#!/usr/bin/env python3
"""
Update progress tracking with mapping results
"""

import sys
import os
import json

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from integrators.progress_updater import ProgressTrackingUpdater

def main():
    # Load mapping results
    with open('mapping_results/mapping_analysis_20250928_010049_mapping_data.json', 'r', encoding='utf-8') as f:
        mapping_data = json.load(f)

    # Initialize updater
    progress_file_path = "../../betterProofAll/Common/SWMR_modification_progress.py"
    updater = ProgressTrackingUpdater(progress_file_path)

    # Update progress tracking
    try:
        updater.update_progress_tracking(mapping_data)
        print('✅ Progress tracking updated successfully')
    except Exception as e:
        print(f'❌ Error updating progress tracking: {e}')
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
