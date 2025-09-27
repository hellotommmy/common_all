# Quickstart: Comprehensive Conjunct Mapping Documentation

## Overview
This quickstart guide demonstrates how to execute comprehensive conjunct mapping analysis to establish line-by-line correspondence between original 2-device conjuncts and current multi-device conjuncts.

## Prerequisites
- Python 3.11+
- Access to betterProofAll/Common/ directory
- OldCohProp.thy (original 2-device theory file)
- CoherenceProperties.thy (current multi-device theory file)

## Quick Start Steps

### 1. Prepare Environment
```bash
cd C:\Users\Chengsong\Documents\GitHub\nit_template
python -m venv mapping_analysis_env
mapping_analysis_env\Scripts\activate  # Windows
pip install -r requirements.txt  # If requirements file exists
```

### 2. Execute Sequential Mapping Analysis
```python
# Run the comprehensive mapping analysis
python specs/001-multi-device-conjunct-modification-plan/comprehensive_mapping_analyzer.py

# Expected output:
# - Loading 796 original conjuncts from OldCohProp.thy (lines 200-995)
# - Loading 486 current conjuncts from CoherenceProperties.thy (lines 286-771)
# - Executing sequential two-pointer mapping algorithm
# - Detecting N:1 consolidation patterns
# - Generating comprehensive mapping documentation
```

### 3. Verify Results
```python
# Check mapping coverage
python -c "
import json
with open('mapping_results.json', 'r') as f:
    results = json.load(f)
print(f'Coverage: {results[\"mapping_summary\"][\"original_mapping_coverage\"]}%')
print(f'Total mappings: {results[\"mapping_summary\"][\"total_mappings\"]}')
print(f'Consolidation ratio: {results[\"mapping_summary\"][\"consolidation_ratio\"]}')
"

# Expected output:
# Coverage: 100.0%
# Total mappings: 486
# Consolidation ratio: 1.64
```

### 4. Review Documentation Updates
```bash
# Check updated progress tracking
python betterProofAll/Common/SWMR_modification_progress.py

# Review detailed modifications
head -50 betterProofAll/Common/DETAILED_MODIFICATIONS.md

# Check progress report
tail -20 betterProofAll/Common/PROGRESS_REPORT.md
```

## Expected Results

### Mapping Analysis Output
- **Total Original Conjuncts**: 796 (lines 200-995 in OldCohProp.thy)
- **Total Current Conjuncts**: 486 (lines 286-771 in CoherenceProperties.thy)
- **Expected Coverage**: 100% (all original conjuncts mapped)
- **Expected Consolidation Patterns**:
  - 2:1 consolidations: ~250-300 instances
  - 4:1 consolidations: ~5-10 instances
  - 6:1 consolidations: ~1-3 instances
  - 1:1 transformations: ~200-250 instances

### Documentation Updates
- **SWMR_modification_progress.py**: Enhanced with mapping relationship fields
- **DETAILED_MODIFICATIONS.md**: Added consolidation explanations
- **PROGRESS_REPORT.md**: Updated with mapping analysis summary
- **mapping_results.json**: Comprehensive mapping documentation

### Quality Metrics
- **Average Confidence Score**: >0.8
- **High Confidence Mappings**: >80%
- **Semantic Equivalence**: 100% preserved or enhanced
- **Documentation Consistency**: Full alignment with existing progress tracking

## Validation Steps

### 1. Coverage Validation
```python
# Ensure all 796 original conjuncts are mapped
python -c "
import json
with open('mapping_results.json', 'r') as f:
    results = json.load(f)
mapped_originals = set()
for mapping in results['mappings']:
    mapped_originals.update(mapping['original_lines'])
print(f'Mapped original conjuncts: {len(mapped_originals)}/796')
assert len(mapped_originals) == 796, 'Not all original conjuncts mapped!'
print('✅ Coverage validation passed')
"
```

### 2. Consolidation Validation
```python
# Verify consolidation patterns
python -c "
import json
with open('mapping_results.json', 'r') as f:
    results = json.load(f)
patterns = results['consolidation_patterns']
total_consolidations = sum(patterns.values()) - patterns.get('1_to_1', 0)
print(f'Total consolidations detected: {total_consolidations}')
print(f'Consolidation breakdown: {patterns}')
"
```

### 3. Documentation Consistency
```bash
# Verify documentation updates
git status
git diff betterProofAll/Common/SWMR_modification_progress.py
git diff betterProofAll/Common/DETAILED_MODIFICATIONS.md
git diff betterProofAll/Common/PROGRESS_REPORT.md
```

## Troubleshooting

### Common Issues
1. **File Not Found**: Ensure OldCohProp.thy and CoherenceProperties.thy are in correct locations
2. **Low Coverage**: Check for parsing errors in conjunct extraction
3. **Low Confidence**: Review similarity calculation algorithm parameters
4. **Documentation Errors**: Verify file permissions and backup existing files

### Debug Commands
```python
# Debug conjunct extraction
python -c "
from comprehensive_mapping_analyzer import ConjunctExtractor
extractor = ConjunctExtractor('OldCohProp.thy', 'CoherenceProperties.thy', 200, 995, 286, 771)
original = extractor.extract_conjuncts_from_file('betterProofAll/Common/OldCohProp.thy', 200, 995, True)
print(f'Original conjuncts extracted: {len(original)}')
"

# Debug mapping algorithm
python -c "
from comprehensive_mapping_analyzer import SequentialConjunctMapper
mapper = SequentialConjunctMapper('OldCohProp.thy', 'CoherenceProperties.thy', 200, 995, 286, 771)
# Add debug prints in run_sequential_mapping method
"
```

## Success Criteria Verification
- [ ] All 796 original conjuncts have mapping entries
- [ ] Average confidence score >0.8
- [ ] Documentation updates completed successfully
- [ ] No unmapped sections reported
- [ ] Consolidation patterns documented with examples
- [ ] Semantic equivalence preserved in all transformations

This quickstart demonstrates the complete conjunct mapping analysis workflow, ensuring comprehensive documentation of the transformation from 2-device to multi-device theory files.