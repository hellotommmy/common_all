"""
Similarity calculation engine using difflib
Calculates similarity scores between conjunct content strings
"""

from difflib import SequenceMatcher
import re
from typing import List, Tuple

class SimilarityCalculator:
    """Calculates similarity scores between text strings"""
    
    def __init__(self):
        """Initialize the similarity calculator"""
        pass
    
    def calculate_similarity(self, text1: str, text2: str) -> float:
        """
        Calculate similarity score between two text strings
        
        Args:
            text1: First text string
            text2: Second text string
            
        Returns:
            Similarity score between 0.0 and 1.0
        """
        if not text1 and not text2:
            return 1.0
        if not text1 or not text2:
            return 0.0
        
        # Use SequenceMatcher for basic similarity
        matcher = SequenceMatcher(None, text1, text2)
        return matcher.ratio()
    
    def calculate_semantic_similarity(self, text1: str, text2: str) -> float:
        """
        Calculate semantic similarity with Isabelle/HOL awareness
        
        Args:
            text1: First text string (typically original conjunct)
            text2: Second text string (typically current conjunct)
            
        Returns:
            Semantic similarity score between 0.0 and 1.0
        """
        # Normalize both texts for semantic comparison
        norm_text1 = self._normalize_isabelle_text(text1)
        norm_text2 = self._normalize_isabelle_text(text2)
        
        # Calculate base similarity
        base_similarity = self.calculate_similarity(norm_text1, norm_text2)
        
        # Apply semantic bonuses
        semantic_bonus = self._calculate_semantic_bonus(text1, text2)
        
        # Combine base similarity with semantic bonus
        final_similarity = min(1.0, base_similarity + semantic_bonus)
        
        return final_similarity
    
    def _normalize_isabelle_text(self, text: str) -> str:
        """
        Normalize Isabelle/HOL text for comparison
        
        Args:
            text: Original text
            
        Returns:
            Normalized text
        """
        # Remove Isabelle escape sequences
        normalized = text.replace('\\<', '<').replace('\\>', '>')
        
        # Normalize whitespace
        normalized = re.sub(r'\s+', ' ', normalized.strip())
        
        # Remove trailing conjunctions
        normalized = re.sub(r'\s*<and>\s*$', '', normalized)
        normalized = re.sub(r'\s*\)\s*$', '', normalized)
        
        return normalized
    
    def _calculate_semantic_bonus(self, text1: str, text2: str) -> float:
        """
        Calculate semantic bonus based on transformation patterns
        
        Args:
            text1: Original text
            text2: Current text
            
        Returns:
            Bonus score (0.0 to 0.3)
        """
        bonus = 0.0
        
        # Bonus for quantifier introduction
        if self._has_quantifier_transformation(text1, text2):
            bonus += 0.15
        
        # Bonus for device generalization
        if self._has_device_generalization(text1, text2):
            bonus += 0.10
        
        # Bonus for preserved core predicates
        if self._has_preserved_predicates(text1, text2):
            bonus += 0.05
        
        return min(0.3, bonus)  # Cap at 0.3
    
    def _has_quantifier_transformation(self, text1: str, text2: str) -> bool:
        """Check if text2 introduces quantifiers not in text1"""
        quantifiers = ['<forall>', '<exists>', '∀', '∃']
        
        text1_has_quantifiers = any(q in text1 for q in quantifiers)
        text2_has_quantifiers = any(q in text2 for q in quantifiers)
        
        return not text1_has_quantifiers and text2_has_quantifiers
    
    def _has_device_generalization(self, text1: str, text2: str) -> bool:
        """Check if text2 generalizes hardcoded devices from text1"""
        # Look for hardcoded devices in text1
        hardcoded_devices = re.findall(r'\b[01]\b', text1)
        
        # Look for device variables in text2
        device_variables = re.findall(r'\bi\b|\bj\b', text2)
        
        return len(hardcoded_devices) > 0 and len(device_variables) > 0
    
    def _has_preserved_predicates(self, text1: str, text2: str) -> bool:
        """Check if core predicates are preserved between texts"""
        # Extract predicates (words starting with capital letters)
        predicates1 = set(re.findall(r'\b[A-Z][A-Za-z]*\b', text1))
        predicates2 = set(re.findall(r'\b[A-Z][A-Za-z]*\b', text2))
        
        if not predicates1:
            return False
        
        # Calculate overlap
        overlap = len(predicates1.intersection(predicates2))
        return overlap / len(predicates1) > 0.5
    
    def calculate_combined_similarity(self, original_texts: List[str], current_text: str) -> float:
        """
        Calculate similarity between multiple original texts and a single current text
        Used for N:1 consolidation detection
        
        Args:
            original_texts: List of original conjunct texts
            current_text: Single current conjunct text
            
        Returns:
            Combined similarity score
        """
        if not original_texts:
            return 0.0
        
        # Combine original texts
        combined_original = ' '.join(original_texts)
        
        # Calculate similarity with combined text
        combined_similarity = self.calculate_semantic_similarity(combined_original, current_text)
        
        # Apply consolidation bonus if multiple originals map to one current
        if len(original_texts) > 1:
            consolidation_bonus = min(0.2, 0.05 * len(original_texts))
            combined_similarity = min(1.0, combined_similarity + consolidation_bonus)
        
        return combined_similarity
    
    def find_best_match(self, target_text: str, candidate_texts: List[str], 
                       threshold: float = 0.5) -> Tuple[int, float]:
        """
        Find the best matching text from candidates
        
        Args:
            target_text: Text to match against
            candidate_texts: List of candidate texts
            threshold: Minimum similarity threshold
            
        Returns:
            Tuple of (best_index, best_score) or (-1, 0.0) if no match above threshold
        """
        best_index = -1
        best_score = 0.0
        
        for i, candidate in enumerate(candidate_texts):
            score = self.calculate_semantic_similarity(target_text, candidate)
            if score > best_score and score >= threshold:
                best_score = score
                best_index = i
        
        return best_index, best_score
