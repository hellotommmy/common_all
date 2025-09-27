"""
ConsolidationPattern data class
Documents N:1 transformation patterns
"""

from dataclasses import dataclass
from typing import List, Optional
from .conjunct_mapping import ConjunctMapping

@dataclass
class ConsolidationPattern:
    """Documents N:1 transformation patterns"""
    
    # Core pattern fields
    pattern_type: str  # Pattern identifier (2_to_1, 4_to_1, 6_to_1)
    count: int  # Number of occurrences
    examples: List[ConjunctMapping]  # Representative examples
    semantic_rule: str  # Transformation rule description
    
    def __post_init__(self):
        """Validate fields after initialization"""
        self.validate()
    
    def validate(self) -> None:
        """Validate all fields according to data model requirements"""
        
        # Validate pattern_type
        valid_pattern_types = ['1_to_1', '2_to_1', '3_to_1', '4_to_1', '5_to_1', '6_to_1', 'no_match']
        if self.pattern_type not in valid_pattern_types:
            raise ValueError(f"Pattern type '{self.pattern_type}' must be one of {valid_pattern_types}")
        
        # Validate count is positive
        if self.count < 0:
            raise ValueError(f"Count {self.count} must be non-negative")
        
        # Validate examples are ConjunctMapping instances
        for example in self.examples:
            if not isinstance(example, ConjunctMapping):
                raise ValueError("All examples must be ConjunctMapping instances")
            
            # Validate that examples match the pattern type
            expected_original_count = int(self.pattern_type.split('_')[0]) if '_to_' in self.pattern_type else 1
            if self.pattern_type != 'no_match' and len(example.original_lines) != expected_original_count:
                raise ValueError(f"Example has {len(example.original_lines)} original lines but pattern type is {self.pattern_type}")
    
    def get_consolidation_ratio(self) -> float:
        """Calculate average consolidation ratio for this pattern"""
        if not self.examples:
            return 1.0
        
        total_ratio = sum(example.get_consolidation_ratio() for example in self.examples)
        return total_ratio / len(self.examples)
    
    def get_average_confidence(self) -> float:
        """Calculate average confidence score for this pattern"""
        if not self.examples:
            return 0.0
        
        total_confidence = sum(example.confidence_score for example in self.examples)
        return total_confidence / len(self.examples)
    
    def get_high_confidence_count(self) -> int:
        """Count examples with high confidence (>0.8)"""
        return sum(1 for example in self.examples if example.is_high_confidence())
    
    def add_example(self, mapping: ConjunctMapping) -> None:
        """Add a new example mapping to this pattern"""
        # Validate that the mapping matches this pattern type
        expected_original_count = int(self.pattern_type.split('_')[0]) if '_to_' in self.pattern_type else 1
        if self.pattern_type != 'no_match' and len(mapping.original_lines) != expected_original_count:
            raise ValueError(f"Mapping has {len(mapping.original_lines)} original lines but pattern type is {self.pattern_type}")
        
        self.examples.append(mapping)
    
    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'pattern_type': self.pattern_type,
            'count': self.count,
            'examples': [example.to_dict() for example in self.examples],
            'semantic_rule': self.semantic_rule,
            'consolidation_ratio': self.get_consolidation_ratio(),
            'average_confidence': self.get_average_confidence(),
            'high_confidence_count': self.get_high_confidence_count()
        }
    
    @classmethod
    def from_dict(cls, data: dict) -> 'ConsolidationPattern':
        """Create instance from dictionary"""
        examples = [ConjunctMapping.from_dict(example_data) for example_data in data['examples']]
        return cls(
            pattern_type=data['pattern_type'],
            count=data['count'],
            examples=examples,
            semantic_rule=data['semantic_rule']
        )
    
    @classmethod
    def create_pattern(cls, pattern_type: str, semantic_rule: str) -> 'ConsolidationPattern':
        """Create a new consolidation pattern with no examples"""
        return cls(
            pattern_type=pattern_type,
            count=0,
            examples=[],
            semantic_rule=semantic_rule
        )
