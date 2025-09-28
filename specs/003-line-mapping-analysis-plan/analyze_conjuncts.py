#!/usr/bin/env python3
"""
Conjunct Analysis Script for Line Mapping
Analyzes original 796 conjuncts vs current multi-device version
"""

import re
import json
from typing import List, Dict, Tuple, Optional

class ConjunctAnalyzer:
    def __init__(self):
        self.original_conjuncts = []
        self.current_conjuncts = []
        self.mapping = {}
        self.consolidation_patterns = {}
    
    def extract_conjuncts_from_file(self, filepath: str, start_line: int, end_line: int) -> List[Dict]:
        """Extract conjuncts from a file within specified line range"""
        conjuncts = []
        
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        # Extract the relevant lines
        relevant_lines = lines[start_line-1:end_line]
        
        conjunct_id = 1
        current_line = start_line
        
        for line in relevant_lines:
            line = line.strip()
            if not line or line.startswith('--') or line.startswith('(*'):
                current_line += 1
                continue
            
            # Check if this line contains conjuncts
            if '∧' in line or line.endswith('∧'):
                # Split by ∧ and process each conjunct
                parts = line.split('∧')
                for i, part in enumerate(parts):
                    part = part.strip()
                    if part and not part.startswith('--') and not part.startswith('(*'):
                        conjunct = {
                            'id': f"orig_{conjunct_id}",
                            'line_number': current_line,
                            'content': part,
                            'type': self.classify_conjunct(part),
                            'original': True
                        }
                        conjuncts.append(conjunct)
                        conjunct_id += 1
            
            current_line += 1
        
        return conjuncts
    
    def classify_conjunct(self, content: str) -> str:
        """Classify conjunct type based on content"""
        content_lower = content.lower()
        
        # Check for hardcoded device references
        if re.search(r'[0-9]\s*T\s*\)', content):
            return 'hardcoded_device'
        
        # Check for universal quantifiers
        if '∀' in content or '\\<forall>' in content:
            return 'universal_quantifier'
        
        # Check for existential quantifiers
        if '∃' in content or '\\<exists>' in content:
            return 'existential_quantifier'
        
        # Check for mutual exclusion patterns
        if '≠' in content and '→' in content:
            return 'mutual_exclusion'
        
        # Check for length constraints
        if 'length' in content_lower:
            return 'length_constraint'
        
        # Check for channel constraints
        if any(channel in content_lower for channel in ['htddatas', 'dthdatas', 'reqresps', 'snps', 'snpresps']):
            return 'channel_constraint'
        
        # Check for state constraints
        if any(state in content_lower for state in ['cstate', 'hstate']):
            return 'state_constraint'
        
        return 'other'
    
    def analyze_consolidation_patterns(self):
        """Analyze how original conjuncts were consolidated"""
        patterns = {
            'simple_universal': [],
            'mutual_exclusion': [],
            'length_constraint': [],
            'channel_constraint': [],
            'complex_consolidation': []
        }
        
        # Analyze original conjuncts for consolidation patterns
        for conjunct in self.original_conjuncts:
            if conjunct['type'] == 'hardcoded_device':
                # Look for patterns that could be consolidated
                content = conjunct['content']
                
                # Simple universal pattern: (A T 0) and (A T 1)
                if re.search(r'\([^)]*\s+0\s*\)', content) and re.search(r'\([^)]*\s+1\s*\)', content):
                    patterns['simple_universal'].append(conjunct)
                
                # Mutual exclusion pattern: A T 0 → ¬B T 1
                elif '→' in content and '¬' in content:
                    patterns['mutual_exclusion'].append(conjunct)
                
                # Length constraint pattern
                elif 'length' in content.lower():
                    patterns['length_constraint'].append(conjunct)
                
                # Channel constraint pattern
                elif any(channel in content.lower() for channel in ['htddatas', 'dthdatas', 'reqresps', 'snps', 'snpresps']):
                    patterns['channel_constraint'].append(conjunct)
        
        self.consolidation_patterns = patterns
        return patterns
    
    def find_semantic_matches(self, original_conjunct: Dict, current_conjuncts: List[Dict]) -> List[Dict]:
        """Find semantic matches for an original conjunct in current conjuncts"""
        matches = []
        
        # Simple keyword matching
        original_keywords = self.extract_keywords(original_conjunct['content'])
        
        for current_conjunct in current_conjuncts:
            current_keywords = self.extract_keywords(current_conjunct['content'])
            
            # Check for keyword overlap
            overlap = len(set(original_keywords) & set(current_keywords))
            if overlap > 0:
                matches.append({
                    'current_conjunct': current_conjunct,
                    'overlap_score': overlap,
                    'overlap_keywords': list(set(original_keywords) & set(current_keywords))
                })
        
        # Sort by overlap score
        matches.sort(key=lambda x: x['overlap_score'], reverse=True)
        return matches
    
    def extract_keywords(self, content: str) -> List[str]:
        """Extract keywords from conjunct content"""
        # Remove common words and extract meaningful terms
        content_lower = content.lower()
        
        # Extract function names, state names, etc.
        keywords = re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', content_lower)
        
        # Filter out common words
        common_words = {'t', 'and', 'or', 'not', 'if', 'then', 'else', 'the', 'a', 'an', 'is', 'are', 'was', 'were'}
        keywords = [kw for kw in keywords if kw not in common_words and len(kw) > 2]
        
        return keywords
    
    def generate_mapping_report(self) -> Dict:
        """Generate comprehensive mapping report"""
        report = {
            'summary': {
                'original_conjuncts': len(self.original_conjuncts),
                'current_conjuncts': len(self.current_conjuncts),
                'consolidation_ratio': len(self.original_conjuncts) / len(self.current_conjuncts) if self.current_conjuncts else 0
            },
            'consolidation_patterns': self.consolidation_patterns,
            'mapping_analysis': {},
            'gaps': [],
            'recommendations': []
        }
        
        # Analyze mapping completeness
        mapped_original = set()
        for original_conjunct in self.original_conjuncts:
            matches = self.find_semantic_matches(original_conjunct, self.current_conjuncts)
            if matches:
                mapped_original.add(original_conjunct['id'])
                report['mapping_analysis'][original_conjunct['id']] = {
                    'original': original_conjunct,
                    'matches': matches[:3],  # Top 3 matches
                    'best_match': matches[0] if matches else None
                }
            else:
                report['gaps'].append(original_conjunct)
        
        # Check for unmapped current conjuncts
        mapped_current = set()
        for mapping in report['mapping_analysis'].values():
            if mapping['best_match']:
                mapped_current.add(mapping['best_match']['current_conjunct']['id'])
        
        unmapped_current = [c for c in self.current_conjuncts if c['id'] not in mapped_current]
        if unmapped_current:
            report['gaps'].extend(unmapped_current)
        
        return report

def main():
    analyzer = ConjunctAnalyzer()
    
    print("=== Conjunct Analysis for Line Mapping ===")
    print()
    
    # Extract original conjuncts (lines 200-795 in OldCohProp.thy)
    print("1. Extracting original conjuncts from OldCohProp.thy (lines 200-795)...")
    analyzer.original_conjuncts = analyzer.extract_conjuncts_from_file(
        'betterProofAll/Common/OldCohProp.thy', 200, 795
    )
    print(f"   Found {len(analyzer.original_conjuncts)} original conjuncts")
    
    # Extract current conjuncts (SWMR_state_machine definition in CoherenceProperties.thy)
    print("2. Extracting current conjuncts from CoherenceProperties.thy...")
    analyzer.current_conjuncts = analyzer.extract_conjuncts_from_file(
        'betterProofAll/Common/CoherenceProperties.thy', 286, 771
    )
    print(f"   Found {len(analyzer.current_conjuncts)} current conjuncts")
    
    # Analyze consolidation patterns
    print("3. Analyzing consolidation patterns...")
    patterns = analyzer.analyze_consolidation_patterns()
    for pattern_type, conjuncts in patterns.items():
        print(f"   {pattern_type}: {len(conjuncts)} conjuncts")
    
    # Generate mapping report
    print("4. Generating mapping report...")
    report = analyzer.generate_mapping_report()
    
    # Save report
    with open('specs/003-line-mapping-analysis-plan/mapping_analysis_report.json', 'w') as f:
        json.dump(report, f, indent=2, default=str)
    
    print("5. Mapping analysis complete!")
    print(f"   Original conjuncts: {report['summary']['original_conjuncts']}")
    print(f"   Current conjuncts: {report['summary']['current_conjuncts']}")
    print(f"   Consolidation ratio: {report['summary']['consolidation_ratio']:.2f}")
    print(f"   Gaps found: {len(report['gaps'])}")
    
    print("\nReport saved to: specs/003-line-mapping-analysis-plan/mapping_analysis_report.json")

if __name__ == "__main__":
    main()
