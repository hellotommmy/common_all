<!--
Sync Impact Report:
- Version change: 1.3.0 → 1.4.0
- Modified principles: VI. English-Only Output (enhanced with corruption detection and recovery procedures)
- Added sections: Corruption Recovery Procedures in English-Only Output principle
- Removed sections: None
- Templates requiring updates: ✅ constitution.md updated
- Follow-up TODOs: DETAILED_MODIFICATIONS.md requires immediate regeneration in English
-->

# Multi-Device Theory Modification Constitution

## Core Principles

### I. Semantic Preservation (NON-NEGOTIABLE)
Every modification MUST preserve the original cache coherence semantics while generalizing from 2-device to multi-device. Original definitions MUST be preserved in cartouche comments for historical tracking. Semantic correctness is verified through deep analysis of each constraint's logical meaning and its multi-device generalization.

### II. Systematic Documentation
Every modification MUST be documented in DETAILED_MODIFICATIONS.md with original content, its meaning, modified content, and its meaning. DETAILED_MODIFICATIONS.md MUST record every change with detailed semantic analysis explaining WHY each modification was made and WHAT the semantic implications are. Progress tracking MUST be maintained in SWMR_modification_progress.py, PROGRESS_REPORT.md, and my_messages.md. All documentation MUST follow conjunct order for consistency and traceability. Conjunct mapping analysis MUST be performed to ensure no original conjuncts are missed or duplicated during multi-device conversion.

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

**Corruption Detection and Recovery:**
- If ANY file contains garbled characters, encoding corruption, or non-English text where English is expected, it MUST be immediately flagged for regeneration
- Corrupted files MUST be completely regenerated in English rather than attempting partial fixes
- The AI MUST proactively detect corruption patterns (e.g., sequences like "Þ»ª", "õ┐«", "µö╣", "Õ¢ò") and initiate recovery procedures
- Recovery involves creating a clean English version of the entire corrupted section, preserving only the semantic content and structure
- All regenerated content MUST maintain the original documentation structure and completeness

**Immediate Action Required:**
DETAILED_MODIFICATIONS.md is currently corrupted and MUST be regenerated in English before any further modifications proceed.

### VII. Conjunct Mapping Analysis (NON-NEGOTIABLE)
Due to the consolidation of multiple 2-device conjuncts into fewer multi-device conjuncts during conversion, a comprehensive mapping analysis MUST be performed to ensure no original conjuncts are missed or duplicated. This includes:
- Sequential two-pointer algorithm implementation for line-by-line mapping
- Identification of N:1 consolidation patterns (multiple original conjuncts merged into single multi-device conjunct)
- Verification that all 796 original conjuncts (lines 200-995 in OldCohProp.thy) are accounted for
- Documentation of mapping relationships in progress tracking files
- Detection and reporting of any misalignments or unmapped sections

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
- Conjunct mapping analysis results MUST be documented and integrated into progress tracking
- ALL documentation files MUST be in English and free from encoding corruption

## Development Workflow

### Modification Process
1. Analyze theory files for 2-device patterns
2. Apply established quantifier patterns
3. Preserve original definitions in comments
4. Perform conjunct mapping analysis to ensure no conjuncts are missed or duplicated
5. Update DETAILED_MODIFICATIONS.md with semantic analysis for each conjunct (IN ENGLISH ONLY)
6. Update all progress tracking files including mapping relationships
7. Commit and push changes
8. Verify semantic correctness

### Quality Gates
- 100% semantic accuracy verification
- Isabelle syntax validation
- Complete documentation updates including DETAILED_MODIFICATIONS.md
- Conjunct mapping analysis completion with all 796 original conjuncts accounted for
- Git repository synchronization
- English-only content verification and corruption detection

### Corruption Recovery Protocol
1. Detect corrupted files through pattern recognition
2. Halt all modifications until corruption is resolved
3. Regenerate corrupted files completely in English
4. Verify regenerated content maintains semantic accuracy
5. Resume modifications only after clean English documentation is confirmed

## Governance

This constitution supersedes all other practices for multi-device theory modification. Amendments require documentation, user approval, and migration plan. All modifications must verify compliance with these principles. Complexity must be justified through semantic analysis.

**Version**: 1.4.0 | **Ratified**: 2025-01-20 | **Last Amended**: 2025-01-20