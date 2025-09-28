#!/usr/bin/env python3
"""
Extract Original Conjuncts from OldCohProp.thy
Extracts all 796 conjuncts from lines 200-795
"""

import re
import json
from typing import List, Dict, Tuple

class OriginalConjunctExtractor:
    def __init__(self):
        self.conjuncts = []
        self.conjunct_id = 1
    
    def extract_conjuncts(self, filepath: str) -> List[Dict]:
        """Extract conjuncts from OldCohProp.thy lines 200-795"""
        conjuncts = []
        
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        # Extract lines 200-795
        relevant_lines = lines[199:795]  # 0-indexed, so 199 = line 200
        
        current_line = 200
        in_definition = False
        current_conjunct = ""
        
        for line in relevant_lines:
            line = line.strip()
            
            # Skip empty lines and comments
            if not line or line.startswith('--') or line.startswith('(*'):
                current_line += 1
                continue
            
            # Check if we're in the SWMR_state_machine definition
            if 'SWMR_state_machine T =' in line:
                in_definition = True
                current_line += 1
                continue
            
            # Check if we've reached the end of the definition
            if in_definition and line == ')' and not line.endswith('∧'):
                break
            
            if in_definition:
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
                        'id': f"orig_{self.conjunct_id:03d}",
                        'line_number': line_number,
                        'content': conjunct_content,
                        'type': self.classify_conjunct(conjunct_content),
                        'original': True
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
    extractor = OriginalConjunctExtractor()
    
    print("=== Extracting Original Conjuncts from OldCohProp.thy ===")
    print()
    
    # Extract conjuncts
    print("1. Reading OldCohProp.thy lines 200-795...")
    conjuncts = extractor.extract_conjuncts('betterProofAll/Common/OldCohProp.thy')
    
    print(f"   Found {len(conjuncts)} original conjuncts")
    
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
    with open('specs/003-line-mapping-analysis-plan/original_conjuncts.json', 'w') as f:
        json.dump(conjuncts, f, indent=2, default=str)
    
    # Create summary
    summary = {
        'total_conjuncts': len(conjuncts),
        'type_distribution': type_counts,
        'line_range': '200-795',
        'extraction_timestamp': '2025-01-20'
    }
    
    with open('specs/003-line-mapping-analysis-plan/original_conjuncts_summary.json', 'w') as f:
        json.dump(summary, f, indent=2)
    
    print(f"   Original conjuncts saved to: original_conjuncts.json")
    print(f"   Summary saved to: original_conjuncts_summary.json")
    
    # Show sample conjuncts
    print("\n4. Sample conjuncts:")
    for i, conjunct in enumerate(conjuncts[:5]):
        print(f"   {conjunct['id']}: Line {conjunct['line_number']} - {conjunct['content'][:80]}...")
    
    print(f"\n5. Extraction complete! Found {len(conjuncts)} original conjuncts.")

if __name__ == "__main__":
    main()
