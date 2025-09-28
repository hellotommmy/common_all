# Corrected Line Mapping Analysis Tasks

## Task Overview
Correct the previous analysis that incorrectly counted conjuncts. The user has identified that OldCohProp.thy lines 200-995 each contain exactly one conjunct, totaling 796 conjuncts (not 595 as incorrectly calculated).

## Phase 1: Corrected Analysis

### T001: Fix Original Conjunct Extraction
**Priority**: Critical
**Dependencies**: None
**Description**: Correct the parsing logic to properly extract all 796 original conjuncts.

**Subtasks**:
- [ ] Fix parsing logic to count lines, not splits by ∧
- [ ] Extract each line 200-995 as one conjunct
- [ ] Verify count equals exactly 796
- [ ] Correct conjunct content extraction
- [ ] Update conjunct classification

**Deliverables**:
- Corrected list of 796 original conjuncts
- Accurate line number mapping
- Proper conjunct content extraction
- Corrected conjunct classification

### T002: Fix Current Conjunct Extraction
**Priority**: Critical
**Dependencies**: None
**Description**: Correct the parsing logic for current conjuncts to ensure accurate counting.

**Subtasks**:
- [ ] Fix parsing logic for current conjuncts
- [ ] Extract conjuncts from CoherenceProperties.thy correctly
- [ ] Verify accurate count of current conjuncts
- [ ] Correct conjunct content extraction
- [ ] Update conjunct classification

**Deliverables**:
- Corrected list of current conjuncts
- Accurate line number mapping
- Proper conjunct content extraction
- Corrected conjunct classification

### T003: Recalculate Consolidation Analysis
**Priority**: High
**Dependencies**: T001, T002
**Description**: Recalculate consolidation analysis with correct conjunct counts.

**Subtasks**:
- [ ] Recalculate consolidation ratio with correct counts
- [ ] Analyze consolidation patterns with accurate data
- [ ] Update consolidation effectiveness metrics
- [ ] Correct consolidation factor analysis

**Deliverables**:
- Corrected consolidation analysis
- Accurate consolidation ratio
- Updated consolidation patterns
- Corrected consolidation metrics

### T004: Recreate Mapping Framework
**Priority**: High
**Dependencies**: T001, T002, T003
**Description**: Recreate the mapping framework with correct conjunct data.

**Subtasks**:
- [ ] Recreate semantic matching with correct data
- [ ] Update mapping algorithm for accurate counts
- [ ] Recalculate mapping coverage
- [ ] Update gap analysis

**Deliverables**:
- Corrected mapping framework
- Accurate mapping coverage
- Updated gap analysis
- Corrected quality metrics

## Phase 2: Accurate Mapping

### T005: Create Line-by-Line Mapping
**Priority**: Critical
**Dependencies**: T004
**Description**: Create accurate line-by-line mapping between original 796 lines and current version.

**Mapping Process**:
- [ ] Map each original line 200-995 to current version
- [ ] Identify which original lines were consolidated
- [ ] Map which original lines remained unchanged
- [ ] Identify any new lines in current version
- [ ] Verify mapping completeness

**Deliverables**:
- Complete line-by-line mapping table
- Consolidation mapping analysis
- Gap analysis with correct counts
- Mapping verification report

### T006: Analyze True Consolidation Patterns
**Priority**: High
**Dependencies**: T005
**Description**: Analyze how the 796 original lines were consolidated in the current version.

**Consolidation Analysis**:
- [ ] Identify which original lines were merged
- [ ] Analyze consolidation patterns (2→1, 3→1, etc.)
- [ ] Calculate accurate consolidation factors
- [ ] Document consolidation effectiveness

**Deliverables**:
- Accurate consolidation pattern analysis
- Consolidation factor calculations
- Consolidation effectiveness metrics
- Consolidation documentation

### T007: Verify Mapping Accuracy
**Priority**: Critical
**Dependencies**: T005, T006
**Description**: Verify that all 796 original lines are accurately mapped.

**Verification Process**:
- [ ] Verify all 796 original lines are accounted for
- [ ] Check for duplicate mappings
- [ ] Verify semantic equivalence
- [ ] Validate mapping completeness
- [ ] Perform independent verification

**Deliverables**:
- Mapping accuracy verification
- Completeness verification
- Quality assurance report
- Independent verification results

## Phase 3: Corrected Documentation

### T008: Update All Analysis Reports
**Priority**: High
**Dependencies**: T007
**Description**: Update all previous analysis reports with correct data.

**Update Process**:
- [ ] Update original conjunct extraction report
- [ ] Update current conjunct extraction report
- [ ] Update consolidation analysis report
- [ ] Update mapping framework report
- [ ] Update all summary reports

**Deliverables**:
- Corrected original conjunct report
- Corrected current conjunct report
- Corrected consolidation analysis
- Corrected mapping framework report
- Updated summary reports

### T009: Create Accurate Line-by-Line Documentation
**Priority**: High
**Dependencies**: T008
**Description**: Create comprehensive line-by-line mapping documentation.

**Documentation Structure**:
- [ ] Line-by-line mapping table (796 lines)
- [ ] Consolidation analysis with correct counts
- [ ] Gap analysis with accurate data
- [ ] Verification guide with correct procedures
- [ ] Complete audit trail

**Deliverables**:
- Complete line-by-line mapping documentation
- Accurate consolidation report
- Corrected gap analysis
- Updated verification guide
- Complete audit trail

### T010: Final Validation and Correction
**Priority**: Critical
**Dependencies**: T009
**Description**: Perform final validation of corrected analysis.

**Validation Process**:
- [ ] Verify all 796 original lines mapped
- [ ] Confirm accurate consolidation analysis
- [ ] Validate documentation completeness
- [ ] Perform independent verification
- [ ] Generate final correction report

**Deliverables**:
- Final validation report
- Correction summary
- Accuracy verification
- Complete documentation
- Independent verification

## Success Criteria

### Primary Success Criteria
1. **Correct Count**: Exactly 796 original conjuncts identified
2. **Complete Mapping**: All 796 lines mapped to current version
3. **Accurate Analysis**: Correct consolidation analysis with proper counts
4. **Complete Documentation**: Comprehensive line-by-line documentation

### Secondary Success Criteria
1. **Accurate Consolidation**: Correct understanding of consolidation patterns
2. **Proper Verification**: Robust verification with correct data
3. **Complete Audit Trail**: Full audit trail with accurate counts
4. **Quality Assurance**: High-quality analysis with correct methodology

## Error Correction Summary

### What Was Wrong:
1. **Parsing Logic**: Split by ∧ instead of counting lines
2. **Conjunct Count**: 595 instead of 796
3. **Structure Recognition**: Didn't recognize line-by-line structure
4. **Analysis Accuracy**: All subsequent analysis based on wrong counts

### What Needs to be Fixed:
1. **Correct Parsing**: Count lines, not splits
2. **Accurate Counting**: 796 original conjuncts
3. **Proper Mapping**: Line-by-line mapping
4. **Updated Analysis**: All analysis with correct data

## Timeline Estimate

- **Phase 1 (Corrected Analysis)**: 2-3 hours
- **Phase 2 (Accurate Mapping)**: 4-6 hours
- **Phase 3 (Corrected Documentation)**: 2-3 hours

**Total Estimated Time**: 8-12 hours

## Dependencies

### External Dependencies
- Access to OldCohProp.thy and CoherenceProperties.thy
- Corrected parsing logic
- Updated analysis scripts

### Internal Dependencies
- Fix parsing logic before any analysis
- Correct counts before mapping
- Accurate data before documentation
- Verification after each phase
