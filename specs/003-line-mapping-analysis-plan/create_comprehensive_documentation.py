#!/usr/bin/env python3
"""
Create Comprehensive Mapping Documentation
Creates complete documentation of all line-by-line mappings
"""

import json
import re
from typing import List, Dict, Tuple
from datetime import datetime

class ComprehensiveDocumentationCreator:
    def __init__(self):
        self.mapping_data = {}
        self.original_conjuncts = []
        self.current_conjuncts = []
        self.mappings = []
    
    def load_all_data(self):
        """Load all mapping and conjunct data"""
        # Load mapping data
        with open('specs/003-line-mapping-analysis-plan/mapping_framework_results.json', 'r') as f:
            self.mapping_data = json.load(f)
        
        # Load original conjuncts
        with open('specs/003-line-mapping-analysis-plan/original_conjuncts.json', 'r') as f:
            self.original_conjuncts = json.load(f)
        
        # Load current conjuncts
        with open('specs/003-line-mapping-analysis-plan/current_conjuncts.json', 'r') as f:
            self.current_conjuncts = json.load(f)
        
        self.mappings = self.mapping_data['mappings']
        
        print(f"Loaded {len(self.original_conjuncts)} original conjuncts")
        print(f"Loaded {len(self.current_conjuncts)} current conjuncts")
        print(f"Loaded {len(self.mappings)} mappings")
    
    def create_mapping_summary(self):
        """Create mapping summary section"""
        summary = {
            'overview': {
                'total_original_conjuncts': len(self.original_conjuncts),
                'total_current_conjuncts': len(self.current_conjuncts),
                'total_mappings': len(self.mappings),
                'mapping_coverage': len(self.mappings) / len(self.original_conjuncts) if self.original_conjuncts else 0,
                'unmapped_original': len(self.mapping_data['unmapped_original']),
                'unmapped_current': len(self.mapping_data['unmapped_current']),
                'analysis_date': datetime.now().isoformat()
            },
            'consolidation_analysis': {
                'consolidation_ratio': len(self.original_conjuncts) / len(self.current_conjuncts) if self.current_conjuncts else 0,
                'net_change': len(self.current_conjuncts) - len(self.original_conjuncts),
                'consolidation_occurred': len(self.original_conjuncts) > len(self.current_conjuncts)
            },
            'quality_metrics': self.mapping_data.get('quality_metrics', {})
        }
        
        return summary
    
    def create_conjunct_by_conjunct_mapping(self):
        """Create detailed conjunct-by-conjunct mapping"""
        mapping_details = []
        
        for mapping in self.mappings:
            # Find original conjunct details
            orig_conjunct = next((c for c in self.original_conjuncts if c['id'] == mapping['original_id']), None)
            
            # Find current conjunct details
            curr_conjunct = next((c for c in self.current_conjuncts if c['id'] == mapping['current_id']), None)
            
            if orig_conjunct and curr_conjunct:
                mapping_detail = {
                    'mapping_id': f"{mapping['original_id']} → {mapping['current_id']}",
                    'original': {
                        'id': orig_conjunct['id'],
                        'line_number': orig_conjunct['line_number'],
                        'content': orig_conjunct['content'],
                        'type': orig_conjunct['type']
                    },
                    'current': {
                        'id': curr_conjunct['id'],
                        'line_number': curr_conjunct['line_number'],
                        'content': curr_conjunct['content'],
                        'type': curr_conjunct['type']
                    },
                    'mapping_analysis': {
                        'similarity_score': mapping['similarity_score'],
                        'mapping_type': mapping['mapping_type'],
                        'semantic_equivalence': self.assess_semantic_equivalence(orig_conjunct['content'], curr_conjunct['content']),
                        'consolidation_pattern': self.identify_consolidation_pattern(orig_conjunct['content'], curr_conjunct['content'])
                    }
                }
                mapping_details.append(mapping_detail)
        
        return mapping_details
    
    def assess_semantic_equivalence(self, orig_content: str, curr_content: str) -> Dict:
        """Assess semantic equivalence between original and current content"""
        # Extract key semantic elements
        orig_elements = self.extract_semantic_elements(orig_content)
        curr_elements = self.extract_semantic_elements(curr_content)
        
        # Calculate semantic overlap
        common_elements = set(orig_elements) & set(curr_elements)
        total_elements = set(orig_elements) | set(curr_elements)
        
        semantic_overlap = len(common_elements) / len(total_elements) if total_elements else 0
        
        return {
            'semantic_overlap': semantic_overlap,
            'common_elements': list(common_elements),
            'original_elements': orig_elements,
            'current_elements': curr_elements,
            'equivalence_confidence': 'high' if semantic_overlap > 0.7 else 'medium' if semantic_overlap > 0.4 else 'low'
        }
    
    def extract_semantic_elements(self, content: str) -> List[str]:
        """Extract semantic elements from content"""
        # Extract meaningful terms
        terms = re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', content.lower())
        
        # Filter out common words
        common_words = {
            't', 'and', 'or', 'not', 'if', 'then', 'else', 'the', 'a', 'an',
            'is', 'are', 'was', 'were', 'i', 'j', 'all', 'any', 'some', 'for',
            'lambda', 'forall', 'exists', 'true', 'false'
        }
        
        semantic_elements = [term for term in terms if term not in common_words and len(term) > 2]
        return semantic_elements
    
    def identify_consolidation_pattern(self, orig_content: str, curr_content: str) -> str:
        """Identify the consolidation pattern used"""
        # Check for universal quantification
        if '∀' in curr_content or '\\<forall>' in curr_content:
            if '0' in orig_content and '1' in orig_content:
                return 'universal_consolidation'
            else:
                return 'universal_quantification'
        
        # Check for existential quantification
        if '∃' in curr_content or '\\<exists>' in curr_content:
            return 'existential_quantification'
        
        # Check for mutual exclusion
        if '≠' in curr_content and '→' in curr_content:
            return 'mutual_exclusion_consolidation'
        
        # Check for no change
        if orig_content == curr_content:
            return 'no_change'
        
        # Check for minor changes
        if self.calculate_similarity(orig_content, curr_content) > 0.8:
            return 'minor_change'
        
        return 'complex_change'
    
    def calculate_similarity(self, str1: str, str2: str) -> float:
        """Calculate similarity between two strings"""
        # Simple similarity based on common words
        words1 = set(str1.lower().split())
        words2 = set(str2.lower().split())
        
        if not words1 and not words2:
            return 1.0
        
        intersection = len(words1 & words2)
        union = len(words1 | words2)
        
        return intersection / union if union > 0 else 0.0
    
    def create_consolidation_report(self):
        """Create consolidation analysis report"""
        consolidation_patterns = {}
        
        for mapping in self.mappings:
            pattern = mapping.get('mapping_type', 'unknown')
            if pattern not in consolidation_patterns:
                consolidation_patterns[pattern] = []
            consolidation_patterns[pattern].append(mapping)
        
        # Analyze consolidation effectiveness
        consolidation_analysis = {}
        for pattern, mappings in consolidation_patterns.items():
            if mappings:
                avg_similarity = sum(m['similarity_score'] for m in mappings) / len(mappings)
                consolidation_analysis[pattern] = {
                    'count': len(mappings),
                    'percentage': (len(mappings) / len(self.mappings)) * 100,
                    'average_similarity': avg_similarity,
                    'effectiveness': 'high' if avg_similarity > 0.7 else 'medium' if avg_similarity > 0.4 else 'low'
                }
        
        return {
            'consolidation_patterns': consolidation_patterns,
            'consolidation_analysis': consolidation_analysis,
            'consolidation_effectiveness': self.assess_consolidation_effectiveness(consolidation_analysis)
        }
    
    def assess_consolidation_effectiveness(self, consolidation_analysis: Dict) -> Dict:
        """Assess the effectiveness of consolidation patterns"""
        total_mappings = sum(analysis['count'] for analysis in consolidation_analysis.values())
        high_effectiveness = sum(1 for analysis in consolidation_analysis.values() if analysis['effectiveness'] == 'high')
        medium_effectiveness = sum(1 for analysis in consolidation_analysis.values() if analysis['effectiveness'] == 'medium')
        low_effectiveness = sum(1 for analysis in consolidation_analysis.values() if analysis['effectiveness'] == 'low')
        
        return {
            'total_patterns': len(consolidation_analysis),
            'high_effectiveness_patterns': high_effectiveness,
            'medium_effectiveness_patterns': medium_effectiveness,
            'low_effectiveness_patterns': low_effectiveness,
            'overall_effectiveness': 'high' if high_effectiveness > medium_effectiveness + low_effectiveness else 'medium' if medium_effectiveness > low_effectiveness else 'low'
        }
    
    def create_gap_report(self):
        """Create gap analysis report"""
        gap_report = {
            'unmapped_original_analysis': self.analyze_unmapped_conjuncts(self.mapping_data['unmapped_original']),
            'unmapped_current_analysis': self.analyze_unmapped_conjuncts(self.mapping_data['unmapped_current']),
            'gap_impact_assessment': self.assess_gap_impact(),
            'recommendations': self.generate_gap_recommendations()
        }
        
        return gap_report
    
    def analyze_unmapped_conjuncts(self, unmapped_conjuncts: List[Dict]) -> Dict:
        """Analyze unmapped conjuncts"""
        if not unmapped_conjuncts:
            return {'count': 0, 'analysis': 'No unmapped conjuncts'}
        
        type_distribution = {}
        for conjunct in unmapped_conjuncts:
            conjunct_type = conjunct.get('type', 'unknown')
            type_distribution[conjunct_type] = type_distribution.get(conjunct_type, 0) + 1
        
        return {
            'count': len(unmapped_conjuncts),
            'type_distribution': type_distribution,
            'sample_conjuncts': unmapped_conjuncts[:5]  # First 5 as examples
        }
    
    def assess_gap_impact(self) -> Dict:
        """Assess the impact of gaps in mapping"""
        unmapped_original = len(self.mapping_data['unmapped_original'])
        unmapped_current = len(self.mapping_data['unmapped_current'])
        total_original = len(self.original_conjuncts)
        total_current = len(self.current_conjuncts)
        
        original_gap_percentage = (unmapped_original / total_original) * 100 if total_original > 0 else 0
        current_gap_percentage = (unmapped_current / total_current) * 100 if total_current > 0 else 0
        
        return {
            'original_gap_percentage': original_gap_percentage,
            'current_gap_percentage': current_gap_percentage,
            'gap_impact': 'high' if original_gap_percentage > 10 or current_gap_percentage > 10 else 'medium' if original_gap_percentage > 5 or current_gap_percentage > 5 else 'low',
            'critical_gaps': unmapped_original > 20 or unmapped_current > 20
        }
    
    def generate_gap_recommendations(self) -> List[str]:
        """Generate recommendations for addressing gaps"""
        recommendations = []
        
        unmapped_original = len(self.mapping_data['unmapped_original'])
        unmapped_current = len(self.mapping_data['unmapped_current'])
        
        if unmapped_original > 10:
            recommendations.append(f"Review {unmapped_original} unmapped original conjuncts - may need manual mapping or different similarity threshold")
        
        if unmapped_current > 10:
            recommendations.append(f"Review {unmapped_current} unmapped current conjuncts - may be new conjuncts introduced in multi-device version")
        
        if unmapped_original > 20 or unmapped_current > 20:
            recommendations.append("Consider implementing additional mapping strategies for high-volume gaps")
        
        return recommendations
    
    def create_verification_guide(self):
        """Create verification guide for independent verification"""
        return {
            'verification_methods': [
                'Semantic similarity verification',
                'Pattern matching verification',
                'Manual review of high-confidence mappings',
                'Cross-validation with original source files'
            ],
            'verification_criteria': {
                'high_confidence_threshold': 0.7,
                'medium_confidence_threshold': 0.4,
                'low_confidence_threshold': 0.0
            },
            'verification_steps': [
                '1. Load original and current conjunct data',
                '2. Apply semantic matching algorithm',
                '3. Verify similarity scores',
                '4. Check for missing mappings',
                '5. Validate semantic equivalence',
                '6. Generate verification report'
            ],
            'quality_checks': [
                'Check mapping coverage > 90%',
                'Verify average similarity > 0.5',
                'Ensure no duplicate mappings',
                'Validate semantic preservation'
            ]
        }
    
    def generate_comprehensive_documentation(self):
        """Generate comprehensive mapping documentation"""
        documentation = {
            'metadata': {
                'title': 'Comprehensive Line Mapping Documentation',
                'version': '1.0',
                'created_date': datetime.now().isoformat(),
                'description': 'Complete documentation of line-by-line mapping between original 2-device and current multi-device versions'
            },
            'mapping_summary': self.create_mapping_summary(),
            'conjunct_by_conjunct_mapping': self.create_conjunct_by_conjunct_mapping(),
            'consolidation_report': self.create_consolidation_report(),
            'gap_report': self.create_gap_report(),
            'verification_guide': self.create_verification_guide(),
            'appendix': {
                'original_conjuncts': self.original_conjuncts,
                'current_conjuncts': self.current_conjuncts,
                'mappings': self.mappings
            }
        }
        
        return documentation

def main():
    creator = ComprehensiveDocumentationCreator()
    
    print("=== Creating Comprehensive Mapping Documentation ===")
    print()
    
    # Load all data
    print("1. Loading all mapping and conjunct data...")
    creator.load_all_data()
    
    # Generate comprehensive documentation
    print("2. Generating comprehensive documentation...")
    documentation = creator.generate_comprehensive_documentation()
    
    # Save documentation
    print("3. Saving comprehensive documentation...")
    with open('specs/003-line-mapping-analysis-plan/comprehensive_mapping_documentation.json', 'w') as f:
        json.dump(documentation, f, indent=2, default=str)
    
    print(f"   Comprehensive documentation saved to: comprehensive_mapping_documentation.json")
    
    # Show summary
    print("\n4. Documentation summary:")
    summary = documentation['mapping_summary']['overview']
    print(f"   Total original conjuncts: {summary['total_original_conjuncts']}")
    print(f"   Total current conjuncts: {summary['total_current_conjuncts']}")
    print(f"   Total mappings: {summary['total_mappings']}")
    print(f"   Mapping coverage: {summary['mapping_coverage']:.1%}")
    print(f"   Unmapped original: {summary['unmapped_original']}")
    print(f"   Unmapped current: {summary['unmapped_current']}")
    
    # Show consolidation analysis
    print("\n5. Consolidation analysis:")
    consolidation = documentation['consolidation_report']['consolidation_analysis']
    for pattern, analysis in consolidation.items():
        print(f"   {pattern}: {analysis['count']} mappings ({analysis['percentage']:.1f}%) - {analysis['effectiveness']} effectiveness")
    
    # Show gap analysis
    print("\n6. Gap analysis:")
    gap_impact = documentation['gap_report']['gap_impact_assessment']
    print(f"   Original gap: {gap_impact['original_gap_percentage']:.1f}%")
    print(f"   Current gap: {gap_impact['current_gap_percentage']:.1f}%")
    print(f"   Gap impact: {gap_impact['gap_impact']}")
    
    print(f"\n7. Comprehensive documentation creation complete!")

if __name__ == "__main__":
    main()
