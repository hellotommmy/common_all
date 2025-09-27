"""
PROGRESS_REPORT.md updater with mapping summary
Adds comprehensive mapping analysis summary to the progress report
"""

import os
import re
from typing import Dict, List, Optional
from datetime import datetime
from dataclasses import dataclass

@dataclass
class MappingSummary:
    """Represents a mapping summary for progress reporting"""
    total_mappings: int
    original_conjuncts_mapped: int
    current_conjuncts_generated: int
    coverage_percentage: float
    consolidation_patterns: Dict[str, int]
    transformation_types: Dict[str, int]
    average_confidence: float
    quality_metrics: Dict[str, float]

class ProgressReportUpdater:
    """Updates PROGRESS_REPORT.md with mapping analysis summary"""
    
    def __init__(self, progress_report_path: str):
        """
        Initialize the progress report updater
        
        Args:
            progress_report_path: Path to PROGRESS_REPORT.md
        """
        self.progress_report_path = progress_report_path
        self.mapping_summary = None
        
    def update_progress_report(self, mapping_results: Dict) -> bool:
        """
        Update PROGRESS_REPORT.md with mapping analysis summary
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            True if update successful, False otherwise
        """
        try:
            # Generate mapping summary
            self.mapping_summary = self._generate_mapping_summary(mapping_results)
            
            # Read current progress report
            current_content = self._read_progress_report()
            if current_content is None:
                return False
            
            # Generate mapping section
            mapping_section = self._generate_mapping_section()
            
            # Update progress report content
            updated_content = self._update_progress_content(current_content, mapping_section)
            
            # Write updated content back
            return self._write_progress_report(updated_content)
            
        except Exception as e:
            print(f"Error updating progress report: {e}")
            return False
    
    def _generate_mapping_summary(self, mapping_results: Dict) -> MappingSummary:
        """Generate mapping summary from analysis results"""
        mappings = mapping_results.get('mappings', [])
        
        # Calculate basic statistics
        total_mappings = len(mappings)
        original_conjuncts_mapped = sum(len(mapping['original_lines']) for mapping in mappings)
        current_conjuncts_generated = len(set(mapping['current_line'] for mapping in mappings))
        coverage_percentage = (original_conjuncts_mapped / 796) * 100.0
        
        # Count consolidation patterns
        consolidation_patterns = {}
        for mapping in mappings:
            ratio = f"{len(mapping['original_lines'])}:1"
            consolidation_patterns[ratio] = consolidation_patterns.get(ratio, 0) + 1
        
        # Count transformation types
        transformation_types = {}
        for mapping in mappings:
            trans_type = mapping['transformation_type']
            transformation_types[trans_type] = transformation_types.get(trans_type, 0) + 1
        
        # Calculate average confidence
        if mappings:
            average_confidence = sum(mapping['confidence_score'] for mapping in mappings) / len(mappings)
        else:
            average_confidence = 0.0
        
        # Extract quality metrics
        quality_metrics = mapping_results.get('quality_metrics', {})
        
        return MappingSummary(
            total_mappings=total_mappings,
            original_conjuncts_mapped=original_conjuncts_mapped,
            current_conjuncts_generated=current_conjuncts_generated,
            coverage_percentage=coverage_percentage,
            consolidation_patterns=consolidation_patterns,
            transformation_types=transformation_types,
            average_confidence=average_confidence,
            quality_metrics=quality_metrics
        )
    
    def _read_progress_report(self) -> Optional[str]:
        """Read the current progress report content"""
        try:
            with open(self.progress_report_path, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            print(f"Progress report file not found: {self.progress_report_path}")
            return None
        except Exception as e:
            print(f"Error reading progress report: {e}")
            return None
    
    def _generate_mapping_section(self) -> str:
        """Generate the mapping analysis section for progress report"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        summary = self.mapping_summary
        
        section_lines = [
            "",
            "## Conjunct Mapping Analysis Status",
            f"*Last updated: {timestamp}*",
            "",
            "### Mapping Coverage",
            f"- **Total Mappings**: {summary.total_mappings}",
            f"- **Original Conjuncts Mapped**: {summary.original_conjuncts_mapped}/796 ({summary.coverage_percentage:.1f}%)",
            f"- **Current Conjuncts Generated**: {summary.current_conjuncts_generated}",
            f"- **Average Confidence Score**: {summary.average_confidence:.3f}",
            "",
            "### Consolidation Patterns",
        ]
        
        for pattern, count in sorted(summary.consolidation_patterns.items()):
            percentage = (count / summary.total_mappings) * 100.0
            section_lines.append(f"- **{pattern}**: {count} mappings ({percentage:.1f}%)")
        
        section_lines.extend([
            "",
            "### Transformation Types",
        ])
        
        for trans_type, count in sorted(summary.transformation_types.items()):
            percentage = (count / summary.total_mappings) * 100.0
            section_lines.append(f"- **{trans_type}**: {count} mappings ({percentage:.1f}%)")
        
        # Add quality metrics if available
        if summary.quality_metrics:
            section_lines.extend([
                "",
                "### Quality Metrics",
            ])
            
            for metric, value in summary.quality_metrics.items():
                if isinstance(value, float):
                    section_lines.append(f"- **{metric}**: {value:.3f}")
                else:
                    section_lines.append(f"- **{metric}**: {value}")
        
        # Add progress bar visualization
        section_lines.extend(self._generate_progress_visualization())
        
        # Add next steps if coverage is incomplete
        if summary.coverage_percentage < 100.0:
            section_lines.extend(self._generate_next_steps())
        
        return "\n".join(section_lines)
    
    def _generate_progress_visualization(self) -> List[str]:
        """Generate visual progress bar for mapping coverage"""
        coverage = self.mapping_summary.coverage_percentage
        bar_length = 50
        filled_length = int(bar_length * coverage / 100)
        
        bar = "█" * filled_length + "░" * (bar_length - filled_length)
        
        return [
            "",
            "### Progress Visualization",
            f"```",
            f"Mapping Coverage: [{bar}] {coverage:.1f}%",
            f"Original Conjuncts: {self.mapping_summary.original_conjuncts_mapped}/796",
            f"```",
        ]
    
    def _generate_next_steps(self) -> List[str]:
        """Generate next steps for incomplete coverage"""
        unmapped_count = 796 - self.mapping_summary.original_conjuncts_mapped
        
        return [
            "",
            "### Next Steps",
            f"- **Unmapped Conjuncts**: {unmapped_count} original conjuncts need analysis",
            "- **Quality Review**: Validate low-confidence mappings",
            "- **Semantic Verification**: Ensure transformation correctness",
            "- **Documentation Update**: Complete detailed modification records",
        ]
    
    def _update_progress_content(self, content: str, mapping_section: str) -> str:
        """Update the progress report content with mapping section"""
        # Check if mapping section already exists
        if "## Conjunct Mapping Analysis Status" in content:
            # Replace existing section
            pattern = r'## Conjunct Mapping Analysis Status.*?(?=##|\Z)'
            updated_content = re.sub(pattern, mapping_section.strip(), content, flags=re.DOTALL)
        else:
            # Find appropriate insertion point (before any "Next Steps" or at the end)
            if "## Next Steps" in content:
                insertion_point = content.find("## Next Steps")
                updated_content = content[:insertion_point] + mapping_section + "\n\n" + content[insertion_point:]
            else:
                # Append at the end
                updated_content = content.rstrip() + "\n" + mapping_section
        
        return updated_content
    
    def _write_progress_report(self, content: str) -> bool:
        """Write updated content back to the progress report"""
        try:
            with open(self.progress_report_path, 'w', encoding='utf-8') as f:
                f.write(content)
            return True
        except Exception as e:
            print(f"Error writing progress report: {e}")
            return False
    
    def generate_executive_summary(self) -> str:
        """Generate executive summary of mapping progress"""
        if not self.mapping_summary:
            return "Mapping analysis not yet completed."
        
        summary = self.mapping_summary
        status = "COMPLETE" if summary.coverage_percentage >= 100.0 else "IN PROGRESS"
        
        return f"""
CONJUNCT MAPPING EXECUTIVE SUMMARY
================================
Status: {status}
Coverage: {summary.coverage_percentage:.1f}% ({summary.original_conjuncts_mapped}/796 original conjuncts)
Consolidation Efficiency: {796 - summary.current_conjuncts_generated} conjuncts consolidated
Average Confidence: {summary.average_confidence:.3f}
Primary Consolidation Pattern: {max(summary.consolidation_patterns.items(), key=lambda x: x[1])[0]}
Primary Transformation Type: {max(summary.transformation_types.items(), key=lambda x: x[1])[0]}
        """.strip()

# Integration with existing DocumentationIntegrationInterface
def update_progress_report_with_mapping(mapping_results: Dict) -> bool:
    """Update PROGRESS_REPORT.md with mapping analysis summary"""
    progress_report_file = 'betterProofAll/Common/PROGRESS_REPORT.md'
    
    if not os.path.exists(progress_report_file):
        raise FileNotFoundError(f"Progress report file not found: {progress_report_file}")
    
    updater = ProgressReportUpdater(progress_report_file)
    return updater.update_progress_report(mapping_results)
