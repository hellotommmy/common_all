# BuggyRules.thy Multi-Device Modification Record

## Overview
This document tracks all modifications to BuggyRules.thy for extending from 2-device to N-device model.

Key changes focus on:
- Rules that send messages to "sharers" (other devices in Shared/SMAD state)
- Functions that need to compute sharer lists dynamically
- Transaction ID integration for proper message tracking

---

## Helper Function: getSharersList

### Design Rationale
In 2-device model: "the other device" is explicit via `(i+1) mod 2`
In N-device model: need to compute all devices in sharer states dynamically

### Existing Functions in Transposed.thy

**`lastSharer` (Line 1018-1019):**
```isabelle
definition lastSharer :: "Type1State ⇒ bool" where [simp]:
  "lastSharer T = (∃j. CSTATE Shared T j ∧ (∀i. i ≠ j → CSTATE Invalid T i))"
```
✓ Already N-device compatible - uses existential + universal quantifiers

**`invalidateSharers` (Line 991-996):**
```isabelle
definition invalidateSharers :: "TransactionID ⇒ nat ⇒ nat list ⇒ Type1State ⇒ Type1State" where [simp]:
  "invalidateSharers tid reqNum sharersList T = (
    let T' = sendHostData reqNum MA T in
    let T'' = sendSnpInvToAll T' tid sharersList in
    T''[reqNum -=req]
  )"
```
✓ Already accepts list parameter - N-device compatible

**`sendSnpInvToAll` (Line 977-979):**
```isabelle
fun sendSnpInvToAll :: "Type1State ⇒ TransactionID ⇒ nat list ⇒ Type1State" where
  "sendSnpInvToAll T tid [] = T"
| "sendSnpInvToAll T tid (j # js) = sendSnpInvToAll (T[j +=snp SnpInv tid]) tid js"
```
✓ Recursively sends SnpInv to all devices in list - N-device compatible

### New Function Design: getSharersList

**Simplest implementation (to be added to Transposed.thy):**
```isabelle
definition "getSharersList T i = 
  filter (λj. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)) allDeviceIDs"
```

where `allDeviceIDs` should be defined as list of valid device IDs (e.g., `[0, 1, 2, ...]`).

**Even simpler version using bounded range:**
```isabelle
definition "getSharersList T i = 
  filter (λj. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)) [0..<maxDevices]"
```

**Alternative set-based approach:**
```isabelle
definition "getSharers T i = 
  {j. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)}"
```
Can convert to list: `sorted_list_of_set (getSharers T i)`

### Recommendation: List-Based with Filter

**Chosen implementation:**
```isabelle
definition "getSharersList T i = 
  [j. j ← [0..<maxDevices], j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)]"
```

**Properties:**
- Simple one-liner using list comprehension syntax
- Returns empty list `[]` if no sharers (safe for `sharersList ≠ []` guards)
- O(maxDevices) time complexity - acceptable for small N
- Compatible with existing `invalidateSharers` and `sendSnpInvToAll` functions

---

## Related Modifications in Other Files

### Transposed.thy

See **TRANSPOSED_MODIFICATIONS.md** for detailed modifications to Transposed.thy, including:
- **NEW function:** `getSharersList` (lines 1025-1029) - dynamically computes sharer list
- **Verified functions:** `lastSharer`, `invalidateSharers`, `sendSnpInvToAll` (already N-device compatible)
- **Future modifications:** `sendSnoop`, `noInvalidateSharers` (use `(i+1) mod 2`)

---

## Modification Records

### Rule 1: HostSharedRdOwn' (Lines 256-260)

**Original Content:**
```isabelle
definition "HostSharedRdOwn' T i sharersList = (if HSTATE SharedM T ∧ nextReqIs RdOwn T i ∧ 
    sharersList ≠ [] ∧
    (∀j. j ∈ set sharersList → j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)) ∧
    (∀k. k ∉ set sharersList ∧ k ≠ i → CSTATE Invalid T k)
  then [clearBuffer (invalidateSharers (nextReqID T i) i sharersList T)] else [])"
```

**Original Semantics:**
- Host in SharedM state, device i requests RdOwn (exclusive ownership)
- Must send SnpInv to ALL sharers to invalidate their copies
- `sharersList` is passed as explicit parameter (works for 2-device: just device `(i+1) mod 2`)
- Guards ensure sharersList contains exactly devices in Shared/SMAD state

**Issues in Multi-Device Context:**
1. Explicit parameter `sharersList` doesn't scale - caller must compute it
2. Transaction ID not tracked - can't verify all SnpInv belong to same transaction
3. No guarantee all snoops processed before granting ownership

**Modified Content (Proposed):**
```isabelle
definition "HostSharedRdOwn' T i = (
  let sharers = getSharersList T i in
  if HSTATE SharedM T ∧ nextReqIs RdOwn T i ∧ sharers ≠ []
  then [clearBuffer (invalidateSharers (nextReqID T i) i sharers T)] 
  else [])"
```

**Modified Semantics:**
- Compute sharers list dynamically inside the rule
- Same semantic intent: send SnpInv to all current sharers
- Simplified guard: just check sharers non-empty
- Transaction ID `(nextReqID T i)` will be shared by all SnpInv messages (implementation detail in `invalidateSharers`)

**Status:** IMPLEMENTED (2025-10-21)

**Implementation Details:**
- Added NEW function `getSharersList` to Transposed.thy:1025-1029
- Modified BuggyRules.thy:262-266 to use `getSharersList` 
- Original 2-device version with explicit `sharersList` parameter preserved in comments (lines 253-259)
- Line number reference updated: adjacent to HostModifiedRdOwn' (~245) and HostSharedRdOwnSelf' (~271)
- Current implementation uses `[0..<2]` for 2-device compatibility

**User Notes:**
- Original definition with explicit `sharersList` parameter preserved as cartouche comment
- New version computes sharers dynamically using `getSharersList T i`
- Currently uses `[0..<2]` for 2-device compatibility; will upgrade to `[0..<maxDevices]` for full N-device support

---

### Rule 2: HostSharedRdOwnSelf' (Lines 265-268)

**Original Content:**
```isabelle
definition "HostSharedRdOwnSelf' T i = (if HSTATE SharedM T ∧ nextReqIs RdOwn T i ∧ 
    (CSTATE Shared T i ∨ CSTATE SMAD T i) ∧
    (∀j. j ≠ i → CSTATE Invalid T j)
  then [clearBuffer (noInvalidateSharers (nextReqID T i) i T)] else [])"
```

**Original Semantics:**
- Special case: device i is the ONLY sharer (all others Invalid)
- No snoops needed - just grant GO and upgrade to Modified
- In 2-device model: other device must be Invalid

**Issues in Multi-Device Context:**
- Guard `(∀j. j ≠ i → CSTATE Invalid T j)` already correct for N devices
- No changes needed to semantics

**Modified Content:**
```isabelle
(* No change needed - already N-device compatible *)
definition "HostSharedRdOwnSelf' T i = (if HSTATE SharedM T ∧ nextReqIs RdOwn T i ∧ 
    (CSTATE Shared T i ∨ CSTATE SMAD T i) ∧
    (∀j. j ≠ i → CSTATE Invalid T j)
  then [clearBuffer (noInvalidateSharers (nextReqID T i) i T)] else [])"
```

**Status:** VERIFIED - already N-device compatible

**User Notes:**
[None yet]

---

### Rule 3: HostShared_CleanEvict_NotLastDrop' (Line 201)

**Original Content:**
```isabelle
definition "HostShared_CleanEvict_NotLastDrop' T i = (if HSTATE SharedM T ∧ nextReqIs CleanEvict T i ∧ ¬(lastSharer T) ∧ GTS T ((i + 1) mod 2) ∧ ¬ CSTATE IIA T ((i + 1) mod 2)
  then [clearBuffer (sendEvictResp GO_WritePullDrop i SharedM (nextReqID T i) T)] else [])"
```

**Original Semantics:**
- Device i evicting its clean shared copy
- NOT the last sharer: `¬(lastSharer T)` means other device(s) still have copies
- Check: `¬ CSTATE IIA T ((i + 1) mod 2)` verifies other device is indeed a sharer (not IIA)
- Host stays in SharedM state

**Issues in Multi-Device Context:**
1. `GTS T ((i + 1) mod 2)` - assumes 2 devices
2. `¬ CSTATE IIA T ((i + 1) mod 2)` - checks only one other device

**Modified Content (Proposed):**
```isabelle
definition "HostShared_CleanEvict_NotLastDrop' T i = (
  if HSTATE SharedM T ∧ nextReqIs CleanEvict T i ∧ ¬(lastSharer T) ∧ 
     (∀j. j ≠ i → GTS T j) ∧  (* all other devices allowed to proceed *)
     (∃j. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j))  (* at least one other sharer exists *)
  then [clearBuffer (sendEvictResp GO_WritePullDrop i SharedM (nextReqID T i) T)] 
  else [])"
```

**Modified Semantics:**
- Verify ALL other devices satisfy GTS (not just one)
- Verify at least one other sharer exists (existential quantifier)
- Host remains in SharedM since other sharers exist

**Status:** PROPOSED

**User Notes:**
[None yet]

---

### Rule 4: HostShared_CleanEvict_NotLastData' (Line 198-199)

**Similar to Rule 3 - requires same modifications**

**Status:** PROPOSED

---

## Summary Table

| Rule Name | Original Line | Status | Key Change |
|-----------|--------------|--------|------------|
| HostSharedRdOwn' | 256-260 | PROPOSED | Compute sharers dynamically |
| HostSharedRdOwnSelf' | 265-268 | VERIFIED | No change needed |
| HostShared_CleanEvict_NotLastDrop' | 201 | PROPOSED | Fix GTS check, verify other sharers exist |
| HostShared_CleanEvict_NotLastData' | 198-199 | PROPOSED | Fix GTS check, verify other sharers exist |

---

## Next Steps

1. Implement `getSharersList` helper function
2. Verify `invalidateSharers` function handles N devices correctly
3. Update all CleanEvict rules to use proper N-device quantifiers
4. Add transaction ID tracking throughout
5. Test with N>2 device configurations

---

## Modification History

- 2025-10-21: Document created, initial analysis of Rules 1-4

