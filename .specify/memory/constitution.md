<!--
Sync Impact Report:
- Version change: 1.1.0 → 1.2.0
- Modified principles: II. Systematic Documentation (strengthened DETAILED_MODIFICATIONS.md requirements)
- Added sections: VI. English-Only Output (new principle to prevent encoding issues)
- Removed sections: None
- Templates requiring updates: ✅ constitution.md updated
- Follow-up TODOs: None
-->

# Multi-Device Theory Modification Constitution

## Core Principles

### I. Semantic Preservation (NON-NEGOTIABLE)
Every modification MUST preserve the original cache coherence semantics while generalizing from 2-device to multi-device. Original definitions MUST be preserved in cartouche comments for historical tracking. Semantic correctness is verified through deep analysis of each constraint's logical meaning and its multi-device generalization.

### II. Systematic Documentation
Every modification MUST be documented in DETAILED_MODIFICATIONS.md with original content, its meaning, modified content, and its meaning. DETAILED_MODIFICATIONS.md MUST record every change with detailed semantic analysis explaining WHY each modification was made and WHAT the semantic implications are. Progress tracking MUST be maintained in SWMR_modification_progress.py, PROGRESS_REPORT.md, and my_messages.md. All documentation MUST follow conjunct order for consistency and traceability.

### III. Quantifier Pattern Consistency
Multi-device generalizations MUST follow established patterns:
- Universal constraints: `∀i. condition(i) → property(i)`
- Existential constraints: `∀i. condition(i) → (∃j. j≠i ∧ property(j))`
- Mutual exclusion: `∀i. condition(i) → (∀j. j≠i → ¬property(j))`
- Global existence: `(∃i. property(i)) → global_condition`

### IV. Parallel Processing with Quality Assurance
Multiple conjuncts CAN be modified in parallel, but each modification MUST undergo deep semantic analysis. When in doubt, ASK the user for clarification rather than making assumptions. Quality over speed - 100% semantic accuracy is mandatory.

### V. Version Control Integration
Every modification session MUST be committed and pushed to the common_all repository. Git tracking MUST be properly configured to include all Common directory files. Regular commits preserve work and enable rollback if needed.

### VI. English-Only Output (NON-NEGOTIABLE)
All AI-generated content MUST be in English to prevent encoding issues and ensure compatibility across different systems. This includes all documentation, comments, commit messages, and user communications. Non-English content MUST be rejected and regenerated in English. This principle prevents the corruption and garbled text issues that occur with mixed-language content.

## Multi-Device Modification Standards

### Theory File Requirements
- All `.thy` files in betterProofAll/Common/ MUST be analyzed for 2-device patterns
- Hardcoded device references (e.g., `reqs1 T`, `reqs2 T`) MUST be converted to quantified expressions (e.g., `reqs T i`)
- Isabelle syntax correctness MUST be maintained
- Original definitions MUST be preserved in cartouche comments

### Progress Tracking Requirements
- SWMR_modification_progress.py MUST track each line's modification status
- PROGRESS_REPORT.md MUST provide human-readable progress summaries
- DETAILED_MODIFICATIONS.md MUST record every change with detailed semantic analysis, original content, modified content, and reasoning for each conjunct in order
- my_messages.md MUST log all user interactions and instructions

## Development Workflow

### Modification Process
1. Analyze theory files for 2-device patterns
2. Apply established quantifier patterns
3. Preserve original definitions in comments
4. Update DETAILED_MODIFICATIONS.md with semantic analysis for each conjunct
5. Update all progress tracking files
6. Commit and push changes
7. Verify semantic correctness

### Quality Gates
- 100% semantic accuracy verification
- Isabelle syntax validation
- Complete documentation updates including DETAILED_MODIFICATIONS.md
- Git repository synchronization

## Governance

This constitution supersedes all other practices for multi-device theory modification. Amendments require documentation, user approval, and migration plan. All modifications must verify compliance with these principles. Complexity must be justified through semantic analysis.

**Version**: 1.2.0 | **Ratified**: 2025-01-20 | **Last Amended**: 2025-01-20