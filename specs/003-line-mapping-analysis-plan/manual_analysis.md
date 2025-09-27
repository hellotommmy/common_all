# Manual Line Mapping Analysis

## Problem Statement
The user has identified that the original 2-device version had 796 conjuncts (lines 200-795 in OldCohProp.thy), but the current multi-device version has fewer lines due to quantifier consolidation. We need to create a precise line-by-line mapping.

## Initial Analysis

### Original Version (OldCohProp.thy)
- **Definition Start**: Line 200
- **Definition End**: Line 795 (approximately)
- **Total Lines**: 596 lines
- **Expected Conjuncts**: 796 conjuncts
- **Pattern**: Each line typically contains multiple conjuncts separated by `∧`

### Current Version (CoherenceProperties.thy)
- **Definition Start**: Line 286
- **Definition End**: Line 771 (approximately)
- **Total Lines**: 486 lines
- **Current Conjuncts**: Unknown (needs analysis)
- **Pattern**: Quantifier consolidation has reduced the number of lines

## Key Observations

### Consolidation Patterns Observed

1. **Simple Universal Quantification**:
   ```isabelle
   # Original (2 lines):
   (HSTATE SharedM T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1) ∧
   (HSTATE SD T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1) ∧
   
   # Current (1 line):
   (HSTATE SharedM T ⟶ (∀i. ¬ CSTATE Modified T i)) ∧
   (HSTATE SD T ⟶ (∀i. ¬ CSTATE Modified T i)) ∧
   ```

2. **Mutual Exclusion Consolidation**:
   ```isabelle
   # Original (2 lines):
   (snps2 T ≠ [] ⟶ reqs1 T = [] ∧ snpresps2 T = [] ∧ dthdatas2 T = [] ∧ reqresps1 T = []) ∧
   (snps1 T ≠ [] ⟶ reqs2 T = [] ∧ snpresps1 T = [] ∧ dthdatas1 T = [] ∧ reqresps2 T = []) ∧
   
   # Current (1 line):
   (∀i j. i ≠ j ⟶ (snps T j ≠ [] ⟶ reqs T i = [] ∧ snpresps T j = [] ∧ dthdatas T j = [] ∧ reqresps T i = [])) ∧
   ```

3. **Length Constraint Consolidation**:
   ```isabelle
   # Original (2 lines):
   (length (reqs1 T) ≤ 1 ∧ (length (reqs2 T) ≤ 1)) ∧
   (length (snps2 T) ≤ 1 ∧ length (snps1 T) ≤ 1) ∧
   
   # Current (2 lines):
   (∀i. length (reqs T i) ≤ 1) ∧
   (∀i. length (snps T i) ≤ 1) ∧
   ```

## Mapping Strategy

### Phase 1: Extract and Count Conjuncts

1. **Original Version Analysis**:
   - Parse OldCohProp.thy lines 200-795
   - Count actual conjuncts (not just lines)
   - Identify conjunct boundaries
   - Classify conjunct types

2. **Current Version Analysis**:
   - Parse CoherenceProperties.thy SWMR_state_machine definition
   - Count actual conjuncts
   - Identify conjunct boundaries
   - Classify conjunct types

### Phase 2: Create Mapping

1. **Semantic Matching**:
   - Match original conjuncts to current conjuncts by semantic meaning
   - Identify consolidation patterns
   - Track which original conjuncts were merged

2. **Gap Analysis**:
   - Identify any missing conjuncts
   - Identify any duplicate mappings
   - Verify completeness

### Phase 3: Documentation

1. **Mapping Table**:
   - Original conjunct ID → Current conjunct ID
   - Consolidation pattern used
   - Semantic equivalence verification

2. **Consolidation Report**:
   - Which original conjuncts were merged
   - How they were merged
   - Verification of semantic equivalence

## Next Steps

1. **Create Better Parsing Script**: Improve conjunct extraction logic
2. **Manual Verification**: Manually verify key consolidation patterns
3. **Systematic Mapping**: Create systematic mapping between versions
4. **Documentation**: Create comprehensive mapping documentation

## Critical Questions

1. **Conjunct Counting**: How do we accurately count conjuncts when they span multiple lines?
2. **Consolidation Verification**: How do we verify that consolidation preserved semantics?
3. **Gap Detection**: How do we ensure no conjuncts are lost or duplicated?
4. **Mapping Completeness**: How do we verify 100% mapping coverage?

## Immediate Actions Needed

1. **Improve Parsing**: Create better conjunct extraction logic
2. **Manual Analysis**: Manually analyze key sections to understand patterns
3. **Create Mapping Framework**: Design systematic approach for line-by-line mapping
4. **Verification System**: Create system to verify mapping accuracy and completeness
