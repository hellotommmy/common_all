#!/usr/bin/env python3
"""
Update DETAILED_MODIFICATIONS.md with consolidation explanations
"""

import sys
import os
import json

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from integrators.detailed_modifications_updater import DetailedModificationsUpdater

def main():
    # Load mapping results
    with open('mapping_results/mapping_analysis_20250928_010049_mapping_data.json', 'r', encoding='utf-8') as f:
        mapping_data = json.load(f)

    # Initialize updater
    detailed_modifications_path = "../../betterProofAll/Common/DETAILED_MODIFICATIONS.md"
    updater = DetailedModificationsUpdater(detailed_modifications_path)

    # Update detailed modifications
    try:
        updater.update_detailed_modifications(mapping_data)
        print('✅ DETAILED_MODIFICATIONS.md updated successfully')
    except Exception as e:
        print(f'❌ Error updating DETAILED_MODIFICATIONS.md: {e}')
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
