#!/usr/bin/env python3
"""
Create Mapping Framework
Designs systematic approach for line-by-line mapping between original and current versions
"""

import json
import re
from typing import List, Dict, Tuple, Optional
from difflib import SequenceMatcher

class MappingFramework:
    def __init__(self):
        self.original_conjuncts = []
        self.current_conjuncts = []
        self.mappings = []
        self.unmapped_original = []
        self.unmapped_current = []
    
    def load_data(self):
        """Load original and current conjunct data"""
        with open('specs/003-line-mapping-analysis-plan/original_conjuncts.json', 'r') as f:
            self.original_conjuncts = json.load(f)
        
        with open('specs/003-line-mapping-analysis-plan/current_conjuncts.json', 'r') as f:
            self.current_conjuncts = json.load(f)
        
        print(f"Loaded {len(self.original_conjuncts)} original conjuncts")
        print(f"Loaded {len(self.current_conjuncts)} current conjuncts")
    
    def create_semantic_matcher(self):
        """Create semantic matching algorithm"""
        def semantic_similarity(orig_content: str, curr_content: str) -> float:
            """Calculate semantic similarity between two conjuncts"""
            
            # Extract keywords from both contents
            orig_keywords = self.extract_keywords(orig_content)
            curr_keywords = self.extract_keywords(curr_content)
            
            # Calculate keyword overlap
            keyword_overlap = len(set(orig_keywords) & set(curr_keywords))
            total_keywords = len(set(orig_keywords) | set(curr_keywords))
            
            if total_keywords == 0:
                return 0.0
            
            keyword_similarity = keyword_overlap / total_keywords
            
            # Calculate structural similarity
            structural_similarity = self.calculate_structural_similarity(orig_content, curr_content)
            
            # Calculate pattern similarity
            pattern_similarity = self.calculate_pattern_similarity(orig_content, curr_content)
            
            # Weighted combination
            total_similarity = (
                0.4 * keyword_similarity +
                0.3 * structural_similarity +
                0.3 * pattern_similarity
            )
            
            return total_similarity
        
        return semantic_similarity
    
    def extract_keywords(self, content: str) -> List[str]:
        """Extract keywords from conjunct content"""
        content_lower = content.lower()
        
        # Extract meaningful terms
        keywords = re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', content_lower)
        
        # Filter out common words
        common_words = {
            't', 'and', 'or', 'not', 'if', 'then', 'else', 'the', 'a', 'an', 
            'is', 'are', 'was', 'were', 'i', 'j', 'all', 'any', 'some', 'for'
        }
        keywords = [kw for kw in keywords if kw not in common_words and len(kw) > 2]
        
        return keywords
    
    def calculate_structural_similarity(self, orig_content: str, curr_content: str) -> float:
        """Calculate structural similarity between conjuncts"""
        # Normalize content for comparison
        orig_norm = self.normalize_content(orig_content)
        curr_norm = self.normalize_content(curr_content)
        
        # Use SequenceMatcher for structural similarity
        matcher = SequenceMatcher(None, orig_norm, curr_norm)
        return matcher.ratio()
    
    def normalize_content(self, content: str) -> str:
        """Normalize content for structural comparison"""
        # Remove device numbers (0, 1) and replace with generic markers
        content = re.sub(r'\b[01]\b', 'X', content)
        
        # Remove specific variable names and replace with generic markers
        content = re.sub(r'\b(htddatas|dthdatas|reqresps|snps|snpresps)[12]\b', r'\1X', content)
        
        # Normalize whitespace
        content = re.sub(r'\s+', ' ', content).strip()
        
        return content
    
    def calculate_pattern_similarity(self, orig_content: str, curr_content: str) -> float:
        """Calculate pattern similarity between conjuncts"""
        # Define pattern types
        patterns = {
            'universal_quantifier': r'∀|\\<forall>',
            'existential_quantifier': r'∃|\\<exists>',
            'mutual_exclusion': r'≠.*→',
            'length_constraint': r'length.*≤',
            'state_constraint': r'(CSTATE|HSTATE)',
            'channel_constraint': r'(htddatas|dthdatas|reqresps|snps|snpresps)',
            'implication': r'→',
            'conjunction': r'∧'
        }
        
        orig_patterns = set()
        curr_patterns = set()
        
        for pattern_name, pattern_regex in patterns.items():
            if re.search(pattern_regex, orig_content):
                orig_patterns.add(pattern_name)
            if re.search(pattern_regex, curr_content):
                curr_patterns.add(pattern_name)
        
        if not orig_patterns and not curr_patterns:
            return 1.0
        
        pattern_overlap = len(orig_patterns & curr_patterns)
        total_patterns = len(orig_patterns | curr_patterns)
        
        return pattern_overlap / total_patterns if total_patterns > 0 else 0.0
    
    def find_best_matches(self, threshold: float = 0.3) -> List[Dict]:
        """Find best matches between original and current conjuncts"""
        semantic_matcher = self.create_semantic_matcher()
        mappings = []
        used_current = set()
        
        for orig_conjunct in self.original_conjuncts:
            best_match = None
            best_similarity = 0.0
            
            for curr_conjunct in self.current_conjuncts:
                if curr_conjunct['id'] in used_current:
                    continue
                
                similarity = semantic_matcher(orig_conjunct['content'], curr_conjunct['content'])
                
                if similarity > best_similarity and similarity >= threshold:
                    best_similarity = similarity
                    best_match = curr_conjunct
            
            if best_match:
                mapping = {
                    'original_id': orig_conjunct['id'],
                    'current_id': best_match['id'],
                    'original_line': orig_conjunct['line_number'],
                    'current_line': best_match['line_number'],
                    'similarity_score': best_similarity,
                    'original_content': orig_conjunct['content'],
                    'current_content': best_match['content'],
                    'mapping_type': self.classify_mapping_type(orig_conjunct, best_match)
                }
                mappings.append(mapping)
                used_current.add(best_match['id'])
            else:
                self.unmapped_original.append(orig_conjunct)
        
        # Find unmapped current conjuncts
        used_current_ids = {m['current_id'] for m in mappings}
        for curr_conjunct in self.current_conjuncts:
            if curr_conjunct['id'] not in used_current_ids:
                self.unmapped_current.append(curr_conjunct)
        
        self.mappings = mappings
        return mappings
    
    def classify_mapping_type(self, orig_conjunct: Dict, curr_conjunct: Dict) -> str:
        """Classify the type of mapping between conjuncts"""
        orig_content = orig_conjunct['content']
        curr_content = curr_conjunct['content']
        
        # Check for consolidation patterns
        if '∀' in curr_content or '\\<forall>' in curr_content:
            if '0' in orig_content and '1' in orig_content:
                return 'universal_consolidation'
            elif '≠' in curr_content and '→' in curr_content:
                return 'mutual_exclusion_consolidation'
            else:
                return 'universal_quantification'
        
        # Check for no change
        if orig_content == curr_content:
            return 'no_change'
        
        # Check for minor changes
        if self.calculate_structural_similarity(orig_content, curr_content) > 0.8:
            return 'minor_change'
        
        return 'complex_change'
    
    def generate_mapping_report(self) -> Dict:
        """Generate comprehensive mapping report"""
        report = {
            'summary': {
                'total_original': len(self.original_conjuncts),
                'total_current': len(self.current_conjuncts),
                'mapped_pairs': len(self.mappings),
                'unmapped_original': len(self.unmapped_original),
                'unmapped_current': len(self.unmapped_current),
                'mapping_coverage': len(self.mappings) / len(self.original_conjuncts) if self.original_conjuncts else 0
            },
            'mapping_types': {},
            'mappings': self.mappings,
            'unmapped_original': self.unmapped_original,
            'unmapped_current': self.unmapped_current,
            'quality_metrics': {
                'average_similarity': 0.0,
                'high_confidence_mappings': 0,
                'low_confidence_mappings': 0
            }
        }
        
        # Analyze mapping types
        for mapping in self.mappings:
            mapping_type = mapping['mapping_type']
            if mapping_type not in report['mapping_types']:
                report['mapping_types'][mapping_type] = 0
            report['mapping_types'][mapping_type] += 1
        
        # Calculate quality metrics
        if self.mappings:
            similarities = [m['similarity_score'] for m in self.mappings]
            report['quality_metrics']['average_similarity'] = sum(similarities) / len(similarities)
            report['quality_metrics']['high_confidence_mappings'] = len([s for s in similarities if s >= 0.7])
            report['quality_metrics']['low_confidence_mappings'] = len([s for s in similarities if s < 0.3])
        
        return report

def main():
    framework = MappingFramework()
    
    print("=== Creating Mapping Framework ===")
    print()
    
    # Load data
    print("1. Loading conjunct data...")
    framework.load_data()
    
    # Find best matches
    print("2. Finding best matches between original and current conjuncts...")
    mappings = framework.find_best_matches(threshold=0.3)
    
    print(f"   Found {len(mappings)} mappings")
    print(f"   Unmapped original: {len(framework.unmapped_original)}")
    print(f"   Unmapped current: {len(framework.unmapped_current)}")
    
    # Generate report
    print("\n3. Generating mapping report...")
    report = framework.generate_mapping_report()
    
    # Save results
    print("\n4. Saving results...")
    with open('specs/003-line-mapping-analysis-plan/mapping_framework_results.json', 'w') as f:
        json.dump(report, f, indent=2, default=str)
    
    print(f"   Mapping results saved to: mapping_framework_results.json")
    
    # Show summary
    print("\n5. Mapping summary:")
    print(f"   Total original conjuncts: {report['summary']['total_original']}")
    print(f"   Total current conjuncts: {report['summary']['total_current']}")
    print(f"   Mapped pairs: {report['summary']['mapped_pairs']}")
    print(f"   Mapping coverage: {report['summary']['mapping_coverage']:.1%}")
    print(f"   Average similarity: {report['quality_metrics']['average_similarity']:.3f}")
    
    print("\n6. Mapping types:")
    for mapping_type, count in report['mapping_types'].items():
        print(f"   {mapping_type}: {count} mappings")
    
    print(f"\n7. Mapping framework creation complete!")

if __name__ == "__main__":
    main()
