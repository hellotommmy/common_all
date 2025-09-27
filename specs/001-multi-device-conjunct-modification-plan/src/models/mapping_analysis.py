"""
MappingAnalysis data class
Overall analysis results and statistics
"""

from dataclasses import dataclass
from typing import Dict, List, Optional
from .conjunct_mapping import ConjunctMapping
from .consolidation_pattern import ConsolidationPattern
from .transformation_type import TransformationType

@dataclass
class MappingAnalysis:
    """Overall analysis results and statistics"""
    
    # Core analysis fields
    total_original_conjuncts: int  # 796
    total_current_conjuncts: int  # 486
    total_mappings: int  # Number of mapping entries
    coverage_percentage: float  # Mapped original conjuncts percentage
    consolidation_ratio: float  # Original/current ratio
    average_confidence: float  # Mean confidence score
    quality_metrics: Dict[str, int]  # High/medium/low confidence counts
    
    # Analysis components
    mappings: List[ConjunctMapping]
    consolidation_patterns: List[ConsolidationPattern]
    transformation_types: List[TransformationType]
    
    def __post_init__(self):
        """Validate fields after initialization"""
        self.validate()
    
    def validate(self) -> None:
        """Validate all fields according to data model requirements"""
        
        # Validate expected conjunct counts
        if self.total_original_conjuncts != 796:
            raise ValueError(f"Total original conjuncts must be 796, got {self.total_original_conjuncts}")
        
        if self.total_current_conjuncts != 486:
            raise ValueError(f"Total current conjuncts must be 486, got {self.total_current_conjuncts}")
        
        # Validate coverage percentage (0-100)
        if not (0.0 <= self.coverage_percentage <= 100.0):
            raise ValueError(f"Coverage percentage {self.coverage_percentage} must be between 0.0 and 100.0")
        
        # Validate consolidation ratio (should be > 1 since 796 > 486)
        if self.consolidation_ratio <= 0:
            raise ValueError(f"Consolidation ratio {self.consolidation_ratio} must be positive")
        
        # Validate average confidence (0.0-1.0)
        if not (0.0 <= self.average_confidence <= 1.0):
            raise ValueError(f"Average confidence {self.average_confidence} must be between 0.0 and 1.0")
        
        # Validate quality metrics structure
        required_metrics = ['high_confidence', 'medium_confidence', 'low_confidence']
        for metric in required_metrics:
            if metric not in self.quality_metrics:
                raise ValueError(f"Quality metrics must include '{metric}'")
            if not isinstance(self.quality_metrics[metric], int) or self.quality_metrics[metric] < 0:
                raise ValueError(f"Quality metric '{metric}' must be a non-negative integer")
    
    def calculate_mapped_original_conjuncts(self) -> int:
        """Calculate total number of original conjuncts that are mapped"""
        mapped_lines = set()
        for mapping in self.mappings:
            mapped_lines.update(mapping.original_lines)
        return len(mapped_lines)
    
    def calculate_coverage_percentage(self) -> float:
        """Calculate coverage percentage based on mapped original conjuncts"""
        mapped_count = self.calculate_mapped_original_conjuncts()
        return (mapped_count / self.total_original_conjuncts) * 100.0
    
    def calculate_consolidation_ratio(self) -> float:
        """Calculate consolidation ratio (original/current)"""
        return self.total_original_conjuncts / self.total_current_conjuncts
    
    def calculate_average_confidence(self) -> float:
        """Calculate average confidence score across all mappings"""
        if not self.mappings:
            return 0.0
        
        total_confidence = sum(mapping.confidence_score for mapping in self.mappings)
        return total_confidence / len(self.mappings)
    
    def calculate_quality_metrics(self) -> Dict[str, int]:
        """Calculate quality metrics (high/medium/low confidence counts)"""
        high_confidence = sum(1 for mapping in self.mappings if mapping.confidence_score > 0.8)
        medium_confidence = sum(1 for mapping in self.mappings if 0.5 <= mapping.confidence_score <= 0.8)
        low_confidence = sum(1 for mapping in self.mappings if mapping.confidence_score < 0.5)
        
        return {
            'high_confidence': high_confidence,
            'medium_confidence': medium_confidence,
            'low_confidence': low_confidence
        }
    
    def get_consolidation_pattern_summary(self) -> Dict[str, int]:
        """Get summary of consolidation patterns"""
        pattern_summary = {}
        for pattern in self.consolidation_patterns:
            pattern_summary[pattern.pattern_type] = pattern.count
        return pattern_summary
    
    def get_transformation_type_summary(self) -> Dict[str, int]:
        """Get summary of transformation types"""
        type_summary = {}
        for trans_type in self.transformation_types:
            type_summary[trans_type.type_name] = trans_type.frequency
        return type_summary
    
    def is_complete_coverage(self) -> bool:
        """Check if all 796 original conjuncts are mapped (100% coverage)"""
        return self.coverage_percentage >= 100.0
    
    def is_high_quality(self) -> bool:
        """Check if analysis meets high quality thresholds"""
        return (
            self.is_complete_coverage() and
            self.average_confidence > 0.8 and
            self.quality_metrics.get('high_confidence', 0) > self.quality_metrics.get('low_confidence', 0)
        )
    
    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'mapping_summary': {
                'total_original_conjuncts': self.total_original_conjuncts,
                'total_current_conjuncts': self.total_current_conjuncts,
                'total_mappings': self.total_mappings,
                'coverage_percentage': self.coverage_percentage,
                'consolidation_ratio': self.consolidation_ratio,
                'average_confidence': self.average_confidence
            },
            'quality_metrics': self.quality_metrics,
            'consolidation_patterns': self.get_consolidation_pattern_summary(),
            'transformation_types': self.get_transformation_type_summary(),
            'mappings': [mapping.to_dict() for mapping in self.mappings],
            'consolidation_pattern_details': [pattern.to_dict() for pattern in self.consolidation_patterns],
            'transformation_type_details': [trans_type.to_dict() for trans_type in self.transformation_types]
        }
    
    @classmethod
    def create_empty_analysis(cls) -> 'MappingAnalysis':
        """Create an empty analysis with default values"""
        return cls(
            total_original_conjuncts=796,
            total_current_conjuncts=486,
            total_mappings=0,
            coverage_percentage=0.0,
            consolidation_ratio=796.0/486.0,
            average_confidence=0.0,
            quality_metrics={'high_confidence': 0, 'medium_confidence': 0, 'low_confidence': 0},
            mappings=[],
            consolidation_patterns=[],
            transformation_types=[]
        )
