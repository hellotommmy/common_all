
# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

## Execution Flow (/plan command scope)
```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect Project Type from context (web=frontend+backend, mobile=app+api)
   → Set Structure Decision based on project type
3. Fill the Constitution Check section based on the content of the constitution document.
4. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → contracts, data-model.md, quickstart.md, agent-specific template file (e.g., `CLAUDE.md` for Claude Code, `.github/copilot-instructions.md` for GitHub Copilot, `GEMINI.md` for Gemini CLI, `QWEN.md` for Qwen Code or `AGENTS.md` for opencode).
7. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
8. Plan Phase 2 → Describe task generation approach (DO NOT create tasks.md)
9. STOP - Ready for /tasks command
```

**IMPORTANT**: The /plan command STOPS at step 7. Phases 2-4 are executed by other commands:
- Phase 2: /tasks command creates tasks.md
- Phase 3-4: Implementation execution (manual or via tools)

## Summary
**Primary Requirement**: Create a comprehensive plan for systematically modifying 432 remaining conjuncts in Isabelle/HOL theory files to support arbitrary number of devices instead of hardcoded 2-device model.

**Technical Approach**: 
- **Conjunct Classification**: Categorize remaining conjuncts by complexity (Simple, Medium, Complex, Critical)
- **Modification Order**: Establish optimal sequence based on complexity and dependencies
- **Task Division**: Break down into 46 manageable, parallelizable tasks across 6 categories
- **Pattern Application**: Use established quantifier patterns (Universal, MutualExclusion, Existential, Global)
- **Quality Assurance**: Maintain 100% semantic accuracy with comprehensive progress tracking

**Key Deliverables**:
- Research analysis of 432 remaining conjuncts with complexity classification
- Data model for conjunct entities, modification batches, and progress tracking
- Quickstart guide with step-by-step modification instructions
- API contracts for conjunct modification operations
- Task generation strategy for 46 ordered, parallelizable tasks

## Technical Context
**Language/Version**: Isabelle/HOL (formal verification language)  
**Primary Dependencies**: Isabelle/HOL theorem prover, CXL cache coherence protocol semantics  
**Storage**: Git repository (betterProofAll/Common/ theory files)  
**Testing**: Isabelle/HOL syntax validation, semantic correctness verification  
**Target Platform**: Isabelle/HOL development environment  
**Project Type**: single (formal verification project)  
**Performance Goals**: 100% semantic accuracy, systematic modification of 432 remaining conjuncts  
**Constraints**: Must preserve original cache coherence semantics, maintain conjunct order, 100% accuracy  
**Scale/Scope**: 432 conjuncts across 4 theory files (CoherenceProperties.thy primary, BasicInvariants.thy, Fixer.thy, BuggyRules.thy)

## Constitution Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

### I. Semantic Preservation (NON-NEGOTIABLE) ✅
- All modifications preserve original cache coherence semantics
- Original definitions preserved in cartouche comments
- Deep semantic analysis for each constraint

### II. Systematic Documentation ✅
- DETAILED_MODIFICATIONS.md records all changes
- SWMR_modification_progress.py tracks conjunct order
- PROGRESS_REPORT.md provides human-readable summaries
- my_messages.md logs user interactions

### III. Quantifier Pattern Consistency ✅
- Universal constraints: `∀i. condition(i) → property(i)`
- Existential constraints: `∀i. condition(i) → (∃j. j≠i ∧ property(j))`
- Mutual exclusion: `∀i. condition(i) → (∀j. j≠i → ¬property(j))`
- Global existence: `(∃i. property(i)) → global_condition`

### IV. Parallel Processing with Quality Assurance ✅
- Multiple conjuncts can be modified in parallel
- Each modification undergoes deep semantic analysis
- Quality over speed - 100% semantic accuracy mandatory

### V. Version Control Integration ✅
- Every modification session committed and pushed
- Git tracking properly configured
- Regular commits preserve work

**Status**: PASS - All constitutional requirements met

## Project Structure

### Documentation (this feature)
```
specs/[###-feature]/
├── plan.md              # This file (/plan command output)
├── research.md          # Phase 0 output (/plan command)
├── data-model.md        # Phase 1 output (/plan command)
├── quickstart.md        # Phase 1 output (/plan command)
├── contracts/           # Phase 1 output (/plan command)
└── tasks.md             # Phase 2 output (/tasks command - NOT created by /plan)
```

### Source Code (repository root)
```
# Option 1: Single project (DEFAULT)
src/
├── models/
├── services/
├── cli/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# Option 2: Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/

# Option 3: Mobile + API (when "iOS/Android" detected)
api/
└── [same as backend above]

ios/ or android/
└── [platform-specific structure]
```

**Structure Decision**: [DEFAULT to Option 1 unless Technical Context indicates web/mobile app]

## Phase 0: Outline & Research
1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Design & Contracts
*Prerequisites: research.md complete*

1. **Extract entities from feature spec** → `data-model.md`:
   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable

2. **Generate API contracts** from functional requirements:
   - For each user action → endpoint
   - Use standard REST/GraphQL patterns
   - Output OpenAPI/GraphQL schema to `/contracts/`

3. **Generate contract tests** from contracts:
   - One test file per endpoint
   - Assert request/response schemas
   - Tests must fail (no implementation yet)

4. **Extract test scenarios** from user stories:
   - Each story → integration test scenario
   - Quickstart test = story validation steps

5. **Update agent file incrementally** (O(1) operation):
   - Run `.specify/scripts/bash/update-agent-context.sh cursor` for your AI assistant
   - If exists: Add only NEW tech from current plan
   - Preserve manual additions between markers
   - Update recent changes (keep last 3)
   - Keep under 150 lines for token efficiency
   - Output to repository root

**Output**: data-model.md, /contracts/*, failing tests, quickstart.md, agent-specific file

## Phase 2: Task Planning Approach
*This section describes what the /tasks command will do - DO NOT execute during /plan*

**Task Generation Strategy**:
- Load `.specify/templates/tasks-template.md` as base
- Generate tasks from Phase 1 design docs (research.md, data-model.md, quickstart.md, contracts/)
- Each complexity level → modification batch task [P]
- Each pattern type → specific modification task [P]
- Each batch → parallel execution task [P]
- Progress tracking → documentation update task
- Quality assurance → validation task

**Ordering Strategy**:
- Complexity order: Simple → Medium → Complex → Critical
- Dependency order: Independent conjuncts before dependent ones
- Batch order: Sequential batches, parallel conjuncts within batches
- Mark [P] for parallel execution (independent conjuncts/batches)

**Task Categories**:
1. **Simple Pattern Tasks** (Lines 561-590): 6 tasks, high parallelization
2. **Medium Pattern Tasks** (Lines 591-650): 8 tasks, medium parallelization  
3. **Complex Pattern Tasks** (Lines 651-800): 15 tasks, low parallelization
4. **Critical Pattern Tasks** (Lines 801-873): 10 tasks, very low parallelization
5. **Progress Tracking Tasks**: 4 tasks, sequential
6. **Quality Assurance Tasks**: 3 tasks, sequential

**Estimated Output**: 46 numbered, ordered tasks in tasks.md

**IMPORTANT**: This phase is executed by the /tasks command, NOT by /plan

## Phase 3+: Future Implementation
*These phases are beyond the scope of the /plan command*

**Phase 3**: Task execution (/tasks command creates tasks.md)  
**Phase 4**: Implementation (execute tasks.md following constitutional principles)  
**Phase 5**: Validation (run tests, execute quickstart.md, performance validation)

## Complexity Tracking
*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |


## Progress Tracking
*This checklist is updated during execution flow*

**Phase Status**:
- [x] Phase 0: Research complete (/plan command)
- [x] Phase 1: Design complete (/plan command)
- [ ] Phase 2: Task planning complete (/plan command - describe approach only)
- [ ] Phase 3: Tasks generated (/tasks command)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Validation passed

**Gate Status**:
- [x] Initial Constitution Check: PASS
- [x] Post-Design Constitution Check: PASS
- [x] All NEEDS CLARIFICATION resolved
- [x] Complexity deviations documented

---
*Based on Constitution v2.1.1 - See `/memory/constitution.md`*
