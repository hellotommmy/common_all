"""
Transformation type classifier for semantic analysis
Classifies the type of transformation applied to each conjunct mapping
"""

import re
from typing import List, Dict, Optional
from dataclasses import dataclass
import sys
import os

# Add models to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from models.transformation_type import TransformationType
from models.conjunct_mapping import ConjunctMapping
from extractors.conjunct_extractor import ConjunctEntry

@dataclass
class TransformationAnalysis:
    """Analysis result for a transformation"""
    transformation_type: str
    confidence: float
    evidence: List[str]
    semantic_changes: List[str]

class TransformationClassifier:
    """Classifies transformation types in conjunct mappings"""
    
    def __init__(self):
        """Initialize the transformation classifier"""
        self.transformation_stats = {}
        
    def classify_transformation(self, original_conjuncts: List[ConjunctEntry], 
                              current_conjunct: ConjunctEntry) -> TransformationAnalysis:
        """
        Classify the transformation type for a mapping
        
        Args:
            original_conjuncts: List of original conjuncts
            current_conjunct: Current conjunct
            
        Returns:
            TransformationAnalysis with classification results
        """
        if not original_conjuncts:
            return TransformationAnalysis(
                transformation_type='no_change',
                confidence=1.0,
                evidence=['no_original_conjuncts'],
                semantic_changes=[]
            )
        
        # Extract content for analysis
        original_contents = [conj.content for conj in original_conjuncts]
        current_content = current_conjunct.content
        
        # Analyze transformation patterns
        analysis_results = []
        
        # Check each transformation type
        analysis_results.append(self._analyze_hardcoded_to_quantified(original_contents, current_content))
        analysis_results.append(self._analyze_multi_conjunct_consolidation(original_contents, current_content))
        analysis_results.append(self._analyze_enhanced_quantification(original_contents, current_content))
        analysis_results.append(self._analyze_single_conjunct_transformation(original_contents, current_content))
        analysis_results.append(self._analyze_no_change(original_contents, current_content))
        
        # Select best analysis based on confidence
        best_analysis = max(analysis_results, key=lambda x: x.confidence)
        
        # Update statistics
        self._update_stats(best_analysis.transformation_type)
        
        return best_analysis
    
    def _analyze_hardcoded_to_quantified(self, original_contents: List[str], 
                                       current_content: str) -> TransformationAnalysis:
        """Analyze hardcoded_to_quantified transformation"""
        evidence = []
        semantic_changes = []
        confidence = 0.0
        
        # Check for hardcoded devices in original
        has_hardcoded_devices = any(
            bool(re.search(r'\b[01]\b', content)) for content in original_contents
        )
        
        # Check for quantifiers in current
        has_quantifiers = bool(re.search(r'\\<forall>|\\<exists>|∀|∃', current_content))
        
        if has_hardcoded_devices and has_quantifiers:
            evidence.append('hardcoded_devices_to_quantifiers')
            semantic_changes.append('Device-specific constraints generalized to all devices')
            confidence += 0.6
        
        # Check for hardcoded channels
        hardcoded_channels = ['reqs1', 'reqs2', 'snps1', 'snps2', 'dthdatas1', 'dthdatas2']
        has_hardcoded_channels = any(
            any(channel in content for channel in hardcoded_channels)
            for content in original_contents
        )
        
        generalized_channels = ['reqs T i', 'snps T i', 'dthdatas T i']
        has_generalized_channels = any(
            channel in current_content for channel in generalized_channels
        )
        
        if has_hardcoded_channels and has_generalized_channels:
            evidence.append('hardcoded_channels_to_functions')
            semantic_changes.append('Hardcoded message channels generalized to indexed functions')
            confidence += 0.4
        
        # Check for device variable introduction
        has_device_variables = bool(re.search(r'\bi\b|\bj\b', current_content))
        if has_hardcoded_devices and has_device_variables:
            evidence.append('device_variables_introduced')
            semantic_changes.append('Device indices (i, j) introduced for generalization')
            confidence += 0.3
        
        return TransformationAnalysis(
            transformation_type='hardcoded_to_quantified',
            confidence=min(1.0, confidence),
            evidence=evidence,
            semantic_changes=semantic_changes
        )
    
    def _analyze_multi_conjunct_consolidation(self, original_contents: List[str], 
                                            current_content: str) -> TransformationAnalysis:
        """Analyze multi_conjunct_consolidation transformation"""
        evidence = []
        semantic_changes = []
        confidence = 0.0
        
        # Must have multiple original conjuncts
        if len(original_contents) <= 1:
            return TransformationAnalysis(
                transformation_type='multi_conjunct_consolidation',
                confidence=0.0,
                evidence=[],
                semantic_changes=[]
            )
        
        evidence.append(f'{len(original_contents)}_conjuncts_consolidated')
        semantic_changes.append(f'{len(original_contents)} separate conjuncts merged into one')
        confidence += 0.5
        
        # Check for mutual exclusion patterns
        if self._has_mutual_exclusion_pattern(original_contents, current_content):
            evidence.append('mutual_exclusion_consolidation')
            semantic_changes.append('Mutual exclusion patterns unified with quantified constraints')
            confidence += 0.3
        
        # Check for symmetric pattern consolidation
        if self._has_symmetric_patterns(original_contents):
            evidence.append('symmetric_patterns_consolidated')
            semantic_changes.append('Symmetric device patterns consolidated using universal quantifiers')
            confidence += 0.2
        
        # Check for logical operator enhancement
        if self._has_logical_operator_enhancement(original_contents, current_content):
            evidence.append('logical_operators_enhanced')
            semantic_changes.append('Logical structure enhanced with quantified implications')
            confidence += 0.2
        
        return TransformationAnalysis(
            transformation_type='multi_conjunct_consolidation',
            confidence=min(1.0, confidence),
            evidence=evidence,
            semantic_changes=semantic_changes
        )
    
    def _analyze_enhanced_quantification(self, original_contents: List[str], 
                                       current_content: str) -> TransformationAnalysis:
        """Analyze enhanced_quantification transformation"""
        evidence = []
        semantic_changes = []
        confidence = 0.0
        
        # Check for nested quantifiers
        has_nested_quantifiers = bool(re.search(
            r'\\<forall>.*\\<forall>|∀.*∀|\\<exists>.*\\<forall>|∃.*∀', current_content
        ))
        
        if has_nested_quantifiers:
            evidence.append('nested_quantifiers')
            semantic_changes.append('Nested quantifier patterns for complex device interactions')
            confidence += 0.4
        
        # Check for mutual exclusion quantifiers (∀i. ... → (∀j. j≠i → ...))
        has_mutual_exclusion_quantifiers = bool(re.search(
            r'\\<forall>.*→.*\\<forall>.*≠.*→|∀.*→.*∀.*≠.*→', current_content
        ))
        
        if has_mutual_exclusion_quantifiers:
            evidence.append('mutual_exclusion_quantifiers')
            semantic_changes.append('Mutual exclusion expressed through nested quantified implications')
            confidence += 0.3
        
        # Check for existential requirements
        has_existential_requirements = bool(re.search(
            r'\\<exists>.*≠|∃.*≠', current_content
        ))
        
        if has_existential_requirements:
            evidence.append('existential_requirements')
            semantic_changes.append('Existential requirements for device coordination')
            confidence += 0.2
        
        # Check for complex conditions
        has_complex_conditions = bool(re.search(
            r'\\<forall>.*\\<and>.*\\<forall>|∀.*∧.*∀', current_content
        ))
        
        if has_complex_conditions:
            evidence.append('complex_quantified_conditions')
            semantic_changes.append('Complex quantified conditions for multi-device coordination')
            confidence += 0.2
        
        return TransformationAnalysis(
            transformation_type='enhanced_quantification',
            confidence=min(1.0, confidence),
            evidence=evidence,
            semantic_changes=semantic_changes
        )
    
    def _analyze_single_conjunct_transformation(self, original_contents: List[str], 
                                              current_content: str) -> TransformationAnalysis:
        """Analyze single_conjunct_transformation"""
        evidence = []
        semantic_changes = []
        confidence = 0.0
        
        # Should have exactly one original conjunct
        if len(original_contents) != 1:
            confidence = 0.1  # Low confidence if not 1:1
        else:
            confidence = 0.3
            evidence.append('one_to_one_mapping')
        
        original_content = original_contents[0] if original_contents else ""
        
        # Check for structure preservation
        if self._has_preserved_structure(original_content, current_content):
            evidence.append('structure_preserved')
            semantic_changes.append('Logical structure preserved with generalized variables')
            confidence += 0.2
        
        # Check for minor quantifier additions
        original_has_quantifiers = bool(re.search(r'\\<forall>|\\<exists>|∀|∃', original_content))
        current_has_quantifiers = bool(re.search(r'\\<forall>|\\<exists>|∀|∃', current_content))
        
        if not original_has_quantifiers and current_has_quantifiers:
            evidence.append('quantifiers_added')
            semantic_changes.append('Quantifiers added for device generalization')
            confidence += 0.2
        
        # Check for variable substitution
        if self._has_variable_substitution(original_content, current_content):
            evidence.append('variable_substitution')
            semantic_changes.append('Device-specific variables replaced with general variables')
            confidence += 0.2
        
        return TransformationAnalysis(
            transformation_type='single_conjunct_transformation',
            confidence=min(1.0, confidence),
            evidence=evidence,
            semantic_changes=semantic_changes
        )
    
    def _analyze_no_change(self, original_contents: List[str], 
                         current_content: str) -> TransformationAnalysis:
        """Analyze no_change transformation"""
        evidence = []
        semantic_changes = []
        confidence = 0.0
        
        if len(original_contents) != 1:
            return TransformationAnalysis(
                transformation_type='no_change',
                confidence=0.0,
                evidence=[],
                semantic_changes=[]
            )
        
        original_content = original_contents[0]
        
        # Calculate similarity
        from algorithms.similarity_calculator import SimilarityCalculator
        calc = SimilarityCalculator()
        similarity = calc.calculate_similarity(original_content, current_content)
        
        if similarity > 0.95:
            evidence.append('high_similarity')
            semantic_changes.append('Content essentially unchanged')
            confidence = similarity
        elif similarity > 0.85:
            evidence.append('minor_changes')
            semantic_changes.append('Minor formatting or syntactic changes only')
            confidence = similarity * 0.8
        
        # Check for identical predicates
        if self._has_identical_predicates(original_content, current_content):
            evidence.append('identical_predicates')
            semantic_changes.append('Core predicates remain identical')
            confidence += 0.1
        
        return TransformationAnalysis(
            transformation_type='no_change',
            confidence=min(1.0, confidence),
            evidence=evidence,
            semantic_changes=semantic_changes
        )
    
    def _has_mutual_exclusion_pattern(self, original_contents: List[str], 
                                     current_content: str) -> bool:
        """Check if mutual exclusion pattern exists"""
        if len(original_contents) != 2:
            return False
        
        # Look for device swapping in originals
        content1, content2 = original_contents
        has_device_swap = (
            ('T 0' in content1 and 'T 1' in content1 and 'T 1' in content2 and 'T 0' in content2) or
            ('T 1' in content1 and 'T 0' in content1 and 'T 0' in content2 and 'T 1' in content2)
        )
        
        # Look for quantified mutual exclusion in current
        has_quantified_exclusion = bool(re.search(r'i.*j.*≠|j.*i.*≠', current_content))
        
        return has_device_swap and has_quantified_exclusion
    
    def _has_symmetric_patterns(self, original_contents: List[str]) -> bool:
        """Check if original contents have symmetric patterns"""
        if len(original_contents) < 2:
            return False
        
        # Remove device numbers and compare patterns
        base_patterns = []
        for content in original_contents:
            base_pattern = re.sub(r'\b[01]\b', 'X', content)
            base_patterns.append(base_pattern)
        
        # Check if all patterns are similar
        first_pattern = base_patterns[0]
        return all(
            self._calculate_pattern_similarity(first_pattern, pattern) > 0.8
            for pattern in base_patterns[1:]
        )
    
    def _has_logical_operator_enhancement(self, original_contents: List[str], 
                                        current_content: str) -> bool:
        """Check if logical operators are enhanced"""
        # Count logical operators in originals vs current
        original_operators = sum(
            len(re.findall(r'\\<and>|\\<or>|→|∧|∨', content))
            for content in original_contents
        )
        
        current_operators = len(re.findall(r'\\<and>|\\<or>|→|∧|∨', current_content))
        
        # Enhancement if current has more complex logical structure
        return current_operators > original_operators
    
    def _has_preserved_structure(self, original_content: str, current_content: str) -> bool:
        """Check if logical structure is preserved"""
        # Extract predicates (capitalized words)
        original_predicates = set(re.findall(r'\b[A-Z][A-Za-z]*\b', original_content))
        current_predicates = set(re.findall(r'\b[A-Z][A-Za-z]*\b', current_content))
        
        if not original_predicates:
            return False
        
        # Check overlap
        overlap = len(original_predicates.intersection(current_predicates))
        return overlap / len(original_predicates) > 0.7
    
    def _has_variable_substitution(self, original_content: str, current_content: str) -> bool:
        """Check if variables are substituted"""
        # Look for device number substitution
        has_device_substitution = (
            bool(re.search(r'\b[01]\b', original_content)) and
            bool(re.search(r'\bi\b|\bj\b', current_content))
        )
        
        return has_device_substitution
    
    def _has_identical_predicates(self, original_content: str, current_content: str) -> bool:
        """Check if predicates are identical"""
        original_predicates = set(re.findall(r'\b[A-Z][A-Za-z]*\b', original_content))
        current_predicates = set(re.findall(r'\b[A-Z][A-Za-z]*\b', current_content))
        
        return original_predicates == current_predicates
    
    def _calculate_pattern_similarity(self, pattern1: str, pattern2: str) -> float:
        """Calculate similarity between two patterns"""
        from algorithms.similarity_calculator import SimilarityCalculator
        calc = SimilarityCalculator()
        return calc.calculate_similarity(pattern1, pattern2)
    
    def _update_stats(self, transformation_type: str):
        """Update transformation statistics"""
        if transformation_type not in self.transformation_stats:
            self.transformation_stats[transformation_type] = 0
        self.transformation_stats[transformation_type] += 1
    
    def get_transformation_summary(self) -> Dict[str, TransformationType]:
        """Get summary of all transformation types"""
        summary = {}
        
        for type_name, count in self.transformation_stats.items():
            if type_name == 'hardcoded_to_quantified':
                trans_type = TransformationType.create_hardcoded_to_quantified()
            elif type_name == 'multi_conjunct_consolidation':
                trans_type = TransformationType.create_multi_conjunct_consolidation()
            elif type_name == 'enhanced_quantification':
                trans_type = TransformationType.create_enhanced_quantification()
            elif type_name == 'single_conjunct_transformation':
                trans_type = TransformationType.create_single_conjunct_transformation()
            else:
                trans_type = TransformationType.create_no_change()
            
            trans_type.frequency = count
            summary[type_name] = trans_type
        
        return summary
