"""
Sequential Mapping API Contract
Defines the interface for two-pointer algorithm implementation
"""

from typing import List, Dict, Optional, Tuple
from dataclasses import dataclass

@dataclass
class ConjunctEntry:
    """Represents a single conjunct from theory file"""
    line_number: int
    content: str
    classification: str

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
        raise NotImplementedError
    
    def calculate_similarity(self, text1: str, text2: str) -> float:
        """
        Calculate similarity score between two text strings
        
        Args:
            text1: First text string
            text2: Second text string
            
        Returns:
            Similarity score between 0.0 and 1.0
        """
        raise NotImplementedError
    
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
        raise NotImplementedError
    
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
        raise NotImplementedError

# Contract Test Requirements
class SequentialMappingTests:
    """Test requirements for sequential mapping implementation"""
    
    def test_load_conjuncts_valid_file(self):
        """Must successfully load conjuncts from valid theory file"""
        pass
    
    def test_load_conjuncts_invalid_file(self):
        """Must raise FileNotFoundError for invalid file path"""
        pass
    
    def test_similarity_calculation(self):
        """Must return similarity scores between 0.0 and 1.0"""
        pass
    
    def test_sequential_mapping_coverage(self):
        """Must process all current conjuncts and report coverage percentage"""
        pass
    
    def test_consolidation_detection(self):
        """Must identify N:1 consolidation patterns correctly"""
        pass
    
    def test_transformation_classification(self):
        """Must classify transformation types accurately"""
        pass
