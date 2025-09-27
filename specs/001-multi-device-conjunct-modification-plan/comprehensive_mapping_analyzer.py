"""
Comprehensive Mapping Analyzer Orchestrator
Main orchestrator for the complete conjunct mapping analysis workflow
"""

import os
import sys
import json
import traceback
from typing import Dict, List, Optional, Tuple
from datetime import datetime
from dataclasses import dataclass, asdict

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from extractors.conjunct_extractor import ConjunctExtractor
from algorithms.sequential_mapper import SequentialMapper
from algorithms.similarity_calculator import SimilarityCalculator
from analyzers.consolidation_detector import ConsolidationDetector
from analyzers.transformation_classifier import TransformationClassifier
from integrators.progress_updater import DocumentationIntegrationInterface
from validators.mapping_validator import ValidationInterface

@dataclass
class AnalysisConfiguration:
    """Configuration for comprehensive mapping analysis"""
    original_file_path: str
    current_file_path: str
    original_line_range: Tuple[int, int]
    current_line_range: Tuple[int, int]
    output_directory: str
    enable_validation: bool = True
    enable_documentation_update: bool = True
    confidence_threshold: float = 0.5
    max_consolidation_ratio: int = 5

@dataclass
class AnalysisResults:
    """Results from comprehensive mapping analysis"""
    analysis_id: str
    timestamp: str
    configuration: AnalysisConfiguration
    mappings: List[Dict]
    original_conjuncts: Dict[int, str]
    current_conjuncts: Dict[int, str]
    quality_metrics: Dict[str, float]
    validation_results: Dict[str, any]
    execution_time: float
    success: bool
    error_message: Optional[str]

class ComprehensiveMappingAnalyzer:
    """Main orchestrator for comprehensive conjunct mapping analysis"""
    
    def __init__(self, config: AnalysisConfiguration):
        """
        Initialize the comprehensive mapping analyzer
        
        Args:
            config: Analysis configuration
        """
        self.config = config
        self.analysis_id = f"mapping_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        
        # Initialize components
        self.conjunct_extractor = ConjunctExtractor()
        self.similarity_calculator = SimilarityCalculator()
        self.sequential_mapper = SequentialMapper(self.similarity_calculator)
        self.consolidation_detector = ConsolidationDetector()
        self.transformation_classifier = TransformationClassifier()
        
        if config.enable_validation:
            self.validator = ValidationInterface()
        
        if config.enable_documentation_update:
            self.documentation_integrator = DocumentationIntegrationInterface()
        
        # Ensure output directory exists
        os.makedirs(config.output_directory, exist_ok=True)
    
    def run_comprehensive_analysis(self) -> AnalysisResults:
        """
        Run the complete comprehensive mapping analysis workflow
        
        Returns:
            AnalysisResults with complete analysis results
        """
        start_time = datetime.now()
        
        try:
            print(f"🚀 Starting comprehensive mapping analysis: {self.analysis_id}")
            print(f"📁 Original file: {self.config.original_file_path}")
            print(f"📁 Current file: {self.config.current_file_path}")
            print(f"📊 Original range: lines {self.config.original_line_range[0]}-{self.config.original_line_range[1]}")
            print(f"📊 Current range: lines {self.config.current_line_range[0]}-{self.config.current_line_range[1]}")
            
            # Phase 1: Extract conjuncts
            print("\n🔍 Phase 1: Extracting conjuncts...")
            original_conjuncts = self._extract_original_conjuncts()
            current_conjuncts = self._extract_current_conjuncts()
            
            print(f"✅ Extracted {len(original_conjuncts)} original conjuncts")
            print(f"✅ Extracted {len(current_conjuncts)} current conjuncts")
            
            # Phase 2: Sequential mapping analysis
            print("\n🔗 Phase 2: Sequential mapping analysis...")
            mappings = self._perform_sequential_mapping(original_conjuncts, current_conjuncts)
            
            print(f"✅ Generated {len(mappings)} mappings")
            
            # Phase 3: Consolidation and transformation analysis
            print("\n🔬 Phase 3: Consolidation and transformation analysis...")
            enhanced_mappings = self._enhance_mappings_with_analysis(mappings, original_conjuncts, current_conjuncts)
            
            print(f"✅ Enhanced {len(enhanced_mappings)} mappings with detailed analysis")
            
            # Phase 4: Validation (if enabled)
            validation_results = {}
            if self.config.enable_validation:
                print("\n✅ Phase 4: Validation and quality assurance...")
                validation_results = self._perform_validation(enhanced_mappings, original_conjuncts, current_conjuncts)
                
                print(f"✅ Validation completed - Overall quality: {validation_results.get('quality_metrics', {}).get('overall_quality', 0):.3f}")
            
            # Phase 5: Documentation integration (if enabled)
            if self.config.enable_documentation_update:
                print("\n📝 Phase 5: Documentation integration...")
                self._update_documentation(enhanced_mappings, original_conjuncts, current_conjuncts, validation_results)
                
                print("✅ Documentation updated successfully")
            
            # Phase 6: Generate outputs
            print("\n📄 Phase 6: Generating outputs...")
            self._generate_analysis_outputs(enhanced_mappings, original_conjuncts, current_conjuncts, validation_results)
            
            execution_time = (datetime.now() - start_time).total_seconds()
            
            # Create results object
            results = AnalysisResults(
                analysis_id=self.analysis_id,
                timestamp=start_time.isoformat(),
                configuration=self.config,
                mappings=enhanced_mappings,
                original_conjuncts=original_conjuncts,
                current_conjuncts=current_conjuncts,
                quality_metrics=validation_results.get('quality_metrics', {}),
                validation_results=validation_results,
                execution_time=execution_time,
                success=True,
                error_message=None
            )
            
            print(f"\n🎉 Analysis completed successfully in {execution_time:.2f} seconds")
            print(f"📊 Coverage: {len(set().union(*[m['original_lines'] for m in enhanced_mappings]))}/796 original conjuncts")
            print(f"📈 Quality score: {validation_results.get('quality_metrics', {}).get('overall_quality', 0):.3f}")
            
            return results
            
        except Exception as e:
            execution_time = (datetime.now() - start_time).total_seconds()
            error_message = f"Analysis failed: {str(e)}\n{traceback.format_exc()}"
            
            print(f"\n❌ Analysis failed after {execution_time:.2f} seconds")
            print(f"Error: {str(e)}")
            
            return AnalysisResults(
                analysis_id=self.analysis_id,
                timestamp=start_time.isoformat(),
                configuration=self.config,
                mappings=[],
                original_conjuncts={},
                current_conjuncts={},
                quality_metrics={},
                validation_results={},
                execution_time=execution_time,
                success=False,
                error_message=error_message
            )
    
    def _extract_original_conjuncts(self) -> Dict[int, str]:
        """Extract original conjuncts from the source file"""
        return self.conjunct_extractor.load_conjuncts(
            self.config.original_file_path,
            self.config.original_line_range[0],
            self.config.original_line_range[1]
        )
    
    def _extract_current_conjuncts(self) -> Dict[int, str]:
        """Extract current conjuncts from the target file"""
        return self.conjunct_extractor.load_conjuncts(
            self.config.current_file_path,
            self.config.current_line_range[0],
            self.config.current_line_range[1]
        )
    
    def _perform_sequential_mapping(self, original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str]) -> List[Dict]:
        """Perform sequential two-pointer mapping analysis"""
        return self.sequential_mapper.run_sequential_mapping(original_conjuncts, current_conjuncts)
    
    def _enhance_mappings_with_analysis(self, mappings: List[Dict], original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str]) -> List[Dict]:
        """Enhance mappings with consolidation and transformation analysis"""
        enhanced_mappings = []
        
        for mapping in mappings:
            # Add consolidation analysis
            consolidation_pattern = self.consolidation_detector.detect_consolidation_pattern(
                mapping, original_conjuncts, current_conjuncts
            )
            
            # Add transformation classification
            transformation_type = self.transformation_classifier.classify_transformation(
                mapping, original_conjuncts, current_conjuncts
            )
            
            # Create enhanced mapping
            enhanced_mapping = {
                **mapping,
                'consolidation_pattern': consolidation_pattern,
                'transformation_type': transformation_type,
                'analysis_metadata': {
                    'original_count': len(mapping['original_lines']),
                    'consolidation_ratio': f"{len(mapping['original_lines'])}:1",
                    'complexity_score': self._calculate_complexity_score(mapping, original_conjuncts, current_conjuncts)
                }
            }
            
            enhanced_mappings.append(enhanced_mapping)
        
        return enhanced_mappings
    
    def _calculate_complexity_score(self, mapping: Dict, original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str]) -> float:
        """Calculate complexity score for a mapping"""
        # Base complexity from consolidation ratio
        consolidation_complexity = len(mapping['original_lines']) / 5.0  # Normalize to 0-1 range
        
        # Text complexity from current conjunct length
        current_text = current_conjuncts.get(mapping['current_line'], '')
        text_complexity = min(len(current_text) / 500.0, 1.0)  # Normalize to 0-1 range
        
        # Quantification complexity (nested quantifiers increase complexity)
        quantifier_count = current_text.count('∀') + current_text.count('∃')
        quantifier_complexity = min(quantifier_count / 3.0, 1.0)  # Normalize to 0-1 range
        
        # Weighted average
        return (consolidation_complexity * 0.4 + text_complexity * 0.3 + quantifier_complexity * 0.3)
    
    def _perform_validation(self, mappings: List[Dict], original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str]) -> Dict[str, any]:
        """Perform comprehensive validation"""
        mapping_results = {
            'mappings': mappings,
            'original_conjuncts': original_conjuncts,
            'current_conjuncts': current_conjuncts
        }
        
        # Run all validations
        coverage_valid = self.validator.validate_coverage(mapping_results)
        semantic_valid = self.validator.validate_semantic_equivalence(mapping_results)
        consolidation_valid = self.validator.validate_consolidation_patterns(mapping_results)
        documentation_valid = self.validator.validate_documentation_consistency(mapping_results)
        
        # Calculate quality metrics
        quality_metrics = self.validator.calculate_quality_metrics(mapping_results)
        
        # Generate validation report
        validation_report = self.validator.generate_validation_report(mapping_results)
        
        return {
            'coverage_valid': coverage_valid,
            'semantic_valid': semantic_valid,
            'consolidation_valid': consolidation_valid,
            'documentation_valid': documentation_valid,
            'quality_metrics': quality_metrics,
            'validation_report': validation_report
        }
    
    def _update_documentation(self, mappings: List[Dict], original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str], validation_results: Dict):
        """Update all documentation files"""
        mapping_results = {
            'mappings': mappings,
            'original_conjuncts': original_conjuncts,
            'current_conjuncts': current_conjuncts,
            'quality_metrics': validation_results.get('quality_metrics', {})
        }
        
        # Update progress tracking
        self.documentation_integrator.update_progress_tracking(mapping_results)
        
        # Update detailed modifications
        self.documentation_integrator.update_detailed_modifications(mapping_results)
        
        # Update progress report
        self.documentation_integrator.update_progress_report(mapping_results)
        
        # Create comprehensive mapping documentation
        mapping_doc_path = os.path.join(self.config.output_directory, f"{self.analysis_id}_comprehensive_mapping.md")
        self.documentation_integrator.create_mapping_documentation(mapping_results, mapping_doc_path)
    
    def _generate_analysis_outputs(self, mappings: List[Dict], original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str], validation_results: Dict):
        """Generate analysis output files"""
        # Save raw mapping data
        mapping_data = {
            'analysis_id': self.analysis_id,
            'timestamp': datetime.now().isoformat(),
            'mappings': mappings,
            'original_conjuncts': original_conjuncts,
            'current_conjuncts': current_conjuncts,
            'validation_results': validation_results
        }
        
        mapping_data_path = os.path.join(self.config.output_directory, f"{self.analysis_id}_mapping_data.json")
        with open(mapping_data_path, 'w', encoding='utf-8') as f:
            json.dump(mapping_data, f, indent=2, ensure_ascii=False)
        
        # Save validation report
        if validation_results.get('validation_report'):
            validation_report_path = os.path.join(self.config.output_directory, f"{self.analysis_id}_validation_report.md")
            with open(validation_report_path, 'w', encoding='utf-8') as f:
                f.write(validation_results['validation_report'])
        
        # Save analysis summary
        summary = self._generate_analysis_summary(mappings, original_conjuncts, current_conjuncts, validation_results)
        summary_path = os.path.join(self.config.output_directory, f"{self.analysis_id}_summary.md")
        with open(summary_path, 'w', encoding='utf-8') as f:
            f.write(summary)
        
        print(f"📄 Analysis outputs saved to: {self.config.output_directory}")
        print(f"   - Mapping data: {os.path.basename(mapping_data_path)}")
        print(f"   - Validation report: {os.path.basename(validation_report_path)}")
        print(f"   - Analysis summary: {os.path.basename(summary_path)}")
    
    def _generate_analysis_summary(self, mappings: List[Dict], original_conjuncts: Dict[int, str], current_conjuncts: Dict[int, str], validation_results: Dict) -> str:
        """Generate analysis summary"""
        quality_metrics = validation_results.get('quality_metrics', {})
        
        # Calculate statistics
        total_original = len(original_conjuncts)
        total_current = len(current_conjuncts)
        total_mappings = len(mappings)
        mapped_original = len(set().union(*[m['original_lines'] for m in mappings]))
        
        # Count consolidation patterns
        consolidation_counts = {}
        for mapping in mappings:
            ratio = len(mapping['original_lines'])
            consolidation_counts[ratio] = consolidation_counts.get(ratio, 0) + 1
        
        summary_lines = [
            f"# Comprehensive Mapping Analysis Summary",
            f"**Analysis ID**: {self.analysis_id}",
            f"**Timestamp**: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
            "",
            "## Overview",
            f"- **Original Conjuncts**: {total_original}",
            f"- **Current Conjuncts**: {total_current}",
            f"- **Total Mappings**: {total_mappings}",
            f"- **Mapped Original Conjuncts**: {mapped_original}/796 ({mapped_original/796*100:.1f}%)",
            f"- **Overall Quality Score**: {quality_metrics.get('overall_quality', 0):.3f}",
            "",
            "## Consolidation Analysis",
        ]
        
        for ratio, count in sorted(consolidation_counts.items()):
            percentage = (count / total_mappings) * 100.0
            summary_lines.append(f"- **{ratio}:1 Consolidation**: {count} mappings ({percentage:.1f}%)")
        
        summary_lines.extend([
            "",
            "## Quality Metrics",
            f"- **Coverage Score**: {quality_metrics.get('coverage_score', 0):.3f}",
            f"- **Semantic Score**: {quality_metrics.get('semantic_score', 0):.3f}",
            f"- **Consolidation Score**: {quality_metrics.get('consolidation_score', 0):.3f}",
            f"- **Documentation Score**: {quality_metrics.get('documentation_score', 0):.3f}",
            "",
            "## Validation Results",
            f"- **Coverage Valid**: {'✅' if validation_results.get('coverage_valid') else '❌'}",
            f"- **Semantic Valid**: {'✅' if validation_results.get('semantic_valid') else '❌'}",
            f"- **Consolidation Valid**: {'✅' if validation_results.get('consolidation_valid') else '❌'}",
            f"- **Documentation Valid**: {'✅' if validation_results.get('documentation_valid') else '❌'}",
        ])
        
        return "\n".join(summary_lines)

def create_default_configuration() -> AnalysisConfiguration:
    """Create default analysis configuration"""
    return AnalysisConfiguration(
        original_file_path='betterProofAll/Common/OldCohProp.thy',
        current_file_path='betterProofAll/Common/CoherenceProperties.thy',
        original_line_range=(200, 995),
        current_line_range=(200, 700),  # Adjust based on actual file
        output_directory='mapping_analysis_results',
        enable_validation=True,
        enable_documentation_update=True,
        confidence_threshold=0.5,
        max_consolidation_ratio=5
    )

def main():
    """Main entry point for comprehensive mapping analysis"""
    print("🔍 Comprehensive Conjunct Mapping Analyzer")
    print("=" * 50)
    
    # Create configuration
    config = create_default_configuration()
    
    # Initialize analyzer
    analyzer = ComprehensiveMappingAnalyzer(config)
    
    # Run analysis
    results = analyzer.run_comprehensive_analysis()
    
    if results.success:
        print(f"\n✅ Analysis completed successfully!")
        print(f"📊 Results available in: {config.output_directory}")
        return 0
    else:
        print(f"\n❌ Analysis failed!")
        print(f"Error: {results.error_message}")
        return 1

if __name__ == "__main__":
    sys.exit(main())
