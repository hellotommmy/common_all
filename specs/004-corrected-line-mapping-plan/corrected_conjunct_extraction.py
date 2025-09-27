#!/usr/bin/env python3
"""
Corrected Conjunct Extraction
Correctly extracts conjuncts by counting lines, not splitting by ∧
"""

import re
import json
from typing import List, Dict

class CorrectedConjunctExtractor:
    def __init__(self):
        self.conjuncts = []
        self.conjunct_id = 1
    
    def extract_original_conjuncts_correctly(self, filepath: str) -> List[Dict]:
        """Correctly extract conjuncts from OldCohProp.thy lines 200-995"""
        conjuncts = []
        
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        # Extract lines 200-995 (each line = one conjunct)
        for line_num in range(200, 996):  # 200 to 995 inclusive
            if line_num <= len(lines):
                line = lines[line_num - 1].strip()  # Convert to 0-indexed
                
                # Skip empty lines and comments
                if not line or line.startswith('--') or line.startswith('(*'):
                    continue
                
                # Each line contains one conjunct
                conjunct_content = self.clean_conjunct(line)
                
                if conjunct_content:
                    conjunct = {
                        'id': f"orig_{self.conjunct_id:03d}",
                        'line_number': line_num,
                        'content': conjunct_content,
                        'type': self.classify_conjunct(conjunct_content),
                        'original': True
                    }
                    conjuncts.append(conjunct)
                    self.conjunct_id += 1
        
        return conjuncts
    
    def extract_current_conjuncts_correctly(self, filepath: str) -> List[Dict]:
        """Correctly extract conjuncts from CoherenceProperties.thy"""
        conjuncts = []
        
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        # Find the SWMR_state_machine definition
        start_line = None
        end_line = None
        
        for i, line in enumerate(lines):
            if 'SWMR_state_machine T =' in line:
                start_line = i + 1  # 0-indexed
                break
        
        if start_line is None:
            print("Error: SWMR_state_machine definition not found")
            return []
        
        # Find the end of the definition
        for i in range(start_line, len(lines)):
            line = lines[i].strip()
            if line == ')' and not line.endswith('∧'):
                end_line = i + 1  # 0-indexed
                break
        
        if end_line is None:
            print("Error: End of SWMR_state_machine definition not found")
            return []
        
        print(f"Found SWMR_state_machine definition: lines {start_line+1}-{end_line}")
        
        # Extract conjuncts line by line
        for line_num in range(start_line + 1, end_line):  # Skip the definition start line
            if line_num <= len(lines):
                line = lines[line_num - 1].strip()
                
                # Skip empty lines and comments
                if not line or line.startswith('--') or line.startswith('(*'):
                    continue
                
                # Each line contains one conjunct
                conjunct_content = self.clean_conjunct(line)
                
                if conjunct_content:
                    conjunct = {
                        'id': f"curr_{self.conjunct_id:03d}",
                        'line_number': line_num,
                        'content': conjunct_content,
                        'type': self.classify_conjunct(conjunct_content),
                        'original': False
                    }
                    conjuncts.append(conjunct)
                    self.conjunct_id += 1
        
        return conjuncts
    
    def clean_conjunct(self, line: str) -> str:
        """Clean up conjunct content"""
        # Remove trailing ∧
        line = line.rstrip('∧').strip()
        
        # Remove comments
        line = re.sub(r'\\<comment>.*?\\<close>', '', line)
        line = re.sub(r'--.*$', '', line)
        
        return line.strip()
    
    def classify_conjunct(self, content: str) -> str:
        """Classify conjunct type based on content"""
        content_lower = content.lower()
        
        # Check for hardcoded device references
        if re.search(r'[0-9]\s*T\s*\)', content):
            return 'hardcoded_device'
        
        # Check for universal quantifiers
        if '∀' in content or '\\<forall>' in content:
            return 'universal_quantifier'
        
        # Check for existential quantifiers
        if '∃' in content or '\\<exists>' in content:
            return 'existential_quantifier'
        
        # Check for mutual exclusion patterns
        if '≠' in content and '→' in content:
            return 'mutual_exclusion'
        
        # Check for length constraints
        if 'length' in content_lower:
            return 'length_constraint'
        
        # Check for channel constraints
        if any(channel in content_lower for channel in ['htddatas', 'dthdatas', 'reqresps', 'snps', 'snpresps']):
            return 'channel_constraint'
        
        # Check for state constraints
        if any(state in content_lower for state in ['cstate', 'hstate']):
            return 'state_constraint'
        
        return 'other'
    
    def verify_line_count(self, conjuncts: List[Dict], expected_count: int, file_type: str) -> bool:
        """Verify that the conjunct count matches expected count"""
        actual_count = len(conjuncts)
        print(f"{file_type} conjuncts: Expected {expected_count}, Found {actual_count}")
        
        if actual_count == expected_count:
            print(f"✅ {file_type} count is correct!")
            return True
        else:
            print(f"❌ {file_type} count is incorrect!")
            return False

def main():
    extractor = CorrectedConjunctExtractor()
    
    print("=== Corrected Conjunct Extraction ===")
    print()
    
    # Extract original conjuncts correctly
    print("1. Extracting original conjuncts from OldCohProp.thy (lines 200-995)...")
    original_conjuncts = extractor.extract_original_conjuncts_correctly('betterProofAll/Common/OldCohProp.thy')
    
    # Verify count
    extractor.verify_line_count(original_conjuncts, 796, "Original")
    
    # Classify original conjuncts
    type_counts = {}
    for conjunct in original_conjuncts:
        conjunct_type = conjunct['type']
        type_counts[conjunct_type] = type_counts.get(conjunct_type, 0) + 1
    
    print("\n2. Original conjunct classification:")
    for conjunct_type, count in sorted(type_counts.items()):
        print(f"   {conjunct_type}: {count} conjuncts")
    
    # Extract current conjuncts correctly
    print("\n3. Extracting current conjuncts from CoherenceProperties.thy...")
    current_conjuncts = extractor.extract_current_conjuncts_correctly('betterProofAll/Common/CoherenceProperties.thy')
    
    # Classify current conjuncts
    type_counts = {}
    for conjunct in current_conjuncts:
        conjunct_type = conjunct['type']
        type_counts[conjunct_type] = type_counts.get(conjunct_type, 0) + 1
    
    print("\n4. Current conjunct classification:")
    for conjunct_type, count in sorted(type_counts.items()):
        print(f"   {conjunct_type}: {count} conjuncts")
    
    # Save results
    print("\n5. Saving corrected results...")
    with open('specs/004-corrected-line-mapping-plan/corrected_original_conjuncts.json', 'w') as f:
        json.dump(original_conjuncts, f, indent=2, default=str)
    
    with open('specs/004-corrected-line-mapping-plan/corrected_current_conjuncts.json', 'w') as f:
        json.dump(current_conjuncts, f, indent=2, default=str)
    
    # Create summary
    summary = {
        'original_conjuncts': {
            'count': len(original_conjuncts),
            'line_range': '200-995',
            'expected_count': 796,
            'count_correct': len(original_conjuncts) == 796
        },
        'current_conjuncts': {
            'count': len(current_conjuncts),
            'line_range': 'SWMR_state_machine definition',
            'expected_count': 'Unknown (to be determined)'
        },
        'extraction_timestamp': '2025-01-20',
        'method': 'Line-by-line extraction (corrected)'
    }
    
    with open('specs/004-corrected-line-mapping-plan/corrected_extraction_summary.json', 'w') as f:
        json.dump(summary, f, indent=2)
    
    print(f"   Corrected original conjuncts saved to: corrected_original_conjuncts.json")
    print(f"   Corrected current conjuncts saved to: corrected_current_conjuncts.json")
    print(f"   Summary saved to: corrected_extraction_summary.json")
    
    # Show sample conjuncts
    print("\n6. Sample original conjuncts:")
    for i, conjunct in enumerate(original_conjuncts[:5]):
        print(f"   {conjunct['id']}: Line {conjunct['line_number']} - {conjunct['content'][:80]}...")
    
    print(f"\n7. Corrected extraction complete!")
    print(f"   Original conjuncts: {len(original_conjuncts)} (Expected: 796)")
    print(f"   Current conjuncts: {len(current_conjuncts)}")

if __name__ == "__main__":
    main()
