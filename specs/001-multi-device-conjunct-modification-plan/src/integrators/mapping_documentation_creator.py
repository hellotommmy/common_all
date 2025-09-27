"""
Comprehensive mapping documentation creator
Creates standalone mapping documentation file with complete analysis
"""

import os
import json
from typing import Dict, List, Optional, Tuple
from datetime import datetime
from dataclasses import dataclass, asdict

@dataclass
class ComprehensiveMappingEntry:
    """Represents a comprehensive mapping entry for documentation"""
    mapping_id: str
    original_lines: List[int]
    original_conjuncts: List[str]
    current_line: int
    current_conjunct: str
    transformation_type: str
    consolidation_ratio: str
    semantic_analysis: str
    confidence_score: float
    quality_flags: List[str]
    verification_status: str

class MappingDocumentationCreator:
    """Creates comprehensive mapping documentation file"""
    
    def __init__(self):
        """Initialize the mapping documentation creator"""
        self.mapping_entries = []
        self.metadata = {}
        
    def create_mapping_documentation(self, mapping_results: Dict, output_path: str) -> bool:
        """
        Create comprehensive mapping documentation file
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            output_path: Path for the output documentation file
            
        Returns:
            True if creation successful, False otherwise
        """
        try:
            # Process mapping results
            self._process_mapping_results(mapping_results)
            
            # Generate documentation content
            documentation_content = self._generate_documentation_content()
            
            # Write documentation file
            return self._write_documentation_file(output_path, documentation_content)
            
        except Exception as e:
            print(f"Error creating mapping documentation: {e}")
            return False
    
    def _process_mapping_results(self, mapping_results: Dict):
        """Process mapping results into comprehensive entries"""
        self.mapping_entries = []
        
        mappings = mapping_results.get('mappings', [])
        original_conjuncts = mapping_results.get('original_conjuncts', {})
        current_conjuncts = mapping_results.get('current_conjuncts', {})
        quality_metrics = mapping_results.get('quality_metrics', {})
        
        # Store metadata
        self.metadata = {
            'analysis_timestamp': datetime.now().isoformat(),
            'total_mappings': len(mappings),
            'original_conjuncts_count': len(original_conjuncts),
            'current_conjuncts_count': len(current_conjuncts),
            'quality_metrics': quality_metrics,
            'coverage_percentage': (sum(len(m['original_lines']) for m in mappings) / 796) * 100.0
        }
        
        # Process each mapping
        for i, mapping in enumerate(mappings, 1):
            # Get original conjunct texts
            original_texts = []
            for line_num in mapping['original_lines']:
                if line_num in original_conjuncts:
                    original_texts.append(original_conjuncts[line_num])
                else:
                    original_texts.append(f"[MISSING: Line {line_num}]")
            
            # Get current conjunct text
            current_text = current_conjuncts.get(mapping['current_line'], '[MISSING]')
            
            # Generate comprehensive semantic analysis
            semantic_analysis = self._generate_comprehensive_semantic_analysis(
                mapping, original_texts, current_text
            )
            
            # Determine quality flags
            quality_flags = self._determine_quality_flags(mapping, original_texts, current_text)
            
            # Determine verification status
            verification_status = self._determine_verification_status(mapping, quality_flags)
            
            entry = ComprehensiveMappingEntry(
                mapping_id=f"M{i:03d}",
                original_lines=mapping['original_lines'],
                original_conjuncts=original_texts,
                current_line=mapping['current_line'],
                current_conjunct=current_text,
                transformation_type=mapping['transformation_type'],
                consolidation_ratio=f"{len(mapping['original_lines'])}:1",
                semantic_analysis=semantic_analysis,
                confidence_score=mapping['confidence_score'],
                quality_flags=quality_flags,
                verification_status=verification_status
            )
            
            self.mapping_entries.append(entry)
    
    def _generate_comprehensive_semantic_analysis(self, mapping: Dict, original_texts: List[str], current_text: str) -> str:
        """Generate comprehensive semantic analysis for the mapping"""
        transformation_type = mapping['transformation_type']
        original_count = len(mapping['original_lines'])
        confidence = mapping['confidence_score']
        
        analysis_parts = []
        
        # Basic transformation description
        if transformation_type == 'HARDCODED_TO_QUANTIFIED':
            analysis_parts.append(
                f"This mapping represents a hardcoded-to-quantified transformation where "
                f"{original_count} device-specific conjunct{'s' if original_count > 1 else ''} "
                f"{'were' if original_count > 1 else 'was'} generalized using universal quantification."
            )
        elif transformation_type == 'TWO_TO_ONE_MUTEX':
            analysis_parts.append(
                "This mapping consolidates mutual exclusion constraints using nested quantification "
                "to preserve the bidirectional exclusion semantics while generalizing to multiple devices."
            )
        elif transformation_type == 'DIRECT_QUANTIFICATION':
            analysis_parts.append(
                "This mapping involves direct quantification where device indices were replaced "
                "with quantified variables without structural formula changes."
            )
        else:
            analysis_parts.append(
                f"This mapping involves {transformation_type.lower().replace('_', ' ')} transformation "
                f"with {original_count} original conjunct{'s' if original_count > 1 else ''}."
            )
        
        # Semantic preservation analysis
        if confidence >= 0.9:
            analysis_parts.append(
                "High confidence in semantic preservation - the transformation maintains "
                "the original logical meaning while extending to arbitrary device counts."
            )
        elif confidence >= 0.7:
            analysis_parts.append(
                "Moderate confidence in semantic preservation - the transformation appears "
                "correct but may require additional verification for edge cases."
            )
        else:
            analysis_parts.append(
                "Low confidence in semantic preservation - this transformation requires "
                "careful review to ensure correctness and completeness."
            )
        
        # Quantification pattern analysis
        if '∀i' in current_text and '∀j' in current_text:
            analysis_parts.append(
                "Uses nested universal quantification pattern (∀i...∀j) which is appropriate "
                "for multi-device interactions and mutual exclusion constraints."
            )
        elif '∀i' in current_text:
            analysis_parts.append(
                "Uses single universal quantification (∀i) which generalizes the property "
                "to apply uniformly across all devices."
            )
        
        # Consolidation efficiency analysis
        if original_count > 1:
            efficiency = ((original_count - 1) / original_count) * 100
            analysis_parts.append(
                f"Consolidation efficiency: {efficiency:.1f}% reduction in conjunct count "
                f"while maintaining semantic completeness."
            )
        
        return " ".join(analysis_parts)
    
    def _determine_quality_flags(self, mapping: Dict, original_texts: List[str], current_text: str) -> List[str]:
        """Determine quality flags for the mapping"""
        flags = []
        
        # Confidence-based flags
        if mapping['confidence_score'] < 0.5:
            flags.append("LOW_CONFIDENCE")
        elif mapping['confidence_score'] >= 0.95:
            flags.append("HIGH_CONFIDENCE")
        
        # Missing content flags
        if any("[MISSING" in text for text in original_texts):
            flags.append("MISSING_ORIGINAL")
        if "[MISSING]" in current_text:
            flags.append("MISSING_CURRENT")
        
        # Transformation complexity flags
        if len(mapping['original_lines']) > 3:
            flags.append("COMPLEX_CONSOLIDATION")
        
        # Quantification pattern flags
        if '∀i' in current_text and '∀j' in current_text:
            flags.append("NESTED_QUANTIFICATION")
        elif '∀i' in current_text:
            flags.append("SINGLE_QUANTIFICATION")
        
        # Semantic pattern flags
        if mapping['transformation_type'] == 'TWO_TO_ONE_MUTEX':
            flags.append("MUTEX_PATTERN")
        elif mapping['transformation_type'] == 'HARDCODED_TO_QUANTIFIED':
            flags.append("GENERALIZATION_PATTERN")
        
        return flags
    
    def _determine_verification_status(self, mapping: Dict, quality_flags: List[str]) -> str:
        """Determine verification status for the mapping"""
        if "LOW_CONFIDENCE" in quality_flags or "MISSING_ORIGINAL" in quality_flags or "MISSING_CURRENT" in quality_flags:
            return "NEEDS_REVIEW"
        elif "COMPLEX_CONSOLIDATION" in quality_flags:
            return "NEEDS_VERIFICATION"
        elif mapping['confidence_score'] >= 0.9:
            return "VERIFIED"
        else:
            return "PENDING_REVIEW"
    
    def _generate_documentation_content(self) -> str:
        """Generate the complete documentation content"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        content_parts = [
            "# Comprehensive Conjunct Mapping Documentation",
            f"*Generated on {timestamp}*",
            "",
            "This document provides a complete analysis of the mapping relationships between",
            "original 2-device conjuncts and their multi-device counterparts in the Isabelle/HOL",
            "theory files. Each mapping includes semantic analysis, transformation details,",
            "and quality assessment.",
            "",
            "## Executive Summary",
            "",
            f"- **Total Mappings**: {self.metadata['total_mappings']}",
            f"- **Coverage**: {self.metadata['coverage_percentage']:.1f}% ({sum(len(entry.original_lines) for entry in self.mapping_entries)}/796 original conjuncts)",
            f"- **Consolidation Efficiency**: {796 - len(set(entry.current_line for entry in self.mapping_entries))} conjuncts consolidated",
            f"- **Average Confidence**: {sum(entry.confidence_score for entry in self.mapping_entries) / len(self.mapping_entries):.3f}",
            "",
            self._generate_quality_summary(),
            "",
            "## Detailed Mapping Analysis",
            ""
        ]
        
        # Add detailed mappings
        for entry in self.mapping_entries:
            content_parts.extend(self._format_mapping_entry(entry))
            content_parts.append("")  # Add spacing
        
        # Add appendices
        content_parts.extend(self._generate_appendices())
        
        return "\n".join(content_parts)
    
    def _generate_quality_summary(self) -> str:
        """Generate quality summary section"""
        # Count verification statuses
        status_counts = {}
        for entry in self.mapping_entries:
            status = entry.verification_status
            status_counts[status] = status_counts.get(status, 0) + 1
        
        # Count quality flags
        flag_counts = {}
        for entry in self.mapping_entries:
            for flag in entry.quality_flags:
                flag_counts[flag] = flag_counts.get(flag, 0) + 1
        
        lines = [
            "### Quality Assessment",
            "",
            "**Verification Status Distribution:**"
        ]
        
        for status, count in sorted(status_counts.items()):
            percentage = (count / len(self.mapping_entries)) * 100.0
            lines.append(f"- {status}: {count} mappings ({percentage:.1f}%)")
        
        if flag_counts:
            lines.extend([
                "",
                "**Quality Flags Distribution:**"
            ])
            
            for flag, count in sorted(flag_counts.items(), key=lambda x: x[1], reverse=True):
                percentage = (count / len(self.mapping_entries)) * 100.0
                lines.append(f"- {flag}: {count} mappings ({percentage:.1f}%)")
        
        return "\n".join(lines)
    
    def _format_mapping_entry(self, entry: ComprehensiveMappingEntry) -> List[str]:
        """Format a single mapping entry for documentation"""
        lines = [
            f"### {entry.mapping_id}: Lines {entry.original_lines} → Line {entry.current_line}",
            "",
            f"**Consolidation**: {entry.consolidation_ratio} | **Type**: {entry.transformation_type} | **Confidence**: {entry.confidence_score:.3f} | **Status**: {entry.verification_status}",
        ]
        
        if entry.quality_flags:
            lines.append(f"**Quality Flags**: {', '.join(entry.quality_flags)}")
        
        lines.extend([
            "",
            "**Original Conjuncts:**"
        ])
        
        for i, (line_num, conjunct) in enumerate(zip(entry.original_lines, entry.original_conjuncts)):
            lines.append(f"- Line {line_num}: `{conjunct.strip()}`")
        
        lines.extend([
            "",
            "**Current Conjunct:**",
            f"- Line {entry.current_line}: `{entry.current_conjunct.strip()}`",
            "",
            "**Semantic Analysis:**",
            entry.semantic_analysis,
        ])
        
        return lines
    
    def _generate_appendices(self) -> List[str]:
        """Generate appendices for the documentation"""
        lines = [
            "## Appendices",
            "",
            "### Appendix A: Transformation Type Definitions",
            "",
            "- **HARDCODED_TO_QUANTIFIED**: Device-specific references replaced with universal quantification",
            "- **TWO_TO_ONE_MUTEX**: Mutual exclusion patterns consolidated using nested quantification",
            "- **DIRECT_QUANTIFICATION**: Simple replacement of device indices with quantified variables",
            "- **COMPLEX_CONSOLIDATION**: Multiple transformation patterns combined in a single mapping",
            "",
            "### Appendix B: Quality Flag Definitions",
            "",
            "- **LOW_CONFIDENCE**: Confidence score below 0.5, requires manual review",
            "- **HIGH_CONFIDENCE**: Confidence score above 0.95, high reliability",
            "- **MISSING_ORIGINAL**: Original conjunct text not found in source file",
            "- **MISSING_CURRENT**: Current conjunct text not found in target file",
            "- **COMPLEX_CONSOLIDATION**: More than 3 original conjuncts consolidated",
            "- **NESTED_QUANTIFICATION**: Uses nested universal quantification (∀i...∀j)",
            "- **SINGLE_QUANTIFICATION**: Uses single universal quantification (∀i)",
            "- **MUTEX_PATTERN**: Implements mutual exclusion semantics",
            "- **GENERALIZATION_PATTERN**: Generalizes from specific to universal cases",
            "",
            "### Appendix C: Verification Status Definitions",
            "",
            "- **VERIFIED**: High confidence, no quality issues, ready for use",
            "- **PENDING_REVIEW**: Moderate confidence, standard review recommended",
            "- **NEEDS_VERIFICATION**: Complex transformation, detailed verification required",
            "- **NEEDS_REVIEW**: Low confidence or missing content, manual review required",
            "",
            f"### Appendix D: Analysis Metadata",
            "",
            f"```json",
            json.dumps(self.metadata, indent=2),
            "```",
        ]
        
        return lines
    
    def _write_documentation_file(self, output_path: str, content: str) -> bool:
        """Write the documentation content to file"""
        try:
            # Ensure output directory exists
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            print(f"Comprehensive mapping documentation created: {output_path}")
            return True
            
        except Exception as e:
            print(f"Error writing documentation file: {e}")
            return False
    
    def export_mapping_data(self, output_path: str) -> bool:
        """Export mapping data as JSON for programmatic use"""
        try:
            export_data = {
                'metadata': self.metadata,
                'mappings': [asdict(entry) for entry in self.mapping_entries]
            }
            
            with open(output_path, 'w', encoding='utf-8') as f:
                json.dump(export_data, f, indent=2, ensure_ascii=False)
            
            return True
            
        except Exception as e:
            print(f"Error exporting mapping data: {e}")
            return False

# Integration function
def create_comprehensive_mapping_documentation(mapping_results: Dict, output_path: str) -> bool:
    """Create comprehensive mapping documentation file"""
    creator = MappingDocumentationCreator()
    return creator.create_mapping_documentation(mapping_results, output_path)
