#!/usr/bin/env python3
"""
Sequential Conjunct Mapper
Implements two-pointer algorithm to sequentially map conjuncts from original to current files
"""

import re
import json
from typing import List, Dict, Tuple, Optional

class SequentialConjunctMapper:
    def __init__(self):
        self.original_pointer = 200  # Start of original conjuncts
        self.current_pointer = 286   # Start of current conjuncts
        self.original_end = 995      # End of original conjuncts
        self.current_end = 771       # End of current conjuncts
        self.mappings = []
        self.errors = []
        self.original_lines = []
        self.current_lines = []
    
    def load_files(self):
        """Load both files and extract relevant lines"""
        print("Loading original file (OldCohProp.thy)...")
        with open('betterProofAll/Common/OldCohProp.thy', 'r', encoding='utf-8') as f:
            all_lines = f.readlines()
            # Extract lines 200-995 (0-indexed: 199-994)
            self.original_lines = all_lines[199:995]
        
        print("Loading current file (CoherenceProperties.thy)...")
        with open('betterProofAll/Common/CoherenceProperties.thy', 'r', encoding='utf-8') as f:
            all_lines = f.readlines()
            # Extract lines 286-771 (0-indexed: 285-770)
            self.current_lines = all_lines[285:771]
        
        print(f"Loaded {len(self.original_lines)} original lines")
        print(f"Loaded {len(self.current_lines)} current lines")
    
    def clean_conjunct(self, line: str) -> str:
        """Clean conjunct content for comparison"""
        # Remove trailing ∧ and whitespace
        line = line.strip().rstrip('∧').strip()
        
        # Remove comments
        line = re.sub(r'\\<comment>.*?\\<close>', '', line)
        line = re.sub(r'--.*$', '', line)
        
        return line.strip()
    
    def normalize_for_comparison(self, content: str) -> str:
        """Normalize content for comparison by removing device-specific patterns"""
        normalized = content
        
        # Replace device numbers with placeholders
        normalized = re.sub(r'\bT\s+0\b', 'T DEVICE', normalized)
        normalized = re.sub(r'\bT\s+1\b', 'T DEVICE', normalized)
        normalized = re.sub(r'\b0\s+T\b', 'DEVICE T', normalized)
        normalized = re.sub(r'\b1\s+T\b', 'DEVICE T', normalized)
        
        # Replace hardcoded channel patterns
        normalized = re.sub(r'(dthdatas|htddatas|reqresps|snps|snpresps)[12]', r'\1X', normalized)
        
        # Normalize whitespace
        normalized = re.sub(r'\s+', ' ', normalized).strip()
        
        return normalized
    
    def extract_semantic_keywords(self, content: str) -> set:
        """Extract semantic keywords from content"""
        # Extract meaningful terms
        keywords = re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', content.lower())
        
        # Filter out common words
        common_words = {
            't', 'and', 'or', 'not', 'if', 'then', 'else', 'the', 'a', 'an',
            'is', 'are', 'was', 'were', 'i', 'j', 'all', 'any', 'some', 'for',
            'lambda', 'forall', 'exists', 'true', 'false', 'longrightarrow'
        }
        
        semantic_keywords = [kw for kw in keywords if kw not in common_words and len(kw) > 2]
        return set(semantic_keywords)
    
    def direct_correspondence(self, orig_content: str, curr_content: str) -> bool:
        """Check if original and current conjuncts directly correspond"""
        # Rule 1: Exact match after normalization
        orig_norm = self.normalize_for_comparison(orig_content)
        curr_norm = self.normalize_for_comparison(curr_content)
        
        if orig_norm == curr_norm:
            return True
        
        # Rule 2: High semantic keyword overlap
        orig_keywords = self.extract_semantic_keywords(orig_content)
        curr_keywords = self.extract_semantic_keywords(curr_content)
        
        if orig_keywords and curr_keywords:
            overlap = len(orig_keywords & curr_keywords)
            total = len(orig_keywords | curr_keywords)
            similarity = overlap / total if total > 0 else 0
            
            if similarity > 0.8:  # High similarity threshold
                return True
        
        return False
    
    def consolidation_match(self, orig_group: List[str], curr_content: str) -> bool:
        """Check if a group of original conjuncts matches current conjunct (consolidation)"""
        # Combine keywords from all original conjuncts
        combined_keywords = set()
        for orig_content in orig_group:
            combined_keywords.update(self.extract_semantic_keywords(orig_content))
        
        curr_keywords = self.extract_semantic_keywords(curr_content)
        
        if combined_keywords and curr_keywords:
            overlap = len(combined_keywords & curr_keywords)
            total = len(combined_keywords | curr_keywords)
            similarity = overlap / total if total > 0 else 0
            
            # Check if current has quantifiers (indicates consolidation)
            has_quantifiers = ('∀' in curr_content or '\\<forall>' in curr_content or 
                             '∃' in curr_content or '\\<exists>' in curr_content)
            
            # Lower threshold for consolidation if quantifiers are present
            threshold = 0.6 if has_quantifiers else 0.8
            
            return similarity > threshold
        
        return False
    
    def detect_consolidation(self, orig_pointer_offset: int, curr_pointer_offset: int) -> Dict:
        """Detect consolidation pattern at current pointer positions"""
        # Get current conjuncts
        orig_content = self.clean_conjunct(self.original_lines[orig_pointer_offset])
        curr_content = self.clean_conjunct(self.current_lines[curr_pointer_offset])
        
        # Check for direct 1→1 correspondence
        if self.direct_correspondence(orig_content, curr_content):
            return {
                'type': '1_to_1',
                'original_count': 1,
                'current_count': 1,
                'confidence': 0.9,
                'rule': 'direct_correspondence'
            }
        
        # Look ahead for consolidation patterns (2→1, 3→1, etc.)
        for look_ahead in range(2, 6):  # Check up to 5 original lines
            if orig_pointer_offset + look_ahead > len(self.original_lines):
                break
            
            # Get group of original conjuncts
            orig_group = []
            for i in range(look_ahead):
                if orig_pointer_offset + i < len(self.original_lines):
                    orig_group.append(self.clean_conjunct(self.original_lines[orig_pointer_offset + i]))
            
            # Check if this group matches current conjunct
            if self.consolidation_match(orig_group, curr_content):
                return {
                    'type': f'{look_ahead}_to_1',
                    'original_count': look_ahead,
                    'current_count': 1,
                    'confidence': 0.8,
                    'rule': 'consolidation_match'
                }
        
        # No clear match found - default to 1→1 with low confidence
        return {
            'type': 'no_match',
            'original_count': 1,
            'current_count': 1,
            'confidence': 0.1,
            'rule': 'default_advance'
        }
    
    def create_mapping(self, consolidation: Dict, orig_pointer_offset: int, curr_pointer_offset: int) -> Dict:
        """Create detailed mapping record"""
        # Get original conjuncts
        original_lines = []
        original_content = []
        for i in range(consolidation['original_count']):
            if orig_pointer_offset + i < len(self.original_lines):
                line_num = self.original_pointer + orig_pointer_offset + i
                content = self.clean_conjunct(self.original_lines[orig_pointer_offset + i])
                original_lines.append(line_num)
                original_content.append(content)
        
        # Get current conjunct
        current_line = self.current_pointer + curr_pointer_offset
        current_content = self.clean_conjunct(self.current_lines[curr_pointer_offset])
        
        # Create mapping
        mapping = {
            'original_lines': original_lines,
            'current_line': current_line,
            'consolidation_type': consolidation['type'],
            'original_content': original_content,
            'current_content': current_content,
            'correspondence_rule': consolidation['rule'],
            'confidence_score': consolidation['confidence'],
            'pointer_movement': {
                'original': consolidation['original_count'],
                'current': consolidation['current_count']
            }
        }
        
        # Add explanation
        if consolidation['type'] == '1_to_1':
            mapping['explanation'] = 'Direct 1→1 correspondence between original and current conjunct'
        elif consolidation['type'].endswith('_to_1'):
            count = consolidation['original_count']
            mapping['explanation'] = f'{count} original conjuncts consolidated into 1 current conjunct'
        else:
            mapping['explanation'] = 'No clear correspondence detected - advanced with default pattern'
        
        return mapping
    
    def execute_sequential_mapping(self):
        """Execute the main two-pointer sequential mapping algorithm"""
        print("\n=== Executing Sequential Mapping ===")
        
        orig_offset = 0  # Offset within original_lines array
        curr_offset = 0  # Offset within current_lines array
        
        mapping_count = 0
        
        while orig_offset < len(self.original_lines) and curr_offset < len(self.current_lines):
            # Detect consolidation pattern
            consolidation = self.detect_consolidation(orig_offset, curr_offset)
            
            # Create mapping
            mapping = self.create_mapping(consolidation, orig_offset, curr_offset)
            self.mappings.append(mapping)
            mapping_count += 1
            
            # Advance pointers
            orig_offset += consolidation['original_count']
            curr_offset += consolidation['current_count']
            
            # Progress reporting
            if mapping_count % 50 == 0:
                orig_line = self.original_pointer + orig_offset
                curr_line = self.current_pointer + curr_offset
                print(f"   Processed {mapping_count} mappings. Current position: orig={orig_line}, curr={curr_line}")
        
        # Check completion
        self.check_completion(orig_offset, curr_offset)
        
        print(f"Sequential mapping complete! Created {len(self.mappings)} mappings")
    
    def check_completion(self, orig_offset: int, curr_offset: int):
        """Check if both files were completely processed"""
        errors = []
        
        if orig_offset < len(self.original_lines):
            remaining = len(self.original_lines) - orig_offset
            start_line = self.original_pointer + orig_offset
            end_line = self.original_end
            errors.append(f"Original file incomplete: {remaining} lines remaining (lines {start_line}-{end_line})")
        
        if curr_offset < len(self.current_lines):
            remaining = len(self.current_lines) - curr_offset
            start_line = self.current_pointer + curr_offset
            end_line = self.current_end
            errors.append(f"Current file incomplete: {remaining} lines remaining (lines {start_line}-{end_line})")
        
        if errors:
            print("\n❌ ALIGNMENT ERRORS DETECTED:")
            for error in errors:
                print(f"   {error}")
            self.errors.extend(errors)
        else:
            print("\n✅ SUCCESS: Both files completely processed!")
    
    def analyze_results(self) -> Dict:
        """Analyze sequential mapping results"""
        # Count consolidation types
        consolidation_stats = {}
        confidence_scores = []
        
        for mapping in self.mappings:
            cons_type = mapping['consolidation_type']
            consolidation_stats[cons_type] = consolidation_stats.get(cons_type, 0) + 1
            confidence_scores.append(mapping['confidence_score'])
        
        # Calculate statistics
        total_original_lines = sum(len(m['original_lines']) for m in self.mappings)
        total_current_lines = len(self.mappings)  # Each mapping covers 1 current line
        
        analysis = {
            'summary': {
                'total_mappings': len(self.mappings),
                'total_original_lines_mapped': total_original_lines,
                'total_current_lines_mapped': total_current_lines,
                'original_coverage': total_original_lines / len(self.original_lines) if self.original_lines else 0,
                'current_coverage': total_current_lines / len(self.current_lines) if self.current_lines else 0,
                'consolidation_ratio': total_original_lines / total_current_lines if total_current_lines > 0 else 0
            },
            'consolidation_patterns': consolidation_stats,
            'quality_metrics': {
                'average_confidence': sum(confidence_scores) / len(confidence_scores) if confidence_scores else 0,
                'high_confidence_mappings': len([s for s in confidence_scores if s >= 0.8]),
                'medium_confidence_mappings': len([s for s in confidence_scores if 0.5 <= s < 0.8]),
                'low_confidence_mappings': len([s for s in confidence_scores if s < 0.5])
            },
            'errors': self.errors,
            'mappings': self.mappings
        }
        
        return analysis
    
    def save_results(self, analysis: Dict):
        """Save sequential mapping results"""
        # Save complete results
        with open('specs/006-sequential-conjunct-mapping-plan/sequential_mapping_results.json', 'w') as f:
            json.dump(analysis, f, indent=2, default=str)
        
        print(f"Results saved to: sequential_mapping_results.json")

def main():
    mapper = SequentialConjunctMapper()
    
    print("=== Sequential Conjunct Mapping with Two-Pointer Algorithm ===")
    print()
    
    # Load files
    print("1. Loading files...")
    mapper.load_files()
    
    # Execute sequential mapping
    print("2. Executing sequential mapping...")
    mapper.execute_sequential_mapping()
    
    # Analyze results
    print("3. Analyzing results...")
    analysis = mapper.analyze_results()
    
    # Save results
    print("4. Saving results...")
    mapper.save_results(analysis)
    
    # Show summary
    print("\n5. Sequential mapping summary:")
    summary = analysis['summary']
    print(f"   Total mappings: {summary['total_mappings']}")
    print(f"   Original lines mapped: {summary['total_original_lines_mapped']}/{len(mapper.original_lines)} ({summary['original_coverage']:.1%})")
    print(f"   Current lines mapped: {summary['total_current_lines_mapped']}/{len(mapper.current_lines)} ({summary['current_coverage']:.1%})")
    print(f"   Consolidation ratio: {summary['consolidation_ratio']:.2f}")
    
    print("\n6. Consolidation patterns:")
    for pattern, count in analysis['consolidation_patterns'].items():
        print(f"   {pattern}: {count}")
    
    print("\n7. Quality metrics:")
    quality = analysis['quality_metrics']
    print(f"   Average confidence: {quality['average_confidence']:.3f}")
    print(f"   High confidence: {quality['high_confidence_mappings']}")
    print(f"   Medium confidence: {quality['medium_confidence_mappings']}")
    print(f"   Low confidence: {quality['low_confidence_mappings']}")
    
    if analysis['errors']:
        print("\n8. Errors detected:")
        for error in analysis['errors']:
            print(f"   ❌ {error}")
    else:
        print("\n8. ✅ No errors detected - both files completely processed!")
    
    print("\nSequential conjunct mapping complete!")

if __name__ == "__main__":
    main()
