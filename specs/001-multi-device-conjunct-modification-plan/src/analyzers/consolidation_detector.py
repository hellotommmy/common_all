"""
Consolidation pattern detector for N:1 mapping identification
Detects when multiple original conjuncts are consolidated into a single current conjunct
"""

import re
from typing import List, Dict, Tuple, Optional
from dataclasses import dataclass
import sys
import os

# Add models to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from models.consolidation_pattern import ConsolidationPattern
from models.conjunct_mapping import ConjunctMapping
from extractors.conjunct_extractor import ConjunctEntry
from algorithms.similarity_calculator import SimilarityCalculator

@dataclass
class ConsolidationCandidate:
    """Represents a potential consolidation pattern"""
    original_conjuncts: List[ConjunctEntry]
    current_conjunct: ConjunctEntry
    consolidation_type: str
    confidence_score: float
    pattern_evidence: List[str]

class ConsolidationDetector:
    """Detects N:1 consolidation patterns in conjunct mappings"""
    
    def __init__(self):
        """Initialize the consolidation detector"""
        self.similarity_calculator = SimilarityCalculator()
        self.consolidation_patterns = []
        
        # Pattern detection thresholds
        self.min_consolidation_confidence = 0.7
        self.max_consolidation_size = 6  # Maximum N in N:1 consolidation
        
    def detect_consolidation_patterns(self, original_conjuncts: List[ConjunctEntry], 
                                    current_conjuncts: List[ConjunctEntry]) -> List[ConsolidationPattern]:
        """
        Detect all consolidation patterns between original and current conjuncts
        
        Args:
            original_conjuncts: List of original conjuncts (796 expected)
            current_conjuncts: List of current conjuncts (486 expected)
            
        Returns:
            List of detected consolidation patterns
        """
        print(f"Detecting consolidation patterns: {len(original_conjuncts)} original → {len(current_conjuncts)} current")
        
        consolidation_candidates = []
        
        # Use sliding window approach to detect consolidations
        orig_idx = 0
        curr_idx = 0
        
        while orig_idx < len(original_conjuncts) and curr_idx < len(current_conjuncts):
            current_conj = current_conjuncts[curr_idx]
            
            # Try different consolidation sizes (1:1, 2:1, 3:1, etc.)
            best_candidate = None
            best_confidence = 0.0
            
            for n in range(1, min(self.max_consolidation_size + 1, len(original_conjuncts) - orig_idx + 1)):
                if orig_idx + n > len(original_conjuncts):
                    break
                    
                original_group = original_conjuncts[orig_idx:orig_idx + n]
                candidate = self._evaluate_consolidation_candidate(original_group, current_conj)
                
                if candidate and candidate.confidence_score > best_confidence:
                    best_candidate = candidate
                    best_confidence = candidate.confidence_score
            
            if best_candidate and best_confidence >= self.min_consolidation_confidence:
                consolidation_candidates.append(best_candidate)
                orig_idx += len(best_candidate.original_conjuncts)
                curr_idx += 1
            else:
                # No good consolidation found, advance both pointers
                orig_idx += 1
                curr_idx += 1
        
        # Group candidates by consolidation type
        patterns = self._group_candidates_by_pattern(consolidation_candidates)
        
        print(f"Detected {len(patterns)} consolidation patterns from {len(consolidation_candidates)} candidates")
        return patterns
    
    def _evaluate_consolidation_candidate(self, original_group: List[ConjunctEntry], 
                                        current_conjunct: ConjunctEntry) -> Optional[ConsolidationCandidate]:
        """
        Evaluate whether a group of original conjuncts consolidates into a current conjunct
        
        Args:
            original_group: Group of original conjuncts to test
            current_conjunct: Single current conjunct
            
        Returns:
            ConsolidationCandidate if consolidation is detected, None otherwise
        """
        n = len(original_group)
        consolidation_type = f"{n}_to_1"
        
        # Extract content for analysis
        original_contents = [conj.content for conj in original_group]
        current_content = current_conjunct.content
        
        # Calculate combined similarity
        combined_similarity = self.similarity_calculator.calculate_combined_similarity(
            original_contents, current_content
        )
        
        # Detect consolidation evidence
        pattern_evidence = self._detect_consolidation_evidence(original_contents, current_content)
        
        # Calculate confidence based on similarity and evidence
        confidence = self._calculate_consolidation_confidence(
            combined_similarity, pattern_evidence, n
        )
        
        if confidence >= self.min_consolidation_confidence:
            return ConsolidationCandidate(
                original_conjuncts=original_group,
                current_conjunct=current_conjunct,
                consolidation_type=consolidation_type,
                confidence_score=confidence,
                pattern_evidence=pattern_evidence
            )
        
        return None
    
    def _detect_consolidation_evidence(self, original_contents: List[str], 
                                     current_content: str) -> List[str]:
        """
        Detect evidence of consolidation patterns in the content
        
        Args:
            original_contents: List of original conjunct contents
            current_content: Current conjunct content
            
        Returns:
            List of evidence strings describing the consolidation
        """
        evidence = []
        
        # Check for hardcoded device generalization
        if self._has_hardcoded_device_generalization(original_contents, current_content):
            evidence.append("hardcoded_device_to_quantifier")
        
        # Check for mutual exclusion consolidation
        if self._has_mutual_exclusion_consolidation(original_contents, current_content):
            evidence.append("mutual_exclusion_consolidation")
        
        # Check for symmetric pattern consolidation
        if self._has_symmetric_pattern_consolidation(original_contents, current_content):
            evidence.append("symmetric_pattern_consolidation")
        
        # Check for quantifier enhancement
        if self._has_quantifier_enhancement(original_contents, current_content):
            evidence.append("quantifier_enhancement")
        
        # Check for channel generalization
        if self._has_channel_generalization(original_contents, current_content):
            evidence.append("channel_generalization")
        
        return evidence
    
    def _has_hardcoded_device_generalization(self, original_contents: List[str], 
                                           current_content: str) -> bool:
        """Check if hardcoded devices (0, 1) are generalized to quantifiers (i, j)"""
        # Look for hardcoded devices in originals
        has_hardcoded = any(re.search(r'\b[01]\b', content) for content in original_contents)
        
        # Look for quantifiers in current
        has_quantifiers = bool(re.search(r'\\<forall>|\\<exists>|∀|∃', current_content))
        
        return has_hardcoded and has_quantifiers
    
    def _has_mutual_exclusion_consolidation(self, original_contents: List[str], 
                                          current_content: str) -> bool:
        """Check if multiple mutual exclusion patterns are consolidated"""
        if len(original_contents) != 2:
            return False
        
        # Look for complementary patterns like (A → B) and (B → A)
        pattern1 = original_contents[0]
        pattern2 = original_contents[1]
        
        # Check for device swapping patterns
        has_device_swap = (
            ('T 0' in pattern1 and 'T 1' in pattern1 and 'T 1' in pattern2 and 'T 0' in pattern2) or
            ('T 1' in pattern1 and 'T 0' in pattern1 and 'T 0' in pattern2 and 'T 1' in pattern2)
        )
        
        # Check for quantified mutual exclusion in current
        has_quantified_exclusion = bool(re.search(r'i.*j.*i\s*≠\s*j|j.*i.*j\s*≠\s*i', current_content))
        
        return has_device_swap and has_quantified_exclusion
    
    def _has_symmetric_pattern_consolidation(self, original_contents: List[str], 
                                           current_content: str) -> bool:
        """Check if symmetric patterns are consolidated"""
        if len(original_contents) < 2:
            return False
        
        # Check if original contents have similar structure but different devices
        base_patterns = []
        for content in original_contents:
            # Remove device numbers to get base pattern
            base_pattern = re.sub(r'\b[01]\b', 'X', content)
            base_patterns.append(base_pattern)
        
        # Check if all base patterns are similar
        first_pattern = base_patterns[0]
        all_similar = all(
            self.similarity_calculator.calculate_similarity(first_pattern, pattern) > 0.8
            for pattern in base_patterns[1:]
        )
        
        return all_similar and bool(re.search(r'\\<forall>|∀', current_content))
    
    def _has_quantifier_enhancement(self, original_contents: List[str], 
                                  current_content: str) -> bool:
        """Check if quantifiers are enhanced (e.g., nested quantifiers)"""
        # Look for simple quantifiers in originals
        original_has_simple_quantifiers = any(
            bool(re.search(r'\\<forall>|\\<exists>|∀|∃', content))
            for content in original_contents
        )
        
        # Look for complex quantifiers in current (nested or with conditions)
        current_has_complex_quantifiers = bool(re.search(
            r'\\<forall>.*\\<forall>|∀.*∀|\\<exists>.*\\<forall>|∃.*∀', current_content
        ))
        
        return original_has_simple_quantifiers and current_has_complex_quantifiers
    
    def _has_channel_generalization(self, original_contents: List[str], 
                                  current_content: str) -> bool:
        """Check if hardcoded channels are generalized"""
        # Look for hardcoded channels in originals
        channel_patterns = ['reqs1', 'reqs2', 'snps1', 'snps2', 'dthdatas1', 'dthdatas2']
        has_hardcoded_channels = any(
            any(pattern in content for pattern in channel_patterns)
            for content in original_contents
        )
        
        # Look for generalized channels in current
        generalized_patterns = ['reqs T i', 'snps T i', 'dthdatas T i']
        has_generalized_channels = any(
            pattern in current_content for pattern in generalized_patterns
        )
        
        return has_hardcoded_channels and has_generalized_channels
    
    def _calculate_consolidation_confidence(self, similarity_score: float, 
                                          evidence: List[str], n: int) -> float:
        """
        Calculate confidence score for consolidation
        
        Args:
            similarity_score: Base similarity score
            evidence: List of consolidation evidence
            n: Number of original conjuncts (N in N:1)
            
        Returns:
            Confidence score between 0.0 and 1.0
        """
        # Start with similarity score
        confidence = similarity_score
        
        # Add evidence bonuses
        evidence_bonus = len(evidence) * 0.05  # 5% per evidence type
        confidence += evidence_bonus
        
        # Add consolidation size bonus (higher N gets slight bonus)
        size_bonus = min(0.1, (n - 1) * 0.02)  # 2% per additional conjunct, max 10%
        confidence += size_bonus
        
        # Penalize very large consolidations (they're less likely to be correct)
        if n > 4:
            large_consolidation_penalty = (n - 4) * 0.05
            confidence -= large_consolidation_penalty
        
        return min(1.0, max(0.0, confidence))
    
    def _group_candidates_by_pattern(self, candidates: List[ConsolidationCandidate]) -> List[ConsolidationPattern]:
        """
        Group consolidation candidates by pattern type
        
        Args:
            candidates: List of consolidation candidates
            
        Returns:
            List of consolidation patterns with examples
        """
        pattern_groups = {}
        
        for candidate in candidates:
            pattern_type = candidate.consolidation_type
            
            if pattern_type not in pattern_groups:
                pattern_groups[pattern_type] = {
                    'examples': [],
                    'count': 0,
                    'evidence_types': set()
                }
            
            # Convert candidate to ConjunctMapping
            mapping = ConjunctMapping(
                original_lines=[conj.line_number for conj in candidate.original_conjuncts],
                current_line=candidate.current_conjunct.line_number,
                consolidation_type=candidate.consolidation_type,
                transformation_type=self._classify_transformation_type(candidate),
                confidence_score=candidate.confidence_score,
                semantic_equivalence='preserved',  # Assume preserved for now
                explanation=f"Consolidation: {', '.join(candidate.pattern_evidence)}"
            )
            
            pattern_groups[pattern_type]['examples'].append(mapping)
            pattern_groups[pattern_type]['count'] += 1
            pattern_groups[pattern_type]['evidence_types'].update(candidate.pattern_evidence)
        
        # Create ConsolidationPattern objects
        patterns = []
        for pattern_type, group_data in pattern_groups.items():
            semantic_rule = self._generate_semantic_rule(pattern_type, group_data['evidence_types'])
            
            pattern = ConsolidationPattern(
                pattern_type=pattern_type,
                count=group_data['count'],
                examples=group_data['examples'][:5],  # Keep top 5 examples
                semantic_rule=semantic_rule
            )
            patterns.append(pattern)
        
        return patterns
    
    def _classify_transformation_type(self, candidate: ConsolidationCandidate) -> str:
        """Classify the transformation type based on evidence"""
        evidence = candidate.pattern_evidence
        
        if 'hardcoded_device_to_quantifier' in evidence:
            if len(candidate.original_conjuncts) > 1:
                return 'multi_conjunct_consolidation'
            else:
                return 'hardcoded_to_quantified'
        
        if 'quantifier_enhancement' in evidence:
            return 'enhanced_quantification'
        
        if 'mutual_exclusion_consolidation' in evidence:
            return 'multi_conjunct_consolidation'
        
        if len(candidate.original_conjuncts) > 1:
            return 'multi_conjunct_consolidation'
        
        return 'single_conjunct_transformation'
    
    def _generate_semantic_rule(self, pattern_type: str, evidence_types: set) -> str:
        """Generate semantic rule description for the pattern"""
        n = int(pattern_type.split('_')[0]) if '_to_' in pattern_type else 1
        
        if n == 1:
            return "Single conjunct transformation with quantifier generalization"
        
        rule_parts = [f"{n} original conjuncts consolidated into 1 current conjunct"]
        
        if 'hardcoded_device_to_quantifier' in evidence_types:
            rule_parts.append("hardcoded devices (0,1) generalized to quantified variables (i,j)")
        
        if 'mutual_exclusion_consolidation' in evidence_types:
            rule_parts.append("mutual exclusion patterns unified with ∀i j. i≠j quantifiers")
        
        if 'channel_generalization' in evidence_types:
            rule_parts.append("hardcoded channels generalized to indexed functions")
        
        if 'quantifier_enhancement' in evidence_types:
            rule_parts.append("simple quantifiers enhanced to nested quantifier patterns")
        
        return "; ".join(rule_parts)
