"""
ConjunctMapping data class
Represents line-by-line mapping between original and current conjuncts
"""

from dataclasses import dataclass
from typing import List, Optional

@dataclass
class ConjunctMapping:
    """Represents mapping between original and current conjuncts"""
    
    # Core mapping fields
    original_lines: List[int]  # Line numbers from OldCohProp.thy (200-995)
    current_line: int  # Line number from CoherenceProperties.thy (286-771)
    consolidation_type: str  # Type of mapping (1_to_1, 2_to_1, 4_to_1, 6_to_1, no_match)
    transformation_type: str  # Semantic transformation category
    confidence_score: float  # Mapping confidence (0.0-1.0)
    semantic_equivalence: str  # Preservation status (preserved, enhanced, modified)
    explanation: str  # Human-readable mapping description
    
    def __post_init__(self):
        """Validate fields after initialization"""
        self.validate()
    
    def validate(self) -> None:
        """Validate all fields according to data model requirements"""
        
        # Validate original_lines range (200-995)
        for line in self.original_lines:
            if not (200 <= line <= 995):
                raise ValueError(f"Original line {line} must be within range 200-995")
        
        # Validate current_line range (286-771)
        if not (286 <= self.current_line <= 771):
            raise ValueError(f"Current line {self.current_line} must be within range 286-771")
        
        # Validate confidence_score range (0.0-1.0)
        if not (0.0 <= self.confidence_score <= 1.0):
            raise ValueError(f"Confidence score {self.confidence_score} must be between 0.0 and 1.0")
        
        # Validate consolidation_type pattern
        valid_consolidation_types = ['1_to_1', '2_to_1', '3_to_1', '4_to_1', '5_to_1', '6_to_1', 'no_match']
        if self.consolidation_type not in valid_consolidation_types:
            raise ValueError(f"Consolidation type '{self.consolidation_type}' must match pattern N_to_1 or no_match")
        
        # Validate transformation_type
        valid_transformation_types = [
            'hardcoded_to_quantified',
            'multi_conjunct_consolidation',
            'enhanced_quantification',
            'single_conjunct_transformation',
            'no_change'
        ]
        if self.transformation_type not in valid_transformation_types:
            raise ValueError(f"Transformation type '{self.transformation_type}' must be one of {valid_transformation_types}")
        
        # Validate semantic_equivalence
        valid_semantic_equivalence = ['preserved', 'enhanced', 'modified']
        if self.semantic_equivalence not in valid_semantic_equivalence:
            raise ValueError(f"Semantic equivalence '{self.semantic_equivalence}' must be one of {valid_semantic_equivalence}")
    
    def get_consolidation_ratio(self) -> float:
        """Calculate consolidation ratio (original lines / current lines)"""
        return len(self.original_lines) / 1.0
    
    def is_high_confidence(self) -> bool:
        """Check if mapping has high confidence (>0.8)"""
        return self.confidence_score > 0.8
    
    def is_consolidation(self) -> bool:
        """Check if this mapping represents consolidation (N:1 where N>1)"""
        return len(self.original_lines) > 1
    
    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'original_lines': self.original_lines,
            'current_line': self.current_line,
            'consolidation_type': self.consolidation_type,
            'transformation_type': self.transformation_type,
            'confidence_score': self.confidence_score,
            'semantic_equivalence': self.semantic_equivalence,
            'explanation': self.explanation
        }
    
    @classmethod
    def from_dict(cls, data: dict) -> 'ConjunctMapping':
        """Create instance from dictionary"""
        return cls(
            original_lines=data['original_lines'],
            current_line=data['current_line'],
            consolidation_type=data['consolidation_type'],
            transformation_type=data['transformation_type'],
            confidence_score=data['confidence_score'],
            semantic_equivalence=data['semantic_equivalence'],
            explanation=data['explanation']
        )
