#!/usr/bin/env python3
"""
Complete Systematic Mapping
Completes all systematic mapping tasks (T006-T010)
"""

import json
import re
from typing import List, Dict, Tuple

class CompleteSystematicMapper:
    def __init__(self):
        self.mapping_data = {}
        self.mappings = []
        self.gap_analysis = {}
    
    def load_mapping_data(self):
        """Load all mapping data"""
        with open('specs/003-line-mapping-analysis-plan/mapping_framework_results.json', 'r') as f:
            self.mapping_data = json.load(f)
        
        self.mappings = self.mapping_data['mappings']
        print(f"Loaded {len(self.mappings)} mappings")
    
    def map_mutual_exclusion_consolidation(self):
        """Map mutual exclusion consolidation patterns (T006)"""
        mutual_exclusion_mappings = []
        
        for mapping in self.mappings:
            orig_content = mapping['original_content']
            curr_content = mapping['current_content']
            
            # Check for mutual exclusion patterns
            if self.is_mutual_exclusion_pattern(orig_content, curr_content):
                mapping['consolidation_type'] = 'mutual_exclusion'
                mutual_exclusion_mappings.append(mapping)
        
        print(f"Found {len(mutual_exclusion_mappings)} mutual exclusion mappings")
        return mutual_exclusion_mappings
    
    def is_mutual_exclusion_pattern(self, orig_content: str, curr_content: str) -> bool:
        """Check if mapping represents mutual exclusion consolidation"""
        # Look for mutual exclusion indicators
        has_implication = '→' in orig_content
        has_negation = '¬' in orig_content
        has_inequality = '≠' in curr_content
        has_universal = '∀' in curr_content or '\\<forall>' in curr_content
        
        return has_implication and has_negation and has_inequality and has_universal
    
    def map_length_constraint_consolidation(self):
        """Map length constraint consolidation patterns (T007)"""
        length_constraint_mappings = []
        
        for mapping in self.mappings:
            orig_content = mapping['original_content']
            curr_content = mapping['current_content']
            
            # Check for length constraint patterns
            if self.is_length_constraint_pattern(orig_content, curr_content):
                mapping['consolidation_type'] = 'length_constraint'
                length_constraint_mappings.append(mapping)
        
        print(f"Found {len(length_constraint_mappings)} length constraint mappings")
        return length_constraint_mappings
    
    def is_length_constraint_pattern(self, orig_content: str, curr_content: str) -> bool:
        """Check if mapping represents length constraint consolidation"""
        has_length = 'length' in orig_content.lower()
        has_universal = '∀' in curr_content or '\\<forall>' in curr_content
        has_length_current = 'length' in curr_content.lower()
        
        return has_length and has_universal and has_length_current
    
    def map_complex_multi_condition_consolidation(self):
        """Map complex multi-condition consolidation patterns (T008)"""
        complex_mappings = []
        
        for mapping in self.mappings:
            orig_content = mapping['original_content']
            curr_content = mapping['current_content']
            
            # Check for complex consolidation patterns
            if self.is_complex_consolidation_pattern(orig_content, curr_content):
                mapping['consolidation_type'] = 'complex_multi_condition'
                complex_mappings.append(mapping)
        
        print(f"Found {len(complex_mappings)} complex consolidation mappings")
        return complex_mappings
    
    def is_complex_consolidation_pattern(self, orig_content: str, curr_content: str) -> bool:
        """Check if mapping represents complex consolidation"""
        # Complex patterns typically have multiple conditions or nested structures
        orig_complexity = self.calculate_complexity(orig_content)
        curr_complexity = self.calculate_complexity(curr_content)
        
        # Check if current is more complex than original (consolidation)
        is_consolidation = curr_complexity > orig_complexity
        
        # Check for quantifier usage
        has_quantifiers = '∀' in curr_content or '∃' in curr_content or '\\<forall>' in curr_content or '\\<exists>' in curr_content
        
        return is_consolidation and has_quantifiers
    
    def calculate_complexity(self, content: str) -> int:
        """Calculate complexity score for content"""
        complexity = 0
        
        # Count operators and quantifiers
        complexity += content.count('∧')
        complexity += content.count('→')
        complexity += content.count('¬')
        complexity += content.count('∀')
        complexity += content.count('∃')
        complexity += content.count('\\<forall>')
        complexity += content.count('\\<exists>')
        
        # Count parentheses (nesting)
        complexity += content.count('(')
        complexity += content.count(')')
        
        return complexity
    
    def map_channel_interaction_consolidation(self):
        """Map channel interaction consolidation patterns (T009)"""
        channel_mappings = []
        
        for mapping in self.mappings:
            orig_content = mapping['original_content']
            curr_content = mapping['current_content']
            
            # Check for channel interaction patterns
            if self.is_channel_interaction_pattern(orig_content, curr_content):
                mapping['consolidation_type'] = 'channel_interaction'
                channel_mappings.append(mapping)
        
        print(f"Found {len(channel_mappings)} channel interaction mappings")
        return channel_mappings
    
    def is_channel_interaction_pattern(self, orig_content: str, curr_content: str) -> bool:
        """Check if mapping represents channel interaction consolidation"""
        channel_terms = ['htddatas', 'dthdatas', 'reqresps', 'snps', 'snpresps']
        
        orig_has_channels = any(channel in orig_content.lower() for channel in channel_terms)
        curr_has_channels = any(channel in curr_content.lower() for channel in channel_terms)
        
        return orig_has_channels and curr_has_channels
    
    def perform_gap_analysis(self):
        """Perform comprehensive gap analysis (T010)"""
        gap_analysis = {
            'unmapped_original': self.mapping_data['unmapped_original'],
            'unmapped_current': self.mapping_data['unmapped_current'],
            'mapping_coverage': len(self.mappings) / len(self.mapping_data['mappings']) if self.mapping_data['mappings'] else 0,
            'duplicate_mappings': self.find_duplicate_mappings(),
            'semantic_gaps': self.find_semantic_gaps(),
            'quality_issues': self.find_quality_issues()
        }
        
        self.gap_analysis = gap_analysis
        return gap_analysis
    
    def find_duplicate_mappings(self):
        """Find duplicate mappings"""
        duplicates = []
        seen_original = set()
        seen_current = set()
        
        for mapping in self.mappings:
            orig_id = mapping['original_id']
            curr_id = mapping['current_id']
            
            if orig_id in seen_original:
                duplicates.append(f"Original {orig_id} mapped multiple times")
            else:
                seen_original.add(orig_id)
            
            if curr_id in seen_current:
                duplicates.append(f"Current {curr_id} mapped multiple times")
            else:
                seen_current.add(curr_id)
        
        return duplicates
    
    def find_semantic_gaps(self):
        """Find semantic gaps in mappings"""
        semantic_gaps = []
        
        for mapping in self.mappings:
            if mapping['similarity_score'] < 0.3:
                semantic_gaps.append({
                    'mapping_id': mapping['original_id'],
                    'similarity_score': mapping['similarity_score'],
                    'issue': 'Low semantic similarity'
                })
        
        return semantic_gaps
    
    def find_quality_issues(self):
        """Find quality issues in mappings"""
        quality_issues = []
        
        for mapping in self.mappings:
            issues = []
            
            # Check for missing content
            if not mapping['original_content'] or not mapping['current_content']:
                issues.append('Missing content')
            
            # Check for very low similarity
            if mapping['similarity_score'] < 0.2:
                issues.append('Very low similarity')
            
            # Check for potential semantic mismatch
            if mapping['mapping_type'] == 'complex_change' and mapping['similarity_score'] < 0.5:
                issues.append('Complex change with low similarity')
            
            if issues:
                quality_issues.append({
                    'mapping_id': mapping['original_id'],
                    'issues': issues
                })
        
        return quality_issues
    
    def generate_comprehensive_mapping_report(self):
        """Generate comprehensive mapping report"""
        # Perform all mapping analyses
        mutual_exclusion = self.map_mutual_exclusion_consolidation()
        length_constraints = self.map_length_constraint_consolidation()
        complex_consolidation = self.map_complex_multi_condition_consolidation()
        channel_interactions = self.map_channel_interaction_consolidation()
        gap_analysis = self.perform_gap_analysis()
        
        # Generate comprehensive report
        report = {
            'summary': {
                'total_mappings': len(self.mappings),
                'mapping_coverage': gap_analysis['mapping_coverage'],
                'unmapped_original': len(gap_analysis['unmapped_original']),
                'unmapped_current': len(gap_analysis['unmapped_current']),
                'consolidation_patterns': {
                    'mutual_exclusion': len(mutual_exclusion),
                    'length_constraints': len(length_constraints),
                    'complex_consolidation': len(complex_consolidation),
                    'channel_interactions': len(channel_interactions)
                }
            },
            'consolidation_analysis': {
                'mutual_exclusion_mappings': mutual_exclusion,
                'length_constraint_mappings': length_constraints,
                'complex_consolidation_mappings': complex_consolidation,
                'channel_interaction_mappings': channel_interactions
            },
            'gap_analysis': gap_analysis,
            'quality_metrics': {
                'average_similarity': sum(m['similarity_score'] for m in self.mappings) / len(self.mappings) if self.mappings else 0,
                'high_confidence_mappings': len([m for m in self.mappings if m['similarity_score'] >= 0.7]),
                'medium_confidence_mappings': len([m for m in self.mappings if 0.3 <= m['similarity_score'] < 0.7]),
                'low_confidence_mappings': len([m for m in self.mappings if m['similarity_score'] < 0.3])
            },
            'recommendations': self.generate_recommendations()
        }
        
        return report
    
    def generate_recommendations(self):
        """Generate recommendations based on analysis"""
        recommendations = []
        
        # Check mapping coverage
        if self.gap_analysis['mapping_coverage'] < 0.9:
            recommendations.append("Improve mapping coverage - consider lowering similarity threshold")
        
        # Check for unmapped conjuncts
        if len(self.gap_analysis['unmapped_original']) > 10:
            recommendations.append("Review unmapped original conjuncts - may need manual mapping")
        
        if len(self.gap_analysis['unmapped_current']) > 10:
            recommendations.append("Review unmapped current conjuncts - may be new conjuncts")
        
        # Check for quality issues
        if len(self.gap_analysis['quality_issues']) > 20:
            recommendations.append("Address quality issues - many mappings have low confidence")
        
        # Check for semantic gaps
        if len(self.gap_analysis['semantic_gaps']) > 50:
            recommendations.append("Review semantic gaps - many mappings have low similarity")
        
        return recommendations

def main():
    mapper = CompleteSystematicMapper()
    
    print("=== Complete Systematic Mapping ===")
    print()
    
    # Load mapping data
    print("1. Loading mapping data...")
    mapper.load_mapping_data()
    
    # Generate comprehensive report
    print("2. Generating comprehensive mapping report...")
    report = mapper.generate_comprehensive_mapping_report()
    
    # Save report
    with open('specs/003-line-mapping-analysis-plan/complete_systematic_mapping_report.json', 'w') as f:
        json.dump(report, f, indent=2, default=str)
    
    print(f"   Complete systematic mapping report saved to: complete_systematic_mapping_report.json")
    
    # Show summary
    print("\n3. Mapping summary:")
    summary = report['summary']
    print(f"   Total mappings: {summary['total_mappings']}")
    print(f"   Mapping coverage: {summary['mapping_coverage']:.1%}")
    print(f"   Unmapped original: {summary['unmapped_original']}")
    print(f"   Unmapped current: {summary['unmapped_current']}")
    
    print("\n4. Consolidation patterns:")
    for pattern, count in summary['consolidation_patterns'].items():
        print(f"   {pattern}: {count} mappings")
    
    print("\n5. Quality metrics:")
    quality = report['quality_metrics']
    print(f"   Average similarity: {quality['average_similarity']:.3f}")
    print(f"   High confidence: {quality['high_confidence_mappings']}")
    print(f"   Medium confidence: {quality['medium_confidence_mappings']}")
    print(f"   Low confidence: {quality['low_confidence_mappings']}")
    
    print("\n6. Recommendations:")
    for i, rec in enumerate(report['recommendations'], 1):
        print(f"   {i}. {rec}")
    
    print(f"\n7. Complete systematic mapping finished!")

if __name__ == "__main__":
    main()
