"""
Sequential two-pointer mapping algorithm implementation
Implements the user-requested "双指针法" for systematic conjunct mapping
"""

from typing import List, Dict, Optional, Tuple
from dataclasses import dataclass
import sys
import os

# Add models to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from models.conjunct_mapping import ConjunctMapping
from extractors.conjunct_extractor import ConjunctEntry
from .similarity_calculator import SimilarityCalculator

@dataclass
class MappingResult:
    """Represents mapping between original and current conjuncts"""
    original_lines: List[int]
    current_line: int
    consolidation_type: str
    transformation_type: str
    confidence_score: float
    explanation: str

class SequentialMappingInterface:
    """Interface for sequential conjunct mapping analysis"""
    
    def __init__(self):
        """Initialize the sequential mapping interface"""
        self.similarity_calculator = SimilarityCalculator()
        self.original_conjuncts: List[ConjunctEntry] = []
        self.current_conjuncts: List[ConjunctEntry] = []
        self.mappings: List[MappingResult] = []
        self.unmapped_original: List[ConjunctEntry] = []
        self.unmapped_current: List[ConjunctEntry] = []
    
    def load_conjuncts(self, filepath: str, start_line: int, end_line: int) -> List[ConjunctEntry]:
        """
        Load conjuncts from theory file
        
        Args:
            filepath: Path to .thy file
            start_line: Starting line number (inclusive)
            end_line: Ending line number (inclusive)
            
        Returns:
            List of ConjunctEntry objects
            
        Raises:
            FileNotFoundError: If file doesn't exist
            ValueError: If line range is invalid
        """
        from extractors.conjunct_extractor import ConjunctExtractor
        
        # Determine if this is original or current file based on path
        is_original = 'OldCohProp.thy' in filepath
        
        # Create temporary extractor for this specific file
        if is_original:
            extractor = ConjunctExtractor(filepath, '', start_line, end_line, 0, 0)
            return extractor.load_conjuncts(filepath, start_line, end_line, is_original=True)
        else:
            extractor = ConjunctExtractor('', filepath, 0, 0, start_line, end_line)
            return extractor.load_conjuncts(filepath, start_line, end_line, is_original=False)
    
    def calculate_similarity(self, text1: str, text2: str) -> float:
        """
        Calculate similarity score between two text strings
        
        Args:
            text1: First text string
            text2: Second text string
            
        Returns:
            Similarity score between 0.0 and 1.0
        """
        return self.similarity_calculator.calculate_semantic_similarity(text1, text2)
    
    def classify_transformation(self, original_conjuncts: List[ConjunctEntry], 
                              current_conjunct: ConjunctEntry) -> str:
        """
        Classify the type of transformation applied
        
        Args:
            original_conjuncts: List of original conjuncts
            current_conjunct: Current conjunct
            
        Returns:
            Transformation type string
        """
        if not original_conjuncts:
            return 'no_change'
        
        # Combine original content for analysis
        original_content = ' '.join([conj.content for conj in original_conjuncts])
        current_content = current_conjunct.content
        
        # Check for quantifier introduction
        if self._has_quantifier_introduction(original_content, current_content):
            if len(original_conjuncts) > 1:
                return 'multi_conjunct_consolidation'
            else:
                return 'hardcoded_to_quantified'
        
        # Check for enhanced quantification patterns
        if self._has_enhanced_quantification(current_content):
            return 'enhanced_quantification'
        
        # Check for high similarity (no significant change)
        similarity = self.calculate_similarity(original_content, current_content)
        if similarity > 0.95:
            return 'no_change'
        
        # Default to single conjunct transformation
        return 'single_conjunct_transformation'
    
    def _has_quantifier_introduction(self, original: str, current: str) -> bool:
        """Check if quantifiers were introduced"""
        quantifiers = ['\\<forall>', '\\<exists>', '∀', '∃']
        
        original_has_quantifiers = any(q in original for q in quantifiers)
        current_has_quantifiers = any(q in current for q in quantifiers)
        
        return not original_has_quantifiers and current_has_quantifiers
    
    def _has_enhanced_quantification(self, text: str) -> bool:
        """Check for complex quantification patterns"""
        # Look for nested quantifiers or mutual exclusion patterns
        patterns = [
            'j. j ≠ i',
            'j. j <noteq> i',
            '\\<forall>.*\\<forall>',
            '\\<exists>.*\\<forall>',
            '\\<forall>.*\\<exists>'
        ]
        
        import re
        return any(re.search(pattern, text) for pattern in patterns)
    
    def run_sequential_mapping(self) -> Dict:
        """
        Execute two-pointer algorithm for sequential mapping
        
        Returns:
            Dictionary containing:
            - mapping_summary: Overall statistics
            - consolidation_patterns: Pattern counts
            - mappings: List of MappingResult objects
            - unmapped_original: Unmapped original conjuncts
            - unmapped_current: Unmapped current conjuncts
            
        Raises:
            RuntimeError: If mapping algorithm fails
        """
        if not self.original_conjuncts or not self.current_conjuncts:
            raise RuntimeError("Conjuncts not loaded. Call load_conjuncts first.")
        
        # Initialize pointers
        orig_ptr = 0
        curr_ptr = 0
        
        self.mappings = []
        
        print(f"Starting sequential mapping: {len(self.original_conjuncts)} original → {len(self.current_conjuncts)} current")
        
        # Two-pointer algorithm
        while orig_ptr < len(self.original_conjuncts) and curr_ptr < len(self.current_conjuncts):
            original_conj = self.original_conjuncts[orig_ptr]
            current_conj = self.current_conjuncts[curr_ptr]
            
            # Calculate 1:1 similarity
            similarity = self.calculate_similarity(original_conj.content, current_conj.content)
            
            if similarity > 0.7:  # High similarity - likely 1:1 mapping
                mapping = MappingResult(
                    original_lines=[original_conj.line_number],
                    current_line=current_conj.line_number,
                    consolidation_type='1_to_1',
                    transformation_type=self.classify_transformation([original_conj], current_conj),
                    confidence_score=similarity,
                    explanation=f"1:1 mapping with {similarity:.3f} similarity"
                )
                self.mappings.append(mapping)
                orig_ptr += 1
                curr_ptr += 1
                
            else:
                # Try N:1 consolidation (look ahead in original)
                best_consolidation = self._find_best_consolidation(orig_ptr, curr_ptr)
                
                if best_consolidation:
                    n, consolidation_similarity = best_consolidation
                    original_conjuncts = self.original_conjuncts[orig_ptr:orig_ptr + n]
                    
                    mapping = MappingResult(
                        original_lines=[conj.line_number for conj in original_conjuncts],
                        current_line=current_conj.line_number,
                        consolidation_type=f'{n}_to_1',
                        transformation_type=self.classify_transformation(original_conjuncts, current_conj),
                        confidence_score=consolidation_similarity,
                        explanation=f"{n}:1 consolidation with {consolidation_similarity:.3f} similarity"
                    )
                    self.mappings.append(mapping)
                    orig_ptr += n
                    curr_ptr += 1
                    
                else:
                    # No good match found - mark as unmapped and advance current
                    mapping = MappingResult(
                        original_lines=[],
                        current_line=current_conj.line_number,
                        consolidation_type='no_match',
                        transformation_type='unknown',
                        confidence_score=0.0,
                        explanation=f"No suitable mapping found for current line {current_conj.line_number}"
                    )
                    self.mappings.append(mapping)
                    curr_ptr += 1
            
            # Progress reporting
            if len(self.mappings) % 50 == 0:
                print(f"   Processed {len(self.mappings)} mappings (orig: {orig_ptr}/{len(self.original_conjuncts)}, curr: {curr_ptr}/{len(self.current_conjuncts)})")
        
        # Handle remaining unmapped conjuncts
        self.unmapped_original = self.original_conjuncts[orig_ptr:]
        self.unmapped_current = self.current_conjuncts[curr_ptr:]
        
        # Calculate statistics
        return self._generate_mapping_results()
    
    def _find_best_consolidation(self, orig_ptr: int, curr_ptr: int) -> Optional[Tuple[int, float]]:
        """
        Find the best N:1 consolidation starting from orig_ptr
        
        Args:
            orig_ptr: Current original pointer
            curr_ptr: Current current pointer
            
        Returns:
            Tuple of (n, similarity) for best consolidation, or None
        """
        current_conj = self.current_conjuncts[curr_ptr]
        best_n = 0
        best_similarity = 0.0
        
        # Try consolidations from 2:1 up to 6:1
        for n in range(2, min(7, len(self.original_conjuncts) - orig_ptr + 1)):
            original_conjuncts = self.original_conjuncts[orig_ptr:orig_ptr + n]
            original_texts = [conj.content for conj in original_conjuncts]
            
            # Calculate combined similarity
            combined_similarity = self.similarity_calculator.calculate_combined_similarity(
                original_texts, current_conj.content
            )
            
            if combined_similarity > 0.7 and combined_similarity > best_similarity:
                best_similarity = combined_similarity
                best_n = n
        
        return (best_n, best_similarity) if best_n > 0 else None
    
    def _generate_mapping_results(self) -> Dict:
        """Generate comprehensive mapping results"""
        # Calculate mapped original lines
        mapped_original_lines = set()
        for mapping in self.mappings:
            mapped_original_lines.update(mapping.original_lines)
        
        # Calculate consolidation patterns
        consolidation_patterns = {}
        for mapping in self.mappings:
            pattern = mapping.consolidation_type
            consolidation_patterns[pattern] = consolidation_patterns.get(pattern, 0) + 1
        
        # Calculate quality metrics
        confidence_scores = [m.confidence_score for m in self.mappings if m.confidence_score > 0]
        avg_confidence = sum(confidence_scores) / len(confidence_scores) if confidence_scores else 0.0
        
        high_confidence = sum(1 for score in confidence_scores if score > 0.8)
        medium_confidence = sum(1 for score in confidence_scores if 0.5 <= score <= 0.8)
        low_confidence = sum(1 for score in confidence_scores if score < 0.5)
        
        return {
            'mapping_summary': {
                'total_mappings': len(self.mappings),
                'original_lines_total': len(self.original_conjuncts),
                'original_lines_mapped': len(mapped_original_lines),
                'original_mapping_coverage': (len(mapped_original_lines) / len(self.original_conjuncts)) * 100.0,
                'current_lines_total': len(self.current_conjuncts),
                'current_lines_mapped': len([m for m in self.mappings if m.original_lines]),
                'consolidation_ratio': len(self.original_conjuncts) / len(self.current_conjuncts)
            },
            'consolidation_patterns': consolidation_patterns,
            'quality_metrics': {
                'average_confidence': avg_confidence,
                'high_confidence': high_confidence,
                'medium_confidence': medium_confidence,
                'low_confidence': low_confidence
            },
            'mappings': [
                {
                    'original_lines': m.original_lines,
                    'current_line': m.current_line,
                    'consolidation_type': m.consolidation_type,
                    'transformation_type': m.transformation_type,
                    'confidence_score': m.confidence_score,
                    'explanation': m.explanation
                } for m in self.mappings
            ],
            'unmapped_original': [
                {
                    'line_number': conj.line_number,
                    'content': conj.content[:80] + '...' if len(conj.content) > 80 else conj.content
                } for conj in self.unmapped_original
            ],
            'unmapped_current': [
                {
                    'line_number': conj.line_number,
                    'content': conj.content[:80] + '...' if len(conj.content) > 80 else conj.content
                } for conj in self.unmapped_current
            ]
        }
