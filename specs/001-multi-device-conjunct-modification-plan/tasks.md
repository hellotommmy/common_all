# Tasks: Multi-Device Conjunct Modification

**Input**: Design documents from `/specs/001-multi-device-conjunct-modification-plan/`
**Prerequisites**: plan.md (required), research.md, data-model.md, contracts/

## Execution Flow (main)
```
1. Load plan.md from feature directory ✅
   → Extract: Isabelle/HOL tech stack, CXL cache coherence protocol
2. Load optional design documents ✅
   → data-model.md: Extract Conjunct, ModificationBatch, ProgressTracking entities
   → contracts/: Extract conjunct-modification-api.md → contract test tasks
   → research.md: Extract conjunct classification and modification patterns
3. Generate tasks by category:
   → Setup: project structure, dependencies, validation
   → Tests: contract tests, integration tests, validation tests
   → Core: conjunct modification, batch processing, progress tracking
   → Integration: file system, git, documentation
   → Polish: quality assurance, final validation, documentation
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness ✅
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Path Conventions
- **Theory Files**: `betterProofAll/Common/CoherenceProperties.thy`
- **Progress Tracking**: `betterProofAll/Common/SWMR_modification_progress.py`
- **Documentation**: `betterProofAll/Common/PROGRESS_REPORT.md`, `betterProofAll/Common/DETAILED_MODIFICATIONS.md`
- **User Messages**: `betterProofAll/Common/my_messages.md`

## Phase 3.1: Setup
- [x] T001 Verify Isabelle/HOL environment and syntax validation tools
- [x] T002 Initialize progress tracking system and validate current state (44.0% complete)
- [x] T003 [P] Configure git repository and ensure proper file tracking
- [x] T004 [P] Validate existing modification patterns and quantifier conventions
- [x] T005 Create backup of current CoherenceProperties.thy before modifications

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**
- [ ] T006 [P] Contract test modify_conjunct API in tests/contract/test_conjunct_modification.py
- [ ] T007 [P] Contract test batch_modify_conjuncts API in tests/contract/test_batch_modification.py
- [ ] T008 [P] Contract test update_progress_tracking API in tests/contract/test_progress_tracking.py
- [ ] T009 [P] Contract test validate_modification API in tests/contract/test_validation.py
- [ ] T010 [P] Integration test simple pattern modification in tests/integration/test_simple_patterns.py
- [ ] T011 [P] Integration test medium pattern modification in tests/integration/test_medium_patterns.py
- [ ] T012 [P] Integration test complex pattern modification in tests/integration/test_complex_patterns.py
- [ ] T013 [P] Integration test critical pattern modification in tests/integration/test_critical_patterns.py

## Phase 3.3: Core Implementation (ONLY after tests are failing)
### Simple Pattern Modifications (Lines 561-590) - High Parallelization
- [x] T014 [P] Modify device-specific state constraints (Lines 561-570) in betterProofAll/Common/CoherenceProperties.thy
- [x] T015 [P] Modify host state constraints (Lines 571-580) in betterProofAll/Common/CoherenceProperties.thy
- [x] T016 [P] Modify remaining simple patterns (Lines 581-590) in betterProofAll/Common/CoherenceProperties.thy

### Medium Pattern Modifications (Lines 591-650) - Medium Parallelization
- [ ] T017 [P] Modify cross-device mutual exclusion patterns (Lines 591-610) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T018 [P] Modify channel coordination patterns (Lines 611-630) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T019 [P] Modify remaining medium patterns (Lines 631-650) in betterProofAll/Common/CoherenceProperties.thy

### Complex Pattern Modifications (Lines 651-800) - Low Parallelization
- [ ] T020 Modify multi-device state coordination (Lines 651-680) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T021 Modify existential device requirements (Lines 681-710) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T022 Modify sophisticated coordination patterns (Lines 711-740) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T023 Modify channel management patterns (Lines 741-770) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T024 Modify remaining complex patterns (Lines 771-800) in betterProofAll/Common/CoherenceProperties.thy

### Critical Pattern Modifications (Lines 801-873) - Very Low Parallelization
- [ ] T025 Modify core coherence properties (Lines 801-830) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T026 Modify fundamental protocol properties (Lines 831-850) in betterProofAll/Common/CoherenceProperties.thy
- [ ] T027 Modify essential cache coherence invariants (Lines 851-873) in betterProofAll/Common/CoherenceProperties.thy

### Progress Tracking Implementation
- [ ] T028 [P] Update SWMR_modification_progress.py for simple patterns (Lines 561-590)
- [ ] T029 [P] Update SWMR_modification_progress.py for medium patterns (Lines 591-650)
- [ ] T030 [P] Update SWMR_modification_progress.py for complex patterns (Lines 651-800)
- [ ] T031 [P] Update SWMR_modification_progress.py for critical patterns (Lines 801-873)

## Phase 3.4: Integration
- [ ] T032 Integrate progress tracking updates with PROGRESS_REPORT.md
- [ ] T033 Integrate detailed modifications with DETAILED_MODIFICATIONS.md
- [ ] T034 Integrate user interactions with my_messages.md
- [ ] T035 Validate git repository integration and commit changes
- [ ] T036 Verify Isabelle/HOL syntax validation across all modifications
- [ ] T037 Validate semantic consistency across all modified conjuncts

## Phase 3.5: Polish
- [ ] T038 [P] Unit tests for conjunct modification validation in tests/unit/test_conjunct_validation.py
- [ ] T039 [P] Unit tests for progress tracking accuracy in tests/unit/test_progress_tracking.py
- [ ] T040 [P] Unit tests for semantic preservation in tests/unit/test_semantic_preservation.py
- [ ] T041 Performance validation (<5 seconds per batch modification)
- [ ] T042 [P] Update documentation in betterProofAll/Common/PROGRESS_REPORT.md
- [ ] T043 [P] Update detailed modifications in betterProofAll/Common/DETAILED_MODIFICATIONS.md
- [ ] T044 [P] Update user messages in betterProofAll/Common/my_messages.md
- [ ] T045 Remove code duplication and optimize modification patterns
- [ ] T046 Run comprehensive validation and final quality assurance

## Dependencies
- Tests (T006-T013) before implementation (T014-T031)
- T014-T016 blocks T017-T019 (simple patterns before medium patterns)
- T017-T019 blocks T020-T024 (medium patterns before complex patterns)
- T020-T024 blocks T025-T027 (complex patterns before critical patterns)
- T028-T031 can run in parallel with their respective modification tasks
- T032-T037 must run after all modifications are complete
- Implementation before polish (T038-T046)

## Parallel Execution Examples

### Example 1: Simple Pattern Modifications (T014-T016)
```bash
# Launch T014-T016 together (different line ranges):
Task: "Modify device-specific state constraints (Lines 561-570) in betterProofAll/Common/CoherenceProperties.thy"
Task: "Modify host state constraints (Lines 571-580) in betterProofAll/Common/CoherenceProperties.thy"
Task: "Modify remaining simple patterns (Lines 581-590) in betterProofAll/Common/CoherenceProperties.thy"
```

### Example 2: Progress Tracking Updates (T028-T031)
```bash
# Launch T028-T031 together (different complexity levels):
Task: "Update SWMR_modification_progress.py for simple patterns (Lines 561-590)"
Task: "Update SWMR_modification_progress.py for medium patterns (Lines 591-650)"
Task: "Update SWMR_modification_progress.py for complex patterns (Lines 651-800)"
Task: "Update SWMR_modification_progress.py for critical patterns (Lines 801-873)"
```

### Example 3: Unit Tests (T038-T040)
```bash
# Launch T038-T040 together (different test files):
Task: "Unit tests for conjunct modification validation in tests/unit/test_conjunct_validation.py"
Task: "Unit tests for progress tracking accuracy in tests/unit/test_progress_tracking.py"
Task: "Unit tests for semantic preservation in tests/unit/test_semantic_preservation.py"
```

### Example 4: Documentation Updates (T042-T044)
```bash
# Launch T042-T044 together (different documentation files):
Task: "Update documentation in betterProofAll/Common/PROGRESS_REPORT.md"
Task: "Update detailed modifications in betterProofAll/Common/DETAILED_MODIFICATIONS.md"
Task: "Update user messages in betterProofAll/Common/my_messages.md"
```

## Task Categories Summary
1. **Setup Tasks** (T001-T005): 5 tasks - Project initialization and validation
2. **Test Tasks** (T006-T013): 8 tasks [P] - Contract and integration tests
3. **Simple Pattern Tasks** (T014-T016): 3 tasks [P] - High parallelization
4. **Medium Pattern Tasks** (T017-T019): 3 tasks [P] - Medium parallelization
5. **Complex Pattern Tasks** (T020-T024): 5 tasks - Low parallelization
6. **Critical Pattern Tasks** (T025-T027): 3 tasks - Very low parallelization
7. **Progress Tracking Tasks** (T028-T031): 4 tasks [P] - High parallelization
8. **Integration Tasks** (T032-T037): 6 tasks - Sequential
9. **Polish Tasks** (T038-T046): 9 tasks [P] - High parallelization

**Total**: 46 tasks (25 parallelizable, 21 sequential)

## Notes
- [P] tasks = different files, no dependencies
- Verify tests fail before implementing
- Commit after each major phase
- Avoid: vague tasks, same file conflicts
- Maintain 100% semantic accuracy throughout
- Preserve original definitions in cartouche comments
- Update all progress tracking files simultaneously

## Validation Checklist
*GATE: Checked before returning*

- [x] All contracts have corresponding tests (T006-T009)
- [x] All entities have model tasks (Conjunct, ModificationBatch, ProgressTracking)
- [x] All tests come before implementation (T006-T013 before T014-T031)
- [x] Parallel tasks truly independent (different line ranges, different files)
- [x] Each task specifies exact file path
- [x] No task modifies same file as another [P] task
- [x] Dependencies properly ordered (simple → medium → complex → critical)
- [x] Progress tracking integrated throughout
- [x] Quality assurance built into every phase
