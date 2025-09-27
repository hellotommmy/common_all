# Line Mapping Analysis Tasks

## Task Overview
Create precise line-by-line mapping between original 796 conjuncts (OldCohProp.thy lines 200-795) and current multi-device version (CoherenceProperties.thy) to ensure no conjuncts are lost or duplicated during quantifier consolidation.

## Phase 1: Analysis and Discovery

### T001: Extract Original Conjuncts
**Priority**: Critical
**Dependencies**: None
**Description**: Parse and extract all 796 conjuncts from the original 2-device version.

**Subtasks**:
- [ ] Read OldCohProp.thy lines 200-795
- [ ] Parse SWMR_state_machine definition
- [ ] Extract each conjunct with line number and content
- [ ] Create structured list of all 796 conjuncts
- [ ] Identify conjunct boundaries and separators

**Deliverables**:
- Complete list of 796 original conjuncts
- Line number mapping for each conjunct
- Content and semantic meaning of each conjunct
- Conjunct classification by type

### T002: Extract Current Conjuncts
**Priority**: Critical
**Dependencies**: None
**Description**: Parse and extract all conjuncts from the current multi-device version.

**Subtasks**:
- [ ] Read CoherenceProperties.thy SWMR_state_machine definition
- [ ] Parse current multi-device definition
- [ ] Extract each conjunct with line number and content
- [ ] Create structured list of all current conjuncts
- [ ] Identify conjunct boundaries and separators

**Deliverables**:
- Complete list of current conjuncts
- Line number mapping for each conjunct
- Content and semantic meaning of each conjunct
- Conjunct classification by type

### T003: Identify Consolidation Patterns
**Priority**: High
**Dependencies**: T001, T002
**Description**: Analyze how quantifiers consolidated multiple original conjuncts into single current conjuncts.

**Consolidation Patterns to Identify**:
1. **Simple Universal Quantification**: `(A T 0) ∧ (A T 1)` → `∀i. A T i`
2. **Mutual Exclusion Consolidation**: `(A T 0 → ¬B T 1) ∧ (A T 1 → ¬B T 0)` → `∀i j. i ≠ j → (A T i → ¬B T j)`
3. **Length Constraint Consolidation**: `(length (X1 T) ≤ 1) ∧ (length (X2 T) ≤ 1)` → `∀i. length (X T i) ≤ 1`
4. **Complex Multi-Condition Consolidation**: Multiple conjuncts merged into complex quantifier expressions
5. **Channel Interaction Consolidation**: Multiple device-specific channel constraints merged

**Deliverables**:
- Classification of consolidation patterns
- Examples of each pattern type
- Mapping rules for each pattern
- Consolidation factor analysis (how many original conjuncts per current conjunct)

### T004: Create Mapping Framework
**Priority**: High
**Dependencies**: T001, T002, T003
**Description**: Design systematic approach for line-by-line mapping between original and current versions.

**Mapping Framework Components**:
1. **Conjunct Identifier**: Unique identifier for each conjunct
2. **Semantic Matcher**: Algorithm to match conjuncts by semantic meaning
3. **Consolidation Tracker**: System to track which original conjuncts were merged
4. **Gap Detector**: System to identify missing or unaccounted conjuncts
5. **Verification System**: System to verify mapping accuracy

**Deliverables**:
- Mapping framework design
- Conjunct identification system
- Semantic matching algorithm
- Consolidation tracking system
- Gap detection system

## Phase 2: Systematic Mapping

### T005: Map Simple Universal Quantification
**Priority**: High
**Dependencies**: T004
**Description**: Map original conjuncts that were consolidated using simple universal quantification.

**Pattern**: `(A T 0) ∧ (A T 1)` → `∀i. A T i`

**Mapping Process**:
- [ ] Identify original conjuncts with pattern `(A T 0)` and `(A T 1)`
- [ ] Find corresponding current conjunct with pattern `∀i. A T i`
- [ ] Create mapping: `(A T 0) + (A T 1) → ∀i. A T i`
- [ ] Verify semantic equivalence
- [ ] Document mapping with line numbers

**Deliverables**:
- Mapping for all simple universal quantification patterns
- Verification of semantic equivalence
- Documentation of line number mappings

### T006: Map Mutual Exclusion Consolidation
**Priority**: High
**Dependencies**: T004
**Description**: Map original conjuncts that were consolidated using mutual exclusion patterns.

**Pattern**: `(A T 0 → ¬B T 1) ∧ (A T 1 → ¬B T 0)` → `∀i j. i ≠ j → (A T i → ¬B T j)`

**Mapping Process**:
- [ ] Identify original conjuncts with mutual exclusion patterns
- [ ] Find corresponding current conjunct with universal mutual exclusion
- [ ] Create mapping: `(A T 0 → ¬B T 1) + (A T 1 → ¬B T 0) → ∀i j. i ≠ j → (A T i → ¬B T j)`
- [ ] Verify semantic equivalence
- [ ] Document mapping with line numbers

**Deliverables**:
- Mapping for all mutual exclusion patterns
- Verification of semantic equivalence
- Documentation of line number mappings

### T007: Map Length Constraint Consolidation
**Priority**: Medium
**Dependencies**: T004
**Description**: Map original conjuncts that were consolidated using length constraint patterns.

**Pattern**: `(length (X1 T) ≤ 1) ∧ (length (X2 T) ≤ 1)` → `∀i. length (X T i) ≤ 1`

**Mapping Process**:
- [ ] Identify original conjuncts with length constraints
- [ ] Find corresponding current conjunct with universal length constraint
- [ ] Create mapping: `(length (X1 T) ≤ 1) + (length (X2 T) ≤ 1) → ∀i. length (X T i) ≤ 1`
- [ ] Verify semantic equivalence
- [ ] Document mapping with line numbers

**Deliverables**:
- Mapping for all length constraint patterns
- Verification of semantic equivalence
- Documentation of line number mappings

### T008: Map Complex Multi-Condition Consolidation
**Priority**: High
**Dependencies**: T004
**Description**: Map original conjuncts that were consolidated into complex multi-device patterns.

**Pattern**: Multiple original conjuncts → Complex quantifier expression

**Mapping Process**:
- [ ] Identify original conjuncts with complex patterns
- [ ] Find corresponding current conjunct with complex quantifier expression
- [ ] Analyze semantic relationship between original and current
- [ ] Create mapping: `(Original1) + (Original2) + ... → (Current)`
- [ ] Verify semantic equivalence
- [ ] Document mapping with line numbers

**Deliverables**:
- Mapping for all complex consolidation patterns
- Verification of semantic equivalence
- Documentation of line number mappings

### T009: Map Channel Interaction Consolidation
**Priority**: Medium
**Dependencies**: T004
**Description**: Map original conjuncts related to channel interactions that were consolidated.

**Pattern**: Device-specific channel constraints → Multi-device channel constraints

**Mapping Process**:
- [ ] Identify original conjuncts with channel interactions
- [ ] Find corresponding current conjunct with multi-device channel constraints
- [ ] Analyze channel interaction semantics
- [ ] Create mapping: `(Channel1) + (Channel2) → (MultiChannel)`
- [ ] Verify semantic equivalence
- [ ] Document mapping with line numbers

**Deliverables**:
- Mapping for all channel interaction patterns
- Verification of semantic equivalence
- Documentation of line number mappings

### T010: Gap Analysis and Verification
**Priority**: Critical
**Dependencies**: T005, T006, T007, T008, T009
**Description**: Identify any missing or unaccounted conjuncts and verify mapping completeness.

**Gap Analysis Process**:
- [ ] Check that all 796 original conjuncts are accounted for
- [ ] Identify any original conjuncts not mapped to current version
- [ ] Identify any current conjuncts not mapped from original version
- [ ] Check for duplicate mappings
- [ ] Verify mapping accuracy and completeness

**Deliverables**:
- Gap analysis report
- List of missing conjuncts (if any)
- List of unaccounted conjuncts (if any)
- Verification of mapping completeness
- Correction of any mapping errors

## Phase 3: Documentation and Validation

### T011: Create Comprehensive Mapping Documentation
**Priority**: High
**Dependencies**: T010
**Description**: Create complete documentation of all line-by-line mappings.

**Documentation Structure**:
1. **Mapping Summary**: Overview of mapping results
2. **Conjunct-by-Conjunct Mapping**: Detailed mapping for each original conjunct
3. **Consolidation Report**: Which original conjuncts were merged and how
4. **Gap Report**: Any missing or duplicate conjuncts
5. **Verification Guide**: How to independently verify mappings

**Deliverables**:
- Complete mapping documentation
- Conjunct-by-conjunct mapping table
- Consolidation analysis report
- Gap analysis report
- Verification guide

### T012: Create Consolidation Analysis Report
**Priority**: Medium
**Dependencies**: T011
**Description**: Create detailed analysis of how quantifiers consolidated original conjuncts.

**Analysis Components**:
1. **Consolidation Patterns**: Detailed analysis of each consolidation pattern
2. **Consolidation Factors**: How many original conjuncts per current conjunct
3. **Semantic Preservation**: How consolidation preserved original semantics
4. **Quantifier Efficiency**: How consolidation improved logical expressiveness

**Deliverables**:
- Consolidation analysis report
- Pattern efficiency analysis
- Semantic preservation verification
- Quantifier usage optimization analysis

### T013: Create Verification and Audit System
**Priority**: High
**Dependencies**: T011, T012
**Description**: Create system for independent verification and auditing of mappings.

**Verification Components**:
1. **Automated Verification**: Scripts to verify mapping accuracy
2. **Manual Verification**: Step-by-step verification procedures
3. **Audit Trail**: Complete audit trail of all mappings
4. **Quality Assurance**: Quality checks for mapping completeness

**Deliverables**:
- Automated verification scripts
- Manual verification procedures
- Complete audit trail
- Quality assurance checklist

### T014: Create Mapping Database
**Priority**: Medium
**Dependencies**: T011, T012, T013
**Description**: Create structured database of all mappings for easy querying and analysis.

**Database Structure**:
1. **Original Conjuncts Table**: All 796 original conjuncts with metadata
2. **Current Conjuncts Table**: All current conjuncts with metadata
3. **Mapping Table**: Relationships between original and current conjuncts
4. **Consolidation Table**: Consolidation patterns and relationships
5. **Verification Table**: Verification status and results

**Deliverables**:
- Structured mapping database
- Query interface for mapping analysis
- Export capabilities for different formats
- Integration with existing progress tracking

### T015: Final Validation and Testing
**Priority**: Critical
**Dependencies**: T011, T012, T013, T014
**Description**: Perform final validation and testing of complete mapping system.

**Validation Process**:
- [ ] Verify all 796 original conjuncts are accounted for
- [ ] Verify no duplicate mappings
- [ ] Verify semantic equivalence of all mappings
- [ ] Test verification and audit systems
- [ ] Validate documentation completeness
- [ ] Perform independent verification

**Deliverables**:
- Final validation report
- Verification test results
- Audit system validation
- Documentation completeness verification
- Independent verification results

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

- **Phase 1 (Analysis)**: 4-6 hours
- **Phase 2 (Mapping)**: 8-12 hours
- **Phase 3 (Documentation)**: 4-6 hours

**Total Estimated Time**: 16-24 hours

## Dependencies

### External Dependencies
- Access to OldCohProp.thy and CoherenceProperties.thy
- Text processing and parsing tools
- Database or structured storage system

### Internal Dependencies
- Complete analysis before starting mapping
- Systematic approach to avoid missing conjuncts
- Verification after each mapping phase
- Documentation throughout the process
