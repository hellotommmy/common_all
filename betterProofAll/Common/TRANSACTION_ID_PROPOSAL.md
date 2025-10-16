# Transaction Identifier Infrastructure Proposal

## Problem Statement

During the multi-device conversion of `CoherenceProperties.thy`, we discovered that many 2-device constraints cannot be soundly generalized without **transaction identifiers**. The 2-device model implicitly relies on "the only other transaction" assumption, which breaks down with 3+ devices where multiple independent transactions can be in flight simultaneously.

### Affected Constraints

- **Line 374**: ISD state and channel emptiness
- **Line 378**: MIA state and channel coordination  
- **Line 381**: Request and response coordination
- Many others involving inter-device message coordination

## Core Concept

A **coherence transaction** is a sequence of related messages initiated by a device request:

```
Example RdOwn Transaction (TxID = tid):
1. Device i → Host: RdOwn(tid)
2. Host → Device j (owner): SnpInv(tid)  
3. Device j → Host: SnpResp(tid)
4. Device j → Device i: DTHData(tid)
5. Host → Device i: HTDData(tid)
6. Device i → Host: ReqResp(tid)
```

All messages in this sequence share the same transaction ID `tid`.

## Implementation Options

### Option 1: Extend Message Types with Transaction IDs

**Location**: `Type1State.thy` (message type definitions)

**Changes**:
```isabelle
(* Current *)
datatype Message = RdShared | RdOwn | DirtyEvict | ...
datatype SnpMsg = SnpInv | SnpData | ...

(* Proposed *)
record TxMessage =
  msg_type :: Message
  tx_id :: nat  (* Transaction identifier *)

record TxSnpMsg =
  snp_type :: SnpMsg
  tx_id :: nat
```

**Channel updates**:
```isabelle
(* Current *)
reqs :: "Type1State ⇒ nat ⇒ Message list"
snps :: "Type1State ⇒ nat ⇒ SnpMsg list"

(* Proposed *)
reqs :: "Type1State ⇒ nat ⇒ TxMessage list"
snps :: "Type1State ⇒ nat ⇒ TxSnpMsg list"
```

**Pros**:
- ✅ Clean separation of concerns
- ✅ All message channels become transaction-aware
- ✅ Can express constraints like `hasReqWithTxId tid i T`

**Cons**:
- ❌ **MASSIVE refactoring required** - affects ALL rules, lemmas, proofs
- ❌ Every `nextReqIs RdOwn` becomes `msg_type (hd (reqs T i)) = RdOwn`
- ❌ Breaks 1000+ existing proof lines
- ❌ Estimated effort: 2-4 weeks of careful refactoring

---

### Option 2: Add Transaction Mapping Functions

**Location**: `CoherenceProperties.thy` or new `TransactionModel.thy`

**Changes**:
```isabelle
(* Transaction ID generation *)
definition "genTxId :: Type1State ⇒ nat ⇒ nat" where
  "genTxId T i = (some unique ID based on state)"

(* Transaction membership predicates *)
definition "reqHasTxId :: nat ⇒ nat ⇒ Type1State ⇒ bool" where
  "reqHasTxId tid i T = (reqs T i ≠ [] ∧ genTxId T i = tid)"

definition "snpHasTxId :: nat ⇒ nat ⇒ Type1State ⇒ bool" where
  "snpHasTxId tid j T = (snps T j ≠ [] ∧ ...)" (* derive from host state *)

(* Constraint helpers *)
definition "txChannelsEmpty :: nat ⇒ nat ⇒ Type1State ⇒ bool" where
  "txChannelsEmpty tid i T = 
    (¬hasReqRespWithTxId tid i T ∧
     (∀j. j ≠ i → ¬hasSnpRespWithTxId tid j T) ∧
     ¬hasHTDDataWithTxId tid i T)"
```

**Pros**:
- ✅ **Minimal invasive changes** - original message types unchanged
- ✅ Can be added incrementally
- ✅ Existing proofs largely unaffected
- ✅ Transaction logic isolated in helper functions

**Cons**:
- ⚠️ Transaction ID "reconstructed" from state rather than explicit
- ⚠️ Need careful definition of how to derive TxID from message position/state
- ⚠️ May be less precise than explicit IDs in some edge cases

---

### Option 3: Hybrid Approach - Add Parallel Transaction Tracking

**Location**: New fields in `Type1State` record

**Changes**:
```isabelle
(* Extend Type1State with transaction tracking *)
record Type1State = 
  ... (* existing fields *)
  active_txs :: "nat ⇒ TxInfo option"  (* Device → active transaction *)
  
datatype TxInfo = TxInfo
  tx_id :: nat
  initiator :: nat
  stage :: TxStage
  
datatype TxStage = 
  ReqSent | SnpsSent | SnpsReceived | DataSent | Completed
```

**Pros**:
- ✅ Explicit transaction state tracking
- ✅ Clear transaction lifecycle
- ✅ Original message types unchanged
- ✅ Can validate transaction progression

**Cons**:
- ⚠️ Need to maintain consistency between `active_txs` and message channels
- ⚠️ Adds complexity to state transitions
- ⚠️ Moderate refactoring of transition rules required

---

## Recommended Approach

### **Option 2 (Transaction Mapping Functions)** is recommended for current work:

**Rationale**:
1. **Minimal disruption**: Can continue current multi-device conversion work
2. **Incremental**: Add transaction helpers only where needed
3. **Backward compatible**: Existing proofs don't break
4. **Sufficient expressiveness**: Can capture most transaction-based constraints

**Implementation Strategy**:

#### Phase 1: Define Transaction Tracking (1-2 days)
Create `TransactionModel.thy`:
```isabelle
theory TransactionModel
imports Type1State
begin

(* Transaction ID: unique identifier per coherence transaction *)
type_synonym TxId = nat

(* Derive transaction ID from request initiator and state *)
definition genTxId :: "Type1State ⇒ nat ⇒ TxId" where
  "genTxId T i = (SOME tid. tid < n_dev)"  (* Simplified; refine later *)

(* Request has transaction ID *)
definition reqHasTxId :: "TxId ⇒ nat ⇒ Type1State ⇒ bool" where
  "reqHasTxId tid i T ≡ (reqs T i ≠ [] ∧ genTxId T i = tid)"

(* Response belongs to transaction *)
definition reqrespHasTxId :: "TxId ⇒ nat ⇒ Type1State ⇒ bool" where
  "reqrespHasTxId tid i T ≡ (reqresps T i ≠ [] ∧ ... (* match with pending req *))"

(* Snoop belongs to transaction *)
definition snpHasTxId :: "TxId ⇒ nat ⇒ Type1State ⇒ bool" where
  "snpHasTxId tid j T ≡ (snps T j ≠ [] ∧ ... (* derive from HSTATE/pending reqs *))"

(* Helper: transaction-specific channel emptiness *)
definition txReqChannelsEmpty :: "TxId ⇒ nat ⇒ Type1State ⇒ bool" where
  "txReqChannelsEmpty tid i T ≡ 
    (¬reqrespHasTxId tid i T ∧ ¬htddataHasTxId tid i T)"

definition txSnpChannelsEmpty :: "TxId ⇒ nat ⇒ Type1State ⇒ bool" where
  "txSnpChannelsEmpty tid j T ≡ 
    (¬snprespHasTxId tid j T ∧ ¬dthdataHasTxId tid j T)"

end
```

#### Phase 2: Rewrite Problematic Constraints (2-3 days)

Update affected constraints in `CoherenceProperties.thy`:

**Line 381 - Before**:
```isabelle
(∀i j. i ≠ j → (reqs T i ≠ [] → reqresps T i = [] ∧ snpresps T j = [] ∧ htddatas T i = []))
```

**Line 381 - After**:
```isabelle
(∀i. reqs T i ≠ [] → 
  (let tid = genTxId T i in
    txReqChannelsEmpty tid i T ∧ 
    (∀j. j ≠ i → txSnpChannelsEmpty tid j T)))
```

#### Phase 3: Validate and Refine (3-5 days)

1. Test new constraints on small examples
2. Refine `genTxId` definition based on protocol semantics
3. Add transaction-aware lemmas
4. Document transaction lifecycle assumptions

---

## Alternative: Defer Transaction IDs

If transaction ID infrastructure is too complex for current phase:

### **Weakening Strategy** (for immediate progress):

For constraints that cannot be soundly generalized:
1. **Document the issue** clearly (already done)
2. **Keep only sound parts** of the constraint
3. **Mark as ⚠️ WEAKENED** in progress tracking
4. **Add TODO comment** in code

Example for Line 381:
```isabelle
(* TODO: This constraint is weakened for multi-device.
   Original 2-device version: reqs i ≠ [] → reqresps i = [] ∧ snpresps j = []
   Multi-device needs transaction IDs to properly express.
   Current: only keeping reqresps part. *)
(∀i. reqs T i ≠ [] → reqresps T i = [])
```

**Pros**:
- ✅ Can complete current conversion pass
- ✅ Clear documentation of limitations
- ✅ Can add transaction IDs in follow-up work

**Cons**:
- ⚠️ Weakened invariants may affect proof strength
- ⚠️ Technical debt accumulates

---

## Questions for User

1. **Urgency**: Do you need sound multi-device constraints now, or can we defer transaction IDs?

2. **Scope**: How many constraints are affected? (Current count: ~5-10 critical ones)

3. **Proof impact**: Are you planning to re-prove theorems with multi-device model soon?

4. **Preference**: 
   - Option A: Implement Transaction Mapping Functions (Option 2) now?
   - Option B: Continue with weakened constraints, document issues?
   - Option C: Full refactoring with explicit TxIDs (Option 1) in separate branch?

## Recommendation Summary

**For immediate progress** (this week):
- Use weakening strategy for Line 381 and similar
- Document all affected constraints clearly
- Add `TRANSACTION_ID_REQUIRED` markers in code

**For next phase** (next 1-2 weeks):
- Implement Option 2 (Transaction Mapping Functions)
- Rewrite ~10-15 affected constraints
- Validate with small proof examples

**For long-term** (if needed):
- Consider Option 1 (explicit TxIDs) if precision becomes critical
- Requires dedicated refactoring sprint

---

*Document created: 2025-10-16*
*Author: AI Assistant (based on user feedback)*
*Status: PROPOSAL - awaiting user decision*

