# Multi-Device Theory File Modification Specification

## Feature Overview
**Feature Name**: Multi-device theory file modification  
**Priority**: High  
**Complexity**: High  
**Status**: In Progress

## Description
Modify Common directory theory files to support arbitrary number of devices instead of hardcoded 2-device model. This involves updating Isabelle/HOL theory files to generalize from device-specific references (e.g., `reqs1 T`, `reqs2 T`) to quantified expressions (e.g., `reqs T i`) while preserving semantic correctness.

## Background
The current CXL cache coherence model is hardcoded for exactly 2 devices, with device-specific channels and constraints. The goal is to extend this to support arbitrary number of devices while maintaining the cache coherence protocol semantics. The Transposed.thy has already been updated, whilst CoherenceProperties.thy is work-in-progress, with the huge invariant SWMR_state_machine having around 100 conjuncts already modified.

## Requirements

### Functional Requirements
1. **Theory File Updates**: Modify all `.thy` files in `betterProofAll/Common/` directory
2. **Semantic Preservation**: Maintain original cache coherence semantics while generalizing to multi-device
3. **Pattern Consistency**: Use established patterns from previous modifications (see `DETAILED_MODIFICATIONS.md`)
4. **Documentation**: Update all progress tracking files with detailed modification records

### Technical Requirements
1. **Quantifier Patterns**: 
   - Universal constraints: `∀i. condition(i) → property(i)`
   - Existential constraints: `∀i. condition(i) → (∃j. j≠i ∧ property(j))`
   - Mutual exclusion: `∀i. condition(i) → (∀j. j≠i → ¬property(j))`
   - Global existence: `(∃i. property(i)) → global_condition`

2. **File Structure**:
   - Preserve original definitions in cartouche comments
   - Maintain Isabelle syntax correctness
   - Follow established naming conventions

3. **Progress Tracking**:
   - Update `SWMR_modification_progress.py`
   - Update `PROGRESS_REPORT.md`
   - Update `DETAILED_MODIFICATIONS.md`
   - Update `my_messages.md` with user interactions

### Non-Functional Requirements
1. **Quality Assurance**: 100% semantic accuracy
2. **Documentation**: Comprehensive tracking of all changes
3. **Version Control**: Commit and push changes to `common_all` repository
4. **Consistency**: Follow established patterns from previous work

## Implementation Plan

### Phase 1: Repository Setup
1. Resolve git submodule issues with betterProofAll
2. Ensure proper tracking of Common directory files
3. Set up proper remote repository configuration

### Phase 2: Theory File Analysis
1. Identify all theory files requiring modification
2. Analyze current 2-device patterns
3. Map to multi-device equivalents

### Phase 3: Systematic Modification
1. Apply established patterns from `DETAILED_MODIFICATIONS.md`
2. Preserve original definitions in comments
3. Maintain semantic correctness
4. Update progress tracking files

### Phase 4: Quality Assurance
1. Verify Isabelle syntax
2. Check semantic consistency
3. Update documentation
4. Commit and push changes

## Files to Modify

### Primary Theory Files
- `CoherenceProperties.thy` - Main coherence properties (partially completed)
- `Transposed.thy` - Type definitions and state machine
- `BasicInvariants.thy` - Basic invariant definitions
- `Fixer.thy` - Fixer definitions
- `BuggyRules.thy` - Buggy rules definitions

### Documentation Files
- `SWMR_modification_progress.py` - Progress tracking
- `PROGRESS_REPORT.md` - Progress reports
- `DETAILED_MODIFICATIONS.md` - Detailed change records
- `my_messages.md` - User interaction history

## Success Criteria
1. All theory files successfully modified for multi-device support
2. All modifications preserve original semantics
3. All documentation files updated with complete change history
4. All changes committed and pushed to repository
5. No Isabelle syntax errors
6. 100% semantic accuracy maintained

## Risks and Mitigation
1. **Semantic Errors**: Use established patterns and user validation
2. **Syntax Errors**: Regular Isabelle compilation checks
3. **Documentation Drift**: Update all tracking files simultaneously
4. **Repository Issues**: Proper git configuration and regular commits

## Dependencies
- Existing modification patterns from `DETAILED_MODIFICATIONS.md`
- User validation and feedback
- Isabelle/HOL environment
- Git repository configuration

## Timeline
- Phase 1: Immediate (repository setup)
- Phase 2: 1-2 hours (analysis)
- Phase 3: Ongoing (systematic modification)
- Phase 4: Continuous (quality assurance)

---

**Branch**: `multi-device-theory-modification`  
**Spec File**: `multi-device-theory-modification-spec.md`  
**Status**: Ready for implementation
