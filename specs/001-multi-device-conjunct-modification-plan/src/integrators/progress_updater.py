"""
Progress tracking updater for SWMR_modification_progress.py
Updates the existing progress tracking file with mapping relationships
"""

import os
import re
from typing import Dict, List, Optional
from dataclasses import dataclass

@dataclass
class MappingRelationship:
    """Represents a mapping relationship for progress tracking"""
    original_lines: List[int]
    current_line: int
    consolidation_type: str
    transformation_type: str
    confidence_score: float

class ProgressTrackingUpdater:
    """Updates SWMR_modification_progress.py with mapping relationships"""
    
    def __init__(self, progress_file_path: str):
        """
        Initialize the progress updater
        
        Args:
            progress_file_path: Path to SWMR_modification_progress.py
        """
        self.progress_file_path = progress_file_path
        self.mapping_relationships = []
        
    def update_progress_tracking(self, mapping_results: Dict) -> bool:
        """
        Update the progress tracking file with mapping relationships
        
        Args:
            mapping_results: Results from comprehensive mapping analysis
            
        Returns:
            True if update successful, False otherwise
        """
        try:
            # Extract mapping relationships
            self._extract_mapping_relationships(mapping_results)
            
            # Read current progress file
            current_content = self._read_progress_file()
            if current_content is None:
                return False
            
            # Update progress file content
            updated_content = self._update_progress_content(current_content)
            
            # Write updated content back
            return self._write_progress_file(updated_content)
            
        except Exception as e:
            print(f"Error updating progress tracking: {e}")
            return False
    
    def _extract_mapping_relationships(self, mapping_results: Dict):
        """Extract mapping relationships from analysis results"""
        self.mapping_relationships = []
        
        mappings = mapping_results.get('mappings', [])
        for mapping in mappings:
            relationship = MappingRelationship(
                original_lines=mapping['original_lines'],
                current_line=mapping['current_line'],
                consolidation_type=mapping['consolidation_type'],
                transformation_type=mapping['transformation_type'],
                confidence_score=mapping['confidence_score']
            )
            self.mapping_relationships.append(relationship)
    
    def _read_progress_file(self) -> Optional[str]:
        """Read the current progress file content"""
        try:
            with open(self.progress_file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            print(f"Progress file not found: {self.progress_file_path}")
            return None
        except Exception as e:
            print(f"Error reading progress file: {e}")
            return None
    
    def _update_progress_content(self, content: str) -> str:
        """Update the progress file content with mapping relationships"""
        lines = content.split('\n')
        updated_lines = []
        
        # Find the line_status list definition
        in_line_status = False
        line_status_indent = ""
        
        for line in lines:
            if 'line_status = [' in line:
                in_line_status = True
                line_status_indent = line[:len(line) - len(line.lstrip())]
                updated_lines.append(line)
                continue
            
            if in_line_status and line.strip() == ']':
                # End of line_status list - add our mapping relationships
                self._add_mapping_relationships_to_content(updated_lines, line_status_indent)
                updated_lines.append(line)
                in_line_status = False
                continue
            
            if in_line_status:
                # Update existing line status entries with mapping info
                updated_line = self._update_line_status_entry(line)
                updated_lines.append(updated_line)
            else:
                updated_lines.append(line)
        
        # Add mapping analysis functions if not present
        if 'def get_mapping_relationships():' not in content:
            updated_lines.extend(self._generate_mapping_functions())
        
        return '\n'.join(updated_lines)
    
    def _update_line_status_entry(self, line: str) -> str:
        """Update a line status entry with mapping information"""
        # Extract line number from the entry
        match = re.search(r'(\d+):', line)
        if not match:
            return line
        
        line_number = int(match.group(1))
        
        # Find mapping relationship for this line
        mapping_info = self._find_mapping_for_line(line_number)
        if not mapping_info:
            return line
        
        # Add mapping information to the line status
        if '"mapping":' not in line:
            # Insert mapping info before the closing brace
            if line.strip().endswith('},'):
                insertion_point = line.rfind('},')
                mapping_str = f', "mapping": {mapping_info}'
                updated_line = line[:insertion_point] + mapping_str + line[insertion_point:]
                return updated_line
            elif line.strip().endswith('}'):
                insertion_point = line.rfind('}')
                mapping_str = f', "mapping": {mapping_info}'
                updated_line = line[:insertion_point] + mapping_str + line[insertion_point:]
                return updated_line
        
        return line
    
    def _find_mapping_for_line(self, line_number: int) -> Optional[str]:
        """Find mapping information for a specific line number"""
        for relationship in self.mapping_relationships:
            if line_number in relationship.original_lines:
                return f'{{"current_line": {relationship.current_line}, "consolidation": "{relationship.consolidation_type}", "confidence": {relationship.confidence_score:.3f}}}'
            elif line_number == relationship.current_line:
                return f'{{"original_lines": {relationship.original_lines}, "consolidation": "{relationship.consolidation_type}", "confidence": {relationship.confidence_score:.3f}}}'
        
        return None
    
    def _add_mapping_relationships_to_content(self, lines: List[str], indent: str):
        """Add mapping relationship summary to the content"""
        lines.append(f"{indent}# Mapping relationships summary:")
        lines.append(f"{indent}# Total mappings: {len(self.mapping_relationships)}")
        
        # Count consolidation types
        consolidation_counts = {}
        for rel in self.mapping_relationships:
            consolidation_counts[rel.consolidation_type] = consolidation_counts.get(rel.consolidation_type, 0) + 1
        
        for cons_type, count in consolidation_counts.items():
            lines.append(f"{indent}# {cons_type}: {count}")
    
    def _generate_mapping_functions(self) -> List[str]:
        """Generate additional functions for mapping analysis"""
        functions = [
            "",
            "def get_mapping_relationships():",
            "    \"\"\"Get all mapping relationships between original and current conjuncts\"\"\"",
            "    return [",
        ]
        
        for rel in self.mapping_relationships:
            functions.append(f"        {{")
            functions.append(f"            'original_lines': {rel.original_lines},")
            functions.append(f"            'current_line': {rel.current_line},")
            functions.append(f"            'consolidation_type': '{rel.consolidation_type}',")
            functions.append(f"            'transformation_type': '{rel.transformation_type}',")
            functions.append(f"            'confidence_score': {rel.confidence_score:.3f}")
            functions.append(f"        }},")
        
        functions.extend([
            "    ]",
            "",
            "def get_consolidation_summary():",
            "    \"\"\"Get summary of consolidation patterns\"\"\"",
            "    relationships = get_mapping_relationships()",
            "    consolidation_counts = {}",
            "    for rel in relationships:",
            "        cons_type = rel['consolidation_type']",
            "        consolidation_counts[cons_type] = consolidation_counts.get(cons_type, 0) + 1",
            "    return consolidation_counts",
            "",
            "def get_mapping_coverage():",
            "    \"\"\"Calculate mapping coverage statistics\"\"\"",
            "    relationships = get_mapping_relationships()",
            "    total_original_lines = set()",
            "    for rel in relationships:",
            "        total_original_lines.update(rel['original_lines'])",
            "    ",
            "    return {",
            "        'total_mappings': len(relationships),",
            "        'original_lines_mapped': len(total_original_lines),",
            "        'expected_original_lines': 796,",
            "        'coverage_percentage': (len(total_original_lines) / 796) * 100.0",
            "    }",
            "",
            "def print_mapping_summary():",
            "    \"\"\"Print comprehensive mapping summary\"\"\"",
            "    coverage = get_mapping_coverage()",
            "    consolidation = get_consolidation_summary()",
            "    ",
            "    print('=== CONJUNCT MAPPING ANALYSIS SUMMARY ===')",
            "    print(f'Total mappings: {coverage[\"total_mappings\"]}')",
            "    print(f'Original lines mapped: {coverage[\"original_lines_mapped\"]}/796')",
            "    print(f'Coverage: {coverage[\"coverage_percentage\"]:.1f}%')",
            "    print()",
            "    print('Consolidation patterns:')",
            "    for pattern, count in consolidation.items():",
            "        print(f'  {pattern}: {count}')",
            "    print('=' * 45)",
        ])
        
        return functions
    
    def _write_progress_file(self, content: str) -> bool:
        """Write updated content back to the progress file"""
        try:
            with open(self.progress_file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            return True
        except Exception as e:
            print(f"Error writing progress file: {e}")
            return False
    
    def validate_mapping_completeness(self) -> Dict[str, any]:
        """Validate that all original conjuncts are mapped"""
        mapped_original_lines = set()
        for rel in self.mapping_relationships:
            mapped_original_lines.update(rel.original_lines)
        
        expected_lines = set(range(200, 996))  # Lines 200-995 (796 conjuncts)
        unmapped_lines = expected_lines - mapped_original_lines
        
        return {
            'total_expected': len(expected_lines),
            'total_mapped': len(mapped_original_lines),
            'coverage_percentage': (len(mapped_original_lines) / len(expected_lines)) * 100.0,
            'unmapped_lines': sorted(list(unmapped_lines)),
            'is_complete': len(unmapped_lines) == 0
        }

class DocumentationIntegrationInterface:
    """Interface for documentation integration operations"""
    
    def __init__(self):
        """Initialize the documentation integration interface"""
        self.progress_updater = None
        
    def update_progress_tracking(self, mapping_results: Dict) -> bool:
        """Update SWMR_modification_progress.py with mapping data"""
        progress_file = 'betterProofAll/Common/SWMR_modification_progress.py'
        
        if not os.path.exists(progress_file):
            raise FileNotFoundError(f"Progress tracking file not found: {progress_file}")
        
        self.progress_updater = ProgressTrackingUpdater(progress_file)
        return self.progress_updater.update_progress_tracking(mapping_results)
    
    def update_detailed_modifications(self, mapping_results: Dict) -> bool:
        """Add consolidation explanations to detailed modifications"""
        from .detailed_modifications_updater import update_detailed_modifications_with_consolidation
        return update_detailed_modifications_with_consolidation(mapping_results)
    
    def update_progress_report(self, mapping_results: Dict) -> bool:
        """Add mapping summary to progress report"""
        from .progress_report_updater import update_progress_report_with_mapping
        return update_progress_report_with_mapping(mapping_results)
    
    def create_mapping_documentation(self, mapping_results: Dict, output_path: str) -> bool:
        """Create comprehensive mapping documentation file"""
        from .mapping_documentation_creator import create_comprehensive_mapping_documentation
        return create_comprehensive_mapping_documentation(mapping_results, output_path)
