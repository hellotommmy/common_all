"""
DETAILED_MODIFICATIONS.md updater with consolidation explanations
Adds comprehensive mapping analysis to the detailed modifications documentation
"""

import os
import re
from typing import Dict, List, Optional, Tuple
from datetime import datetime
from dataclasses import dataclass

@dataclass
class ConsolidationExplanation:
    """Represents a consolidation explanation for detailed modifications"""
    original_conjuncts: List[str]
    original_lines: List[int]
    current_conjunct: str
    current_line: int
    semantic_explanation: str
    transformation_type: str
    consolidation_ratio: str
    confidence_score: float

class DetailedModificationsUpdater:
    """Updates DETAILED_MODIFICATIONS.md with consolidation explanations"""
    
    def __init__(self, modifications_file_path: str):
        """
        Initialize the detailed modifications updater
        
        Args:
            modifications_file_path: Path to DETAILED_MODIFICATIONS.md
        """
        self.modifications_file_path = modifications_file_path
        self.consolidation_explanations = []
        
    def update_detailed_modifications(self, mapping_results: Dict) -> bool:
        """
        Update DETAILED_MODIFICATIONS.md with consolidation explanations
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            True if update successful, False otherwise
        """
        try:
            # Extract consolidation explanations
            self._extract_consolidation_explanations(mapping_results)
            
            # Read current modifications file
            current_content = self._read_modifications_file()
            if current_content is None:
                return False
            
            # Generate new consolidation section
            consolidation_section = self._generate_consolidation_section()
            
            # Update modifications file content
            updated_content = self._update_modifications_content(current_content, consolidation_section)
            
            # Write updated content back
            return self._write_modifications_file(updated_content)
            
        except Exception as e:
            print(f"Error updating detailed modifications: {e}")
            return False
    
    def _extract_consolidation_explanations(self, mapping_results: Dict):
        """Extract consolidation explanations from analysis results"""
        self.consolidation_explanations = []
        
        mappings = mapping_results.get('mappings', [])
        original_conjuncts = mapping_results.get('original_conjuncts', {})
        current_conjuncts = mapping_results.get('current_conjuncts', {})
        
        for mapping in mappings:
            # Get original conjunct texts
            original_texts = []
            for line_num in mapping['original_lines']:
                if line_num in original_conjuncts:
                    original_texts.append(original_conjuncts[line_num])
            
            # Get current conjunct text
            current_text = current_conjuncts.get(mapping['current_line'], '')
            
            # Generate semantic explanation
            semantic_explanation = self._generate_semantic_explanation(
                mapping, original_texts, current_text
            )
            
            explanation = ConsolidationExplanation(
                original_conjuncts=original_texts,
                original_lines=mapping['original_lines'],
                current_conjunct=current_text,
                current_line=mapping['current_line'],
                semantic_explanation=semantic_explanation,
                transformation_type=mapping['transformation_type'],
                consolidation_ratio=f"{len(mapping['original_lines'])}:1",
                confidence_score=mapping['confidence_score']
            )
            self.consolidation_explanations.append(explanation)
    
    def _generate_semantic_explanation(self, mapping: Dict, original_texts: List[str], current_text: str) -> str:
        """Generate semantic explanation for the consolidation"""
        transformation_type = mapping['transformation_type']
        original_count = len(mapping['original_lines'])
        
        if transformation_type == 'HARDCODED_TO_QUANTIFIED':
            if original_count == 2:
                return (
                    "Two device-specific conjuncts (hardcoded for devices 0 and 1) were consolidated "
                    "into a single quantified conjunct using universal quantification (∀i). This "
                    "transformation generalizes the property to apply to any number of devices while "
                    "preserving the original semantic meaning."
                )
            else:
                return (
                    f"{original_count} device-specific conjuncts were consolidated into a single "
                    "quantified conjunct using universal quantification. This generalization "
                    "maintains semantic equivalence while extending to arbitrary device counts."
                )
        
        elif transformation_type == 'TWO_TO_ONE_MUTEX':
            return (
                "Two mutual exclusion conjuncts (covering both directions of device interaction) "
                "were consolidated into a single conjunct using nested quantification (∀i. ... → (∀j. j ≠ i → ...)). "
                "This pattern preserves the mutual exclusion semantics while generalizing to multiple devices."
            )
        
        elif transformation_type == 'DIRECT_QUANTIFICATION':
            return (
                "Direct quantification transformation where device-specific references were "
                "replaced with quantified variables without structural changes to the logical formula."
            )
        
        elif transformation_type == 'COMPLEX_CONSOLIDATION':
            return (
                f"Complex consolidation of {original_count} conjuncts involving multiple "
                "transformation patterns. The resulting conjunct combines the semantic "
                "requirements of all original conjuncts using appropriate quantification."
            )
        
        else:
            return (
                f"Consolidation of {original_count} conjuncts with transformation type "
                f"{transformation_type}. Semantic analysis pending detailed review."
            )
    
    def _read_modifications_file(self) -> Optional[str]:
        """Read the current modifications file content"""
        try:
            with open(self.modifications_file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            print(f"Modifications file not found: {self.modifications_file_path}")
            return None
        except Exception as e:
            print(f"Error reading modifications file: {e}")
            return None
    
    def _generate_consolidation_section(self) -> str:
        """Generate the consolidation analysis section"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        section_lines = [
            "",
            "## Conjunct Consolidation Analysis",
            f"*Generated on {timestamp}*",
            "",
            "This section documents the mapping relationships between original 2-device conjuncts",
            "and their multi-device counterparts, including consolidation patterns and semantic analysis.",
            "",
            f"**Summary Statistics:**",
            f"- Total mappings analyzed: {len(self.consolidation_explanations)}",
            f"- Original conjuncts processed: {sum(len(exp.original_lines) for exp in self.consolidation_explanations)}",
            f"- Current conjuncts generated: {len(set(exp.current_line for exp in self.consolidation_explanations))}",
            "",
            "### Detailed Mapping Analysis",
            ""
        ]
        
        # Sort explanations by current line number for consistent ordering
        sorted_explanations = sorted(self.consolidation_explanations, key=lambda x: x.current_line)
        
        for i, explanation in enumerate(sorted_explanations, 1):
            section_lines.extend(self._format_consolidation_explanation(i, explanation))
            section_lines.append("")  # Add spacing between entries
        
        # Add consolidation pattern summary
        section_lines.extend(self._generate_consolidation_summary())
        
        return "\n".join(section_lines)
    
    def _format_consolidation_explanation(self, index: int, explanation: ConsolidationExplanation) -> List[str]:
        """Format a single consolidation explanation"""
        lines = [
            f"#### Mapping {index}: Lines {explanation.original_lines} → Line {explanation.current_line}",
            f"**Consolidation Ratio:** {explanation.consolidation_ratio}",
            f"**Transformation Type:** {explanation.transformation_type}",
            f"**Confidence Score:** {explanation.confidence_score:.3f}",
            "",
            "**Original Conjuncts:**"
        ]
        
        for i, (line_num, conjunct) in enumerate(zip(explanation.original_lines, explanation.original_conjuncts)):
            lines.append(f"- Line {line_num}: `{conjunct.strip()}`")
        
        lines.extend([
            "",
            "**Current Conjunct:**",
            f"- Line {explanation.current_line}: `{explanation.current_conjunct.strip()}`",
            "",
            "**Semantic Analysis:**",
            explanation.semantic_explanation,
        ])
        
        return lines
    
    def _generate_consolidation_summary(self) -> List[str]:
        """Generate summary of consolidation patterns"""
        # Count transformation types
        transformation_counts = {}
        consolidation_ratios = {}
        
        for explanation in self.consolidation_explanations:
            # Count transformation types
            trans_type = explanation.transformation_type
            transformation_counts[trans_type] = transformation_counts.get(trans_type, 0) + 1
            
            # Count consolidation ratios
            ratio = explanation.consolidation_ratio
            consolidation_ratios[ratio] = consolidation_ratios.get(ratio, 0) + 1
        
        lines = [
            "### Consolidation Pattern Summary",
            "",
            "**Transformation Types:**"
        ]
        
        for trans_type, count in sorted(transformation_counts.items()):
            lines.append(f"- {trans_type}: {count} mappings")
        
        lines.extend([
            "",
            "**Consolidation Ratios:**"
        ])
        
        for ratio, count in sorted(consolidation_ratios.items()):
            lines.append(f"- {ratio}: {count} mappings")
        
        # Calculate average confidence
        if self.consolidation_explanations:
            avg_confidence = sum(exp.confidence_score for exp in self.consolidation_explanations) / len(self.consolidation_explanations)
            lines.extend([
                "",
                f"**Average Confidence Score:** {avg_confidence:.3f}"
            ])
        
        return lines
    
    def _update_modifications_content(self, content: str, consolidation_section: str) -> str:
        """Update the modifications file content with consolidation section"""
        # Check if consolidation section already exists
        if "## Conjunct Consolidation Analysis" in content:
            # Replace existing section
            pattern = r'## Conjunct Consolidation Analysis.*?(?=##|\Z)'
            updated_content = re.sub(pattern, consolidation_section.strip(), content, flags=re.DOTALL)
        else:
            # Append new section at the end
            updated_content = content.rstrip() + "\n" + consolidation_section
        
        return updated_content
    
    def _write_modifications_file(self, content: str) -> bool:
        """Write updated content back to the modifications file"""
        try:
            with open(self.modifications_file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            return True
        except Exception as e:
            print(f"Error writing modifications file: {e}")
            return False
    
    def validate_consolidation_documentation(self) -> Dict[str, any]:
        """Validate that consolidation documentation is complete"""
        total_original_lines = sum(len(exp.original_lines) for exp in self.consolidation_explanations)
        unique_current_lines = len(set(exp.current_line for exp in self.consolidation_explanations))
        
        return {
            'total_mappings': len(self.consolidation_explanations),
            'original_lines_documented': total_original_lines,
            'current_lines_documented': unique_current_lines,
            'expected_original_lines': 796,
            'documentation_coverage': (total_original_lines / 796) * 100.0,
            'has_semantic_analysis': all(exp.semantic_explanation for exp in self.consolidation_explanations)
        }

# Integration with existing DocumentationIntegrationInterface
def update_detailed_modifications_with_consolidation(mapping_results: Dict) -> bool:
    """Update DETAILED_MODIFICATIONS.md with consolidation analysis"""
    modifications_file = 'betterProofAll/Common/DETAILED_MODIFICATIONS.md'
    
    if not os.path.exists(modifications_file):
        raise FileNotFoundError(f"Detailed modifications file not found: {modifications_file}")
    
    updater = DetailedModificationsUpdater(modifications_file)
    return updater.update_detailed_modifications(mapping_results)
