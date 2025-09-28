# Multi-Device Fix Quickstart Guide

## Overview
This guide provides a quick start for systematically converting hardcoded 2-device references to multi-device quantifier patterns in the SWMR_state_machine definition.

## Prerequisites
- Isabelle/HOL environment
- Git repository access
- Progress tracking files (SWMR_modification_progress.py, DETAILED_MODIFICATIONS.md)

## Quick Start Steps

### 1. Identify Target Patterns
Run the pattern identification script to find all hardcoded device references:

```bash
cd betterProofAll/Common
grep -n "htddatas[12]\|dthdatas[12]\|reqresps[12]\|snps[12]\|snpresps[12]" CoherenceProperties.thy
```

### 2. Start with Simple Patterns
Begin conversion with the simplest patterns:

**Single Device References**:
- `htddatas1 T` → `htddatas T i`
- `htddatas2 T` → `htddatas T i`
- Apply same pattern for all device-specific variables

**Length Constraints**:
- `length (htddatas1 T) ≤ 1` → `∀i. length (htddatas T i) ≤ 1`
- `length (htddatas2 T) ≤ 1` → (already covered by universal quantifier)

### 3. Convert Mutual Exclusion Patterns
Use the standard mutual exclusion pattern:

**Original**:
```isabelle
(htddatas1 T ≠ [] → htddatas2 T = []) ∧ 
(htddatas2 T ≠ [] → htddatas1 T = [])
```

**Converted**:
```isabelle
∀i. htddatas T i ≠ [] → (∀j. j ≠ i → htddatas T j = [])
```

### 4. Handle Complex Patterns
For complex multi-condition patterns, analyze the semantic meaning and apply appropriate quantifiers:

**Original**:
```isabelle
(CSTATE MIA T 0 ∧ (nextGOPendingIs GO_WritePull T 0) ⟶ 
 snps1 T = [] ∧ snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = [])
```

**Converted**:
```isabelle
∀i. CSTATE MIA T i ∧ (nextGOPendingIs GO_WritePull T i) ⟶ 
    (∀j. snps T j = []) ∧ (∀j. j ≠ i → snpresps T j = []) ∧ htddatas T i = []
```

### 5. Update Documentation
For each conversion:

1. **Update DETAILED_MODIFICATIONS.md**:
   - Record original content
   - Explain original semantic meaning
   - Record modified content
   - Explain modified semantic meaning
   - Justify conversion approach

2. **Update SWMR_modification_progress.py**:
   - Change status to 'AI_MODIFIED'
   - Update description with new content
   - Verify line number accuracy

### 6. Test Incrementally
After each batch of conversions:

```bash
# Test Isabelle compilation
# Check for "Extra variables" errors
# Verify no new compilation errors
```

### 7. Verify Completion
Check that all patterns are converted:

```bash
# Should return no results
grep -n "htddatas[12]\|dthdatas[12]\|reqresps[12]\|snps[12]\|snpresps[12]" CoherenceProperties.thy
```

## Common Patterns and Conversions

### Pattern 1: Simple Single Device
**Original**: `htddatas1 T`
**Converted**: `htddatas T i`
**Context**: Universal quantifier scope

### Pattern 2: Two-Device Mutual Exclusion
**Original**: `htddatas1 T ≠ [] → htddatas2 T = []`
**Converted**: `∀i. htddatas T i ≠ [] → (∀j. j ≠ i → htddatas T j = [])`
**Context**: Mutual exclusion between any two devices

### Pattern 3: Length Constraints
**Original**: `length (htddatas1 T) ≤ 1`
**Converted**: `∀i. length (htddatas T i) ≤ 1`
**Context**: Universal length limits

### Pattern 4: Conditional Selection
**Original**: `if i = 0 then htddatas1 T else htddatas2 T`
**Converted**: `htddatas T i`
**Context**: Device-specific channel access

### Pattern 5: Complex Multi-Condition
**Original**: Complex patterns with multiple device references
**Converted**: Requires semantic analysis and appropriate quantifier placement
**Context**: Multi-device state coordination

## Quality Checklist

### Before Each Conversion
- [ ] Understand the original semantic meaning
- [ ] Identify the appropriate quantifier pattern
- [ ] Consider the multi-device implications
- [ ] Plan the conversion approach

### After Each Conversion
- [ ] Verify semantic meaning is preserved
- [ ] Check quantifier scope is correct
- [ ] Update documentation
- [ ] Update progress tracking

### After Each Batch
- [ ] Test Isabelle compilation
- [ ] Check for new errors
- [ ] Verify progress tracking accuracy
- [ ] Review documentation completeness

## Troubleshooting

### Common Issues

1. **"Extra variables on rhs" Error**
   - Check for remaining hardcoded device references
   - Verify all patterns are properly converted
   - Ensure quantifier scope is correct

2. **Semantic Meaning Changed**
   - Review original 2-device semantics
   - Verify multi-device semantics are equivalent
   - Adjust quantifier patterns if needed

3. **Quantifier Scope Issues**
   - Check nested quantifier placement
   - Verify variable binding is correct
   - Ensure logical consistency

### Verification Commands

```bash
# Check for remaining hardcoded references
grep -n "htddatas[12]\|dthdatas[12]\|reqresps[12]\|snps[12]\|snpresps[12]" CoherenceProperties.thy

# Test Isabelle compilation
# (Run in Isabelle environment)

# Check progress tracking
python SWMR_modification_progress.py
```

## Success Criteria

- [ ] No "Extra variables on rhs" errors
- [ ] All 231 hardcoded references converted
- [ ] Isabelle compilation succeeds
- [ ] All modifications documented
- [ ] Progress tracking shows 100% completion
- [ ] Semantic meaning preserved

## Next Steps

1. Start with T001: Identify All Hardcoded Device References
2. Follow the systematic conversion approach
3. Update documentation after each batch
4. Test incrementally throughout the process
5. Verify final completion and success
