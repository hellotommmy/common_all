#!/usr/bin/env python3
"""
Extract Current Conjuncts from CoherenceProperties.thy
Extracts all conjuncts from the SWMR_state_machine definition
"""

import re
import json
from typing import List, Dict, Tuple

class CurrentConjunctExtractor:
    def __init__(self):
        self.conjuncts = []
        self.conjunct_id = 1
    
    def extract_conjuncts(self, filepath: str) -> List[Dict]:
        """Extract conjuncts from CoherenceProperties.thy SWMR_state_machine definition"""
        conjuncts = []
        
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        # Find the SWMR_state_machine definition (around line 286)
        start_line = None
        end_line = None
        
        for i, line in enumerate(lines):
            if 'SWMR_state_machine T =' in line:
                start_line = i + 1  # 0-indexed
                break
        
        if start_line is None:
            print("Error: SWMR_state_machine definition not found")
            return []
        
        # Find the end of the definition (look for closing parenthesis)
        for i in range(start_line, len(lines)):
            line = lines[i].strip()
            if line == ')' and not line.endswith('∧'):
                end_line = i + 1  # 0-indexed
                break
        
        if end_line is None:
            print("Error: End of SWMR_state_machine definition not found")
            return []
        
        print(f"Found SWMR_state_machine definition: lines {start_line+1}-{end_line}")
        
        # Extract conjuncts from the definition
        current_line = start_line + 1
        in_definition = True
        
        for i in range(start_line, end_line):
            line = lines[i].strip()
            
            # Skip empty lines and comments
            if not line or line.startswith('--') or line.startswith('(*'):
                current_line += 1
                continue
            
            # Process the line for conjuncts
            conjuncts_in_line = self.parse_line_for_conjuncts(line, current_line)
            conjuncts.extend(conjuncts_in_line)
            
            current_line += 1
        
        return conjuncts
    
    def parse_line_for_conjuncts(self, line: str, line_number: int) -> List[Dict]:
        """Parse a line to extract individual conjuncts"""
        conjuncts = []
        
        # Split by ∧ but be careful about nested parentheses
        parts = self.split_by_conjunction(line)
        
        for part in parts:
            part = part.strip()
            if part and not part.startswith('--') and not part.startswith('(*'):
                # Clean up the conjunct
                conjunct_content = self.clean_conjunct(part)
                
                if conjunct_content:
                    conjunct = {
                        'id': f"curr_{self.conjunct_id:03d}",
                        'line_number': line_number,
                        'content': conjunct_content,
                        'type': self.classify_conjunct(conjunct_content),
                        'original': False
                    }
                    conjuncts.append(conjunct)
                    self.conjunct_id += 1
        
        return conjuncts
    
    def split_by_conjunction(self, line: str) -> List[str]:
        """Split line by ∧ while respecting parentheses"""
        parts = []
        current_part = ""
        paren_count = 0
        
        for char in line:
            if char == '(':
                paren_count += 1
            elif char == ')':
                paren_count -= 1
            elif char == '∧' and paren_count == 0:
                parts.append(current_part.strip())
                current_part = ""
                continue
            
            current_part += char
        
        if current_part.strip():
            parts.append(current_part.strip())
        
        return parts
    
    def clean_conjunct(self, conjunct: str) -> str:
        """Clean up conjunct content"""
        # Remove trailing ∧
        conjunct = conjunct.rstrip('∧').strip()
        
        # Remove comments
        conjunct = re.sub(r'\\<comment>.*?\\<close>', '', conjunct)
        conjunct = re.sub(r'--.*$', '', conjunct)
        
        return conjunct.strip()
    
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

def main():
    extractor = CurrentConjunctExtractor()
    
    print("=== Extracting Current Conjuncts from CoherenceProperties.thy ===")
    print()
    
    # Extract conjuncts
    print("1. Reading CoherenceProperties.thy SWMR_state_machine definition...")
    conjuncts = extractor.extract_conjuncts('betterProofAll/Common/CoherenceProperties.thy')
    
    print(f"   Found {len(conjuncts)} current conjuncts")
    
    # Classify conjuncts
    type_counts = {}
    for conjunct in conjuncts:
        conjunct_type = conjunct['type']
        type_counts[conjunct_type] = type_counts.get(conjunct_type, 0) + 1
    
    print("\n2. Conjunct classification:")
    for conjunct_type, count in sorted(type_counts.items()):
        print(f"   {conjunct_type}: {count} conjuncts")
    
    # Save results
    print("\n3. Saving results...")
    with open('specs/003-line-mapping-analysis-plan/current_conjuncts.json', 'w') as f:
        json.dump(conjuncts, f, indent=2, default=str)
    
    # Create summary
    summary = {
        'total_conjuncts': len(conjuncts),
        'type_distribution': type_counts,
        'definition_range': 'SWMR_state_machine definition',
        'extraction_timestamp': '2025-01-20'
    }
    
    with open('specs/003-line-mapping-analysis-plan/current_conjuncts_summary.json', 'w') as f:
        json.dump(summary, f, indent=2)
    
    print(f"   Current conjuncts saved to: current_conjuncts.json")
    print(f"   Summary saved to: current_conjuncts_summary.json")
    
    # Show sample conjuncts
    print("\n4. Sample conjuncts:")
    for i, conjunct in enumerate(conjuncts[:5]):
        print(f"   {conjunct['id']}: Line {conjunct['line_number']} - {conjunct['content'][:80]}...")
    
    print(f"\n5. Extraction complete! Found {len(conjuncts)} current conjuncts.")

if __name__ == "__main__":
    main()
