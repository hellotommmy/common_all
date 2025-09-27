"""
TransformationType data class
Classifies semantic transformations
"""

from dataclasses import dataclass
from typing import List

@dataclass
class TransformationType:
    """Classifies semantic transformations"""
    
    # Core transformation fields
    type_name: str  # Transformation identifier
    description: str  # Semantic meaning
    pattern_examples: List[str]  # Code pattern examples
    frequency: int  # Occurrence count
    
    def __post_init__(self):
        """Validate fields after initialization"""
        self.validate()
    
    def validate(self) -> None:
        """Validate all fields according to data model requirements"""
        
        # Validate type_name
        valid_type_names = [
            'hardcoded_to_quantified',
            'multi_conjunct_consolidation',
            'enhanced_quantification',
            'single_conjunct_transformation',
            'no_change'
        ]
        if self.type_name not in valid_type_names:
            raise ValueError(f"Type name '{self.type_name}' must be one of {valid_type_names}")
        
        # Validate frequency is non-negative
        if self.frequency < 0:
            raise ValueError(f"Frequency {self.frequency} must be non-negative")
        
        # Validate pattern_examples is a list of strings
        if not isinstance(self.pattern_examples, list):
            raise ValueError("Pattern examples must be a list")
        
        for example in self.pattern_examples:
            if not isinstance(example, str):
                raise ValueError("All pattern examples must be strings")
    
    def add_pattern_example(self, example: str) -> None:
        """Add a new pattern example"""
        if not isinstance(example, str):
            raise ValueError("Pattern example must be a string")
        self.pattern_examples.append(example)
    
    def increment_frequency(self) -> None:
        """Increment the frequency count"""
        self.frequency += 1
    
    def get_frequency_percentage(self, total_transformations: int) -> float:
        """Calculate percentage of total transformations"""
        if total_transformations == 0:
            return 0.0
        return (self.frequency / total_transformations) * 100.0
    
    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'type_name': self.type_name,
            'description': self.description,
            'pattern_examples': self.pattern_examples,
            'frequency': self.frequency
        }
    
    @classmethod
    def from_dict(cls, data: dict) -> 'TransformationType':
        """Create instance from dictionary"""
        return cls(
            type_name=data['type_name'],
            description=data['description'],
            pattern_examples=data['pattern_examples'],
            frequency=data['frequency']
        )
    
    @classmethod
    def create_hardcoded_to_quantified(cls) -> 'TransformationType':
        """Create hardcoded_to_quantified transformation type"""
        return cls(
            type_name='hardcoded_to_quantified',
            description='Direct device reference replaced with quantifier (e.g., device_0 → ∀i)',
            pattern_examples=[
                'CSTATE Modified T 0 → ∀i. CSTATE Modified T i',
                'reqs1 T → reqs T i',
                'nextDTHDataFrom 1 T → nextDTHDataFrom i T'
            ],
            frequency=0
        )
    
    @classmethod
    def create_multi_conjunct_consolidation(cls) -> 'TransformationType':
        """Create multi_conjunct_consolidation transformation type"""
        return cls(
            type_name='multi_conjunct_consolidation',
            description='Multiple conjuncts merged into single conjunct with logical operators',
            pattern_examples=[
                '(P 0 ∧ P 1) → ∀i. P i',
                '(¬Q 0 ∧ ¬Q 1) → ∀i. ¬Q i'
            ],
            frequency=0
        )
    
    @classmethod
    def create_enhanced_quantification(cls) -> 'TransformationType':
        """Create enhanced_quantification transformation type"""
        return cls(
            type_name='enhanced_quantification',
            description='Complex quantifier patterns with mutual exclusion or existential requirements',
            pattern_examples=[
                '∀i. P i → (∀j. j≠i → ¬Q j)',
                '∀i. P i → (∃j. j≠i ∧ Q j)'
            ],
            frequency=0
        )
    
    @classmethod
    def create_single_conjunct_transformation(cls) -> 'TransformationType':
        """Create single_conjunct_transformation transformation type"""
        return cls(
            type_name='single_conjunct_transformation',
            description='Individual conjunct generalization without consolidation',
            pattern_examples=[
                'globalProperty T → globalProperty T (unchanged)',
                'systemInvariant T → systemInvariant T (generalized)'
            ],
            frequency=0
        )
    
    @classmethod
    def create_no_change(cls) -> 'TransformationType':
        """Create no_change transformation type"""
        return cls(
            type_name='no_change',
            description='Conjuncts that remained semantically identical',
            pattern_examples=[
                'SWMR T → SWMR T',
                'globalConstraint T → globalConstraint T'
            ],
            frequency=0
        )
