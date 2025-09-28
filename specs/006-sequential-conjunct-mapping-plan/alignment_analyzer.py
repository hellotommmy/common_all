#!/usr/bin/env python3
"""
Alignment Analyzer
Analyzes the alignment issues between original and current files
"""

import re
import json
from typing import List, Dict, Tuple

class AlignmentAnalyzer:
    def __init__(self):
        self.original_lines = []
        self.current_lines = []
        self.original_start = 200
        self.current_start = 286
    
    def load_files(self):
        """Load both files"""
        print("Loading files for alignment analysis...")
        
        with open('betterProofAll/Common/OldCohProp.thy', 'r', encoding='utf-8') as f:
            all_lines = f.readlines()
            self.original_lines = all_lines[199:995]  # Lines 200-995
        
        with open('betterProofAll/Common/CoherenceProperties.thy', 'r', encoding='utf-8') as f:
            all_lines = f.readlines()
            self.current_lines = all_lines[285:771]   # Lines 286-771
        
        print(f"Original: {len(self.original_lines)} lines (200-995)")
        print(f"Current: {len(self.current_lines)} lines (286-771)")
    
    def clean_conjunct(self, line: str) -> str:
        """Clean conjunct for analysis"""
        line = line.strip().rstrip('∧').strip()
        line = re.sub(r'\\<comment>.*?\\<close>', '', line)
        line = re.sub(r'--.*$', '', line)
        return line.strip()
    
    def analyze_file_structure(self):
        """Analyze the structure of both files"""
        print("\n=== File Structure Analysis ===")
        
        # Analyze original file
        print("\nOriginal file analysis:")
        orig_definition_start = None
        orig_definition_end = None
        
        for i, line in enumerate(self.original_lines):
            clean_line = self.clean_conjunct(line)
            if 'SWMR_state_machine T =' in clean_line:
                orig_definition_start = i
                print(f"  Definition starts at offset {i} (line {self.original_start + i})")
            elif clean_line == ')' and orig_definition_start is not None:
                orig_definition_end = i
                print(f"  Definition ends at offset {i} (line {self.original_start + i})")
                break
        
        # Analyze current file
        print("\nCurrent file analysis:")
        curr_definition_start = None
        curr_definition_end = None
        
        for i, line in enumerate(self.current_lines):
            clean_line = self.clean_conjunct(line)
            if 'SWMR_state_machine T =' in clean_line:
                curr_definition_start = i
                print(f"  Definition starts at offset {i} (line {self.current_start + i})")
            elif clean_line == ')' and curr_definition_start is not None:
                curr_definition_end = i
                print(f"  Definition ends at offset {i} (line {self.current_start + i})")
                break
        
        # Calculate actual conjunct ranges
        if orig_definition_start is not None and orig_definition_end is not None:
            orig_conjunct_count = orig_definition_end - orig_definition_start - 1
            print(f"  Original conjuncts: {orig_conjunct_count} (lines {self.original_start + orig_definition_start + 1}-{self.original_start + orig_definition_end - 1})")
        
        if curr_definition_start is not None and curr_definition_end is not None:
            curr_conjunct_count = curr_definition_end - curr_definition_start - 1
            print(f"  Current conjuncts: {curr_conjunct_count} (lines {self.current_start + curr_definition_start + 1}-{self.current_start + curr_definition_end - 1})")
        
        return {
            'original': {
                'definition_start': orig_definition_start,
                'definition_end': orig_definition_end,
                'conjunct_count': orig_conjunct_count if orig_definition_start and orig_definition_end else 0
            },
            'current': {
                'definition_start': curr_definition_start,
                'definition_end': curr_definition_end,
                'conjunct_count': curr_conjunct_count if curr_definition_start and curr_definition_end else 0
            }
        }
    
    def sample_conjuncts(self, start_offset: int = 0, count: int = 10):
        """Sample conjuncts from both files for comparison"""
        print(f"\n=== Sample Conjuncts (starting from offset {start_offset}) ===")
        
        print("\nOriginal conjuncts:")
        for i in range(start_offset, min(start_offset + count, len(self.original_lines))):
            line_num = self.original_start + i
            content = self.clean_conjunct(self.original_lines[i])
            if content and not content.startswith('"SWMR_state_machine'):
                print(f"  Line {line_num}: {content[:100]}...")
        
        print("\nCurrent conjuncts:")
        for i in range(start_offset, min(start_offset + count, len(self.current_lines))):
            line_num = self.current_start + i
            content = self.clean_conjunct(self.current_lines[i])
            if content and not content.startswith('"SWMR_state_machine'):
                print(f"  Line {line_num}: {content[:100]}...")
    
    def find_alignment_point(self):
        """Try to find where the files align"""
        print("\n=== Finding Alignment Points ===")
        
        # Look for common patterns or exact matches
        alignment_points = []
        
        for orig_i in range(min(50, len(self.original_lines))):  # Check first 50 original lines
            orig_content = self.clean_conjunct(self.original_lines[orig_i])
            if not orig_content or orig_content.startswith('"SWMR_state_machine'):
                continue
            
            for curr_i in range(min(50, len(self.current_lines))):  # Check first 50 current lines
                curr_content = self.clean_conjunct(self.current_lines[curr_i])
                if not curr_content or curr_content.startswith('"SWMR_state_machine'):
                    continue
                
                # Check for exact match or high similarity
                if self.calculate_similarity(orig_content, curr_content) > 0.8:
                    alignment_points.append({
                        'original_offset': orig_i,
                        'current_offset': curr_i,
                        'original_line': self.original_start + orig_i,
                        'current_line': self.current_start + curr_i,
                        'similarity': self.calculate_similarity(orig_content, curr_content),
                        'original_content': orig_content[:100],
                        'current_content': curr_content[:100]
                    })
        
        print(f"Found {len(alignment_points)} potential alignment points:")
        for point in alignment_points[:5]:  # Show first 5
            print(f"  Original line {point['original_line']} ↔ Current line {point['current_line']} (similarity: {point['similarity']:.3f})")
            print(f"    Original: {point['original_content']}...")
            print(f"    Current:  {point['current_content']}...")
            print()
        
        return alignment_points
    
    def calculate_similarity(self, content1: str, content2: str) -> float:
        """Calculate similarity between two conjuncts"""
        # Normalize both contents
        norm1 = self.normalize_content(content1)
        norm2 = self.normalize_content(content2)
        
        if norm1 == norm2:
            return 1.0
        
        # Calculate keyword similarity
        keywords1 = set(re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', norm1.lower()))
        keywords2 = set(re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', norm2.lower()))
        
        if keywords1 and keywords2:
            intersection = len(keywords1 & keywords2)
            union = len(keywords1 | keywords2)
            return intersection / union if union > 0 else 0
        
        return 0.0
    
    def normalize_content(self, content: str) -> str:
        """Normalize content for comparison"""
        # Replace device numbers
        content = re.sub(r'\bT\s+[01]\b', 'T DEVICE', content)
        content = re.sub(r'\b[01]\s+T\b', 'DEVICE T', content)
        content = re.sub(r'(dthdatas|htddatas|reqresps|snps|snpresps)[12]', r'\1X', content)
        
        # Normalize whitespace
        content = re.sub(r'\s+', ' ', content).strip()
        
        return content
    
    def analyze_unmapped_region(self, start_line: int = 687):
        """Analyze the unmapped region that caused the alignment failure"""
        print(f"\n=== Analyzing Unmapped Region (starting from line {start_line}) ===")
        
        # Calculate offset in original file
        start_offset = start_line - self.original_start
        
        print(f"Unmapped region: lines {start_line}-995 ({995 - start_line + 1} lines)")
        print("Sample of unmapped original conjuncts:")
        
        for i in range(start_offset, min(start_offset + 10, len(self.original_lines))):
            line_num = self.original_start + i
            content = self.clean_conjunct(self.original_lines[i])
            if content:
                print(f"  Line {line_num}: {content[:100]}...")
        
        # Check if these might correspond to earlier current lines
        print("\nChecking if unmapped originals correspond to earlier current lines...")
        matches_found = 0
        
        for i in range(start_offset, min(start_offset + 20, len(self.original_lines))):
            orig_content = self.clean_conjunct(self.original_lines[i])
            if not orig_content:
                continue
            
            best_match = None
            best_similarity = 0
            
            for j in range(len(self.current_lines)):
                curr_content = self.clean_conjunct(self.current_lines[j])
                if not curr_content:
                    continue
                
                similarity = self.calculate_similarity(orig_content, curr_content)
                if similarity > best_similarity and similarity > 0.7:
                    best_similarity = similarity
                    best_match = j
            
            if best_match is not None:
                matches_found += 1
                orig_line = self.original_start + i
                curr_line = self.current_start + best_match
                print(f"  Original line {orig_line} might match Current line {curr_line} (similarity: {best_similarity:.3f})")
        
        print(f"Found {matches_found} potential matches in unmapped region")

def main():
    analyzer = AlignmentAnalyzer()
    
    print("=== Alignment Analysis ===")
    
    # Load files
    analyzer.load_files()
    
    # Analyze file structure
    structure = analyzer.analyze_file_structure()
    
    # Sample conjuncts from the beginning
    analyzer.sample_conjuncts(start_offset=0, count=5)
    
    # Find alignment points
    alignment_points = analyzer.find_alignment_point()
    
    # Analyze the unmapped region
    analyzer.analyze_unmapped_region(start_line=687)
    
    # Sample conjuncts from the middle
    print("\n=== Middle Section Comparison ===")
    analyzer.sample_conjuncts(start_offset=100, count=5)
    
    print("\n=== Analysis Complete ===")
    print("Key findings:")
    print("1. The sequential mapping processed all current lines but only 61.2% of original lines")
    print("2. This suggests the files are not aligned 1:1 from the beginning")
    print("3. There may be significant structural differences or the definitions don't start at the same relative positions")
    print("4. The unmapped region (lines 687-995) contains 309 original conjuncts that need investigation")

if __name__ == "__main__":
    main()
