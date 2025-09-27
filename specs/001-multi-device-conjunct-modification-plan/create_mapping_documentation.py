#!/usr/bin/env python3
"""
Create comprehensive mapping results documentation file
"""

import sys
import os
import json

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from integrators.mapping_documentation_creator import MappingDocumentationCreator

def main():
    # Load mapping results
    with open('mapping_results/mapping_analysis_20250928_010049_mapping_data.json', 'r', encoding='utf-8') as f:
        mapping_data = json.load(f)

    # Initialize creator
    output_path = "../../betterProofAll/Common/COMPREHENSIVE_MAPPING_ANALYSIS.md"
    creator = MappingDocumentationCreator()

    # Create mapping documentation
    try:
        creator.create_mapping_documentation(mapping_data, output_path)
        print('✅ Comprehensive mapping documentation created successfully')
        print(f'📄 Documentation saved to: {output_path}')
    except Exception as e:
        print(f'❌ Error creating mapping documentation: {e}')
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
