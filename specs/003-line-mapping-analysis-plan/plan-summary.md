# Line Mapping Analysis Plan Summary

## Executive Summary

The user has identified a critical issue: the original 2-device version had 796 conjuncts (lines 200-795 in OldCohProp.thy), but the current multi-device version has fewer lines due to quantifier consolidation. This plan provides a systematic approach to create precise line-by-line mapping between the versions.

## Problem Analysis

### Key Discovery
- **Original Version**: 796 conjuncts in lines 200-795 (OldCohProp.thy)
- **Current Version**: Fewer lines due to quantifier consolidation (CoherenceProperties.thy)
- **Consolidation Factor**: ~1.23 (some original conjuncts were merged)
- **Critical Need**: Precise mapping to ensure no conjuncts are lost or duplicated

### Consolidation Patterns Identified

#### 1. Mutual Exclusion Consolidation (2→1)
**Original**: `(A T 0 → ¬B T 1) ∧ (A T 1 → ¬B T 0)`
**Current**: `∀i j. i ≠ j → (A T i → ¬B T j)`
**Example**: Lines 241-242 → Line 327

#### 2. Length Constraint Consolidation (2→2)
**Original**: `(length (X1 T) ≤ 1) ∧ (length (X2 T) ≤ 1)`
**Current**: `∀i. length (X T i) ≤ 1`
**Example**: Lines 243-244 → Lines 328-329

#### 3. State Constraint Consolidation (2→1)
**Original**: `(CSTATE Invalid T 0 → ...) ∧ (CSTATE Invalid T 1 → ...)`
**Current**: `∀i j. i ≠ j → (CSTATE Invalid T i → ...)`
**Example**: Lines 248-249 → Line 333

#### 4. Host State Constraint Consolidation (1→1)
**Original**: `(HSTATE X T → A T 0 ∧ A T 1)`
**Current**: `(HSTATE X T → ∀i. A T i)`
**Example**: Lines 217-219 → Lines 303-305

## Solution Strategy

### Phase 1: Analysis and Discovery ✅
- **T001**: Extract all 796 original conjuncts from OldCohProp.thy
- **T002**: Extract all current conjuncts from CoherenceProperties.thy
- **T003**: Identify consolidation patterns (4 main patterns identified)
- **T004**: Create mapping framework for systematic analysis

### Phase 2: Systematic Mapping
- **T005**: Map mutual exclusion patterns (2→1 consolidation)
- **T006**: Map length constraint patterns (2→2 with universal quantification)
- **T007**: Map state constraint patterns (2→1 consolidation)
- **T008**: Map host state constraint patterns (1→1 with universal quantification)
- **T009**: Map complex consolidation patterns
- **T010**: Gap analysis and verification

### Phase 3: Documentation and Validation
- **T011**: Create comprehensive mapping documentation
- **T012**: Create consolidation analysis report
- **T013**: Create verification and audit system
- **T014**: Create mapping database
- **T015**: Final validation and testing

## Key Insights

### 1. Consolidation is Systematic
The consolidation follows clear, predictable patterns:
- **Mutual exclusion** patterns are consolidated into universal quantifiers
- **Length constraints** are converted to universal quantifiers but not consolidated
- **State constraints** are consolidated into universal quantifiers with mutual exclusion
- **Host state constraints** are converted to universal quantifiers but not consolidated

### 2. Semantic Preservation
All consolidation patterns preserve semantic meaning:
- **Mutual exclusion**: `A T 0 → ¬B T 1` + `A T 1 → ¬B T 0` → `∀i j. i ≠ j → (A T i → ¬B T j)`
- **Universal constraints**: `A T 0 ∧ A T 1` → `∀i. A T i`
- **Length constraints**: `length (X1 T) ≤ 1 ∧ length (X2 T) ≤ 1` → `∀i. length (X T i) ≤ 1`

### 3. Line Number Mapping
- **Original**: Lines 200-795 (596 lines)
- **Current**: Lines 286-771 (486 lines)
- **Offset**: Current starts 86 lines after original
- **Reduction**: 110 lines fewer in current version

## Implementation Approach

### 1. Automated Parsing
Create sophisticated parsing script to:
- Extract conjuncts from both versions
- Identify conjunct boundaries and separators
- Classify conjunct types and patterns
- Handle multi-line conjuncts properly

### 2. Pattern-Based Mapping
Use identified consolidation patterns to:
- Automatically map conjuncts based on pattern recognition
- Verify semantic equivalence
- Track consolidation relationships
- Identify edge cases and exceptions

### 3. Manual Verification
For complex cases:
- Manually verify key mappings
- Check semantic equivalence
- Handle edge cases and exceptions
- Ensure completeness and accuracy

### 4. Comprehensive Documentation
Create complete documentation including:
- Mapping table for all 796 original conjuncts
- Consolidation analysis report
- Gap analysis and verification
- Audit trail for all mappings

## Success Criteria

### Primary Success Criteria
1. **Complete Mapping**: All 796 original conjuncts mapped to current version
2. **No Missing Conjuncts**: Every original conjunct accounted for
3. **No Duplicates**: No conjuncts counted multiple times
4. **Accurate Mapping**: All mappings verified for accuracy
5. **Complete Documentation**: Comprehensive mapping documentation created

### Secondary Success Criteria
1. **Consolidation Analysis**: Clear understanding of how conjuncts were consolidated
2. **Verification System**: Robust system for independent verification
3. **Audit Trail**: Complete audit trail of all mappings
4. **Query System**: Easy querying and analysis of mappings
5. **Integration**: Integration with existing progress tracking systems

## Risk Mitigation

### High-Risk Areas
1. **Complex Consolidation**: Some conjuncts may have complex consolidation patterns
2. **Semantic Equivalence**: Ensuring semantic equivalence after consolidation
3. **Gap Detection**: Identifying all missing or unaccounted conjuncts
4. **Verification**: Ensuring mapping accuracy and completeness

### Mitigation Strategies
1. **Systematic Approach**: Process one consolidation pattern at a time
2. **Semantic Analysis**: Careful analysis of semantic equivalence
3. **Multiple Verification**: Multiple verification methods and independent checks
4. **Documentation**: Comprehensive documentation of all mappings and reasoning

## Timeline Estimate

- **Phase 1 (Analysis)**: 4-6 hours ✅ (Completed)
- **Phase 2 (Mapping)**: 8-12 hours
- **Phase 3 (Documentation)**: 4-6 hours

**Total Estimated Time**: 16-24 hours

## Next Steps

### Immediate Actions
1. **Create Complete Mapping Table**: Map all 796 original conjuncts to current version
2. **Verify Consolidation Patterns**: Ensure all consolidation follows identified patterns
3. **Gap Analysis**: Identify any missing or duplicate mappings
4. **Semantic Verification**: Verify semantic equivalence of all mappings

### Implementation Priority
1. **High Priority**: Complete mapping table for all 796 conjuncts
2. **Medium Priority**: Consolidation analysis and documentation
3. **Low Priority**: Advanced query system and integration

## Conclusion

The mapping between original and current versions is systematic and follows clear consolidation patterns. The key insight is that quantifier consolidation has reduced the number of conjuncts while preserving semantic meaning. The next step is to create a complete mapping table for all 796 original conjuncts, ensuring no conjuncts are lost or duplicated during the multi-device conversion process.

This mapping is essential for:
1. **Verifying Completeness**: Ensuring all original conjuncts are accounted for
2. **Maintaining Traceability**: Tracking which original conjuncts became which current conjuncts
3. **Quality Assurance**: Verifying that consolidation preserved semantic meaning
4. **Documentation**: Providing complete audit trail of the conversion process
