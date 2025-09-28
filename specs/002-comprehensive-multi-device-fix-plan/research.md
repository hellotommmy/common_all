# Multi-Device Conversion Research

## Current State Analysis

### Isabelle Error Analysis
The Isabelle compilation error "Extra variables on rhs" indicates that the SWMR_state_machine definition references variables that are not properly quantified. The specific variables causing the error are:

- `htddatas1`, `htddatas2` - Host-to-device data channels
- `dthdatas1`, `dthdatas2` - Device-to-host data channels  
- `reqresps1`, `reqresps2` - Request response channels
- `snps1`, `snps2` - Snoop channels
- `snpresps1`, `snpresps2` - Snoop response channels

### Pattern Analysis Results

Based on the grep search, I found **231 matching lines** with hardcoded device references. These patterns fall into several categories:

#### 1. Simple Single Device References
**Pattern**: `htddatas1 T`, `htddatas2 T`
**Count**: ~50-80 instances
**Conversion**: `htddatas T i`

**Examples**:
```isabelle
"GTS T i = (dthdatas1 T = [] ∧ snpresps1 T = [] ∧ snps1 T = [] ∧
             dthdatas2 T = [] ∧ snpresps2 T = [] ∧ snps2 T = [])"
```

#### 2. Two-Device Mutual Exclusion Patterns
**Pattern**: `htddatas1 T ≠ [] → htddatas2 T = []`
**Count**: ~80-120 instances
**Conversion**: `(∀i. htddatas T i ≠ [] → (∀j. j ≠ i → htddatas T j = []))`

**Examples**:
```isabelle
"(HSTATE SD T ∧ dthdatas1 T ≠ [] ⟶ htddatas2 T = []) ∧ 
 (HSTATE SD T ∧ dthdatas2 T ≠ [] ⟶ htddatas1 T = [])"
```

#### 3. Length and Size Constraints
**Pattern**: `length (htddatas1 T) ≤ 1`
**Count**: ~20-30 instances
**Conversion**: `∀i. length (htddatas T i) ≤ 1`

**Examples**:
```isabelle
"(length (htddatas1 T) ≤ 1) ∧ (length (htddatas2 T) ≤ 1)"
```

#### 4. Complex Multi-Condition Patterns
**Pattern**: Multiple device references with complex conditions
**Count**: ~50-80 instances
**Conversion**: Requires careful semantic analysis

**Examples**:
```isabelle
"(CSTATE MIA T 0 ∧ (nextGOPendingIs GO_WritePull T 0) ⟶ 
  snps1 T = [] ∧ snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = [])"
```

#### 5. Conditional Device Selection
**Pattern**: `if i = 0 then htddatas1 T else htddatas2 T`
**Count**: ~20-30 instances
**Conversion**: `htddatas T i`

**Examples**:
```isabelle
"nextSnoopPending T i = (if i = 0 then snps1 T ≠ [] else snps2 T ≠ [])"
```

## Conversion Strategy

### 1. Pattern-Based Conversion Approach

#### Single Device Constraints
**Original**: `htddatas1 T`
**Converted**: `htddatas T i`
**Context**: When used in universal quantifier context

#### Two-Device Mutual Exclusion
**Original**: `htddatas1 T ≠ [] → htddatas2 T = []`
**Converted**: `(∀i. htddatas T i ≠ [] → (∀j. j ≠ i → htddatas T j = []))`
**Context**: Mutual exclusion between devices

#### Length Constraints
**Original**: `length (htddatas1 T) ≤ 1`
**Converted**: `∀i. length (htddatas T i) ≤ 1`
**Context**: Size limits for all devices

#### Conditional Selection
**Original**: `if i = 0 then htddatas1 T else htddatas2 T`
**Converted**: `htddatas T i`
**Context**: Device-specific channel access

### 2. Semantic Preservation Principles

#### Mutual Exclusion Semantics
- **Original**: Only two devices can have mutual exclusion
- **Converted**: Any number of devices can have mutual exclusion
- **Preservation**: The core exclusion property is maintained

#### Channel Semantics
- **Original**: Each device has its own channel
- **Converted**: Each device has its own channel (indexed by i)
- **Preservation**: Channel isolation is maintained

#### Length Constraints
- **Original**: Each device channel has length limits
- **Converted**: All device channels have the same length limits
- **Preservation**: Channel capacity constraints are maintained

### 3. Quantifier Pattern Standards

#### Universal Constraints
```isabelle
∀i. condition(i) → property(i)
```

#### Mutual Exclusion
```isabelle
∀i. condition(i) → (∀j. j ≠ i → ¬property(j))
```

#### Existential Constraints
```isabelle
∃i. condition(i) ∧ property(i)
```

#### Mixed Quantifiers
```isabelle
∀i. condition(i) → (∃j. j ≠ i ∧ property(j))
```

## Technical Challenges

### 1. Complex Nested Patterns
Some patterns have deeply nested device references that require careful analysis to preserve semantic meaning.

### 2. Conditional Logic
Patterns with `if-then-else` logic need to be converted to proper quantifier patterns while maintaining the conditional behavior.

### 3. Channel Interaction Semantics
The interaction between different channel types (htddatas, dthdatas, snps, etc.) must be preserved in the multi-device context.

### 4. State Machine Invariants
The converted patterns must maintain the state machine invariants that ensure cache coherence properties.

## Quality Assurance Strategy

### 1. Incremental Testing
- Test after each pattern type conversion
- Verify Isabelle compilation at each stage
- Check semantic consistency after major changes

### 2. Semantic Verification
- Compare original 2-device semantics with converted multi-device semantics
- Ensure all mutual exclusion properties are preserved
- Verify channel interaction semantics are maintained

### 3. Documentation Standards
- Record every conversion with detailed semantic analysis
- Maintain traceability from original to converted patterns
- Document any semantic changes or implications

## Risk Assessment

### High Risk
1. **Complex Multi-Condition Patterns**: May require significant semantic analysis
2. **Nested Quantifier Scope**: Risk of incorrect quantifier placement
3. **State Machine Invariants**: Must preserve cache coherence properties

### Medium Risk
1. **Performance Impact**: More complex quantifier patterns may impact proof performance
2. **Readability**: Multi-device patterns may be less readable than 2-device patterns

### Low Risk
1. **Simple Single Device References**: Straightforward conversion
2. **Length Constraints**: Clear universal quantification pattern

## Success Metrics

### Primary Metrics
1. **Isabelle Compilation Success**: No "Extra variables" errors
2. **Complete Conversion**: All 231 hardcoded references converted
3. **Semantic Preservation**: All original meanings maintained

### Secondary Metrics
1. **Documentation Completeness**: Every conversion documented
2. **Progress Tracking Accuracy**: 100% completion tracking
3. **Code Quality**: Clean, maintainable multi-device patterns

## Next Steps

1. **Begin Systematic Conversion**: Start with simple single device references
2. **Progress Tracking**: Update tracking files after each batch
3. **Incremental Testing**: Test Isabelle compilation after each pattern type
4. **Documentation**: Maintain detailed records of all conversions
5. **Quality Assurance**: Verify semantic consistency throughout

## Conclusion

The analysis reveals a systematic approach is needed to convert 231 hardcoded device references across 5 main pattern types. The conversion strategy focuses on preserving semantic meaning while enabling multi-device scalability. Success depends on careful semantic analysis, incremental testing, and comprehensive documentation.
