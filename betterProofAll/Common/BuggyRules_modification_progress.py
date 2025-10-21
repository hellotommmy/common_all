# BuggyRules.thy Modification Progress Tracker
# File: BuggyRules.thy
# Focus: Rules involving "sending to sharers" semantics
# 
# Status codes:
# 'VERIFIED': Rule already N-device compatible, no changes needed
# 'PROPOSED': Modification proposed, awaiting implementation
# 'IMPLEMENTED': Modification completed
# 'CONFIRMED': Modification implemented and verified correct
# 'NEEDS_ATTENTION': Requires analysis or modification

# Progress data structure: [line_number, status, rule_name, description]
progress = [
    # Rules that send messages to sharers
    [262, 'IMPLEMENTED', 'HostSharedRdOwn\'', 'Now computes sharers dynamically using getSharersList - original preserved in comments (253-259)'],
    [271, 'VERIFIED', 'HostSharedRdOwnSelf\'', 'Already N-device compatible - uses ∀j quantifier'],
    
    # CleanEvict rules - check for other sharers
    [198, 'PROPOSED', 'HostShared_CleanEvict_NotLastData\'', 'Fix GTS check, verify other sharers exist'],
    [201, 'PROPOSED', 'HostShared_CleanEvict_NotLastDrop\'', 'Fix GTS check, verify other sharers exist'],
    [203, 'NEEDS_ATTENTION', 'HostShared_CleanEvict_Last\'', 'Verify lastSharer predicate works for N devices'],
    [206, 'NEEDS_ATTENTION', 'HostShared_CleanEvictNoData_NotLast\'', 'Check GTS and sharer logic'],
    [208, 'NEEDS_ATTENTION', 'HostShared_CleanEvictNoData_Last\'', 'Verify lastSharer predicate works for N devices'],
    
    # DirtyEvict rules - may need similar checks
    [217, 'NEEDS_ATTENTION', 'HostShared_DirtyEvict\'', 'Check if sharer validation needed'],
    [219, 'NEEDS_ATTENTION', 'HostModifiedDirtyEvict\'', 'Check MIA device validation'],
    [221, 'NEEDS_ATTENTION', 'HostModifiedDirtyEvictPrevious\'', 'Check (i+1) mod 2 usage for previous owner'],
    [226, 'NEEDS_ATTENTION', 'HostInvalidDirtyEvict\'', 'Check IIA device validation'],
    
    # Rules with (i+1) mod 2 pattern - potential 2-device assumptions
    [188, 'NEEDS_ATTENTION', 'HostInvalidRdShared\'', 'Uses GTS T ((i + 1) mod 2) - check if needs fix'],
    [190, 'NEEDS_ATTENTION', 'HostInvalidRdOwn\'', 'Uses GTS T ((i + 1) mod 2) - check if needs fix'],
    [192, 'NEEDS_ATTENTION', 'HostSharedRdShared\'', 'Uses GTS T ((i + 1) mod 2) - check if needs fix'],
    
    # ModifiedRdShared/RdOwn - sends snoop to current owner
    [244, 'NEEDS_ATTENTION', 'HostModifiedRdShared\'', 'Sends SnpData to owner - verify owner identification'],
    [245, 'NEEDS_ATTENTION', 'HostModifiedRdOwn\'', 'Sends SnpInv to owner - verify owner identification'],
    
    # Rules using lastSharer predicate
    [158, 'NEEDS_ATTENTION', 'SIACGO\'', 'Uses GTS T ((i + 1) mod 2) - verify N-device compatibility'],
    
    # Data processing rules - may reference other devices
    [280, 'NEEDS_ATTENTION', 'HostIDData\'', 'Uses (i+1) mod 2 to check other device state'],
    [296, 'NEEDS_ATTENTION', 'HostIBDataPrevious\'', 'Uses (i+1) mod 2 to verify both devices Invalid'],
]

# Helper function definitions
helper_functions = [
    {
        'name': 'getSharersList',
        'status': 'IMPLEMENTED',
        'location': 'Transposed.thy:1025-1029 (NEW FUNCTION added 2025-10-21)',
        'definition': '''
definition getSharersList :: "Type1State ⇒ nat ⇒ nat list" where [simp]:
  "getSharersList T i = [j. j ← [0..<2], j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SMAD T j)]"
  (* Current 2-device version: [0..<2] placeholder *)
  (* Future N-device version will use: [0..<maxDevices] *)
        ''',
        'description': 'NEW function - returns list of all devices (except i) in Shared or SMAD state'
    },
    {
        'name': 'lastSharer',
        'status': 'VERIFIED',
        'location': 'Transposed.thy:1018-1019',
        'definition': '''
definition lastSharer :: "Type1State ⇒ bool" where [simp]:
  "lastSharer T = (∃j. CSTATE Shared T j ∧ (∀i. i ≠ j → CSTATE Invalid T i))"
        ''',
        'description': 'Already N-device compatible - checks if exactly one device is Shared, all others Invalid'
    },
    {
        'name': 'invalidateSharers',
        'status': 'VERIFIED',
        'location': 'Transposed.thy:991-996',
        'definition': '''
definition invalidateSharers :: "TransactionID ⇒ nat ⇒ nat list ⇒ Type1State ⇒ Type1State" where [simp]:
  "invalidateSharers tid reqNum sharersList T = (
    let T' = sendHostData reqNum MA T in
    let T'' = sendSnpInvToAll T' tid sharersList in
    T''[reqNum -=req]
  )"
        ''',
        'description': 'Already N-device compatible - accepts list of sharers, sends SnpInv to all with same txid'
    },
    {
        'name': 'sendSnpInvToAll',
        'status': 'VERIFIED',
        'location': 'Transposed.thy:977-979',
        'definition': '''
fun sendSnpInvToAll :: "Type1State ⇒ TransactionID ⇒ nat list ⇒ Type1State" where
  "sendSnpInvToAll T tid [] = T"
| "sendSnpInvToAll T tid (j # js) = sendSnpInvToAll (T[j +=snp SnpInv tid]) tid js"
        ''',
        'description': 'Already N-device compatible - recursively sends SnpInv to all devices in list'
    }
]

# Summary statistics
def get_stats():
    total_rules = len(progress)
    verified = len([p for p in progress if p[1] == 'VERIFIED'])
    proposed = len([p for p in progress if p[1] == 'PROPOSED'])
    implemented = len([p for p in progress if p[1] == 'IMPLEMENTED'])
    confirmed = len([p for p in progress if p[1] == 'CONFIRMED'])
    needs_attention = len([p for p in progress if p[1] == 'NEEDS_ATTENTION'])
    
    completed = verified + confirmed + implemented
    
    return {
        'total_rules': total_rules,
        'verified': verified,
        'proposed': proposed,
        'implemented': implemented,
        'confirmed': confirmed,
        'needs_attention': needs_attention,
        'completed': completed,
        'progress_percentage': round((completed / total_rules * 100), 1) if total_rules > 0 else 0
    }

# Print progress summary
def print_progress():
    stats = get_stats()
    print("=" * 60)
    print("BuggyRules.thy Multi-Device Modification Progress")
    print("=" * 60)
    print(f"Total rules tracked: {stats['total_rules']}")
    print(f"Verified (no changes needed): {stats['verified']}")
    print(f"Proposed modifications: {stats['proposed']}")
    print(f"Implemented: {stats['implemented']}")
    print(f"Confirmed: {stats['confirmed']}")
    print(f"Needs attention: {stats['needs_attention']}")
    print(f"\nCompleted: {stats['completed']}/{stats['total_rules']} ({stats['progress_percentage']}%)")
    print("=" * 60)
    
    # Progress bar
    bar_length = 50
    filled = int(bar_length * stats['completed'] / stats['total_rules']) if stats['total_rules'] > 0 else 0
    bar = '█' * filled + '-' * (bar_length - filled)
    print(f"Progress: [{bar}] {stats['progress_percentage']}%")
    print("=" * 60)

# Print helper functions status
def print_helpers():
    print("\n" + "=" * 60)
    print("Helper Functions Status")
    print("=" * 60)
    for helper in helper_functions:
        print(f"\n{helper['name']} - {helper['status']}")
        print(f"  Location: {helper['location']}")
        print(f"  Description: {helper['description']}")
    print("=" * 60)

if __name__ == "__main__":
    print_progress()
    print_helpers()

