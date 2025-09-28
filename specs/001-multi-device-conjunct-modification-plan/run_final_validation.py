#!/usr/bin/env python3
"""
Final Validation Script for T033-T036
Executes all parallel validation tasks for comprehensive mapping analysis
"""

import sys
import os
import json
from datetime import datetime

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from validators.mapping_validator import MappingValidator

def main():
    print("🔍 Final Validation Suite - Phase 3.9")
    print("=" * 50)
    
    # Load mapping results
    print("📂 Loading mapping analysis results...")
    try:
        with open('mapping_results/mapping_analysis_20250928_010049_mapping_data.json', 'r', encoding='utf-8') as f:
            mapping_data = json.load(f)
        print("✅ Mapping data loaded successfully")
    except Exception as e:
        print(f"❌ Error loading mapping data: {e}")
        return 1

    # Initialize validator
    print("\n🛠️  Initializing comprehensive validator...")
    validator = MappingValidator()
    
    validation_results = {}
    overall_success = True
    
    # T033: Validate 100% coverage of 796 original conjuncts
    print("\n📊 T033: Validating 100% coverage of 796 original conjuncts...")
    try:
        coverage_result = validator.validate_coverage(mapping_data)
        validation_results['T033_coverage'] = coverage_result
        
        if coverage_result.get('valid', False):
            print("✅ T033: Coverage validation PASSED")
        else:
            print("❌ T033: Coverage validation FAILED")
            print(f"   Coverage: {coverage_result.get('coverage_percentage', 0):.1f}%")
            print(f"   Mapped: {coverage_result.get('mapped_count', 0)}/796 original conjuncts")
            overall_success = False
    except Exception as e:
        print(f"❌ T033: Coverage validation ERROR: {e}")
        validation_results['T033_coverage'] = {'valid': False, 'error': str(e)}
        overall_success = False
    
    # T034: Validate average confidence score >0.8
    print("\n🎯 T034: Validating average confidence score >0.8...")
    try:
        quality_metrics = validator.calculate_quality_metrics(mapping_data)
        avg_confidence = quality_metrics.get('average_confidence', 0.0)
        validation_results['T034_confidence'] = {
            'valid': avg_confidence > 0.8,
            'average_confidence': avg_confidence,
            'threshold': 0.8
        }
        
        if avg_confidence > 0.8:
            print(f"✅ T034: Confidence validation PASSED (avg: {avg_confidence:.3f})")
        else:
            print(f"❌ T034: Confidence validation FAILED (avg: {avg_confidence:.3f} < 0.8)")
            overall_success = False
    except Exception as e:
        print(f"❌ T034: Confidence validation ERROR: {e}")
        validation_results['T034_confidence'] = {'valid': False, 'error': str(e)}
        overall_success = False
    
    # T035: Validate semantic equivalence preservation
    print("\n🧠 T035: Validating semantic equivalence preservation...")
    try:
        semantic_result = validator.validate_semantic_equivalence(mapping_data)
        validation_results['T035_semantic'] = semantic_result
        
        if semantic_result.get('valid', False):
            print("✅ T035: Semantic validation PASSED")
        else:
            print("❌ T035: Semantic validation FAILED")
            issues = semantic_result.get('issues', [])
            if issues:
                print(f"   Issues found: {len(issues)}")
                for issue in issues[:3]:  # Show first 3 issues
                    print(f"   - {issue}")
            overall_success = False
    except Exception as e:
        print(f"❌ T035: Semantic validation ERROR: {e}")
        validation_results['T035_semantic'] = {'valid': False, 'error': str(e)}
        overall_success = False
    
    # T036: Validate documentation consistency
    print("\n📄 T036: Validating documentation consistency...")
    try:
        doc_result = validator.validate_documentation_consistency(mapping_data)
        validation_results['T036_documentation'] = doc_result
        
        if doc_result.get('valid', False):
            print("✅ T036: Documentation validation PASSED")
        else:
            print("❌ T036: Documentation validation FAILED")
            inconsistencies = doc_result.get('inconsistencies', [])
            if inconsistencies:
                print(f"   Inconsistencies found: {len(inconsistencies)}")
                for inconsistency in inconsistencies[:3]:  # Show first 3
                    print(f"   - {inconsistency}")
            overall_success = False
    except Exception as e:
        print(f"❌ T036: Documentation validation ERROR: {e}")
        validation_results['T036_documentation'] = {'valid': False, 'error': str(e)}
        overall_success = False
    
    # Generate validation summary
    print("\n📋 Validation Summary")
    print("=" * 30)
    
    passed_count = sum(1 for result in validation_results.values() if result.get('valid', False))
    total_count = len(validation_results)
    
    print(f"✅ Passed: {passed_count}/{total_count} validations")
    print(f"❌ Failed: {total_count - passed_count}/{total_count} validations")
    
    if overall_success:
        print("\n🎉 ALL VALIDATIONS PASSED!")
        print("✅ Ready for final report generation and commit")
    else:
        print("\n⚠️  SOME VALIDATIONS FAILED")
        print("❌ Review issues before proceeding to final steps")
    
    # Save validation results
    validation_report_path = f"mapping_results/final_validation_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    with open(validation_report_path, 'w', encoding='utf-8') as f:
        json.dump({
            'timestamp': datetime.now().isoformat(),
            'overall_success': overall_success,
            'validation_results': validation_results,
            'summary': {
                'passed': passed_count,
                'total': total_count,
                'success_rate': passed_count / total_count if total_count > 0 else 0
            }
        }, f, indent=2, ensure_ascii=False)
    
    print(f"\n📄 Validation report saved: {validation_report_path}")
    
    return 0 if overall_success else 1

if __name__ == '__main__':
    sys.exit(main())
