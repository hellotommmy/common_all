"""
ConjunctExtractor class for loading conjuncts from theory files
Handles both OldCohProp.thy (original) and CoherenceProperties.thy (current)
"""

import os
import re
from typing import List, Optional
from dataclasses import dataclass

@dataclass
class ConjunctEntry:
    """Represents a single conjunct from theory file"""
    line_number: int
    content: str
    classification: str

class ConjunctExtractor:
    """Extracts conjuncts from Isabelle/HOL theory files"""
    
    def __init__(self, original_file: str, current_file: str, 
                 original_start_line: int, original_end_line: int,
                 current_start_line: int, current_end_line: int):
        """
        Initialize the conjunct extractor
        
        Args:
            original_file: Path to OldCohProp.thy
            current_file: Path to CoherenceProperties.thy
            original_start_line: Start line in original file (200)
            original_end_line: End line in original file (995)
            current_start_line: Start line in current file (286)
            current_end_line: End line in current file (771)
        """
        self.original_file = original_file
        self.current_file = current_file
        self.original_start_line = original_start_line
        self.original_end_line = original_end_line
        self.current_start_line = current_start_line
        self.current_end_line = current_end_line
    
    def load_conjuncts(self, filepath: str, start_line: int, end_line: int, is_original: bool = False) -> List[ConjunctEntry]:
        """
        Load conjuncts from theory file
        
        Args:
            filepath: Path to .thy file
            start_line: Starting line number (inclusive)
            end_line: Ending line number (inclusive)
            is_original: True if this is OldCohProp.thy, False if CoherenceProperties.thy
            
        Returns:
            List of ConjunctEntry objects
            
        Raises:
            FileNotFoundError: If file doesn't exist
            ValueError: If line range is invalid
        """
        if not os.path.exists(filepath):
            raise FileNotFoundError(f"Theory file not found: {filepath}")
        
        conjuncts = []
        
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                lines = f.readlines()
                
                # Validate line range
                if start_line < 1 or end_line > len(lines):
                    raise ValueError(f"Invalid line range {start_line}-{end_line} for file with {len(lines)} lines")
                
                if is_original:
                    # For OldCohProp.thy: each line from start_line to end_line is a conjunct
                    # Line 200 is the start of the definition, lines 201-995 are conjuncts
                    for line_num in range(start_line, end_line + 1):
                        line_content = lines[line_num - 1].strip()  # Convert to 0-indexed
                        
                        if line_content:  # Skip empty lines
                            classification = self._classify_conjunct(line_content)
                            conjuncts.append(ConjunctEntry(
                                line_number=line_num,
                                content=line_content,
                                classification=classification
                            ))
                else:
                    # For CoherenceProperties.thy: extract conjuncts based on Isabelle syntax
                    for line_num in range(start_line, end_line + 1):
                        line_content = lines[line_num - 1].strip()  # Convert to 0-indexed
                        
                        # A conjunct typically ends with \<and> or ) (for the last one)
                        if line_content and (line_content.endswith('\\<and>') or 
                                           line_content.endswith(')') or
                                           line_content.endswith('\\<and>')):
                            classification = self._classify_conjunct(line_content)
                            conjuncts.append(ConjunctEntry(
                                line_number=line_num,
                                content=line_content,
                                classification=classification
                            ))
                            
        except Exception as e:
            raise RuntimeError(f"Error reading file {filepath}: {e}")
        
        return conjuncts
    
    def _classify_conjunct(self, conjunct_content: str) -> str:
        """
        Classify conjunct based on content patterns
        
        Args:
            conjunct_content: The conjunct content string
            
        Returns:
            Classification string
        """
        # Remove Isabelle escape sequences for analysis
        clean_content = conjunct_content.replace('\\<', '<').replace('\\>', '>')
        
        # Check for quantifiers
        if '<forall>' in clean_content or '<exists>' in clean_content:
            if 'i j. i <noteq> j' in clean_content:
                return 'universal_quantifier_mutual_exclusion'
            return 'universal_quantifier'
        
        # Check for channel constraints
        channel_patterns = ['reqs T', 'snps T', 'dthdatas T', 'htddatas T', 'snpresps T', 'reqresps T']
        if any(pattern in clean_content for pattern in channel_patterns):
            return 'channel_constraint'
        
        # Check for state constraints
        state_patterns = ['CSTATE', 'HSTATE']
        if any(pattern in clean_content for pattern in state_patterns):
            return 'state_constraint'
        
        # Check for hardcoded devices (0, 1)
        if re.search(r'\b[01]\b', clean_content):
            return 'hardcoded_device'
        
        # Check for global properties
        global_patterns = ['SWMR T', 'nextGOPending', 'nextHTDDataPending']
        if any(pattern in clean_content for pattern in global_patterns):
            return 'global_property'
        
        return 'other'
    
    def extract_original_conjuncts(self) -> List[ConjunctEntry]:
        """Extract conjuncts from OldCohProp.thy (796 conjuncts)"""
        return self.load_conjuncts(
            self.original_file, 
            self.original_start_line, 
            self.original_end_line, 
            is_original=True
        )
    
    def extract_current_conjuncts(self) -> List[ConjunctEntry]:
        """Extract conjuncts from CoherenceProperties.thy (486 conjuncts)"""
        return self.load_conjuncts(
            self.current_file,
            self.current_start_line,
            self.current_end_line,
            is_original=False
        )
    
    def get_classification_summary(self, conjuncts: List[ConjunctEntry]) -> dict:
        """Get summary of conjunct classifications"""
        classification_counts = {}
        for conjunct in conjuncts:
            classification_counts[conjunct.classification] = classification_counts.get(conjunct.classification, 0) + 1
        return classification_counts
    
    def validate_expected_counts(self) -> dict:
        """Validate that we extract the expected number of conjuncts"""
        original_conjuncts = self.extract_original_conjuncts()
        current_conjuncts = self.extract_current_conjuncts()
        
        return {
            'original_count': len(original_conjuncts),
            'original_expected': 796,
            'original_valid': len(original_conjuncts) == 796,
            'current_count': len(current_conjuncts),
            'current_expected': 486,
            'current_valid': len(current_conjuncts) == 486,
            'original_classifications': self.get_classification_summary(original_conjuncts),
            'current_classifications': self.get_classification_summary(current_conjuncts)
        }
