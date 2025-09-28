# Research: Comprehensive Conjunct Mapping Documentation

## Overview
Research findings for implementing comprehensive conjunct mapping documentation between original 2-device conjuncts (796 total) and current multi-device conjuncts (486 total).

## Sequential Two-Pointer Algorithm Analysis

### Decision: Sequential Line-by-Line Mapping
**Rationale**: User specifically requested "双指针法" (two-pointer algorithm) for systematic mapping. Previous semantic similarity approaches achieved only 93% coverage.

**Implementation**: 
- Start from OldCohProp.thy line 200, CoherenceProperties.thy line 286
- Use two pointers to traverse both files simultaneously
- Handle 1:1, N:1, and misalignment scenarios
- Report unmapped sections

**Previous Results**: Sequential approach processed 486/486 current lines but only 487/796 original lines (61.2%), confirming consolidation hypothesis.

## Consolidation Pattern Analysis

### Decision: Focus on N:1 Consolidation Detection
**Rationale**: 796 original → 486 current conjuncts (39% reduction) indicates significant consolidation.

**Consolidation Types**:
1. **2:1 Most Common**: `device_0 + device_1` → `∀i. condition(i)`
2. **4:1**: Four cross-device constraints → one mutual exclusion
3. **6:1**: Complex multi-device coordination → single existential
4. **1:1**: Device generalization without consolidation

## Documentation Integration Strategy

### Decision: Integrate with Existing Progress Tracking
**Rationale**: Maintain consistency with SWMR_modification_progress.py and DETAILED_MODIFICATIONS.md workflow.

**Enhanced Format**:
```python
{
    'line_number': 304,
    'status': 'AI_MODIFIED',
    'original_mapping': {
        'original_lines': [258, 259],
        'consolidation_type': '2_to_1',
        'confidence_score': 0.85
    }
}
```

## Validation Approach

### Multi-Level Validation
1. **Algorithmic**: Ensure all 796 original conjuncts mapped
2. **Semantic**: Verify transformation preserves meaning
3. **Documentation**: Cross-check with existing progress tracking

**Quality Targets**: 100% coverage, >0.8 average confidence score

## Conclusion
Comprehensive approach combining sequential two-pointer algorithm, N:1 consolidation detection, integrated documentation, and multi-level validation to achieve complete conjunct mapping coverage.