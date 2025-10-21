# Transposed.thy Multi-Device Modification Record

## Overview
This document tracks all modifications to Transposed.thy for extending from 2-device to N-device model.

Key changes focus on:
- Helper functions for computing device lists dynamically
- State predicates that need N-device compatibility
- Message handling functions that scale to arbitrary devices

---

## Modification Records

### NEW FUNCTION: getSharersList (Lines 1025-1029)

**Status:** IMPLEMENTED (2025-10-21)

**Location:** 
- Added after `lastSharer` definition (line 1018-1019)
- Before `ISSUE_EVENT_ROW` (line 1032)
- Context: Section with state checking predicates

**Purpose:**
Provides dynamic computation of all sharers (devices in Shared or SMAD state) for multi-device protocols.
Used by `HostSharedRdOwn'` rule in BuggyRules.thy to eliminate explicit `sharersList` parameter.

**Current Implementation (2-device version):**
```isabelle
⟨═══════════════════════════════════════════════════════════════════════════
  NEW FUNCTION added 2025-10-21 by Chengsong (multi-device extension)
  
  BEFORE: This function did NOT exist in the codebase
  
  PURPOSE: Dynamically compute list of all sharers for BuggyRules.thy HostSharedRdOwn'
  Previously, HostSharedRdOwn' required explicit sharersList parameter, making
  caller responsible for computing sharers. This helper encapsulates that logic.
  
  ADJACENT DEFINITIONS: lastSharer (above, line 1018), ISSUE_EVENT_ROW (below, line 1042)
═══════════════════════════════════════════════════════════════════════════⟩
definition getSharersList :: "Type1State ⇒ nat ⇒ nat list" where [simp]:
  "getSharersList T i = [j. j ← [0..<2], j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)]"
  ⟨Current 2-device version: [0..<2] is placeholder for compatibility
  Future N-device version will use: [j. j ← [0..<maxDevices], ...]
  Returns empty list [] if no sharers found (safe for guards like "sharers ≠ []")⟩
```

**Semantics:**
- **Input:** State `T`, requesting device `i`
- **Output:** List of device IDs (excluding `i`) that are in Shared or SMAD state
- **Current behavior:** Scans devices `[0, 1]` (2-device model)
- **Return value:** 
  - Empty list `[]` if no sharers
  - `[j]` if one sharer j exists (where j ≠ i)
  - In 2-device model: returns at most `[0]` or `[1]`

**Previous State:**
```isabelle
(* This function did NOT exist before *)
(* Previously, callers (e.g., HostSharedRdOwn') required explicit sharersList parameter *)
(* This forced caller to compute and pass sharer list, making function signature verbose *)
```

**Future N-device Version (Planned):**
```isabelle
definition getSharersList :: "Type1State ⇒ nat ⇒ nat list" where [simp]:
  "getSharersList T i = [j. j ← [0..<maxDevices], j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)]"
```
where `maxDevices` is a system-wide constant defining maximum number of devices.

**Alternative Implementations Considered:**

1. **Set-based version:**
```isabelle
definition getSharers :: "Type1State ⇒ nat ⇒ nat set" where
  "getSharers T i = {j. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)}"
```
- Pros: More mathematical, no range dependency
- Cons: Need conversion to list for `invalidateSharers`, infinite comprehension issues

2. **Filter-based version:**
```isabelle
definition getSharersList :: "Type1State ⇒ nat ⇒ nat list" where
  "getSharersList T i = filter (λj. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)) [0..<maxDevices]"
```
- Pros: Explicit filtering, clear semantics
- Cons: Slightly more verbose than list comprehension

**Chosen:** List comprehension for simplicity and Isabelle idiomaticity.

**Dependencies:**
- **Used by:** `HostSharedRdOwn'` (BuggyRules.thy:262)
- **Calls:** `CSTATE` predicate (checks device cache state)
- **Related functions:** 
  - `lastSharer` (1018) - checks if exactly one sharer exists
  - `invalidateSharers` (991) - sends SnpInv to list of sharers
  - `sendSnpInvToAll` (977) - recursively sends snoops to list

**Testing Considerations:**
- Empty case: all devices Invalid ⇒ `getSharersList T i = []`
- Single sharer: device j Shared, i ≠ j ⇒ `getSharersList T i = [j]`
- Self-exclusion: even if device i is Shared, `i ∉ getSharersList T i`
- Multiple sharers (future): devices j, k Shared ⇒ returns both

**User Notes:**
- This is a NEW addition, not a modification
- Simplifies caller code by encapsulating sharer detection logic
- Maintains compatibility with existing `invalidateSharers` interface
- Placeholder `[0..<2]` ensures gradual migration path

---

## Adjacent Verified Functions (Already N-device Compatible)

### lastSharer (Lines 1018-1019)

**Status:** VERIFIED - Already N-device compatible

**Definition:**
```isabelle
(*last Sharer: exists exactly one device in Shared state, all others are Invalid*)
definition lastSharer :: "Type1State ⇒ bool" where [simp]:
  "lastSharer T = (∃j. CSTATE Shared T j ∧ (∀i. i ≠ j → CSTATE Invalid T i))"
```

**Verification:**
- Uses existential (∃) and universal (∀) quantifiers
- Not hardcoded to specific device numbers
- Correctly expresses: "exactly one device is Shared, all others Invalid"
- **No modification needed** ✓

### invalidateSharers (Lines 991-996)

**Status:** VERIFIED - Already N-device compatible

**Definition:**
```isabelle
definition invalidateSharers :: "TransactionID ⇒ nat ⇒ nat list ⇒ Type1State ⇒ Type1State" where [simp]:
  "invalidateSharers tid reqNum sharersList T = (
    let T' = sendHostData reqNum MA T in
    let T'' = sendSnpInvToAll T' tid sharersList in
    T''[reqNum -=req]
  )"
```

**Verification:**
- Accepts arbitrary-length `sharersList :: nat list`
- Uses `sendSnpInvToAll` which recursively handles any list length
- No hardcoded device assumptions
- **No modification needed** ✓

### sendSnpInvToAll (Lines 977-979)

**Status:** VERIFIED - Already N-device compatible

**Definition:**
```isabelle
fun sendSnpInvToAll :: "Type1State ⇒ TransactionID ⇒ nat list ⇒ Type1State" where
  "sendSnpInvToAll T tid [] = T"
| "sendSnpInvToAll T tid (j # js) = sendSnpInvToAll (T[j +=snp SnpInv tid]) tid js"
```

**Verification:**
- Recursive function handling arbitrary list length
- Base case: empty list returns state unchanged
- Recursive case: send snoop to head device, recurse on tail
- All snoops share same `tid` (transaction ID)
- **No modification needed** ✓

---

## Future Modifications Needed

### Functions with (i+1) mod 2 Pattern

Several functions still use `(i+1) mod 2` to refer to "the other device" - these have been **ANNOTATED with warning comments (2025-10-21)**:

1. **noInvalidateSharers (Lines 999-1005)**
```isabelle
⟨ORIGINAL 2-device version - NEEDS REVIEW for N-device extension
  Line 1004 uses: (reqNum + 1) mod 2 to compute "otherNum" but doesn't use it
  May need removal or fix for N-device compatibility
  Status: UNMODIFIED as of 2025-10-21⟩
definition noInvalidateSharers :: "TransactionID ⇒ nat ⇒ Type1State ⇒ Type1State" where [simp]:
  "noInvalidateSharers tid reqNum T = (let otherNum = (reqNum + 1) mod 2 in 
    (sendHostDataGO tid reqNum ModifiedM Modified GO T))"
```
**Issue:** `otherNum` computed but not used - may need removal or fix
**Status:** ANNOTATED - warning comment added to source code

2. **sendSnoop (Lines 1008-1018)**
```isabelle
⟨ORIGINAL 2-device version - NEEDS MODIFICATION for N-device extension
  Line 1017 uses: owner = (devNum + 1) mod 2 (assumes "the other device")
  For N-device: need dynamic owner lookup based on CSTATE (likely Modified or Exclusive)
  Status: UNMODIFIED as of 2025-10-21⟩
definition sendSnoop :: "SnoopType ⇒ nat ⇒ HOST_State ⇒ Type1State ⇒ Type1State" where [simp]:
   "sendSnoop snoopt devNum mesi T = (let owner = (devNum + 1) mod 2 in 
     (let requestor = devNum in 
       T[owner +=snp snoopt (nextReqID T requestor)][5 sHost= mesi][requestor -=req]))"
```
**Issue:** Assumes owner is `(devNum + 1) mod 2` - needs dynamic owner lookup
**Status:** ANNOTATED - warning comment added to source code with detailed explanation

---

## Summary Table

| Item | Line | Type | Status | Notes |
|------|------|------|--------|-------|
| getSharersList | 1025-1029 | NEW | IMPLEMENTED | Dynamic sharer list computation |
| lastSharer | 1018-1019 | EXISTING | VERIFIED | Already N-device compatible |
| invalidateSharers | 991-996 | EXISTING | VERIFIED | Already N-device compatible |
| sendSnpInvToAll | 977-979 | EXISTING | VERIFIED | Already N-device compatible |
| noInvalidateSharers | 1000-1001 | EXISTING | NEEDS_REVIEW | Uses (i+1) mod 2 |
| sendSnoop | 1007-1009 | EXISTING | NEEDS_ATTENTION | Assumes 2-device owner |

---

## Modification History

- **2025-10-21:** Created document, added getSharersList (NEW function)
- **2025-10-21:** Verified lastSharer, invalidateSharers, sendSnpInvToAll as N-device compatible
- **2025-10-21:** Identified noInvalidateSharers and sendSnoop for future modification
- **2025-10-21:** Added detailed annotation comments to:
  - getSharersList: Clarified this is NEW function (did NOT exist before)
  - noInvalidateSharers: Added "ORIGINAL 2-device version - NEEDS REVIEW" comment
  - sendSnoop: Added "ORIGINAL 2-device version - NEEDS MODIFICATION" comment
  - Purpose: Make it clear which functions are new, which are modified, which are unchanged

