# Comprehensive Multi-Device Fix Plan

## Feature Specification

### Problem Statement
The Isabelle compilation is failing with "Extra variables on rhs" error due to hardcoded device references in the SWMR_state_machine definition. The following variables need to be converted from 2-device hardcoded patterns to multi-device quantifier patterns:

- `htddatas1`, `htddatas2` → `htddatas T i`
- `dthdatas1`, `dthdatas2` → `dthdatas T i` 
- `reqresps1`, `reqresps2` → `reqresps T i`
- `snps1`, `snps2` → `snps T i`
- `snpresps1`, `snpresps2` → `snpresps T i`

### Requirements

#### Functional Requirements
1. **Complete Multi-Device Conversion**: Convert all hardcoded 2-device references to proper multi-device quantifier patterns
2. **Semantic Preservation**: Ensure all converted constraints maintain their original semantic meaning
3. **Isabelle Compilation**: Achieve successful Isabelle compilation without "Extra variables" errors
4. **Systematic Documentation**: Document every modification with detailed semantic analysis

#### Non-Functional Requirements
1. **Completeness**: Every conjunct must be analyzed and converted if needed
2. **Traceability**: Every change must be recorded in DETAILED_MODIFICATIONS.md
3. **Progress Tracking**: Update SWMR_modification_progress.py for each modification
4. **Quality Assurance**: Verify semantic correctness of each conversion

### Success Criteria
1. Isabelle compilation succeeds without "Extra variables" errors
2. All 486 lines in SWMR_state_machine definition are properly converted
3. Complete documentation of all modifications
4. Progress tracking shows 100% completion

### Technical Constraints
1. Must preserve original semantic meaning of each constraint
2. Must use consistent quantifier patterns: `(∀i. ... → (∀j. j ≠ i → ...))` for mutual exclusion
3. Must maintain English-only output per constitution
4. Must follow systematic conjunct-by-conjunct approach

## Implementation Plan

### Phase 1: Analysis and Classification
1. **Identify All Hardcoded Patterns**: Systematically find all instances of hardcoded device references
2. **Classify by Pattern Type**: Group similar patterns for systematic conversion
3. **Create Conversion Mapping**: Define standard conversion patterns for each type

### Phase 2: Systematic Conversion
1. **Conjunct-by-Conjunct Processing**: Process each of the 486 lines systematically
2. **Pattern-Based Conversion**: Apply appropriate conversion patterns based on classification
3. **Semantic Verification**: Ensure each conversion maintains original meaning

### Phase 3: Documentation and Tracking
1. **Update DETAILED_MODIFICATIONS.md**: Record every modification with semantic analysis
2. **Update SWMR_modification_progress.py**: Track progress for each line
3. **Update PROGRESS_REPORT.md**: Maintain overall progress summary

### Phase 4: Verification and Testing
1. **Isabelle Compilation Test**: Verify successful compilation
2. **Semantic Consistency Check**: Ensure all constraints are logically consistent
3. **Progress Validation**: Confirm 100% completion tracking

## Technical Context

### Current State
- SWMR_state_machine definition spans lines 286-771 (486 lines total)
- 366 lines already marked as AI_MODIFIED (75.3% progress)
- 120 lines still need attention
- Isabelle compilation failing due to hardcoded device references

### Error Analysis
The Isabelle error "Extra variables on rhs" indicates that the definition references variables that are not properly quantified. The hardcoded device references like `htddatas1`, `htddatas2` need to be converted to properly quantified multi-device patterns.

### Conversion Patterns
1. **Single Device Constraints**: `htddatas1 T` → `htddatas T i`
2. **Two-Device Mutual Exclusion**: `htddatas1 T ≠ [] → htddatas2 T = []` → `(∀i. htddatas T i ≠ [] → (∀j. j ≠ i → htddatas T j = []))`
3. **Existential Constraints**: `∃i. htddatas T i ≠ []`
4. **Universal Constraints**: `∀i. htddatas T i = []`

## Arguments
User provided specific Isabelle error details showing the exact variables that need conversion:
- `htddatas1`, `htddatas2`
- `dthdatas1`, `dthdatas2` 
- `reqresps1`, `reqresps2`
- `snps1`, `snps2`
- `snpresps1`, `snpresps2`

This provides the specific target variables for systematic conversion.
