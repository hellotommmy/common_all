#!/usr/bin/env python3
"""
Map Simple Universal Quantification
Maps original conjuncts that were consolidated using simple universal quantification
"""

import json
import re
from typing import List, Dict, Tuple

class UniversalQuantificationMapper:
    def __init__(self):
        self.mappings = []
        self.universal_patterns = []
    
    def load_mapping_data(self):
        """Load mapping framework results"""
        with open('specs/003-line-mapping-analysis-plan/mapping_framework_results.json', 'r') as f:
            self.mapping_data = json.load(f)
        
        print(f"Loaded mapping data with {len(self.mapping_data['mappings'])} mappings")
    
    def identify_universal_patterns(self):
        """Identify universal quantification patterns in mappings"""
        universal_mappings = []
        
        for mapping in self.mapping_data['mappings']:
            if mapping['mapping_type'] in ['universal_quantification', 'universal_consolidation']:
                universal_mappings.append(mapping)
        
        self.universal_patterns = universal_mappings
        return universal_mappings
    
    def analyze_universal_patterns(self):
        """Analyze the universal quantification patterns"""
        pattern_analysis = {
            'simple_universal': [],
            'mutual_exclusion_universal': [],
            'length_constraint_universal': [],
            'state_constraint_universal': [],
            'channel_constraint_universal': [],
            'complex_universal': []
        }
        
        for mapping in self.universal_patterns:
            orig_content = mapping['original_content']
            curr_content = mapping['current_content']
            
            # Classify the universal pattern
            pattern_type = self.classify_universal_pattern(orig_content, curr_content)
            pattern_analysis[pattern_type].append(mapping)
        
        return pattern_analysis
    
    def classify_universal_pattern(self, orig_content: str, curr_content: str) -> str:
        """Classify the type of universal quantification pattern"""
        
        # Check for simple universal: (A T 0) ∧ (A T 1) → ∀i. A T i
        if re.search(r'\([^)]*\s+0\s*\)', orig_content) and re.search(r'\([^)]*\s+1\s*\)', orig_content):
            if '∀' in curr_content or '\\<forall>' in curr_content:
                return 'simple_universal'
        
        # Check for mutual exclusion universal: A T 0 → ¬B T 1 → ∀i j. i ≠ j → (A T i → ¬B T j)
        if '→' in orig_content and '≠' in curr_content and '∀' in curr_content:
            return 'mutual_exclusion_universal'
        
        # Check for length constraint universal
        if 'length' in orig_content.lower() and '∀' in curr_content:
            return 'length_constraint_universal'
        
        # Check for state constraint universal
        if any(state in orig_content.lower() for state in ['cstate', 'hstate']) and '∀' in curr_content:
            return 'state_constraint_universal'
        
        # Check for channel constraint universal
        if any(channel in orig_content.lower() for channel in ['htddatas', 'dthdatas', 'reqresps', 'snps', 'snpresps']) and '∀' in curr_content:
            return 'channel_constraint_universal'
        
        # Default to complex universal
        return 'complex_universal'
    
    def generate_universal_mapping_report(self):
        """Generate detailed report for universal quantification mappings"""
        pattern_analysis = self.analyze_universal_patterns()
        
        report = {
            'summary': {
                'total_universal_mappings': len(self.universal_patterns),
                'pattern_distribution': {pattern: len(mappings) for pattern, mappings in pattern_analysis.items()},
                'mapping_coverage': len(self.universal_patterns) / len(self.mapping_data['mappings']) if self.mapping_data['mappings'] else 0
            },
            'pattern_analysis': pattern_analysis,
            'examples': self.generate_pattern_examples(pattern_analysis),
            'semantic_verification': self.verify_semantic_equivalence()
        }
        
        return report
    
    def generate_pattern_examples(self, pattern_analysis: Dict) -> Dict:
        """Generate examples for each pattern type"""
        examples = {}
        
        for pattern_type, mappings in pattern_analysis.items():
            if mappings:
                # Get the best example (highest similarity score)
                best_mapping = max(mappings, key=lambda x: x['similarity_score'])
                examples[pattern_type] = {
                    'original_content': best_mapping['original_content'],
                    'current_content': best_mapping['current_content'],
                    'similarity_score': best_mapping['similarity_score'],
                    'line_mapping': f"Line {best_mapping['original_line']} → Line {best_mapping['current_line']}"
                }
        
        return examples
    
    def verify_semantic_equivalence(self) -> Dict:
        """Verify semantic equivalence of universal quantification mappings"""
        verification_results = {
            'total_verified': 0,
            'semantically_equivalent': 0,
            'semantically_different': 0,
            'verification_issues': []
        }
        
        for mapping in self.universal_patterns:
            verification_results['total_verified'] += 1
            
            # Simple verification: check if the universal quantifier preserves the original meaning
            orig_content = mapping['original_content']
            curr_content = mapping['current_content']
            
            # Check for basic semantic preservation
            if self.verify_basic_semantic_equivalence(orig_content, curr_content):
                verification_results['semantically_equivalent'] += 1
            else:
                verification_results['semantically_different'] += 1
                verification_results['verification_issues'].append({
                    'mapping_id': mapping['original_id'],
                    'issue': 'Potential semantic difference detected',
                    'original': orig_content,
                    'current': curr_content
                })
        
        return verification_results
    
    def verify_basic_semantic_equivalence(self, orig_content: str, curr_content: str) -> bool:
        """Basic verification of semantic equivalence"""
        # Extract key terms from both contents
        orig_terms = self.extract_semantic_terms(orig_content)
        curr_terms = self.extract_semantic_terms(curr_content)
        
        # Check if key terms are preserved
        key_terms_preserved = len(orig_terms & curr_terms) >= len(orig_terms) * 0.8
        
        # Check if universal quantifier is properly applied
        has_universal_quantifier = '∀' in curr_content or '\\<forall>' in curr_content
        
        return key_terms_preserved and has_universal_quantifier
    
    def extract_semantic_terms(self, content: str) -> set:
        """Extract semantic terms from content"""
        # Extract meaningful terms (excluding quantifiers and operators)
        terms = re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', content.lower())
        
        # Filter out common words and operators
        common_words = {
            't', 'and', 'or', 'not', 'if', 'then', 'else', 'the', 'a', 'an',
            'is', 'are', 'was', 'were', 'i', 'j', 'all', 'any', 'some', 'for',
            'lambda', 'forall', 'exists'
        }
        
        semantic_terms = {term for term in terms if term not in common_words and len(term) > 2}
        return semantic_terms

def main():
    mapper = UniversalQuantificationMapper()
    
    print("=== Mapping Simple Universal Quantification ===")
    print()
    
    # Load mapping data
    print("1. Loading mapping data...")
    mapper.load_mapping_data()
    
    # Identify universal patterns
    print("2. Identifying universal quantification patterns...")
    universal_patterns = mapper.identify_universal_patterns()
    print(f"   Found {len(universal_patterns)} universal quantification mappings")
    
    # Analyze patterns
    print("3. Analyzing universal patterns...")
    pattern_analysis = mapper.analyze_universal_patterns()
    
    print("\n4. Pattern distribution:")
    for pattern_type, mappings in pattern_analysis.items():
        if mappings:
            print(f"   {pattern_type}: {len(mappings)} mappings")
    
    # Generate report
    print("\n5. Generating universal quantification mapping report...")
    report = mapper.generate_universal_mapping_report()
    
    # Save report
    with open('specs/003-line-mapping-analysis-plan/universal_quantification_mapping_report.json', 'w') as f:
        json.dump(report, f, indent=2, default=str)
    
    print(f"   Universal quantification report saved to: universal_quantification_mapping_report.json")
    
    # Show examples
    print("\n6. Pattern examples:")
    for pattern_type, example in report['examples'].items():
        if example:
            print(f"\n   {pattern_type}:")
            print(f"     Original: {example['original_content'][:80]}...")
            print(f"     Current:  {example['current_content'][:80]}...")
            print(f"     Similarity: {example['similarity_score']:.3f}")
    
    # Show verification results
    print("\n7. Semantic verification results:")
    verification = report['semantic_verification']
    print(f"   Total verified: {verification['total_verified']}")
    print(f"   Semantically equivalent: {verification['semantically_equivalent']}")
    print(f"   Semantically different: {verification['semantically_different']}")
    
    if verification['verification_issues']:
        print(f"   Verification issues: {len(verification['verification_issues'])}")
    
    print(f"\n8. Universal quantification mapping complete!")

if __name__ == "__main__":
    main()
