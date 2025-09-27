# Line Mapping Analysis Plan

## Feature Specification

### Problem Statement
The user has discovered a critical issue: the original 2-device version had 796 conjuncts (lines 200-795 in OldCohProp.thy), but the current multi-device version has fewer lines due to quantifier consolidation. This creates a mapping challenge where:

1. **Original**: 796 conjuncts in lines 200-795 (OldCohProp.thy)
2. **Current**: Fewer lines due to quantifier consolidation (CoherenceProperties.thy)
3. **Need**: Precise line-by-line mapping to ensure no conjuncts are lost or duplicated

### Requirements

#### Functional Requirements
1. **Complete Line Mapping**: Create precise mapping between original 796 conjuncts and current multi-device version
2. **Conjunct Tracking**: Ensure every original conjunct is accounted for in the current version
3. **Consolidation Analysis**: Identify which original conjuncts were merged into single multi-device conjuncts
4. **Gap Detection**: Identify any missing or duplicated conjuncts
5. **Documentation**: Create comprehensive mapping documentation

#### Non-Functional Requirements
1. **Accuracy**: 100% accurate mapping with no missing conjuncts
2. **Traceability**: Every original conjunct must be traceable to current version
3. **Completeness**: All 796 original conjuncts must be accounted for
4. **Verification**: Mapping must be verifiable and auditable

### Success Criteria
1. **Complete Mapping**: All 796 original conjuncts mapped to current version
2. **No Missing Conjuncts**: Every original conjunct accounted for
3. **No Duplicates**: No conjuncts counted multiple times
4. **Clear Documentation**: Comprehensive mapping documentation created
5. **Verification**: Mapping can be independently verified

### Technical Constraints
1. Must analyze both OldCohProp.thy and CoherenceProperties.thy
2. Must account for quantifier consolidation effects
3. Must maintain semantic equivalence verification
4. Must provide clear audit trail

## Implementation Plan

### Phase 1: Analysis and Discovery
1. **Extract Original Conjuncts**: Parse all 796 conjuncts from OldCohProp.thy lines 200-795
2. **Extract Current Conjuncts**: Parse all conjuncts from current CoherenceProperties.thy
3. **Identify Consolidation Patterns**: Analyze how quantifiers consolidated multiple conjuncts
4. **Create Mapping Framework**: Design systematic approach for line-by-line mapping

### Phase 2: Systematic Mapping
1. **Conjunct-by-Conjunct Analysis**: Map each original conjunct to current version
2. **Consolidation Tracking**: Track which original conjuncts were merged
3. **Gap Analysis**: Identify any missing or unaccounted conjuncts
4. **Verification**: Cross-check mapping for accuracy

### Phase 3: Documentation and Validation
1. **Create Mapping Documentation**: Document complete line-by-line mapping
2. **Create Consolidation Report**: Document which conjuncts were merged and how
3. **Create Gap Report**: Document any missing or duplicate conjuncts
4. **Create Verification Guide**: Provide method for independent verification

## Technical Context

### Current Understanding
- **Original Version**: 796 conjuncts in lines 200-795 (OldCohProp.thy)
- **Current Version**: Fewer lines due to quantifier consolidation (CoherenceProperties.thy)
- **Consolidation Effect**: Multiple 2-device conjuncts merged into single multi-device conjuncts
- **Mapping Challenge**: Need precise tracking of every original conjunct

### Consolidation Patterns Expected
1. **Simple Merging**: `(A T 0) ∧ (A T 1)` → `∀i. A T i`
2. **Mutual Exclusion Merging**: `(A T 0 → ¬B T 1) ∧ (A T 1 → ¬B T 0)` → `∀i j. i ≠ j → (A T i → ¬B T j)`
3. **Length Constraint Merging**: `(length (X1 T) ≤ 1) ∧ (length (X2 T) ≤ 1)` → `∀i. length (X T i) ≤ 1`
4. **Complex Merging**: Multiple conjuncts with different patterns merged into complex quantifier expressions

### Mapping Strategy
1. **Parse Original**: Extract all 796 conjuncts with line numbers and content
2. **Parse Current**: Extract all current conjuncts with line numbers and content
3. **Semantic Matching**: Match original conjuncts to current conjuncts based on semantic meaning
4. **Consolidation Tracking**: Track which original conjuncts were merged into which current conjuncts
5. **Gap Detection**: Identify any original conjuncts not accounted for

## Arguments
User provided critical insight that:
- Original 2-device version had 796 conjuncts (lines 200-795)
- Current multi-device version has fewer lines due to quantifier consolidation
- Need precise line-by-line mapping to ensure no conjuncts are lost or duplicated
- This is essential for maintaining completeness and avoiding errors in the multi-device conversion
