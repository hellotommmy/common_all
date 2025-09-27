"""
Mapping validation framework for comprehensive quality assurance
Validates mapping completeness, semantic correctness, and documentation consistency
"""

import os
import re
from typing import Dict, List, Optional, Tuple, Set
from dataclasses import dataclass
from collections import defaultdict

@dataclass
class ValidationResult:
    """Represents a validation result"""
    is_valid: bool
    error_count: int
    warning_count: int
    errors: List[str]
    warnings: List[str]
    quality_score: float
    details: Dict[str, any]

@dataclass
class CoverageValidation:
    """Represents coverage validation results"""
    expected_conjuncts: int
    mapped_conjuncts: int
    unmapped_lines: List[int]
    coverage_percentage: float
    is_complete: bool

@dataclass
class SemanticValidation:
    """Represents semantic validation results"""
    total_mappings: int
    high_confidence_count: int
    low_confidence_count: int
    semantic_errors: List[str]
    semantic_warnings: List[str]
    average_confidence: float

class MappingValidator:
    """Comprehensive mapping validation framework"""
    
    def __init__(self):
        """Initialize the mapping validator"""
        self.validation_rules = self._initialize_validation_rules()
        
    def validate_coverage(self, mapping_results: Dict) -> CoverageValidation:
        """
        Validate mapping coverage completeness
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            CoverageValidation with coverage analysis
        """
        mappings = mapping_results.get('mappings', [])
        
        # Calculate mapped conjuncts
        mapped_lines = set()
        for mapping in mappings:
            mapped_lines.update(mapping['original_lines'])
        
        # Expected lines: 200-995 (796 conjuncts)
        expected_lines = set(range(200, 996))
        unmapped_lines = sorted(list(expected_lines - mapped_lines))
        
        coverage_percentage = (len(mapped_lines) / len(expected_lines)) * 100.0
        
        return CoverageValidation(
            expected_conjuncts=len(expected_lines),
            mapped_conjuncts=len(mapped_lines),
            unmapped_lines=unmapped_lines,
            coverage_percentage=coverage_percentage,
            is_complete=len(unmapped_lines) == 0
        )
    
    def validate_semantic_equivalence(self, mapping_results: Dict) -> SemanticValidation:
        """
        Validate semantic equivalence of mappings
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            SemanticValidation with semantic analysis
        """
        mappings = mapping_results.get('mappings', [])
        original_conjuncts = mapping_results.get('original_conjuncts', {})
        current_conjuncts = mapping_results.get('current_conjuncts', {})
        
        semantic_errors = []
        semantic_warnings = []
        high_confidence_count = 0
        low_confidence_count = 0
        
        for mapping in mappings:
            confidence = mapping['confidence_score']
            
            # Count confidence levels
            if confidence >= 0.9:
                high_confidence_count += 1
            elif confidence < 0.5:
                low_confidence_count += 1
            
            # Validate semantic patterns
            semantic_issues = self._validate_mapping_semantics(
                mapping, original_conjuncts, current_conjuncts
            )
            
            semantic_errors.extend(semantic_issues['errors'])
            semantic_warnings.extend(semantic_issues['warnings'])
        
        average_confidence = sum(m['confidence_score'] for m in mappings) / len(mappings) if mappings else 0.0
        
        return SemanticValidation(
            total_mappings=len(mappings),
            high_confidence_count=high_confidence_count,
            low_confidence_count=low_confidence_count,
            semantic_errors=semantic_errors,
            semantic_warnings=semantic_warnings,
            average_confidence=average_confidence
        )
    
    def validate_consolidation_patterns(self, mapping_results: Dict) -> ValidationResult:
        """
        Validate consolidation patterns for correctness
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            ValidationResult for consolidation patterns
        """
        mappings = mapping_results.get('mappings', [])
        errors = []
        warnings = []
        
        # Analyze consolidation patterns
        consolidation_stats = defaultdict(int)
        transformation_stats = defaultdict(int)
        
        for mapping in mappings:
            consolidation_ratio = len(mapping['original_lines'])
            transformation_type = mapping['transformation_type']
            
            consolidation_stats[consolidation_ratio] += 1
            transformation_stats[transformation_type] += 1
            
            # Validate consolidation logic
            consolidation_issues = self._validate_consolidation_logic(mapping)
            errors.extend(consolidation_issues['errors'])
            warnings.extend(consolidation_issues['warnings'])
        
        # Check for expected patterns
        if consolidation_stats[2] == 0:
            warnings.append("No 2:1 consolidations found - expected for device pair patterns")
        
        if consolidation_stats[1] < len(mappings) * 0.3:
            warnings.append("Low 1:1 mapping ratio - may indicate over-consolidation")
        
        quality_score = self._calculate_consolidation_quality_score(
            consolidation_stats, transformation_stats, errors, warnings
        )
        
        return ValidationResult(
            is_valid=len(errors) == 0,
            error_count=len(errors),
            warning_count=len(warnings),
            errors=errors,
            warnings=warnings,
            quality_score=quality_score,
            details={
                'consolidation_stats': dict(consolidation_stats),
                'transformation_stats': dict(transformation_stats)
            }
        )
    
    def validate_documentation_consistency(self, mapping_results: Dict) -> ValidationResult:
        """
        Validate consistency across all documentation files
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            ValidationResult for documentation consistency
        """
        errors = []
        warnings = []
        
        # Check file existence
        required_files = [
            'betterProofAll/Common/SWMR_modification_progress.py',
            'betterProofAll/Common/DETAILED_MODIFICATIONS.md',
            'betterProofAll/Common/PROGRESS_REPORT.md'
        ]
        
        for file_path in required_files:
            if not os.path.exists(file_path):
                errors.append(f"Required documentation file missing: {file_path}")
        
        # Validate documentation content consistency
        if not errors:  # Only if all files exist
            consistency_issues = self._validate_documentation_content_consistency(mapping_results)
            errors.extend(consistency_issues['errors'])
            warnings.extend(consistency_issues['warnings'])
        
        quality_score = 1.0 - (len(errors) * 0.2 + len(warnings) * 0.1)
        quality_score = max(0.0, min(1.0, quality_score))
        
        return ValidationResult(
            is_valid=len(errors) == 0,
            error_count=len(errors),
            warning_count=len(warnings),
            errors=errors,
            warnings=warnings,
            quality_score=quality_score,
            details={'files_checked': required_files}
        )
    
    def calculate_quality_metrics(self, mapping_results: Dict) -> Dict[str, float]:
        """
        Calculate comprehensive quality metrics
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            Dictionary of quality metrics
        """
        coverage_validation = self.validate_coverage(mapping_results)
        semantic_validation = self.validate_semantic_equivalence(mapping_results)
        consolidation_validation = self.validate_consolidation_patterns(mapping_results)
        documentation_validation = self.validate_documentation_consistency(mapping_results)
        
        # Calculate composite metrics
        coverage_score = coverage_validation.coverage_percentage / 100.0
        semantic_score = semantic_validation.average_confidence
        consolidation_score = consolidation_validation.quality_score
        documentation_score = documentation_validation.quality_score
        
        # Calculate overall quality score (weighted average)
        overall_quality = (
            coverage_score * 0.3 +
            semantic_score * 0.3 +
            consolidation_score * 0.2 +
            documentation_score * 0.2
        )
        
        return {
            'overall_quality': overall_quality,
            'coverage_score': coverage_score,
            'semantic_score': semantic_score,
            'consolidation_score': consolidation_score,
            'documentation_score': documentation_score,
            'completeness_ratio': coverage_validation.coverage_percentage / 100.0,
            'confidence_ratio': semantic_validation.high_confidence_count / max(1, semantic_validation.total_mappings),
            'error_ratio': (consolidation_validation.error_count + documentation_validation.error_count) / max(1, semantic_validation.total_mappings)
        }
    
    def _initialize_validation_rules(self) -> Dict[str, any]:
        """Initialize validation rules and patterns"""
        return {
            'quantification_patterns': [
                r'∀i\.',  # Universal quantification
                r'∀j\.',  # Nested quantification
                r'∃i\.',  # Existential quantification
            ],
            'device_reference_patterns': [
                r'reqs\s+T\s+i',  # Quantified device reference
                r'CSTATE\s+\w+\s+T\s+i',  # Cache state reference
            ],
            'forbidden_patterns': [
                r'reqs1',  # Hardcoded device 1
                r'reqs2',  # Hardcoded device 2
                r'CSTATE\s+\w+\s+T\s+0',  # Hardcoded device 0
                r'CSTATE\s+\w+\s+T\s+1',  # Hardcoded device 1
            ],
            'confidence_thresholds': {
                'high': 0.9,
                'medium': 0.7,
                'low': 0.5
            }
        }
    
    def _validate_mapping_semantics(self, mapping: Dict, original_conjuncts: Dict, current_conjuncts: Dict) -> Dict[str, List[str]]:
        """Validate semantic correctness of a single mapping"""
        errors = []
        warnings = []
        
        current_line = mapping['current_line']
        current_text = current_conjuncts.get(current_line, '')
        
        # Check for forbidden hardcoded patterns in current conjunct
        for pattern in self.validation_rules['forbidden_patterns']:
            if re.search(pattern, current_text):
                errors.append(f"Line {current_line}: Contains forbidden hardcoded pattern: {pattern}")
        
        # Check for required quantification patterns
        has_quantification = any(
            re.search(pattern, current_text) 
            for pattern in self.validation_rules['quantification_patterns']
        )
        
        if not has_quantification and mapping['transformation_type'] != 'DIRECT_QUANTIFICATION':
            warnings.append(f"Line {current_line}: Missing expected quantification patterns")
        
        # Validate transformation type consistency
        transformation_type = mapping['transformation_type']
        if transformation_type == 'TWO_TO_ONE_MUTEX' and len(mapping['original_lines']) != 2:
            errors.append(f"Line {current_line}: TWO_TO_ONE_MUTEX should consolidate exactly 2 conjuncts, got {len(mapping['original_lines'])}")
        
        # Check confidence vs complexity
        if len(mapping['original_lines']) > 2 and mapping['confidence_score'] > 0.9:
            warnings.append(f"Line {current_line}: High confidence for complex consolidation may need review")
        
        return {'errors': errors, 'warnings': warnings}
    
    def _validate_consolidation_logic(self, mapping: Dict) -> Dict[str, List[str]]:
        """Validate consolidation logic for a single mapping"""
        errors = []
        warnings = []
        
        original_count = len(mapping['original_lines'])
        transformation_type = mapping['transformation_type']
        confidence = mapping['confidence_score']
        
        # Validate consolidation ratios
        if original_count == 1 and transformation_type not in ['DIRECT_QUANTIFICATION', 'HARDCODED_TO_QUANTIFIED']:
            warnings.append(f"Lines {mapping['original_lines']}: 1:1 mapping with unexpected transformation type {transformation_type}")
        
        if original_count > 4:
            warnings.append(f"Lines {mapping['original_lines']}: High consolidation ratio ({original_count}:1) may indicate over-consolidation")
        
        # Validate confidence vs consolidation complexity
        expected_confidence = 1.0 - (original_count - 1) * 0.1  # Decrease confidence with complexity
        if confidence > expected_confidence + 0.2:
            warnings.append(f"Lines {mapping['original_lines']}: Confidence {confidence:.3f} may be too high for {original_count}:1 consolidation")
        
        return {'errors': errors, 'warnings': warnings}
    
    def _calculate_consolidation_quality_score(self, consolidation_stats: Dict, transformation_stats: Dict, errors: List[str], warnings: List[str]) -> float:
        """Calculate quality score for consolidation patterns"""
        base_score = 1.0
        
        # Penalize errors and warnings
        base_score -= len(errors) * 0.2
        base_score -= len(warnings) * 0.05
        
        # Reward balanced consolidation patterns
        total_mappings = sum(consolidation_stats.values())
        if total_mappings > 0:
            # Ideal distribution: mostly 1:1 and 2:1, some higher ratios
            one_to_one_ratio = consolidation_stats[1] / total_mappings
            two_to_one_ratio = consolidation_stats[2] / total_mappings
            
            if 0.4 <= one_to_one_ratio <= 0.7 and 0.2 <= two_to_one_ratio <= 0.4:
                base_score += 0.1  # Bonus for good distribution
        
        return max(0.0, min(1.0, base_score))
    
    def _validate_documentation_content_consistency(self, mapping_results: Dict) -> Dict[str, List[str]]:
        """Validate consistency across documentation files"""
        errors = []
        warnings = []
        
        # This would check for consistency between files
        # For now, we'll implement basic checks
        
        mappings = mapping_results.get('mappings', [])
        total_mappings = len(mappings)
        
        if total_mappings == 0:
            errors.append("No mappings found in results - documentation may be incomplete")
        
        # Check for reasonable mapping count
        if total_mappings < 400:  # Expect significant consolidation
            warnings.append(f"Low mapping count ({total_mappings}) - may indicate incomplete analysis")
        
        return {'errors': errors, 'warnings': warnings}

class ValidationInterface:
    """Interface for validation operations"""
    
    def __init__(self):
        """Initialize the validation interface"""
        self.validator = MappingValidator()
    
    def validate_coverage(self, mapping_results: Dict) -> bool:
        """Validate mapping coverage completeness"""
        coverage_validation = self.validator.validate_coverage(mapping_results)
        return coverage_validation.is_complete
    
    def validate_semantic_equivalence(self, mapping_results: Dict) -> bool:
        """Validate semantic equivalence of mappings"""
        semantic_validation = self.validator.validate_semantic_equivalence(mapping_results)
        return len(semantic_validation.semantic_errors) == 0
    
    def validate_consolidation_patterns(self, mapping_results: Dict) -> bool:
        """Validate consolidation patterns for correctness"""
        consolidation_validation = self.validator.validate_consolidation_patterns(mapping_results)
        return consolidation_validation.is_valid
    
    def validate_documentation_consistency(self, mapping_results: Dict) -> bool:
        """Validate consistency across all documentation files"""
        documentation_validation = self.validator.validate_documentation_consistency(mapping_results)
        return documentation_validation.is_valid
    
    def calculate_quality_metrics(self, mapping_results: Dict) -> Dict[str, float]:
        """Calculate comprehensive quality metrics"""
        return self.validator.calculate_quality_metrics(mapping_results)
    
    def generate_validation_report(self, mapping_results: Dict) -> str:
        """Generate comprehensive validation report"""
        coverage = self.validator.validate_coverage(mapping_results)
        semantic = self.validator.validate_semantic_equivalence(mapping_results)
        consolidation = self.validator.validate_consolidation_patterns(mapping_results)
        documentation = self.validator.validate_documentation_consistency(mapping_results)
        quality_metrics = self.validator.calculate_quality_metrics(mapping_results)
        
        report_lines = [
            "# Comprehensive Mapping Validation Report",
            f"*Generated on {__import__('datetime').datetime.now().strftime('%Y-%m-%d %H:%M:%S')}*",
            "",
            "## Executive Summary",
            f"- **Overall Quality Score**: {quality_metrics['overall_quality']:.3f}",
            f"- **Coverage**: {coverage.coverage_percentage:.1f}% ({coverage.mapped_conjuncts}/796)",
            f"- **Average Confidence**: {semantic.average_confidence:.3f}",
            f"- **Total Errors**: {consolidation.error_count + documentation.error_count}",
            f"- **Total Warnings**: {consolidation.warning_count + documentation.warning_count}",
            "",
            "## Coverage Validation",
            f"- **Expected Conjuncts**: {coverage.expected_conjuncts}",
            f"- **Mapped Conjuncts**: {coverage.mapped_conjuncts}",
            f"- **Coverage Percentage**: {coverage.coverage_percentage:.1f}%",
            f"- **Is Complete**: {'✅ Yes' if coverage.is_complete else '❌ No'}",
        ]
        
        if coverage.unmapped_lines:
            report_lines.extend([
                f"- **Unmapped Lines**: {len(coverage.unmapped_lines)} lines",
                f"  - First 10: {coverage.unmapped_lines[:10]}"
            ])
        
        report_lines.extend([
            "",
            "## Semantic Validation",
            f"- **Total Mappings**: {semantic.total_mappings}",
            f"- **High Confidence**: {semantic.high_confidence_count} ({semantic.high_confidence_count/max(1,semantic.total_mappings)*100:.1f}%)",
            f"- **Low Confidence**: {semantic.low_confidence_count} ({semantic.low_confidence_count/max(1,semantic.total_mappings)*100:.1f}%)",
            f"- **Semantic Errors**: {len(semantic.semantic_errors)}",
            f"- **Semantic Warnings**: {len(semantic.semantic_warnings)}",
        ])
        
        if semantic.semantic_errors:
            report_lines.extend([
                "",
                "### Semantic Errors",
                *[f"- {error}" for error in semantic.semantic_errors[:5]]
            ])
        
        report_lines.extend([
            "",
            "## Quality Metrics",
            f"- **Coverage Score**: {quality_metrics['coverage_score']:.3f}",
            f"- **Semantic Score**: {quality_metrics['semantic_score']:.3f}",
            f"- **Consolidation Score**: {quality_metrics['consolidation_score']:.3f}",
            f"- **Documentation Score**: {quality_metrics['documentation_score']:.3f}",
            f"- **Completeness Ratio**: {quality_metrics['completeness_ratio']:.3f}",
            f"- **Confidence Ratio**: {quality_metrics['confidence_ratio']:.3f}",
            f"- **Error Ratio**: {quality_metrics['error_ratio']:.3f}",
        ])
        
        return "\n".join(report_lines)
