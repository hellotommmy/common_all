#!/usr/bin/env python3
"""
Update PROGRESS_REPORT.md with mapping analysis summary
"""

import sys
import os
import json

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from integrators.progress_report_updater import ProgressReportUpdater

def main():
    # Load mapping results
    with open('mapping_results/mapping_analysis_20250928_010049_mapping_data.json', 'r', encoding='utf-8') as f:
        mapping_data = json.load(f)

    # Initialize updater
    progress_report_path = "../../betterProofAll/Common/PROGRESS_REPORT.md"
    updater = ProgressReportUpdater(progress_report_path)

    # Update progress report
    try:
        updater.update_progress_report(mapping_data)
        print('✅ PROGRESS_REPORT.md updated successfully')
    except Exception as e:
        print(f'❌ Error updating PROGRESS_REPORT.md: {e}')
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
