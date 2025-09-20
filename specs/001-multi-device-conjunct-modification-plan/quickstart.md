# Quickstart: Multi-Device Conjunct Modification

## Overview
This guide provides step-by-step instructions for systematically modifying conjuncts in Isabelle/HOL theory files to support arbitrary number of devices instead of hardcoded 2-device model.

## Prerequisites
- Isabelle/HOL development environment
- Git repository with betterProofAll/Common/ files
- Python 3.x for progress tracking
- Understanding of CXL cache coherence protocol

## Current Status
- **Progress**: 44.0% complete (340/772 lines modified)
- **Remaining**: 432 conjuncts (lines 561-1056)
- **Files**: CoherenceProperties.thy (primary), BasicInvariants.thy, Fixer.thy, BuggyRules.thy

## Step-by-Step Process

### Phase 1: Simple Patterns (Lines 561-590)
**Estimated Time**: 2-3 hours  
**Parallelization**: High (10-15 conjuncts per batch)

#### Batch 1.1: Device-Specific State Constraints (Lines 561-570)
```bash
# 1. Open CoherenceProperties.thy at line 561
# 2. Identify pattern: CSTATE X T 0/1 → property
# 3. Convert to: ∀i. CSTATE X T i → property
# 4. Preserve original in cartouche comment
# 5. Update progress tracking
```

**Example**:
```isabelle
-- Original
(CSTATE ISA T 0 ∧ nextSnoopIs SnpInv T 0 → HSTATE MA T) ∧
(CSTATE ISA T 1 ∧ nextSnoopIs SnpInv T 1 → HSTATE MA T) ∧

-- Modified
(∀i. CSTATE ISA T i ∧ nextSnoopIs SnpInv T i → HSTATE MA T) ∧
-- Original: (CSTATE ISA T 0 ∧ nextSnoopIs SnpInv T 0 → HSTATE MA T) ∧ (CSTATE ISA T 1 ∧ nextSnoopIs SnpInv T 1 → HSTATE MA T) - when any device is ISA with SnpInv, host must be MA
```

#### Batch 1.2: Host State Constraints (Lines 571-590)
```bash
# 1. Identify pattern: HSTATE X → ¬CSTATE Y T 0/1
# 2. Convert to: HSTATE X → (∀i. ¬CSTATE Y T i)
# 3. Preserve original in cartouche comment
# 4. Update progress tracking
```

### Phase 2: Medium Patterns (Lines 591-650)
**Estimated Time**: 4-5 hours  
**Parallelization**: Medium (5-10 conjuncts per batch)

#### Batch 2.1: Cross-Device Mutual Exclusion (Lines 591-620)
```bash
# 1. Identify pattern: CSTATE X T 0 → ¬CSTATE Y T 1
# 2. Convert to: ∀i. CSTATE X T i → (∀j. j≠i → ¬CSTATE Y T j)
# 3. Preserve original in cartouche comment
# 4. Update progress tracking
```

**Example**:
```isabelle
-- Original
(CSTATE IMD T 0 ∧ nextHTDDataPending T 0 → ¬CSTATE SMAD T 1) ∧
(CSTATE IMD T 1 ∧ nextHTDDataPending T 1 → ¬CSTATE SMAD T 0) ∧

-- Modified
(∀i. CSTATE IMD T i ∧ nextHTDDataPending T i → (∀j. j≠i → ¬CSTATE SMAD T j)) ∧
-- Original: (CSTATE IMD T 0 ∧ nextHTDDataPending T 0 → ¬CSTATE SMAD T 1) ∧ (CSTATE IMD T 1 ∧ nextHTDDataPending T 1 → ¬CSTATE SMAD T 0) - when device i is IMD with HTDData pending, other devices j cannot be SMAD
```

#### Batch 2.2: Channel Coordination (Lines 621-650)
```bash
# 1. Identify pattern: channel1 T = [] → channel2 T = []
# 2. Convert to: ∀i. channel T i = [] → (∀j. j≠i → other_channel T j = [])
# 3. Preserve original in cartouche comment
# 4. Update progress tracking
```

### Phase 3: Complex Patterns (Lines 651-800)
**Estimated Time**: 8-10 hours  
**Parallelization**: Low (individual analysis required)

#### Batch 3.1: Multi-Device State Coordination (Lines 651-700)
```bash
# 1. Identify complex cross-device dependencies
# 2. Apply appropriate quantifier patterns
# 3. Preserve original in cartouche comment
# 4. Update progress tracking
# 5. Request user review for complex cases
```

**Example**:
```isabelle
-- Original
(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ∧ HSTATE MA T → (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧
(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ∧ HSTATE MA T → (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧

-- Modified
(∀i. CSTATE ISAD T i ∧ nextHTDDataPending T i ∧ HSTATE MA T → (∀j. j≠i → (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ nextHTDDataPending T j ∨ CSTATE IMA T j ∨ CSTATE SMA T j)) ∧
-- Original: (CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ∧ HSTATE MA T → (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ (CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ∧ HSTATE MA T → (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0) - when device i is ISAD with HTDData and host is MA, other devices j must be in Modified-family states
```

#### Batch 3.2: Existential Device Requirements (Lines 701-800)
```bash
# 1. Identify existential patterns
# 2. Apply: ∀i. condition(i) → (∃j. j≠i ∧ property(j))
# 3. Preserve original in cartouche comment
# 4. Update progress tracking
# 5. Request user review for complex cases
```

### Phase 4: Critical Patterns (Lines 801-873)
**Estimated Time**: 6-8 hours  
**Parallelization**: Very Low (individual verification required)

#### Batch 4.1: Core Coherence Properties (Lines 801-850)
```bash
# 1. Identify fundamental protocol properties
# 2. Apply precise quantifier patterns
# 3. Preserve original in cartouche comment
# 4. Update progress tracking
# 5. Require expert validation
```

#### Batch 4.2: Final Verification (Lines 851-873)
```bash
# 1. Verify all modifications
# 2. Check semantic consistency
# 3. Validate Isabelle syntax
# 4. Update final progress tracking
# 5. Commit and push changes
```

## Progress Tracking

### Update SWMR_modification_progress.py
```python
# Add new conjuncts to progress tracking
[561, 'AI_MODIFIED', 'modified_content'],
[562, 'AI_MODIFIED', 'modified_content'],
# ... continue for all modified conjuncts
```

### Update PROGRESS_REPORT.md
```markdown
## Overall Progress
```
[████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░] 44.0%
```

**~340/772 lines modified (44.0% complete)**
```

### Update DETAILED_MODIFICATIONS.md
```markdown
## Line 561: Device-Specific State Constraint
**Original**: (CSTATE ISA T 0 ∧ nextSnoopIs SnpInv T 0 → HSTATE MA T) ∧ (CSTATE ISA T 1 ∧ nextSnoopIs SnpInv T 1 → HSTATE MA T)
**Original Meaning**: When device 0 or 1 is ISA with SnpInv, host must be MA
**Modified**: (∀i. CSTATE ISA T i ∧ nextSnoopIs SnpInv T i → HSTATE MA T)
**Modified Meaning**: When any device i is ISA with SnpInv, host must be MA
**Semantic Analysis**: Preserves exact same semantics - universal quantifier generalizes from 2 devices to arbitrary number
```

### Update my_messages.md
```markdown
## 消息49 - 完成Lines 561-590的修改
已完成Lines 561-590的30个简单约束条件的多设备转换，包括设备特定状态约束和主机状态约束。已更新所有进度追踪文件，当前进度44.0%（340/772行）。
```

## Quality Assurance

### Semantic Verification
1. **Original Semantics**: Verify modified constraint preserves original meaning
2. **Quantifier Scope**: Ensure quantifiers are correctly placed
3. **Cross-Device Logic**: Verify mutual exclusion and dependencies work correctly

### Syntax Validation
1. **Isabelle Syntax**: Check for syntax errors
2. **Type Consistency**: Verify all types are correct
3. **Quantifier Scope**: Ensure proper scoping

### Progress Validation
1. **Line Numbers**: Verify all line numbers are correct
2. **Content Match**: Ensure modified content matches file
3. **Status Updates**: Verify progress tracking is updated

## Troubleshooting

### Common Issues
1. **Syntax Errors**: Check quantifier placement and parentheses
2. **Semantic Errors**: Verify original meaning is preserved
3. **Progress Mismatch**: Ensure tracking files are synchronized

### Error Recovery
1. **Rollback**: Use git to revert failed modifications
2. **Incremental Fix**: Fix one conjunct at a time
3. **User Review**: Request help for complex cases

## Success Criteria
- All 432 remaining conjuncts modified
- 100% semantic accuracy maintained
- All progress tracking files updated
- No Isabelle syntax errors
- All changes committed and pushed

## Next Steps
After completing this quickstart:
1. Continue with remaining theory files (BasicInvariants.thy, Fixer.thy, BuggyRules.thy)
2. Verify overall system consistency
3. Run comprehensive tests
4. Update final documentation
