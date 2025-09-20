processing  
processing theory FixIMDData  imports BasicInvariants  begin 
processing sledgehammer_params[timeout=10, dont_minimize, "try0" = false] 
processing lemma devcache2_sequals1_invariant: shows "devcache2 ( T [ 0 s= X] ) = devcache2 T" 
processing by simp 
processing lemma devcache2_copy_hdata1_invariant: shows "devcache2 ( T [ 0 :=dd msg] ) = devcache2 T" 
processing by simp 
processing lemma devcache2_copy_perform1_invariant: shows "devcache2 ( T [ -=i 0] ) = devcache2 T" 
processing apply simp 
processing apply(case_tac "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma devcache2_consume_hdata1_invariant: shows "devcache2 ( T [ 0 -=devd ] ) = devcache2 T" 
processing by simp 
processing lemma devcache1_IMDData_invariant_aux1: shows "CLEntry.block_state  (devcache1 T) = Shared ⟹ 
  CLEntry.block_state (devcache1 ( T  [ -=i 0] )) ≠ Modified" 
processing apply(case_tac "program1 T")  processing apply simp+  processing done 
processing lemma devcache1_IMDData_invariant_aux: shows "CLEntry.block_state  (devcache1 T) = Shared ⟹ 
  CLEntry.block_state (devcache1 ( T  [ -=i 0] [ 0 -=devd ])) ≠ Modified" 
processing using devcache1_IMDData_invariant_aux1 
processing by auto 
processing lemma devcache1_IMDData_invariant: shows "CLEntry.block_state  (devcache1 T) = Shared ⟹ 
  CLEntry.block_state (devcache1 ( T [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])) ≠ Modified" 
processing apply(subgoal_tac "CLEntry.block_state  (devcache1 (T  [ 0 :=dd msg ])) = Shared") 
processing using devcache1_IMDData_invariant_aux 
processing apply blast 
processing by simp 
processing lemma CSTATE_IMDData_otherside: shows "CSTATE X T 1 = CSTATE X ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 1" 
processing using CSTATE_def devcache2_consume_hdata1_invariant devcache2_copy_hdata1_invariant devcache2_copy_perform1_invariant devcache2_sequals1_invariant 
processing by presburger 
processing lemma IMDData_Modified_aux1: shows "nextLoad T 0 ⟹ CSTATE X T 0 = CSTATE X (T [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n)  processing apply simp+  processing done 
processing lemma nextLoad_devstate: shows "nextLoad T i = nextLoad (T [0 s= mesi]) i" 
processing by simp 
processing lemma IMDData_Modified: shows "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply(case_tac "program1 T")  processing apply simp+  processing done 
processing lemma reqs1_IMDData: shows "reqs1  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) = reqs1 T" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n)  processing apply simp+  processing done 
processing lemma reqs2_IMDData: shows "reqs2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) = reqs2 T" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n)  processing apply simp+  processing done 
processing lemma nextReqIs_IMDData: shows "nextReqIs X T i = nextReqIs X ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) i" 
processing apply(case_tac i) 
processing using nextReqIs_def reqs1_IMDData 
processing apply presburger 
processing using nextReqIs_def old.nat.distinct(2) reqs2_IMDData 
processing by presburger 
processing lemma IMDData_nextGOPendingIs: shows "nextGOPendingIs X T i = nextGOPendingIs X ( T [ 0 s= mesi] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) i" 
processing apply(case_tac i) 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp 
processing apply simp 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing by simp+ 
processing lemma IMDData_nextEvict: shows "nextEvict T 1 = nextEvict ( T [ 0 s= mesi] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma IMDData_nextLoad: shows "nextLoad T 1 = nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma IMDData_HSTATE: shows "(HSTATE X ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) = HSTATE X T" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma IMDData_HSTATES: shows "(HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨
  HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨
  HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨
  HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) = (HSTATE MAD T ∨ HSTATE MA T ∨ HSTATE MD T ∨ HSTATE ModifiedM T)" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma IMDData_nextSnoopIs: shows "nextSnoopIs  X T i = nextSnoopIs X ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) i" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma IMDData_nextStore_otherside: shows "nextStore T 1 = nextStore ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_snps2:   " snps2  T  = snps2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_snps1:   " snps1  T  = snps1  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_reqs1:   " reqs1  T  = reqs1  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_reqs2:   " reqs2  T  = reqs2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_reqresps1:   " reqresps1  T  = reqresps1  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_reqresps2:   " reqresps2  T  = reqresps2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_snpresps1:   " snpresps1  T  = snpresps1  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_snpresps2:   " snpresps2  T  = snpresps2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_dthdatas1:   " dthdatas1  T  = dthdatas1  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_dthdatas2:   " dthdatas2  T  = dthdatas2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_htddatas1:   " length (htddatas1  T) ≤ 1 ⟹   (htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])) = []" 
processing apply (cases "htddatas1 T", cases "program1 T") 
processing by(simp, simp, cases "program1 T", simp+) 
processing lemma device_perform_op_htddatas2:   " htddatas2  T  = htddatas2  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing apply (cases "program1 T") 
processing apply simp  processing apply simp  processing done 
processing lemma device_perform_op_nextHTDDataPending:   " nextHTDDataPending  T 1 = nextHTDDataPending  ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply(case_tac "program1 T") 
processing apply simp 
processing apply(case_tac a) 
processing apply simp 
processing apply(case_tac x2) 
processing apply(case_tac n) 
processing apply simp 
processing apply simp 
processing apply simp  processing apply simp  processing done 
processing lemma nextGOPending_DeviceIMDData: "nextGOPending (  T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ] ) i = nextGOPending T i" 
processing apply(case_tac i) 
processing using device_perform_op_reqresps1 nextGOPending_def 
processing apply presburger 
processing using device_perform_op_reqresps2 nextGOPending_def 
processing by presburger 
processing lemma IMDData'_coherent_aux_simpler: assumes "SWMR_state_machine T ∧ CSTATE IMD T 0 ∧ nextHTDDataPending T 0 " shows 
"SWMR_state_machine ( T [ 0 s= Modified] [ 0 :=dd msg ] [ -=i 0] [ 0 -=devd ])" 
processing proof - 
processing have i0: "SWMR T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i1x: "CSTATE IMD T 0" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i2x: "nextHTDDataPending T 0" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i3: "C_msg_P_oppo ISD nextHTDDataPending (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i4: "H_msg_P_same SD nextDTHDataPending (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i5: "H_msg_P_same SAD nextDTHDataPending (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i6: "C_msg_P_oppo ISAD nextGOPending (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i10: "H_msg_P_same SharedM (nextReqIs RdShared) (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i11: "H_msg_P_oppo SharedM (nextReqIs RdShared) (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i12: "H_msg_P_same ModifiedM (nextReqIs RdShared) (λT i. ¬ CSTATE Modified T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i13: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (λT i. ¬ nextDTHDataPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i14: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (λT i. ¬ nextSnpRespIs RspIFwdM T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i15: "H_msg_P_same ModifiedM (nextReqIs RdShared) (λT i. ¬ nextSnpRespIs RspIFwdM T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i16: "C_H_state IMAD (nextReqIs RdOwn) Modified SD T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i17: "C_H_state IMAD (nextReqIs RdOwn) Modified SAD T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i18: "C_H_state IMAD (nextReqIs RdOwn) Modified SA T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i19: "C_H_state Invalid nextStore Modified SAD T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i20: "C_H_state Invalid nextStore Modified SA T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i21: "C_H_state Invalid nextStore Modified SD T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i22: "HSTATE SharedM T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i23: "HSTATE SD T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i24: "HSTATE MD T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i25: "C_msg_not RdShared IMAD T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i26: "C_msg_not RdShared Invalid T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i27: "H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (λT i. CSTATE MIA T i ∨ CSTATE IIA T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i28: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (λT. ¬ HSTATE ModifiedM T) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i29: "C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i30: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) T" 
processing apply (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing done 
processing have i31: "C_state_not MIA RdShared T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i32: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i34: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextReqIs RdShared T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i35: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextDTHDataPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i36: "H_C_state_msg_same ModifiedM Modified (λT i. ¬ nextReqIs RdShared T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i37: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i39: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextReqIs RdShared T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i40: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextDTHDataPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i41: "H_C_state_msg_oppo ModifiedM IIA (λT i. ¬ nextReqIs RdShared T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i46: "C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i47: "C_msg_state RdShared ISAD T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i49: "C_not_C_msg Modified ISAD nextGOPending T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i50: "C_msg_P_same Invalid nextStore (λT i. ¬ nextHTDDataPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i51: "C_msg_P_same Invalid nextStore (λT i. ¬ nextSnoopIs SnpInv T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i52: "C_msg_P_same ISAD nextGOPending (λT i. ¬ nextReqIs RdShared T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i55: "snps2 T ≠ [] ⟶ reqs1 T = [] ∧ snpresps2 T = [] ∧ dthdatas2 T = [] ∧ reqresps1 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i56: "snps1 T ≠ [] ⟶ reqs2 T = [] ∧ snpresps1 T = [] ∧ dthdatas1 T = [] ∧ reqresps2 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i57: "length (reqs1 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i58: "length (reqs2 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i59: "C_msg_P_same Shared (nextSnoopIs SnpInv) (λT i. ¬ nextHTDDataPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i60: "length (snps2 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i61: "length (snps1 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i611old: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (λ T i. ¬nextSnoopPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i612old: "C_msg_P_oppo Invalid nextStore (λT i. ¬ nextSnoopPending T i) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i613old: "(CSTATE Invalid T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ reqresps1 T = [] ∧ htddatas1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i614old: "(CSTATE Invalid T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ reqresps2 T = [] ∧ htddatas2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i615old: "(CSTATE Shared T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ reqresps1 T = [] ∧ htddatas1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i616old: "(CSTATE Shared T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ reqresps2 T = [] ∧ htddatas2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i617old: "(CSTATE IIA T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i618old: "(CSTATE IIA T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ htddatas2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i68: "CSTATE Invalid T 0 ⟶ reqs1 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i69: "CSTATE Invalid T 1 ⟶ reqs2 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i70: "CSTATE Shared T 0 ⟶ reqs1 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i71: "CSTATE Shared T 1 ⟶ reqs2 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i72: "CSTATE Modified T 0 ⟶ ¬CSTATE Modified T 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i73: "CSTATE Modified T 1 ⟶ ¬CSTATE Modified T 0" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i74: "CSTATE ISD T 0 ⟶ ¬HSTATE ModifiedM T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i75: "CSTATE ISD T 1 ⟶ ¬HSTATE ModifiedM T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i76: "C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) T" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i77: "length (htddatas1 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i78: "length (htddatas2 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i79: "CSTATE ISD T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ reqresps1 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i80: "CSTATE ISD T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ reqresps2 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i81: "CSTATE ISD T 0 ⟶ reqs1 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i82: "CSTATE ISD T 1 ⟶ reqs2 T = []" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i83: "(CSTATE IMAD T 0 ∧ nextHTDDataPending T 0 ⟶ reqs1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i84: "(CSTATE IMAD T 1 ∧ nextHTDDataPending T 1 ⟶ reqs2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i85: "(length (reqresps1 T) ≤ 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i86: "(length (reqresps2 T) ≤ 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i87: "(CSTATE MIA T 0 ∧ (nextGOPendingIs GO_WritePull T 0)  ⟶ snps1 T = [] )" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i88: "(CSTATE MIA T 1 ∧ (nextGOPendingIs GO_WritePull T 1)  ⟶ snps2 T = [] )" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i89: "(CSTATE MIA T 0 ∧ (nextGOPendingIs GO_WritePull T 0) ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i90: "(CSTATE MIA T 1 ∧ (nextGOPendingIs GO_WritePull T 1) ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i91: "(CSTATE ISAD T 0 ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i92: "(CSTATE ISAD T 1 ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i93: "(C_msg_P_same MIA  (nextReqIs DirtyEvict) (nextEvict) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i94: "(reqs1 T ≠ [] ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i95: "(reqs2 T ≠ [] ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i98: "(reqs1 T ≠ [] ⟶ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i99: "(reqs2 T ≠ [] ⟶ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i100: "(reqs1 T ≠ [] ⟶ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i101: "(reqs2 T ≠ [] ⟶ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i751old: " (CSTATE ISD T 0 ⟶ nextLoad T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)+ 
processing have i752old: " (CSTATE ISD T 1 ⟶ nextLoad T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)+ 
processing have i104: "(reqs1 T ≠ [] ⟶ reqresps1 T = [] ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i105: "(reqs2 T ≠ [] ⟶ reqresps2 T = [] ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i106: "(HSTATE SAD T ⟶ (CSTATE ISAD T 0 ∨ CSTATE ISAD T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i107: "(HSTATE ModifiedM T ⟶ ¬CSTATE Shared T 0 ∧ ¬CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i108: "(HSTATE SD T ∧ dthdatas1 T ≠ [] ⟶ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i109: "(HSTATE SD T ∧ dthdatas2 T ≠ [] ⟶ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i110: "(length (dthdatas1 T ) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i111: "(length (dthdatas2 T ) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i112: "(HSTATE SD T ∧ nextDTHDataFrom 0 T ⟶ (CSTATE ISAD T 1 ∨ CSTATE ISD T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i113: "(HSTATE SD T ∧ nextDTHDataFrom 1 T ⟶ (CSTATE ISAD T 0 ∨ CSTATE ISD T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i114: "(HSTATE SA T ∧ (nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspSFwdM T 0) ⟶ CSTATE ISAD T 1 ∨ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i115: "(HSTATE SA T ∧ (nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspSFwdM T 1) ⟶ CSTATE ISAD T 0 ∨ CSTATE ISA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i118: "(snpresps1 T ≠ [] ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i119: "(snpresps2 T ≠ [] ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i120: "(length (snpresps1 T) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i121: "(length (snpresps2 T) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i126: "(HSTATE SAD T ∧ snpresps1 T ≠ [] ⟶ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i127: "(HSTATE SAD T ∧ snpresps2 T ≠ [] ⟶ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i128: "(HSTATE MD T ∧ reqs1 T ≠ [] ⟶ dthdatas1 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i129: "(HSTATE MD T ∧ reqs2 T ≠ [] ⟶ dthdatas2 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i130: "(HSTATE ID T ∧ dthdatas1 T ≠ [] ⟶ CSTATE Invalid T 0 ∨ CSTATE ISAD T 0 ∨ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i131: "(HSTATE ID T ∧ dthdatas2 T ≠ [] ⟶ CSTATE Invalid T 1 ∨ CSTATE ISAD T 1 ∨ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i132: "(HSTATE ID T ∧ dthdatas1 T ≠ [] ⟶ ¬CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i133: "(HSTATE ID T ∧ dthdatas2 T ≠ [] ⟶ ¬CSTATE MIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i136: "(dthdatas1 T ≠ [] ∧ HSTATE SD T ⟶ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i137: "(dthdatas2 T ≠ [] ∧ HSTATE SD T ⟶ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i138: "(CSTATE ISD T 0 ∧ nextHTDDataPending T 0 ⟶ nextLoad T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i139: "(CSTATE ISD T 1 ∧ nextHTDDataPending T 1 ⟶ nextLoad T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i142: "(C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (λ T i. ¬nextSnoopPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i143: "(CSTATE ISAD T 0 ∧ nextGOPending T 0 ⟶ HSTATE SD T ∨ HSTATE SharedM T ∨ HSTATE MAD T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i144: "(CSTATE ISAD T 1 ∧ nextGOPending T 1 ⟶ HSTATE SD T ∨ HSTATE SharedM T ∨ HSTATE MAD T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i145: "(CSTATE ISAD T 0 ⟶ nextLoad T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i146: "(CSTATE ISAD T 1 ⟶ nextLoad T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i147: "(CSTATE ISAD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i148: "(CSTATE ISAD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i149: "(CSTATE ISAD T 0 ∧ nextGOPending T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i150: "(CSTATE ISAD T 1 ∧ nextGOPending T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i153: "((CSTATE Invalid T 0 ∨ CSTATE ISDI T 0) ∧ HSTATE MD T ⟶ dthdatas1 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i154: "((CSTATE Invalid T 1 ∨ CSTATE ISDI T 1) ∧ HSTATE MD T ⟶ dthdatas2 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i159: "(HSTATE ModifiedM T ⟶ snpresps2 T = [] ∧ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i160: "(HSTATE SAD T ∧ nextDTHDataFrom 0 T ⟶ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i161: "(HSTATE SAD T ∧ nextDTHDataFrom 1 T ⟶ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i164: "(HSTATE SAD T ∧ nextDTHDataFrom 0 T ⟶ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i165: "(HSTATE SAD T ∧ nextDTHDataFrom 1 T ⟶ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i166: "(HSTATE SAD T ∧ nextDTHDataFrom 0 T ⟶ reqs2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i167: "(HSTATE SAD T ∧ nextDTHDataFrom 1 T ⟶ reqs1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i168: "(HSTATE SD T ∧ nextDTHDataFrom 0 T ⟶ reqs2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i169: "(HSTATE SD T ∧ nextDTHDataFrom 1 T ⟶ reqs1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i170: "(HSTATE SharedM T ∧ nextReqIs RdOwn T 0 ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i171: "(HSTATE SharedM T ∧ nextReqIs RdOwn T 1 ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i172: "(HSTATE SharedM T ∧ nextReqIs RdShared T 0 ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i173: "(HSTATE SharedM T ∧ nextReqIs RdShared T 1 ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i178: "(CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ⟶ HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i179: "(CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ⟶ HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i180: "(CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePullDrop T 0 ⟶ HSTATE SharedM T ∨ HSTATE InvalidM T ∨ HSTATE ModifiedM T ∨ HSTATE SB T ∨ HSTATE ID T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i181: "(CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePullDrop T 1 ⟶ HSTATE SharedM T ∨ HSTATE InvalidM T ∨ HSTATE ModifiedM T ∨ HSTATE SB T ∨ HSTATE ID T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i182: "(CSTATE IMAD T 0 ∧ nextHTDDataPending T 0 ⟶  HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i183: "(CSTATE IMAD T 1 ∧ nextHTDDataPending T 1 ⟶  HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i186: "(HSTATE SharedM T ⟶ dthdatas1 T = [] ∧ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i187: "(CSTATE MIA T 1 ⟶ ¬CSTATE MIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i188: "(CSTATE MIA T 0 ⟶ ¬CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i189: "(HSTATE ModifiedM T ⟶ dthdatas2 T = [] ∧ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i190: "(nextDTHDataFrom  0 T ⟶ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i191: "(nextDTHDataFrom  1 T ⟶ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i192: "(nextDTHDataFrom 0 T ⟶ ¬ nextDTHDataFrom 1 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i193: "(nextDTHDataFrom 1 T ⟶ ¬ nextDTHDataFrom 0 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i194: "(HSTATE SA T ⟶ dthdatas2 T = [] ∧ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i195: "(HSTATE SD T ⟶ ¬ CSTATE IIA T 0 ∨ ¬ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i196: "(HSTATE SAD T ⟶ (¬ CSTATE IIA T 0 ∨ nextSnpRespIs RspIFwdM T 0) ∧ (¬ CSTATE IIA T 1 ∨ nextSnpRespIs RspIFwdM T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i197: "(CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ⟶ ¬ nextDTHDataFrom 1 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i198: "(CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ⟶ ¬ nextDTHDataFrom 0 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i199: "(CSTATE IIA T 0 ⟶ ¬ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i200: "(CSTATE IIA T 1 ⟶ ¬ CSTATE IIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i301: "(CSTATE MIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ⟶ ¬ nextDTHDataFrom 1 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i302: "(CSTATE MIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ⟶ ¬ nextDTHDataFrom 0 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i305: "(snpresps1 T ≠ [] ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i306: "(snpresps2 T ≠ [] ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i307: "(HSTATE SharedM T ∧ nextReqIs RdShared T 1 ⟶ ¬ nextGOPendingIs GO_WritePull T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i308: "(HSTATE SharedM T ∧ nextReqIs RdShared T 0 ⟶ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i309: "(HSTATE SD T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i310: "(HSTATE SD T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i313: "(HSTATE ModifiedM T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i314: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i315: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextReqIs RdShared T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i316: "(CSTATE SIA T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i317: "(CSTATE SIA T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i318: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (λ T i. ¬nextSnoopPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i319: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ⟶ HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i320: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ⟶ HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i321: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextDTHDataPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i322: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ⟶ ¬ nextDTHDataFrom 1 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i323: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ⟶ ¬ nextDTHDataFrom 0 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i324: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i325: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextReqIs RdShared T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i326: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (λ T i. ¬nextSnoopPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i327: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePullDrop T 0 ⟶ HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T ∨ HSTATE IB T ∨ HSTATE ModifiedM T ∨ HSTATE ID T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i328: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePullDrop T 1 ⟶ HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T ∨ HSTATE IB T ∨ HSTATE ModifiedM T ∨ HSTATE ID T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i329: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextDTHDataPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i332: "(CSTATE SMAD T 0 ∧ nextHTDDataPending T 0 ⟶  HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i333: "(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ⟶  HSTATE SharedM T ∨ HSTATE SA T ∨ HSTATE MA T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i334: "(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ⟶  HSTATE SharedM T ∨ HSTATE SA T ∨ HSTATE MA T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i335: "(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ (CSTATE IMAD T 1 ∧ nextHTDDataPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i336: "(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ (CSTATE IMAD T 0 ∧ nextHTDDataPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i337: "(C_not_C_msg Modified IMAD nextGOPending T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i338: "(CSTATE IMAD T 0 ∧ nextGOPending T 0 ⟶ HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i339: "(CSTATE IMAD T 0 ⟶ nextStore T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i340: "(CSTATE IMAD T 1 ⟶ nextStore T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i341: "(CSTATE IMAD T 0 ∧ nextGOPending T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i342: "(CSTATE IMAD T 1 ∧ nextGOPending T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i343: "(snpresps1 T ≠ [] ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i344: "(snpresps2 T ≠ [] ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i345: "(CSTATE SMAD T 1 ∧ nextHTDDataPending T 1 ⟶  HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i346: "(CSTATE IMAD T 1 ∧ nextGOPending T 1 ⟶  HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i347: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ⟶  HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i348: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ⟶  HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i349: "(CSTATE SMAD T 0 ⟶ nextStore T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i350: "(CSTATE SMAD T 1 ⟶ nextStore T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i351: "(C_msg_P_same IMA (nextGOPending) nextStore T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i352: "(CSTATE IMA T 0 ∨ CSTATE SMA T 0 ∨ CSTATE ISA T 0 ⟶ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i353: "(CSTATE IMA T 1 ∨ CSTATE SMA T 1 ∨ CSTATE ISA T 1 ⟶ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i354: "(C_msg_P_oppo IMA (nextGOPending) (λ T i. ¬nextSnoopPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i355: "(C_msg_P_oppo SMA (nextGOPending) (λ T i. ¬nextSnoopPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i356: "(C_msg_P_oppo ISA (nextGOPending) (λ T i. ¬nextSnoopPending T i) T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i357: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶  HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i358: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶  HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i365: "(C_msg_P_same SMA (nextGOPending) nextStore T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i366: "((CSTATE SMA T 0 ∧ nextGOPending T 0 ∨ CSTATE IMD T 0 ∧ nextHTDDataPending T 0 ∨ CSTATE SMD T 0 ∧ nextHTDDataPending T 0) ⟶  HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i367: "((CSTATE SMA T 1 ∧ nextGOPending T 1 ∨ CSTATE IMD T 1 ∧ nextHTDDataPending T 1 ∨ CSTATE SMD T 1 ∧ nextHTDDataPending T 1) ⟶  HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i368: "(CSTATE ISD T 0 ∨ CSTATE ISAD T 0 ∨ CSTATE ISA T 0 ∨ CSTATE ISDI T 0 ⟶ nextLoad T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i369: "(CSTATE ISD T 1 ∨ CSTATE ISAD T 1 ∨ CSTATE ISA T 1 ∨ CSTATE ISDI T 1 ⟶ nextLoad T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i370: "(CSTATE IMD T 0 ∨ CSTATE IMAD T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMD T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE SMA T 0  ⟶ nextStore T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i371: "(CSTATE IMD T 1 ∨ CSTATE IMAD T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMD T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE SMA T 1  ⟶ nextStore T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i374: "(CSTATE ISA T 0 ∧ nextGOPending T 0 ⟶ HSTATE SharedM T ∨ HSTATE MAD T ∨ HSTATE MA T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i375: "(CSTATE ISA T 1 ∧ nextGOPending T 1 ⟶ HSTATE SharedM T ∨ HSTATE MAD T ∨ HSTATE MA T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i376: "(CSTATE ISDI T 0 ∧ nextHTDDataPending T 0 ⟶ HSTATE ModifiedM T ∨ HSTATE MAD T  ∨ HSTATE MA T ∨ HSTATE MD T∨ HSTATE ID T ∨ HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i377: "(CSTATE ISDI T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ reqresps1 T = [] ∧ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i378: "(CSTATE ISDI T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ reqresps2 T = [] ∧ snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i379: "(CSTATE ISDI T 0 ⟶ ¬nextReqIs RdOwn T 1 ∨ ¬HSTATE ModifiedM T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i380: "(CSTATE ISDI T 1 ⟶ ¬nextReqIs RdOwn T 0 ∨ ¬HSTATE ModifiedM T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i381: "(CSTATE Invalid T 0 ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i382: "(CSTATE Invalid T 1 ⟶ reqresps2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i383: "(CSTATE ISDI T 1 ∧ nextHTDDataPending T 1 ⟶ HSTATE ModifiedM T ∨ HSTATE MAD T  ∨ HSTATE MA T ∨ HSTATE MD T∨ HSTATE ID T ∨ HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i384: "(CSTATE Shared T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i385: "(CSTATE Shared T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i388: "(CSTATE SMAD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ snps2 T = [] ∧ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i389: "(CSTATE SMAD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ snps1 T = [] ∧ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i390: "(CSTATE SMAD T 0 ∧ reqresps1 T = [] ∧ htddatas1 T = [] ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i391: "(CSTATE SMAD T 1 ∧ reqresps2 T = [] ∧ htddatas2 T = [] ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i392: "(nextReqIs RdOwn T 0 ⟶ CSTATE SMAD T 0 ∨ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i393: "(nextReqIs RdOwn T 1 ⟶ CSTATE SMAD T 1 ∨ CSTATE IMAD T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i396: "(CSTATE SMAD T 0 ∧ nextSnoopIs SnpInv T 0 ∧ CXL_SPG_used T 0 ⟶ nextReqIs RdOwn T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i397: "(CSTATE SMAD T 1 ∧ nextSnoopIs SnpInv T 1 ∧ CXL_SPG_used T 1 ⟶ nextReqIs RdOwn T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i400: "(CSTATE ISD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i401: "(CSTATE ISD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i406: "(CSTATE IMA T 0 ∨ CSTATE SMA T 0 ∨ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0)  ⟶ dthdatas1 T = [] ∧ (dthdatas2 T = [] ∨ HSTATE MB T ∨ HSTATE ModifiedM T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i407: "(CSTATE IMA T 1 ∨ CSTATE SMA T 1 ∨ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1)  ⟶ dthdatas2 T = [] ∧ (dthdatas1 T = [] ∨ HSTATE MB T ∨ HSTATE ModifiedM T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i408: "(HSTATE MD T ⟶ snpresps1 T = [] ∧ snpresps2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i415: "(HSTATE ModifiedM T  ∧ nextReqIs RdOwn T 0 ⟶ (CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i416: "(HSTATE ModifiedM T  ∧ nextReqIs RdOwn T 1 ⟶ (CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i417: "((CSTATE Invalid T 0 ∨ CSTATE ISDI T 0) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i418: "((CSTATE Invalid T 1 ∨ CSTATE ISDI T 1) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i419: "(CSTATE IIA T 0 ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i420: "(CSTATE IIA T 1 ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i421: "(HSTATE MD T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i422: "(HSTATE MD T ∧ nextDTHDataFrom 0 T ⟶ CSTATE IMAD T 1 ∧ nextGOPending T 1 ∨ CSTATE IMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i423: "(HSTATE MD T ∧ nextDTHDataFrom 1 T ⟶ CSTATE IMAD T 0 ∧ nextGOPending T 0 ∨ CSTATE IMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i424: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i425: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ CSTATE IMAD T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i426: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i427: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ snpresps1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i430: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE Modified T 0 ∧ reqs2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i431: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE Modified T 1 ∧ reqs1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i432: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i433: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ reqresps1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i437: "(CSTATE IMD T 0 ∨ CSTATE SMD T 0 ∨ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextGOPending T 0) ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i438: "(CSTATE IMD T 1 ∨ CSTATE SMD T 1 ∨ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextGOPending T 1) ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i439: "(HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspSFwdM T 0) ⟶ CSTATE ISAD T 1 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i440: "(HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspSFwdM T 1) ⟶ CSTATE ISAD T 0 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i443: "(nextSnpRespIs RspSFwdM T 0 ⟶ CSTATE Shared T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE SIA T 0 ∨ CSTATE SIAC T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i444: "(nextSnpRespIs RspSFwdM T 1 ⟶ CSTATE Shared T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE SIA T 1 ∨ CSTATE SIAC T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i445: "((HSTATE SAD T ∨ HSTATE MAD T ∨ HSTATE SA T ∨ HSTATE MA T) ∧ snpresps1 T ≠ [] ⟶ htddatas1 T = [] ∨ CSTATE ISDI T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i446: "((HSTATE SAD T ∨ HSTATE MAD T ∨ HSTATE SA T ∨ HSTATE MA T) ∧ snpresps2 T ≠ [] ⟶ htddatas2 T = [] ∨ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i447: "(HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspSFwdM T 0) ⟶ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i448: "(HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspSFwdM T 1) ⟶ ¬ nextGOPendingIs GO_WritePull T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i451: "(HSTATE MAD T ∧ nextSnpRespIs RspIFwdM T 0 ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ dthdatas1 T ≠ [] ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i452: "(HSTATE MAD T ∧ nextSnpRespIs RspIFwdM T 1 ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ dthdatas2 T ≠ [] ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i453: "(HSTATE MA T ∧ snpresps1 T ≠ [] ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ [] ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i454: "(HSTATE MA T ∧ snpresps2 T ≠ [] ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ [] ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i455: "(nextReqIs DirtyEvict T 0 ⟶ CSTATE MIA T 0 ∨  CSTATE SIA T 0 ∨ CSTATE IIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i456: "(nextReqIs DirtyEvict T 1 ⟶ CSTATE MIA T 1 ∨  CSTATE SIA T 1 ∨ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i457: "(HSTATE MA T ⟶ dthdatas2 T = [] ∧ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i458: "((nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspIHitSE T 0) ⟶ CSTATE Invalid T 0 ∨ CSTATE ISDI T 0 ∨ CSTATE ISAD T 0 ∨ CSTATE IMAD T 0 ∨ CSTATE IIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i459: "((nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspIHitSE T 1) ⟶ CSTATE Invalid T 1 ∨ CSTATE ISDI T 1 ∨ CSTATE ISAD T 1 ∨ CSTATE IMAD T 1 ∨ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i462: "((CSTATE Invalid T 0  ∨ CSTATE ISDI T 0 ∨ nextReqIs RdOwn T 0) ∧ HSTATE MA T ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i463: "((CSTATE Invalid T 1  ∨ CSTATE ISDI T 1 ∨ nextReqIs RdOwn T 1) ∧ HSTATE MA T ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0))" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i464: "((CSTATE ISAD T 0 ∧ nextGOPending T 0) ∨ CSTATE ISA T 0 ∨ ( nextHTDDataPending T 0) ∨ CSTATE Shared T 0 ⟶ ¬ CSTATE Modified T 1 ∧ (dthdatas1 T = [] ∨ nextSnpRespIs RspSFwdM T 0 ∨ HSTATE SD T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i465: "((CSTATE ISAD T 1 ∧ nextGOPending T 1) ∨ CSTATE ISA T 1 ∨ ( nextHTDDataPending T 1) ∨ CSTATE Shared T 1 ⟶ ¬ CSTATE Modified T 0 ∧ (dthdatas2 T = [] ∨ nextSnpRespIs RspSFwdM T 1 ∨ HSTATE SD T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i467: "(CSTATE IMD T 0 ∨ CSTATE SMD T 0 ∨ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextGOPending T 0) ⟶ ((¬ CSTATE ISD T 1) ∧ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE SMD T 1 ∧ ¬( (CSTATE ISAD T 1 ∨ CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextGOPending T 1) ∧ ¬CSTATE ISA T 1 ∧ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1 ∧ ¬ (  nextHTDDataPending T 1) ∧  ¬ CSTATE Shared T 1 ∧ ¬ CSTATE Modified T 1) ∨ nextSnoopIs SnpInv T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i468: "(CSTATE IMD T 1 ∨ CSTATE SMD T 1 ∨ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextGOPending T 1) ⟶ ((¬ CSTATE ISD T 0) ∧ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE SMD T 0 ∧ ¬( (CSTATE ISAD T 0 ∨ CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextGOPending T 0) ∧ ¬CSTATE ISA T 0 ∧ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0 ∧ ¬ (  nextHTDDataPending T 0) ∧  ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Modified T 0) ∨ nextSnoopIs SnpInv T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i469: "(CSTATE Shared T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i470: "(CSTATE Shared T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i471: "(CSTATE ISD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i472: "(CSTATE ISD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i473: "(HSTATE MD T ∧ nextDTHDataFrom 0 T ⟶  ¬ nextReqIs CleanEvict T 0 ∧ ¬ nextReqIs CleanEvictNoData T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i474: "(HSTATE MD T ∧ nextDTHDataFrom 1 T ⟶  ¬ nextReqIs CleanEvict T 1 ∧ ¬ nextReqIs CleanEvictNoData T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i475: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶  ¬ nextReqIs CleanEvict T 0 ∧ ¬ nextReqIs CleanEvictNoData T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i476: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶  ¬ nextReqIs CleanEvict T 1 ∧ ¬ nextReqIs CleanEvictNoData T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i477: "(CSTATE Modified T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i478: "(CSTATE Modified T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i479: "(CSTATE Modified T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i480: "(CSTATE Modified T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i481: "(CSTATE MIA T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i482: "(CSTATE MIA T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i483: "(CSTATE MIA T 0 ∧ nextSnoopIs SnpData T 0 ⟶ CSTATE ISAD T 1 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i484: "(CSTATE MIA T 1 ∧ nextSnoopIs SnpData T 1 ⟶ CSTATE ISAD T 0 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i485: "(CSTATE Modified T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i486: "(CSTATE Modified T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i487: "(CSTATE Modified T 0 ∧ nextSnoopIs SnpData T 0 ⟶ CSTATE ISAD T 1 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i488: "(CSTATE Modified T 1 ∧ nextSnoopIs SnpData T 1 ⟶ CSTATE ISAD T 0 ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i489: "(CSTATE Modified T 0 ⟶ reqs1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i490: "(CSTATE Modified T 1 ⟶ reqs2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i491: "(CSTATE Modified T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ reqresps1 T = [] ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i492: "(CSTATE Modified T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ reqresps2 T = [] ∧ htddatas2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i493: "(HSTATE InvalidM T ∧ nextReqIs RdShared T 0 ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i494: "(HSTATE InvalidM T ∧ nextReqIs RdShared T 1 ⟶ dthdatas1 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i495: "(HSTATE InvalidM T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1 ∧ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i496: "(nextReqIs RdOwn T 0 ⟶ ¬ CSTATE ISAD T 0 ∧ ¬ CSTATE Invalid T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i497: "(nextReqIs RdOwn T 1 ⟶ ¬ CSTATE ISAD T 1 ∧ ¬ CSTATE Invalid T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i498: "(HSTATE InvalidM T ∧ nextReqIs RdOwn T 0 ⟶ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i499: "(HSTATE InvalidM T ∧ nextReqIs RdOwn T 1 ⟶ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i500: "(HSTATE InvalidM T ∧ nextReqIs RdOwn T 0 ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i501: "(HSTATE InvalidM T ∧ nextReqIs RdOwn T 1 ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i502: "(CSTATE SIA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ snps2 T = [] ∧ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i503: "(CSTATE SIA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ snps1 T = [] ∧ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i504: "(CSTATE SIA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i505: "(CSTATE SIA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i506: "(CSTATE SIA T 0 ∧ nextSnoopIs SnpInv T 0 ∧ CXL_SPG_used T 0 ⟶ (nextReqIs CleanEvict T 0 ∨ nextReqIs CleanEvictNoData T 0 )) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i507: "(CSTATE SIA T 1 ∧ nextSnoopIs SnpInv T 1 ∧ CXL_SPG_used T 1 ⟶ (nextReqIs CleanEvict T 1 ∨ nextReqIs CleanEvictNoData T 1 )) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i508: "(CSTATE SIA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i509: "(CSTATE SIA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i510: "(CSTATE SMAD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i511: "(CSTATE SMAD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i512: "(HSTATE ID T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1 ∧ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i513: "(HSTATE ModifiedM T ∧ nextReqIs DirtyEvict T 0 ⟶ (¬ CSTATE Modified T 0 ∨ ¬ CSTATE Modified T 1) ∧ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i514: "(HSTATE ModifiedM T ∧ nextReqIs DirtyEvict T 1 ⟶ (¬ CSTATE Modified T 0 ∨ ¬ CSTATE Modified T 1) ∧ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i515: "(HSTATE ID T ∧ nextReqIs RdOwn T 0 ⟶ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i516: "(HSTATE ID T ∧ nextReqIs RdOwn T 1 ⟶ CSTATE IMAD T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i517: "(CSTATE SMAD T 0 ∧ nextGOPending T 0⟶ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i518: "(CSTATE SMAD T 1 ∧ nextGOPending T 1⟶ nextHTDDataPending T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i519: "(C_msg_P_oppo SMAD nextGOPending (λT i. ¬ nextSnoopPending T i) T)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i520: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 0 ⟶ CSTATE SIAC T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i521: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 1 ⟶ CSTATE SIAC T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i524: "(nextGOPendingIs GO_WritePull T 0 ∧ HSTATE InvalidM T ⟶ reqresps2 T = [] ∨ nextReqRespStateIs Invalid (reqresps2 T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i525: "(nextGOPendingIs GO_WritePull T 1 ∧ HSTATE InvalidM T ⟶ reqresps1 T = [] ∨ nextReqRespStateIs Invalid (reqresps1 T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i526: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 0 ⟶ nextEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i527: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 1 ⟶ nextEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i528: "(HSTATE SharedM T ∧ nextReqIs CleanEvict T 0 ⟶ nextEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i529: "(HSTATE SharedM T ∧ nextReqIs CleanEvict T 1 ⟶ nextEvict T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i530: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 0 ⟶ ¬ CSTATE ISDI T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i531: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 1 ⟶ ¬ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i532: "(HSTATE SharedM T ∧ nextReqIs CleanEvict T 0 ⟶ ¬ CSTATE ISDI T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i533: "(HSTATE SharedM T ∧ nextReqIs CleanEvict T 1 ⟶ ¬ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i534: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 0 ⟶ ¬ CSTATE MIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i535: "(HSTATE SharedM T ∧ nextReqIs CleanEvictNoData T 1 ⟶ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i536: "(HSTATE SharedM T ∧ nextReqIs CleanEvict T 0 ⟶ ¬ CSTATE MIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i537: "(HSTATE SharedM T ∧ nextReqIs CleanEvict T 1 ⟶ ¬ CSTATE MIA T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i538: "(CSTATE Shared T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ [] ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i539: "(CSTATE Shared T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ [] ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = []))" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i540: "(nextReqIs DirtyEvict T 0 ⟶ nextEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i541: "(nextReqIs DirtyEvict T 1 ⟶ nextEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i542: "(nextReqIs DirtyEvict T 0 ∧ HSTATE InvalidM T ⟶ ¬ nextDTHDataFrom 1 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i543: "(nextReqIs DirtyEvict T 1 ∧ HSTATE InvalidM T ⟶ ¬ nextDTHDataFrom 0 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i544: "(nextReqIs DirtyEvict T 0 ∧ HSTATE InvalidM T ⟶ ¬ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i545: "(nextReqIs DirtyEvict T 1 ∧ HSTATE InvalidM T ⟶ ¬ CSTATE ISDI T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i546: "(nextReqIs DirtyEvict T 0 ∧ HSTATE InvalidM T ⟶ (reqresps2 T = [] ∨ nextReqRespStateIs Invalid (reqresps2 T))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i547: "(nextReqIs DirtyEvict T 1 ∧ HSTATE InvalidM T ⟶ (reqresps1 T = [] ∨ nextReqRespStateIs Invalid (reqresps1 T)))" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i548: "(CSTATE SMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬(CSTATE ISA T 1 ∨ nextHTDDataPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i549: "(CSTATE SMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬(CSTATE ISA T 0 ∨ nextHTDDataPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i550: "(CSTATE SMD T 0 ∧ nextHTDDataPending T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MAD T ∧ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i551: "(CSTATE SMD T 1 ∧ nextHTDDataPending T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MAD T ∧ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i552: "(CSTATE SMD T 0 ∧ nextHTDDataPending T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T ∧ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i553: "(CSTATE SMD T 1 ∧ nextHTDDataPending T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T ∧ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i554: "(CSTATE SMD T 0 ∧ nextHTDDataPending T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i555: "(CSTATE SMD T 1 ∧ nextHTDDataPending T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i556: "(CSTATE SMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i557: "(CSTATE SMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ nextReqIs DirtyEvict T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i558: "((nextReqIs CleanEvictNoData T 0 ∨ nextReqIs CleanEvict T 0) ⟶ (CSTATE SIA T 0 ∨ CSTATE IIA T 0 ∨ CSTATE SIAC T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i559: "((nextReqIs CleanEvictNoData T 1 ∨ nextReqIs CleanEvict T 1) ⟶ (CSTATE SIA T 1 ∨ CSTATE IIA T 1 ∨ CSTATE SIAC T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i560: "((CSTATE Shared T 0 ∨ CSTATE Shared T 1) ⟶ ¬ HSTATE MD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i561: "(CSTATE Shared T 0 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i562: "(CSTATE Shared T 1 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i563: "((nextReqIs CleanEvictNoData T 0 ∨ nextReqIs CleanEvict T 0) ⟶ nextEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i564: "((nextReqIs CleanEvictNoData T 1 ∨ nextReqIs CleanEvict T 1) ⟶ nextEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i565: "((nextReqIs CleanEvictNoData T 0 ∨ nextReqIs CleanEvict T 0) ⟶ ¬ CSTATE ISDI T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i566: "((nextReqIs CleanEvictNoData T 1 ∨ nextReqIs CleanEvict T 1) ⟶ ¬ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i567: "((nextReqIs CleanEvictNoData T 0 ∨ nextReqIs CleanEvict T 0) ⟶ ¬ CSTATE MIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i568: "((nextReqIs CleanEvictNoData T 1 ∨ nextReqIs CleanEvict T 1) ⟶ ¬ CSTATE MIA T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i569: "(CSTATE IIA T 0 ∧ HSTATE SharedM T ⟶ reqs2 T = [] ∨ nextReqIs CleanEvict T 1 ∨ nextReqIs CleanEvictNoData T 1 ∨ nextReqIs RdOwn T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i570: "(CSTATE IIA T 1 ∧ HSTATE SharedM T ⟶ reqs1 T = [] ∨ nextReqIs CleanEvict T 0 ∨ nextReqIs CleanEvictNoData T 0 ∨ nextReqIs RdOwn T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i571: "(CSTATE IIA T 0 ∧ HSTATE SharedM T ⟶ CSTATE Shared T 1 ∨ CSTATE SIA T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE ISAD T 1 ∧ nextGOPending T 1 ∧ nextHTDDataPending T 1 ∨ CSTATE ISA T 1 ∧ nextGOPending T 1 ∨ CSTATE ISD T 1 ∧ nextHTDDataPending T 1 ∨ CSTATE SIAC T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i572: "(CSTATE IIA T 1 ∧ HSTATE SharedM T ⟶ CSTATE Shared T 0 ∨ CSTATE SIA T 0 ∨ CSTATE SMAD T 0 ∨ CSTATE ISAD T 0 ∧ nextGOPending T 0 ∧ nextHTDDataPending T 0 ∨ CSTATE ISA T 0 ∧ nextGOPending T 0 ∨ CSTATE ISD T 0 ∧ nextHTDDataPending T 0 ∨ CSTATE SIAC T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i573: "(CSTATE IIA T 1 ∧ HSTATE InvalidM T ∧ nextReqIs RdShared T 0 ⟶ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i574: "(CSTATE IIA T 0 ∧ HSTATE InvalidM T ∧ nextReqIs RdShared T 1 ⟶ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i575: "(HSTATE InvalidM T ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0 ∧ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE SMD T 0 ∧  ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1 ∧ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i576: "(HSTATE InvalidM T ⟶ ¬ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0)) ∧ ¬ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i577: "(nextGOPendingIs GO_WritePull T 0 ∨ nextGOPendingIs GO_WritePull T 1 ⟶ ¬ HSTATE InvalidM T)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i578: "(CSTATE MIA T 0 ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1 ∧ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i579: "(CSTATE MIA T 1 ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0 ∧ ¬ nextHTDDataPending T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i580: "(nextGOPendingIs GO_WritePull T 0 ⟶ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i581: "(nextGOPendingIs GO_WritePull T 1 ⟶ ¬ nextGOPendingIs GO_WritePull T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i582: "((CSTATE IMA T 0 ∨ CSTATE SMA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0) ⟶ (HSTATE MA T ∨ HSTATE ModifiedM T ∨ HSTATE MB T ∨ HSTATE MAD T ∨ HSTATE SAD T)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i583: "((CSTATE IMA T 1 ∨ CSTATE SMA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1) ⟶ (HSTATE MA T ∨ HSTATE ModifiedM T ∨ HSTATE MB T ∨ HSTATE MAD T ∨ HSTATE SAD T))" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i584: "(CSTATE MIA T 0 ⟶ snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i585: "(CSTATE MIA T 1 ⟶ snps1 T = [] ∧ snpresps1 T = [] ∧ htddatas2 T = [])" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i586: "(CSTATE MIA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i587: "(CSTATE MIA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i588: "(CSTATE MIA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i589: "(CSTATE MIA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i590: "((HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE ModifiedM T) ⟶ (¬ nextGOPendingIs GO_WritePull T 0) ∧ (¬ nextGOPendingIs GO_WritePull T 1))" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i591: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePullDrop T 0 ∧ CSTATE IIA T 1 ⟶ HSTATE InvalidM T ∨ HSTATE IB T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i592: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePullDrop T 1 ∧ CSTATE IIA T 0 ⟶ HSTATE InvalidM T ∨ HSTATE IB T)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i593: "(HSTATE InvalidM T ⟶ dthdatas1 T = [] ∧ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i594: "(CSTATE Invalid T 0 ⟶ ¬ nextSnoopIs SnpInv T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i595: "(CSTATE Invalid T 1 ⟶ ¬ nextSnoopIs SnpInv T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i596: "(CSTATE Modified T 0 ⟶ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i597: "(CSTATE Modified T 1 ⟶ ¬ CSTATE MIA T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i598: "(HSTATE MA T ∧ nextSnoopIs SnpInv T 0 ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ [] ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i599: "(HSTATE MA T ∧ nextSnoopIs SnpInv T 1 ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ [] ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i600: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ⟶ snps2 T = [] ∧ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i601: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ⟶ snps1 T = [] ∧ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i602: "(HSTATE MA T ∧ nextSnoopIs SnpInv T 0 ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i603: "(HSTATE MA T ∧ nextSnoopIs SnpInv T 1 ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i604: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ CSTATE ISD T 0 ∧ ¬ CSTATE ISA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i605: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ CSTATE ISD T 1 ∧ ¬ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i606: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ CSTATE SMD T 0 ∧ ¬ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i607: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ CSTATE SMD T 1 ∧ ¬ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i608: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE IMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i609: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE IMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i610: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ (CSTATE ISAD T 0 ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i611: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ (CSTATE IMAD T 0 ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i612: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ (CSTATE SMAD T 0 ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i613: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ (CSTATE ISAD T 1 ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i614: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ (CSTATE IMAD T 1 ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i615: "(HSTATE InvalidM T ∨ HSTATE ID T ⟶ ¬ (CSTATE SMAD T 1 ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i616: "(CSTATE ISD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ []) ∨ ((CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i617: "(CSTATE ISD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ []) ∨ ((CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i618: "(CSTATE ISA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ []) ∨ ((CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i619: "(CSTATE ISA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ []) ∨ ((CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i620: "(CSTATE ISAD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ []) ∨ ((CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i621: "(CSTATE ISAD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ []) ∨ ((CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = [])) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i622: "(CSTATE IMAD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i623: "(CSTATE IMAD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i624: "(CSTATE IMD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i625: "(CSTATE IMD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i626: "(CSTATE IMA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i627: "(CSTATE IMA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i628: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i629: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i630: "(CSTATE SMD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i631: "(CSTATE SMD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i632: "(CSTATE SMA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i633: "(CSTATE SMA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i634: "(CSTATE ISD T 0 ∨ CSTATE ISA T 0 ⟶ ¬ HSTATE MD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i635: "(CSTATE ISD T 1 ∨ CSTATE ISA T 1 ⟶ ¬ HSTATE MD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i636: "(CSTATE ISAD T 0 ∧ (nextHTDDataPending T 0 ∨ nextGOPending T 0) ⟶ ¬ HSTATE MD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i637: "(CSTATE ISAD T 1 ∧ (nextHTDDataPending T 1 ∨ nextGOPending T 1) ⟶ ¬ HSTATE MD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i638: "(CSTATE ISD T 0 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i639: "(CSTATE ISD T 1 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i640: "(CSTATE ISA T 0 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i641: "(CSTATE ISA T 1 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i642: "(CSTATE IMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ (CSTATE ISAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i643: "(CSTATE IMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ (CSTATE ISAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i644: "(CSTATE IMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ CSTATE ISA T 1 ∧ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i645: "(CSTATE IMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ CSTATE ISA T 0 ∧ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i646: "(CSTATE IMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i647: "(CSTATE IMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ CSTATE Shared T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i648: "(CSTATE ISA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i649: "(CSTATE ISA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i650: "(CSTATE ISAD T 0 ∧ nextGOPending T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i651: "(CSTATE ISAD T 1 ∧ nextGOPending T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i652: "(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MA T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i653: "(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MA T)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i654: "(HSTATE SharedM T ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i655: "(HSTATE SharedM T ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i656: "(HSTATE SharedM T ⟶ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE SMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i657: "(HSTATE SharedM T ⟶ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i658: "(HSTATE SharedM T ⟶ ¬ (CSTATE IMAD T 0 ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i659: "(HSTATE SharedM T ⟶ ¬ (CSTATE IMAD T 1 ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i660: "(HSTATE SharedM T ⟶ ¬ (CSTATE SMAD T 0 ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i661: "(HSTATE SharedM T ⟶ ¬ (CSTATE SMAD T 1 ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i662: "(HSTATE SharedM T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i663: "(HSTATE InvalidM T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i664: "(HSTATE InvalidM T ⟶ ¬ CSTATE ISD T 0 ∧ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE SMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i665: "(HSTATE InvalidM T ⟶ ¬ CSTATE ISD T 1 ∧ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i666: "(HSTATE InvalidM T ⟶ ¬ (CSTATE ISAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i667: "(HSTATE InvalidM T ⟶ ¬ (CSTATE ISAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i668: "(HSTATE InvalidM T ⟶ ¬ (CSTATE IMAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i669: "(HSTATE InvalidM T ⟶ ¬ (CSTATE IMAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i670: "(HSTATE InvalidM T ⟶ ¬ (CSTATE SMAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i671: "(HSTATE InvalidM T ⟶ ¬ (CSTATE SMAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i672: "(HSTATE InvalidM T ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i673: "(HSTATE InvalidM T ⟶ ¬ CSTATE ISA T 1 ∧ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i674: "(HSTATE InvalidM T ⟶ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i675: "(HSTATE InvalidM T ⟶ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i676: "(HSTATE InvalidM T ⟶ ¬ CSTATE Shared T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i677: "(HSTATE InvalidM T ⟶ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i678: "(HSTATE InvalidM T ⟶ ¬ CSTATE Modified T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i679: "(CSTATE IMD T 0 ∧ nextHTDDataPending T 0 ⟶ snpresps2 T = [] ∧ reqresps1 T = [] ∧ snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i680: "(CSTATE IMD T 1 ∧ nextHTDDataPending T 1 ⟶ snpresps1 T = [] ∧ reqresps2 T = [] ∧ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i681: "(CSTATE IMAD T 0 ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ⟶ snpresps2 T = [] ∧ snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i682: "(CSTATE IMAD T 1 ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ⟶ snpresps1 T = [] ∧ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i683: "(CSTATE IMD T 0 ∧ nextSnoopIs SnpData T 0 ⟶ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i684: "(CSTATE IMD T 1 ∧ nextSnoopIs SnpData T 1 ⟶ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i685: "(CSTATE IMA T 0 ∧ nextSnoopIs SnpData T 0 ⟶ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i686: "(CSTATE IMA T 1 ∧ nextSnoopIs SnpData T 1 ⟶ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i687: "(CSTATE IMAD T 0 ∧ nextSnoopIs SnpData T 0 ⟶ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i688: "(CSTATE IMAD T 1 ∧ nextSnoopIs SnpData T 1 ⟶ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i689: "(CSTATE IMD T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i690: "(CSTATE IMD T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i691: "(CSTATE IMA T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i692: "(CSTATE IMA T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i693: "(CSTATE IMAD T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i694: "(CSTATE IMD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i695: "(CSTATE IMD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i696: "(CSTATE IMAD T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i697: "(CSTATE IMAD T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i698: "(CSTATE IMA T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i699: "(CSTATE IMA T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ HSTATE MAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i700: "(CSTATE IMAD T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i701: "(HSTATE IB T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1 ∧ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i702: "(HSTATE IB T ∧ nextReqIs RdOwn T 0 ⟶ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i703: "(HSTATE IB T ∧ nextReqIs RdOwn T 1 ⟶ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i704: "(HSTATE SB T ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Modified T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i705: "(HSTATE SB T ⟶ length (dthdatas1 T) ≤ 1 ∧ length (dthdatas2 T) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i706: "(HSTATE IB T ⟶ length (dthdatas1 T) ≤ 1 ∧ length (dthdatas2 T) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i707: "(HSTATE SB T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i708: "(HSTATE SB T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE IIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i709: "(HSTATE MB T ⟶ length (dthdatas1 T) ≤ 1 ∧ length (dthdatas2 T) ≤ 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i710: "(HSTATE SB T ∧ nextDTHDataFrom 0 T ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i711: "(HSTATE SB T ∧ nextDTHDataFrom 1 T ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i712: "(HSTATE IB T ∧ nextDTHDataFrom 0 T ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i713: "(HSTATE IB T ∧ nextDTHDataFrom 1 T ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i714: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i715: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i716: "(HSTATE SB T ⟶ snps2 T = [] ∧ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i717: "(HSTATE IB T ⟶ snps2 T = [] ∧ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i718: "(HSTATE MB T ⟶ snps2 T = [] ∧ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i719: "(HSTATE SB T ∧ nextDTHDataFrom 0 T ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i720: "(HSTATE SB T ∧ nextDTHDataFrom 1 T ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i721: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i722: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i723: "(HSTATE IB T ∧ nextDTHDataFrom 0 T ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i724: "(HSTATE IB T ∧ nextDTHDataFrom 1 T ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i725: "(HSTATE SB T ⟶ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE SMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i726: "(HSTATE SB T ⟶ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i727: "(HSTATE IB T ⟶ ¬ CSTATE IMD T 0 ∧ ¬ CSTATE SMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i728: "(HSTATE IB T ⟶ ¬ CSTATE IMD T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i729: "(HSTATE SharedM T ∧ lastSharer T ∧ nextReqIs CleanEvictNoData T 0 ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i730: "(HSTATE SharedM T ∧ lastSharer T ∧ nextReqIs CleanEvictNoData T 1 ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i731: "(HSTATE SharedM T ∧ lastSharer T ∧ nextReqIs CleanEvictNoData T 0 ⟶ ¬ (CSTATE ISAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i732: "(HSTATE SharedM T ∧ lastSharer T ∧ nextReqIs CleanEvictNoData T 1 ⟶ ¬ (CSTATE ISAD T 0 ∧ nextGOPending T 0))" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i733: "(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ⟶ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i734: "(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ⟶ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i735: "(HSTATE SAD T ∧ nextDTHDataFrom 0 T ⟶ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i736: "(HSTATE SAD T ∧ nextDTHDataFrom 1 T ⟶ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i737: "(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i738: "(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ∧ HSTATE MA T ⟶ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i739: "(HSTATE ModifiedM T ⟶ (¬ CSTATE SIA T 0 ∨ nextGOPendingIs GO_WritePullDrop T 0) ∧ (¬ CSTATE SIA T 1 ∨ nextGOPendingIs GO_WritePullDrop T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i740: "(HSTATE MA T ∧ snpresps1 T ≠ [] ⟶ ¬ CSTATE SIA T 0 ∧ ¬ CSTATE SIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i741: "(HSTATE MA T ∧ snpresps2 T ≠ [] ⟶ ¬ CSTATE SIA T 0 ∧ ¬ CSTATE SIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i742: "(HSTATE MD T ⟶ ¬ CSTATE SIA T 0 ∧ ¬ CSTATE SIA T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i743: "(CSTATE MIA T 0 ⟶ ¬ (CSTATE IMAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i744: "(CSTATE MIA T 1 ⟶ ¬ (CSTATE IMAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i745: "(CSTATE MIA T 0 ⟶ ¬ (CSTATE SMAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i746: "(CSTATE MIA T 1 ⟶ ¬ (CSTATE SMAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i747: "(HSTATE ModifiedM T ∧ nextReqIs RdOwn T 0 ⟶ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i748: "(HSTATE ModifiedM T ∧ nextReqIs RdOwn T 1 ⟶ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i749: "(HSTATE ModifiedM T ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i750: "(HSTATE MD T ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i751: "(HSTATE MA T ∧ snpresps1 T ≠ [] ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i752: "(HSTATE MA T ∧ snpresps2 T ≠ [] ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i753: "(CSTATE MIA T 0 ∧ HSTATE ModifiedM T ⟶ ¬ CSTATE SMA T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i754: "(CSTATE MIA T 1 ∧ HSTATE ModifiedM T ⟶ ¬ CSTATE SMA T 0 ∧ ¬ CSTATE SMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i755: "(CSTATE MIA T 0 ∧ HSTATE ModifiedM T ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE IMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i756: "(CSTATE MIA T 1 ∧ HSTATE ModifiedM T ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE IMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i757: "(CSTATE MIA T 0 ∧ HSTATE ModifiedM T ⟶ ¬ (CSTATE IMAD T 1 ∧ (nextGOPending T 1 ∨ nextHTDDataPending T 1))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i758: "(CSTATE MIA T 1 ∧ HSTATE ModifiedM T ⟶ ¬ (CSTATE IMAD T 0 ∧ (nextGOPending T 0 ∨ nextHTDDataPending T 0))) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i759: "(CSTATE MIA T 0 ∧ HSTATE ModifiedM T ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i760: "(CSTATE MIA T 1 ∧ HSTATE ModifiedM T ⟶ ¬ CSTATE SMAD T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i761: "(CSTATE IMD T 1 ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i762: "(CSTATE IMD T 0 ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i763: "(HSTATE IB T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i764: "(HSTATE IB T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i765: "(HSTATE IB T ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE ISD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i766: "(HSTATE IB T ⟶ ¬ CSTATE ISA T 1 ∧ ¬ CSTATE ISD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i767: "(HSTATE IB T ⟶ ¬ CSTATE SMA T 0 ∧ ¬ CSTATE SMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i768: "(HSTATE IB T ⟶ ¬ CSTATE SMA T 1 ∧ ¬ CSTATE SMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i769: "(HSTATE IB T ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE IMD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i770: "(HSTATE IB T ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE IMD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i771: "(HSTATE IB T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i772: "(HSTATE IB T ⟶ ¬ nextHTDDataPending T 0 ∧ ¬ nextHTDDataPending T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i773: "(HSTATE ID T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i774: "(HSTATE ID T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i775: "(HSTATE ID T ∧ nextDTHDataFrom 0 T ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i776: "(HSTATE ID T ∧ nextDTHDataFrom 1 T ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i777: "(HSTATE ID T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i778: "(HSTATE ID T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i779: "(HSTATE ModifiedM T ∧ nextReqIs RdShared T 0 ⟶ ¬ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i780: "(HSTATE ModifiedM T ∧ nextReqIs RdShared T 1 ⟶ ¬ CSTATE ISDI T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i781: "(HSTATE SD T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i782: "(HSTATE SAD T ∧ snpresps1 T ≠ [] ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i783: "(HSTATE SAD T ∧ snpresps2 T ≠ [] ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i784: "(HSTATE MD T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i785: "(snpresps1 T ≠ [] ∧ HSTATE MAD T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i786: "(snpresps2 T ≠ [] ∧ HSTATE MAD T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i787: "(CSTATE IMD T 0 ∧ HSTATE MD T ⟶ snpresps1 T = [] ∧ snps1 T = [] ∧ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i788: "(CSTATE IMD T 1 ∧ HSTATE MD T ⟶ snpresps2 T = [] ∧ snps2 T = [] ∧ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i789: "(nextDTHDataFrom 0 T ∧ HSTATE MD T ∧ nextReqIs RdOwn T 0 ⟶ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i790: "(nextDTHDataFrom 1 T ∧ HSTATE MD T ∧ nextReqIs RdOwn T 1 ⟶ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i791: "(HSTATE SAD T ∧ nextSnpRespIs RspSFwdM T 0 ⟶ ¬ CSTATE Modified T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i792: "(HSTATE SAD T ∧ nextSnpRespIs RspSFwdM T 1 ⟶ ¬ CSTATE Modified T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i793: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE Modified T 1 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i794: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE Modified T 0 ∧ ¬ CSTATE Shared T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i795: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i796: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i797: "(HSTATE SA T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i798: "(HSTATE SharedM T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i799: "(CSTATE IIA T 0 ∧ HSTATE SA T ⟶ CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 ∨ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i800: "(CSTATE IIA T 1 ∧ HSTATE SA T ⟶ CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 ∨ CSTATE ISA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i801: "(HSTATE MA T ∧ snpresps1 T ≠ [] ⟶ htddatas1 T = [] ∨ CSTATE ISDI T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i802: "(HSTATE MA T ∧ snpresps2 T ≠ [] ⟶ htddatas2 T = [] ∨ CSTATE ISDI T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i803: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ (CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i804: "(HSTATE MB T ⟶ ¬ CSTATE ISD T 0 ∧ ¬ CSTATE ISD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i805: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ CSTATE Invalid T 0 ∨ CSTATE ISAD T 0 ∨ CSTATE IMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i806: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ CSTATE Invalid T 1 ∨ CSTATE ISAD T 1 ∨ CSTATE IMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i807: "(HSTATE MB T ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i808: "(HSTATE MB T ⟶ snpresps1 T = [] ∧ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i809: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i810: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i811: "(HSTATE MB T ⟶ ¬ CSTATE SIA T 0 ∧ ¬ CSTATE SIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i812: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextReqIs RdOwn T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i813: "(HSTATE MB T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextReqIs RdOwn T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i814: "(HSTATE MB T ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE ISA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i815: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ∧ HSTATE SB T ⟶ ¬ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i816: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ∧ HSTATE SB T ⟶ ¬ CSTATE IIA T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i817: "(HSTATE IB T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i818: "(HSTATE IB T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i819: "(HSTATE SB T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i820: "(HSTATE SB T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i821: "(HSTATE SB T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i822: "(HSTATE SB T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i823: "(HSTATE ID T ∧ nextDTHDataFrom 0 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i824: "(HSTATE ID T ∧ nextDTHDataFrom 1 T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i825: "(CSTATE Modified T 0 ⟶ ¬ nextReqIs RdOwn T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i826: "(CSTATE Modified T 1 ⟶ ¬ nextReqIs RdOwn T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i827: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE ISD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i828: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE ISD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i829: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ (CSTATE ISAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i830: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ (CSTATE ISAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i831: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ (CSTATE IMA T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i832: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ (CSTATE IMA T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i833: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ (CSTATE ISA T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i834: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ (CSTATE ISA T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i835: "((CSTATE ISAD T 0 ∧ nextGOPending T 0) ∨ CSTATE ISA T 0 ∨ ( nextHTDDataPending T 0) ∨ CSTATE Shared T 0 ⟶ ¬ (CSTATE IMA T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i836: "((CSTATE ISAD T 1 ∧ nextGOPending T 1) ∨ CSTATE ISA T 1 ∨ ( nextHTDDataPending T 1) ∨ CSTATE Shared T 1 ⟶ ¬ (CSTATE IMA T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i837: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i838: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i839: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE MIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i840: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i841: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE SIA T 0 ∧ ¬ CSTATE SIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i842: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE SIA T 1 ∧ ¬ CSTATE SIA T 0)  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i843: "(CSTATE Modified T 0 ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1 ∧ (htddatas2 T = [] ∨ CSTATE ISDI T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i844: "(CSTATE Modified T 1 ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0 ∧ (htddatas1 T = [] ∨ CSTATE ISDI T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i845: "(CSTATE Modified T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i846: "(CSTATE Modified T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i847: "(CSTATE Modified T 0 ⟶ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i848: "(CSTATE Modified T 1 ⟶ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i849: "(CSTATE SMA T 0 ∧ nextGOPending T 0 ⟶ ¬ (CSTATE ISAD T 1 ∧ nextGOPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i850: "(CSTATE SMA T 1 ∧ nextGOPending T 1 ⟶ ¬ (CSTATE ISAD T 0 ∧ nextGOPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i851: "(CSTATE SMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE ISA T 1 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i852: "(CSTATE SMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE ISA T 0 ∧ ¬ CSTATE Shared T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i853: "(CSTATE SMA T 0 ∧ nextGOPending T 0 ⟶ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i854: "(CSTATE SMA T 1 ∧ nextGOPending T 1 ⟶ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i855: "(CSTATE SMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE IMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i856: "(CSTATE SMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE IMA T 0)  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i857: "(CSTATE Invalid T 0 ⟶ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i858: "(CSTATE Invalid T 1 ⟶ snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i859: "(HSTATE SD T ∧ nextDTHDataFrom 0 T ⟶ CSTATE ISD T 1 ∨ CSTATE ISAD T 1 ∧ nextGOPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i860: "(HSTATE SD T ∧ nextDTHDataFrom 1 T ⟶ CSTATE ISD T 0 ∨ CSTATE ISAD T 0 ∧ nextGOPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i861: "(HSTATE SAD T ⟶ ¬ nextGOPendingIs GO_WritePull T 0 ∧ ¬ nextGOPendingIs GO_WritePull T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i862: "(HSTATE SAD T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i863: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ∧ nextHTDDataPending T 0 ∧ nextSnoopIs SnpData T 0 ⟶ HSTATE SAD T ∧ CSTATE ISAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i864: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ∧ nextHTDDataPending T 1 ∧ nextSnoopIs SnpData T 1 ⟶ HSTATE SAD T ∧ CSTATE ISAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i865: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i866: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i867: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ∧ nextHTDDataPending T 0 ⟶ snps2 T = [] ∧ snpresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i868: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ∧ nextHTDDataPending T 1 ⟶ snps1 T = [] ∧ snpresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i869: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ∧ HSTATE IB T ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i870: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ∧ HSTATE IB T ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i871: "(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ∧ HSTATE SB T ⟶ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i872: "(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ∧ HSTATE SB T ⟶ ¬ CSTATE MIA T 0)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i873: "(HSTATE InvalidM T ∧ nextReqIs DirtyEvict T 0 ⟶ CSTATE IIA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i874: "(HSTATE InvalidM T ∧ nextReqIs DirtyEvict T 1 ⟶ CSTATE IIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i875: "(HSTATE InvalidM T ⟶ (¬ CSTATE SIA T 0 ∨ nextGOPendingIs GO_WritePullDrop T 0) ∧ (¬ CSTATE SIA T 1 ∨ nextGOPendingIs GO_WritePullDrop T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i876: "(HSTATE MA T  ∧ nextSnpRespIs RspIFwdM T 0 ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i877: "(HSTATE MA T  ∧ nextSnpRespIs RspIFwdM T 1 ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0))  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i878: "(HSTATE MB T ∧ nextDTHDataFrom 0 T ⟶ (CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i879: "(HSTATE MB T ∧ CSTATE IIA T 0 ⟶ (CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i880: "(HSTATE MB T ∧ CSTATE IIA T 1 ⟶ (CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i883: "length (dthdatas1 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i884: "length (dthdatas2 T) ≤ 1" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i885: "(HSTATE IB T ∧ CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i886: "(HSTATE IB T ∧ CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i887: "(HSTATE MAD T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i888: "(HSTATE MAD T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i889: "(HSTATE MA T ∧ snpresps1 T ≠ [] ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i890: "(HSTATE MA T ∧ snpresps2 T ≠ [] ⟶ ¬ CSTATE Shared T 0 ∧ ¬ CSTATE Shared T 1)  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i891: "(CSTATE IMAD T 0 ∧ nextGOPending T 0 ∧ HSTATE MD T ⟶ snpresps1 T = [] ∧ snps1 T = [] ∧ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i892: "(CSTATE IMAD T 1 ∧ nextGOPending T 1 ∧ HSTATE MD T ⟶ snpresps2 T = [] ∧ snps2 T = [] ∧ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i893: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1 ∧ (htddatas2 T = [] ∨ CSTATE ISDI T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i894: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0 ∧ (htddatas1 T = [] ∨ CSTATE ISDI T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i895: "(CSTATE SMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1 ∧ (htddatas2 T = [] ∨ CSTATE ISDI T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i896: "(CSTATE SMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0 ∧ (htddatas1 T = [] ∨ CSTATE ISDI T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i897: "(CSTATE Modified T 0 ⟶ dthdatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i898: "(CSTATE Modified T 1 ⟶ dthdatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i899: "(nextSnpRespIs RspIHitSE T 0 ⟶ ¬ CSTATE IMA T 0 ∧ ¬ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i900: "(nextSnpRespIs RspIHitSE T 1 ⟶ ¬ CSTATE IMA T 1 ∧ ¬ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i901: "(CSTATE IMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i902: "(CSTATE IMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i903: "(CSTATE SMD T 0 ∧ nextHTDDataPending T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i904: "(CSTATE SMD T 1 ∧ nextHTDDataPending T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i905: "(CSTATE IMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i906: "(CSTATE IMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i907: "(CSTATE SMA T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i908: "(CSTATE SMA T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i909: "(CSTATE IMAD T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i910: "(CSTATE IMAD T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i911: "(HSTATE MD T ∧ nextDTHDataFrom 0 T ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i912: "(HSTATE MD T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i913: "(CSTATE SMAD T 0 ∧ nextGOPending T 0 ⟶ ¬ CSTATE SMAD T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i914: "(CSTATE SMAD T 1 ∧ nextGOPending T 1 ⟶ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i915: "(HSTATE InvalidM T ⟶ ¬ CSTATE SMAD T 1 ∧ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i916: "(HSTATE IB T ⟶ ¬ CSTATE SMAD T 1 ∧ ¬ CSTATE SMAD T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i917: "(HSTATE ID T ⟶ ¬ CSTATE SMAD T 1 ∧ ¬ CSTATE SMAD T 0)  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i918: "(HSTATE MA T ∧ nextSnpRespIs RspIHitSE T 0 ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i919: "(HSTATE MA T ∧ nextSnpRespIs RspIHitSE T 1 ⟶ ¬ nextReqIs DirtyEvict T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i920: "(CSTATE Modified T 0 ⟶ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i921: "(CSTATE Modified T 1 ⟶ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i922: "(HSTATE ModifiedM T ⟶ snps1 T = [] ∧ snps2 T = [])  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i923: "(CSTATE SMAD T 0 ∧ nextHTDDataPending T 0 ∧ nextSnoopIs SnpInv T 0 ⟶ CSTATE IMAD T 1 ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i924: "(CSTATE SMAD T 1 ∧ nextHTDDataPending T 1 ∧ nextSnoopIs SnpInv T 1 ⟶ CSTATE IMAD T 0 ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i925: "(CSTATE SMAD T 1 ∧ HSTATE MA T ∧ nextSnpRespIs RspIFwdM T 0 ⟶ ¬ nextReqIs DirtyEvict T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i926: "(CSTATE SMAD T 0 ∧ HSTATE MA T ∧ nextSnpRespIs RspIFwdM T 1 ⟶ ¬ nextReqIs DirtyEvict T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i927: "(CSTATE SIAC T 0 ∧ HSTATE SA T ⟶ ¬ CSTATE Modified T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i928: "(CSTATE SIAC T 1 ∧ HSTATE SA T ⟶ ¬ CSTATE Modified T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i929: "(CSTATE SIAC T 0 ⟶ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i930: "(CSTATE SIAC T 1 ⟶ ¬ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i931: "((CSTATE SIAC T 0 ∧ nextGOPending T 0 ∧ nextGOPendingState Invalid T 0) --> snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i932: "((CSTATE SIAC T 1 ∧ nextGOPending T 1 ∧ nextGOPendingState Invalid T 1) --> snps1 T = [] ∧ snpresps1 T = [] ∧ htddatas2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i933: "((CSTATE SIAC T 0 ∧ nextGOPending T 0 ∧ nextGOPendingState Invalid T 0) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i934: "((CSTATE SIAC T 1 ∧ nextGOPending T 1 ∧ nextGOPendingState Invalid T 1) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i935: "((CSTATE SIAC T 0 ∧ nextGOPending T 0 ∧ nextGOPendingState Invalid T 0) ∧ HSTATE MD T ⟶ dthdatas1 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i936: "((CSTATE SIAC T 1 ∧ nextGOPending T 1 ∧ nextGOPendingState Invalid T 1) ∧ HSTATE MD T ⟶ dthdatas2 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i937: "((CSTATE SIAC T 0 ∧ nextGOPending T 0 ∧ nextGOPendingState Invalid T 0) ∧ HSTATE MA T ⟶(CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i938: "((CSTATE SIAC T 1 ∧ nextGOPending T 1 ∧ nextGOPendingState Invalid T 1) ∧ HSTATE MA T ⟶(CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i939: "((CSTATE SIAC T 0 ∧ nextGOPending T 0 ∧ nextGOPendingState Invalid T 0) --> snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i940: "((CSTATE SIAC T 1 ∧ nextGOPending T 1 ∧ nextGOPendingState Invalid T 1) --> snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i941: "((CSTATE SIAC T 0 ∧ nextGOPending T 0 ∧ nextGOPendingState Invalid T 0) --> reqs1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i942: "((CSTATE SIAC T 1 ∧ nextGOPending T 1 ∧ nextGOPendingState Invalid T 1) --> reqs2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i943: "(HSTATE MA T ∧ nextSnpRespIs RspIFwdM T 0 ⟶ ¬ nextHTDDataPending T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i944: "(HSTATE MA T ∧ nextSnpRespIs RspIFwdM T 1 ⟶ ¬ nextHTDDataPending T 1)" 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i945: "(HSTATE SB T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i946: "(nextReqIs CleanEvictNoData T 0 ⟶ CSTATE SIAC T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i947: "(nextReqIs CleanEvictNoData T 1 ⟶ CSTATE SIAC T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i948: "(nextSnpRespIs RspIHitSE T 0 ⟶ ¬ nextDTHDataFrom 0 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i949: "(nextSnpRespIs RspIHitSE T 1 ⟶ ¬ nextDTHDataFrom 1 T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i950: "(nextSnpRespIs RspIFwdM T 0 ⟶ ¬ nextReqIs CleanEvictNoData T 0) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i951: "(nextSnpRespIs RspIFwdM T 1 ⟶ ¬ nextReqIs CleanEvictNoData T 1)  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i952: "(CSTATE SMA T 0 ∧ nextSnoopIs SnpData T 0 ∧ nextGOPending T 0 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i953: "(CSTATE SMA T 1 ∧ nextSnoopIs SnpData T 1 ∧ nextGOPending T 1 ⟶ HSTATE SAD T) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i954: "((CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePullDrop T 0) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨(CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i955: "((CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePullDrop T 1) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨(CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0)   " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i956: "((CSTATE SIAC T 0 ∧ nextGOPendingIs GO T 0 ∧ nextGOPendingState Invalid T 0 ∧ ¬ CSTATE IIA T 1 ∧ GTS T 1) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨(CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i957: "((CSTATE SIAC T 1 ∧ nextGOPendingIs GO T 1 ∧ nextGOPendingState Invalid T 1 ∧ ¬ CSTATE IIA T 0 ∧ GTS T 0) ∧ HSTATE ModifiedM T ⟶ CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∧ nextGOPending T 0 ∨(CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ nextGOPending T 0 ∨ (CSTATE IMD T 0 ∨ CSTATE SMD T 0) ∧ nextHTDDataPending T 0)   " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i958: "((CSTATE SIAC T 0 ∧ nextGOPendingIs GO T 0 ∧ nextGOPendingState Invalid T 0 ∧ ¬ CSTATE IIA T 1 ∧ GTS T 1) ∧ HSTATE MD T ⟶ dthdatas1 T ≠ []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i959: "((CSTATE SIAC T 1 ∧ nextGOPendingIs GO T 1 ∧ nextGOPendingState Invalid T 1 ∧ ¬ CSTATE IIA T 0 ∧ GTS T 0) ∧ HSTATE MD T ⟶ dthdatas2 T ≠ [])  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i960: "((CSTATE SIAC T 0 ∧ nextGOPendingIs GO T 0 ∧ nextGOPendingState Invalid T 0 ∧ ¬ CSTATE IIA T 1 ∧ GTS T 1) ∧ HSTATE MA T ⟶ ((CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∨ CSTATE IMA T 1 ∨ CSTATE SMA T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i961: "((CSTATE SIAC T 1 ∧ nextGOPendingIs GO T 1 ∧ nextGOPendingState Invalid T 1 ∧ ¬ CSTATE IIA T 0 ∧ GTS T 0) ∧ HSTATE MA T ⟶ ((CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ nextHTDDataPending T 0 ∨ CSTATE IMA T 0 ∨ CSTATE SMA T 0)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i962: "(HSTATE SD T ∧ nextDTHDataFrom 0 T ⟶ snps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i963: "(HSTATE SD T ∧ nextDTHDataFrom 1 T ⟶ snps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i964: "(HSTATE SD T ∧ nextDTHDataFrom 0 T ⟶ reqresps1 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i965: "(HSTATE SD T ∧ nextDTHDataFrom 1 T ⟶ reqresps2 T = []) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i966: "(HSTATE ID T ∧ nextDTHDataFrom 0 T ⟶ (¬ CSTATE SIA T 1 ∨ nextGOPendingIs GO_WritePullDrop T 1) ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i967: "(HSTATE ID T ∧ nextDTHDataFrom 1 T ⟶ (¬ CSTATE SIA T 0 ∨ nextGOPendingIs GO_WritePullDrop T 0) ) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i968: "(CSTATE MIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 ∧ HSTATE ID T ⟶ (¬ CSTATE SIA T 1 ∨ nextGOPendingIs GO_WritePullDrop T 1)) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i969: "(CSTATE MIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 ∧ HSTATE ID T ⟶ (¬ CSTATE SIA T 0 ∨ nextGOPendingIs GO_WritePullDrop T 0))  " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i970: "(HSTATE SAD T ∧ nextDTHDataFrom 1 T ⟶ ¬ CSTATE MIA T 0 ∧ ¬ CSTATE MIA T 1) " 
processing by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption) 
processing have i220: "HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T" 
processing using i1x i2x i366 
processing by blast 
processing have i221: " CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing by (smt (verit) IMDData_Modified) 
processing have i222: "nextStore T 0" 
processing using i1x i370 
processing by blast 
processing have aux_r39:  "(CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧
  nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶
  nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) " 
processing using CSTATE_inequality_invariant i221 
processing by blast 
processing have aux_r42: "(CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧
  nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶
  ¬ nextDTHDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0)" 
processing using CSTATE_inequality_invariant i221 
processing by blast 
processing have aux3_r42: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1  = CSTATE IIA T 1" 
processing using CSTATE_IMDData_otherside 
processing by blast 
processing have aux4_r42: "
  nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 =
  nextGOPendingIs GO_WritePull T 1" 
processing using IMDData_nextGOPendingIs 
processing by blast 
processing have aux5_r42: "
   nextDTHDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 = 
  nextDTHDataPending T 1" 
processing using device_perform_op_dthdatas2 nextDTHDataPending_def 
processing by presburger 
processing have aux2_r42: "(CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧
  nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶
  ¬ nextDTHDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1)" 
processing using C_msg_P_same_def aux3_r42 aux4_r42 aux5_r42 i40 
processing by presburger 
processing have aux_r93: "(CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧
  nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶
  nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0)" 
processing using CSTATE_inequality_invariant i221 
processing by blast 
processing have auxHTD: "htddatas1  (T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing using i77 
processing by (metis device_perform_op_htddatas1) 
processing have auxHTDplus: "¬ nextHTDDataPending (T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing using auxHTD 
processing by (metis HTDDataPending_htddatas_invariant1) 
processing show ?thesis 
processing unfolding SWMR_state_machine_def 
processing proof (intro conjI) 
processing show goal1: "SWMR ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_otherside_rule_5_0 CSTATE_various_forms1 CSTATE_various_forms6 assms devcache2_consume_hdata1_invariant devcache2_copy_hdata1_invariant devcache2_copy_perform1_invariant devcache2_sequals1_invariant i221 i646)  processing done 
processing show goal2: "C_msg_P_oppo ISD nextHTDDataPending (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(331) MESI_State.distinct(405) assms i352 i467 i472 i480 i511)  processing done 
processing show goal3: "H_msg_P_same SD nextDTHDataPending (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) HOST_State.distinct(141) HOST_State.distinct(147) HOST_State.distinct(175) HOST_State.distinct(269) HOST_State.distinct(37) HOST_State.distinct(9) HSTATE_general_rule_5_0 HSTATE_invariant3 i220)  processing done 
processing show goal4: "H_msg_P_same SAD nextDTHDataPending (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing unfolding H_msg_P_same_def 
processing proof (intro conjI) 
processing show goal1: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing using auxHTD 
processing by (metis CSTATE_other_general1 SharedSnpInv'_CSTATE_invariant5_2 assms dthdatas1_general_rule_4_0 i336 i437 nextDTHDataPending_def) 
processing show goal2: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(11) MESI_State.distinct(261) i106 i1x i467 i480) 
processing done 
processing qed 
processing show goal5: "C_msg_P_oppo ISAD nextGOPending (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(11) assms i221 i642 nextGOPending_DeviceIMDData)  processing done 
processing show goal6: "H_msg_P_same SharedM (nextReqIs RdShared) (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal7: "H_msg_P_oppo SharedM (nextReqIs RdShared) (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal8: "H_msg_P_same ModifiedM (nextReqIs RdShared) (λT i. ¬ CSTATE Modified T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 C_msg_state_def HSTATE_rule_6 MESI_State.distinct(265) empty_no_snoop_variant2 i1x i467 i47 i922 nextReqIs_general_rule_7_0)  processing done 
processing show goal9: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (λT i. ¬ nextDTHDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing using auxHTD 
processing by (metis CSTATE_other_general2 device_perform_op_dthdatas2 H_msg_P_oppo_def SharedSnpInv'_CSTATE_invariant5 aux5_r42 dthdatas1_general_rule_4_0 hstate_invariants(17) hstate_invariants(20) hstate_invariants(24) i189 i1x i2x i437 i491 nextDTHDataPending_def nextHTDDataPending_various_forms1 remove_instr_HSTATE) 
processing show goal10: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (λT i. ¬ nextSnpRespIs RspIFwdM T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) HSTATE_rule_6 i159 nextSnpRespIs_general_rule_7_0 nextSnpRespIs_invariant1 nextSnpRespIs_property2)  processing done 
processing show goal11: "H_msg_P_same ModifiedM (nextReqIs RdShared) (λT i. ¬ nextSnpRespIs RspIFwdM T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) HSTATE_rule_6 i159 nextSnpRespIs_general_rule_7_0 nextSnpRespIs_invariant1 nextSnpRespIs_property2)  processing done 
processing show goal12: "C_H_state IMAD (nextReqIs RdOwn) Modified SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 HOST_State.distinct(141) HOST_State.distinct(169) HOST_State.distinct(175) HOST_State.distinct(269) HOST_State.distinct(7) HOST_State.distinct(9) HSTATE_invariant3 HSTATE_rule_6 MESI_State.distinct(15) i220 i221)  processing done 
processing show goal13: "C_H_state IMAD (nextReqIs RdOwn) Modified SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 HSTATE_rule_6 MESI_State.distinct(15) MESI_State.distinct(265) i106 i1x i221 i497 nextReqIs_general_rule_7_0)  processing done 
processing show goal14: "C_H_state IMAD (nextReqIs RdOwn) Modified SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 HOST_State.distinct(11) HOST_State.distinct(143) HOST_State.distinct(145) HOST_State.distinct(201) HOST_State.distinct(225) HOST_State.distinct(37) HSTATE_invariant3 HSTATE_rule_6 MESI_State.distinct(15) i220 i221)  processing done 
processing show goal15: "C_H_state Invalid nextStore Modified SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(143) MESI_State.distinct(265) MESI_State.distinct(5) assms i106 i221)  processing done 
processing show goal16: "C_H_state Invalid nextStore Modified SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 HOST_State.distinct(11) HOST_State.distinct(143) HOST_State.distinct(151) HOST_State.distinct(201) HOST_State.distinct(251) HOST_State.distinct(7) HSTATE_invariant3 HSTATE_rule_6 MESI_State.distinct(5) i220 i221)  processing done 
processing show goal17: "C_H_state Invalid nextStore Modified SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (metis CSTATE_disj1 CSTATE_otherside_rule_5_0 HOST_State.distinct(115) HOST_State.distinct(175) HOST_State.distinct(9) HSTATE_invariant3 MESI_State.distinct(143) MESI_State.distinct(265) hstate_invariants(17) hstate_invariants(20) hstate_invariants(24) i106 i1x i220 i23 remove_instr_HSTATE)  processing done 
processing show goal18: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal19: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) HOST_State.distinct(141) HOST_State.distinct(147) HOST_State.distinct(175) HOST_State.distinct(269) HOST_State.distinct(37) HOST_State.distinct(9) HSTATE_general_rule_5_0 HSTATE_invariant3 i220)  processing done 
processing show goal20: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) HOST_State.distinct(143) HOST_State.distinct(151) HOST_State.distinct(19) HOST_State.distinct(201) HOST_State.distinct(251) HOST_State.distinct(7) HSTATE_general_rule_5_0 HSTATE_invariant3 i220)  processing done 
processing show goal21: "C_msg_not RdShared IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant C_msg_not_def MESI_State.distinct(15) i221 i25 nextReqIs_IMDData)  processing done 
processing show goal22: "C_msg_not RdShared Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant C_msg_not_def MESI_State.distinct(5) i221 i26 nextReqIs_IMDData)  processing done 
processing show goal23: "H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (λT i. CSTATE MIA T i ∨ CSTATE IIA T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing proof - 
processing have f1: "¬ CSTATE MIA T 0" 
processing by (metis (lifting) CSTATE_inequality_invariant MESI_State.distinct(397) i1x) 
processing have "¬ CSTATE IIA T 0" 
processing by (metis (lifting) CSTATE_inequality_invariant MESI_State.distinct(401) i1x) 
processing moreover 
processing { 
processing assume "¬ nextReqIs DirtyEvict T 1" 
processing then 
processing have "¬ nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ nextReqIs DirtyEvict T 1 ∨ nextReqIs DirtyEvict T 0" 
processing by (metis (lifting) nextReqIs_general_rule_7_0) 
processing then 
processing have "H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (λt n. CSTATE MIA t n ∨ CSTATE IIA t n) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ nextReqIs DirtyEvict T 0" 
processing by (metis (lifting) nextReqIs_general_rule_7_0 H_msg_P_same_def) 
processing } 
processing moreover 
processing { 
processing assume "CSTATE IIA T 1" 
processing then 
processing have "nextReqIs DirtyEvict T 0 ∨ ¬ nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ (CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1)" 
processing by (metis (lifting) CSTATE_otherside_rule_5_0 nextReqIs_general_rule_7_0) 
processing then 
processing have "H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (λt n. CSTATE MIA t n ∨ CSTATE IIA t n) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ nextReqIs DirtyEvict T 0" 
processing by (metis (lifting) H_msg_P_same_def) 
processing } 
processing ultimately 
processing show ?thesis 
processing using f1 
processing by (metis (lifting) HSTATE_general_rule_5_0 H_msg_P_same_def i27 i2x i579) 
processing qed 
processing show goal24: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (λT. ¬ HSTATE ModifiedM T) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextGOPendingIs aux4_r42 i313 i580)  processing done 
processing show goal25: "C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(27) i221 i2x i579)  processing done 
processing show goal26: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(27) i221 i2x i579)  processing done 
processing show goal27: "C_state_not MIA RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(27) assms i221 i579)  processing done 
processing show goal28: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 C_msg_P_same_def IMDData_nextEvict MESI_State.distinct(31) aux3_r42 i221 i32 nextGOPendingIs_general_rule_7_1)  processing done 
processing show goal29: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_different2 C_msg_state_def MESI_State.distinct(277) MESI_State.distinct(31) aux3_r42 i221 i47 nextReqIs_general_rule_7_0)  processing done 
processing show goal30: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextDTHDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(31) aux3_r42 aux5_r42 i181 i189 i1x i221 i575 i608 i656 i725 nextDTHDataPending_def nextGOPendingIs_general_rule_7_1)  processing done 
processing show goal31: "H_C_state_msg_same ModifiedM Modified (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 C_msg_state_def HSTATE_rule_6 MESI_State.distinct(265) empty_no_snoop_variant2 i1x i467 i47 i922 nextReqIs_general_rule_7_0)  processing done 
processing show goal32: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) C_msg_P_same_def IMDData_nextEvict aux3_r42 aux4_r42 aux_r39 i37)  processing done 
processing show goal33: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_different2 C_msg_state_def MESI_State.distinct(277) MESI_State.distinct(31) aux3_r42 i221 i47 nextReqIs_general_rule_7_0)  processing done 
processing show goal34: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextDTHDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) aux2_r42 aux_r42)  processing done 
processing show goal35: "H_C_state_msg_oppo ModifiedM IIA (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 C_msg_state_def MESI_State.distinct(265) MESI_State.distinct(31) i1x i221 i47 nextReqIs_general_rule_7_0)  processing done 
processing show goal36: "C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(3) assms i221 i646)  processing done 
processing show goal37: "C_msg_state RdShared ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_otherside_rule_5_0 C_msg_state_def i100 i2x i47 nextHTDDataPending_def nextReqIs_general_rule_7_0 reqs1_empty_not_nextReqIs_general_invariant)  processing done 
processing show goal38: "C_not_C_msg Modified ISAD nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(11) assms i221 i642 nextGOPending_DeviceIMDData)  processing done 
processing show goal39: "C_msg_P_same Invalid nextStore (λT i. ¬ nextHTDDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_inequality_invariant device_perform_op_nextHTDDataPending MESI_State.distinct(5) assms i221 i644 i901)  processing done 
processing show goal40: "C_msg_P_same Invalid nextStore (λT i. ¬ nextSnoopIs SnpInv T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_nextSnoopIs MESI_State.distinct(5) i221 i595)  processing done 
processing show goal41: "C_msg_P_same ISAD nextGOPending (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 C_msg_state_def MESI_State.distinct(11) i1x i221 i2x i47 i642 nextGOPending_General_rule_4_1 nextReqIs_general_rule_7_0)  processing done 
processing show goal42: "snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snps2 assms i679 i762)  processing done 
processing show goal43: "snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 device_perform_op_reqresps2 device_perform_op_reqs2 device_perform_op_snpresps1 device_perform_op_snps1 assms i437 i56)  processing done 
processing show goal44: "length (reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs1 i57)  processing done 
processing show goal45: "length (reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs2 i58)  processing done 
processing show goal46: "length (snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snps2 i60)  processing done 
processing show goal47: "length (snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snps1 i61)  processing done 
processing show goal48: "C_msg_P_same Shared (nextSnoopIs SnpInv) (λT i. ¬ nextHTDDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(3) assms i221 i646)  processing done 
processing show goal49: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(31) aux3_r42 aux4_r42 i179 i1x i221 i2x i718 i725 i772 nextSnoopPending_empty_not_rule_7_1)  processing done 
processing show goal50: "C_msg_P_oppo Invalid nextStore (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing using C_msg_P_oppo_def 
processing by (metis CSTATE_assign_rule_6 CSTATE_inequality_invariant CSTATE_otherside_rule_8 MESI_State.distinct(5) i612old nextSnoopPending_general_rule_7_0 nextStore_otherside_rule_3_0) 
processing show goal51: "CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(5) i221)  processing done 
processing show goal52: "CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_htddatas2 device_perform_op_reqresps2 device_perform_op_snpresps1 device_perform_op_snps1 assms i382 i437 i492 i614old)  processing done 
processing show goal53: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(3) i221)  processing done 
processing show goal54: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i646)  processing done 
processing show goal55: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(31) i221)  processing done 
processing show goal56: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_htddatas2 device_perform_op_snpresps1 device_perform_op_snps1 aux3_r42 i618old)  processing done 
processing show goal57: "CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(5) i221)  processing done 
processing show goal58: "CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqs2 i69)  processing done 
processing show goal59: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(3) i221)  processing done 
processing show goal60: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i646)  processing done 
processing show goal61: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(331) assms i467 i480)  processing done 
processing show goal62: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(331) assms i467 i480)  processing done 
processing show goal63: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(7) i221)  processing done 
processing show goal64: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE i75)  processing done 
processing show goal65: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(7) i221)  processing done 
processing show goal66: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextLoad i752old)  processing done 
processing show goal67: "C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 HSTATE_rule_6 MESI_State.distinct(7) i221 i401 nextSnoopIs_general_rule_7_0)  processing done 
processing show goal68: "length (htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms htddatas1_empty_if_minus_rule_2_0 i437 i77 i883)  processing done 
processing show goal69: "length (htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_htddatas2 i78)  processing done 
processing show goal70: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 device_perform_op_snpresps2 device_perform_op_snps2 assms i679 i762)  processing done 
processing show goal71: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqresps2 device_perform_op_snpresps1 device_perform_op_snps1 assms i437 i80)  processing done 
processing show goal72: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(7) i221)  processing done 
processing show goal73: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqs2 i82)  processing done 
processing show goal74: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) i221)  processing done 
processing show goal75: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i644 i901)  processing done 
processing show goal76: "length (reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i437 i762 i85)  processing done 
processing show goal77: "length (reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps2 i86)  processing done 
processing show goal78: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(27) i221)  processing done 
processing show goal79: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snps2 assms i437 i679 i901)  processing done 
processing show goal80: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_nextGOPendingIs assms i762 reqresps_empty_noGOPendingIs1)  processing done 
processing show goal81: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i579)  processing done 
processing show goal82: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) i221)  processing done 
processing show goal83: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside i92 nextReqIs_IMDData)  processing done 
processing show goal84: "C_msg_P_same MIA (nextReqIs DirtyEvict) nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) IMDData_nextEvict aux_r93 i541 nextReqIs_IMDData)  processing done 
processing show goal85: "reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal86: "reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps2 device_perform_op_reqs2 assms i762 i95)  processing done 
processing show goal87: "reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 assms i646 i679 i762)  processing done 
processing show goal88: "reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs2 device_perform_op_snpresps1 assms i762 i99)  processing done 
processing show goal89: "reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs1 assms i100 nextHTDDataPending_various_forms1)  processing done 
processing show goal90: "reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_htddatas2 device_perform_op_reqs2 assms i101 i762)  processing done 
processing show goal91: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (metis CSTATE_otherside_rule_8 HSTATE_general_rule_5_0 assms i415 i579 i644 i835 nextGOPending_General_rule_4_1 nextReqIs_general_rule_7_0)  processing done 
processing show goal92: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) i221)  processing done 
processing show goal93: "HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal94: "HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) i221)  processing done 
processing show goal95: "HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(31) i221)  processing done 
processing show goal96: "HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) i221)  processing done 
processing show goal97: "reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal98: "reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps2 device_perform_op_reqs2 assms i762 i95)  processing done 
processing show goal99: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(265) assms i106)  processing done 
processing show goal100: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(3) assms i221 i646)  processing done 
processing show goal101: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 assms i437)  processing done 
processing show goal102: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas2 IMDData_HSTATE assms i109 nextHTDDataPending_various_forms1)  processing done 
processing show goal103: "length (dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 assms i437 i762 i883)  processing done 
processing show goal104: "length (dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas2 i884)  processing done 
processing show goal105: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal106: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(265) MESI_State.distinct(331) assms i113 i161 i220 i425 i74 i840 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal107: "HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ (nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE assms i114 i644 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal108: "HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ (nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(265) assms i115 i352 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal109: "nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextSnpRespIs RspIHitSE ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(151) MESI_State.distinct(265) MESI_State.distinct(299) MESI_State.distinct(331) MESI_State.distinct(401) assms i458 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal110: "nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextSnpRespIs RspIHitSE ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside aux3_r42 i459 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal111: "nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) i2x i316 i455 i584 i617old nextHTDDataPending_def nextReqIs_general_rule_7_0)  processing done 
processing show goal112: "nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms aux3_r42 i456 i579 nextReqIs_IMDData)  processing done 
processing show goal113: "snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps2 device_perform_op_snpresps1 assms i118 i762)  processing done 
processing show goal114: "snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal115: "length (snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps1 i120)  processing done 
processing show goal116: "length (snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ≤ 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 assms i437 i679 i883 i901)  processing done 
processing show goal117: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ (nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE i439 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal118: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ (nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(265) assms i440 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal119: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i437 i451 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal120: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (metis assms hstate_invariants(17) hstate_invariants(20) hstate_invariants(24) i452 nextHTDDataPending_various_forms1 nextSnpRespIs_general_rule_7_0 remove_instr_HSTATE)  processing done 
processing show goal121: "HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (metis CSTATE_inequality_invariant device_perform_op_snpresps1 MESI_State.distinct(299) assms i159 i220 i445 nextHTDDataPending_various_forms1)  processing done 
processing show goal122: "HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (metis CSTATE_inequality_invariant device_perform_op_snpresps2 MESI_State.distinct(331) MESI_State.distinct(405) assms hstate_invariants(17) hstate_invariants(20) hstate_invariants(24) i352 i454 remove_instr_HSTATE)  processing done 
processing show goal123: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_htddatas2 device_perform_op_snpresps1 IMDData_HSTATE assms i126 i437)  processing done 
processing show goal124: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 IMDData_HSTATE assms i127 nextHTDDataPending_various_forms1)  processing done 
processing show goal125: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs1 IMDData_HSTATE assms i128 i437)  processing done 
processing show goal126: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas2 device_perform_op_reqs2 IMDData_HSTATE i129)  processing done 
processing show goal127: "HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i608 i613)  processing done 
processing show goal128: "HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i608 i613)  processing done 
processing show goal129: "HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ ¬ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i608 i615)  processing done 
processing show goal130: "HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ ¬ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i608 i612)  processing done 
processing show goal131: "dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ∧ HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 assms i437)  processing done 
processing show goal132: "dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ∧ HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas2 device_perform_op_snpresps1 IMDData_HSTATE assms i137 i437)  processing done 
processing show goal133: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(7) i221)  processing done 
processing show goal134: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextLoad i752old)  processing done 
processing show goal135: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(31) aux3_r42 i181 i1x i221 i575 i608 i656 i725 i922 nextGOPendingIs_general_rule_7_1 nextSnoopPending_empty_not_rule_7_1)  processing done 
processing show goal136: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) i221)  processing done 
processing show goal137: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i642 nextGOPending_DeviceIMDData)  processing done 
processing show goal138: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) i221)  processing done 
processing show goal139: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextLoad i146)  processing done 
processing show goal140: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) i221)  processing done 
processing show goal141: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextSnoopIs i148)  processing done 
processing show goal142: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 device_perform_op_snps2 assms i642 i679)  processing done 
processing show goal143: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i642 nextGOPending_DeviceIMDData)  processing done 
processing show goal144: "(CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(13) MESI_State.distinct(5) i221)  processing done 
processing show goal145: "(CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) i221)  processing done 
processing show goal146: "(CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(13) MESI_State.distinct(5) i221)  processing done 
processing show goal147: "(CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_dthdatas2 IMDData_HSTATE i154)  processing done 
processing show goal148: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps1 device_perform_op_snpresps2 IMDData_HSTATE assms i159 i642 i679 i762)  processing done 
processing show goal149: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal150: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(265) assms i161 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal151: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal152: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(265) assms i161 i165 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal153: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal154: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs1 IMDData_HSTATE i167 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal155: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal156: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs1 IMDData_HSTATE i169 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal157: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal158: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal159: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal160: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal161: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(31) i221)  processing done 
processing show goal162: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) i221)  processing done 
processing show goal163: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal164: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal165: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(31) i221)  processing done 
processing show goal166: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms aux3_r42 aux4_r42 i178 i179 i656 i725 i772)  processing done 
processing show goal167: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePullDrop ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(31) i221)  processing done 
processing show goal168: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePullDrop ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextGOPendingIs assms aux3_r42 i180 i181 i608 i609 i656 i674 i725)  processing done 
processing show goal169: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal170: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal171: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SIAC ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal172: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SIAC ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal173: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal174: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i579)  processing done 
processing show goal175: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i579)  processing done 
processing show goal176: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 device_perform_op_dthdatas2 IMDData_HSTATE assms i189 i437)  processing done 
processing show goal177: "HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 device_perform_op_dthdatas2 IMDData_HSTATE assms i437 i457)  processing done 
processing show goal178: "nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal179: "nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i644 i901)  processing done 
processing show goal180: "nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal181: "nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal182: "HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 device_perform_op_dthdatas2 IMDData_HSTATE assms i194 i437)  processing done 
processing show goal183: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ ¬ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(31) i221)  processing done 
processing show goal184: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ (¬ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ (¬ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1)" 
processing apply  (insert assms)  processing apply (metis CSTATE_assign_rule_6 CSTATE_inequality_invariant CSTATE_otherside_rule_8 HSTATE_general_rule_5_0 IMDData_Modified_aux1 MESI_State.distinct(31) SharedSnpInv'_CSTATE_invariant5 i196 i368 i440 nextLoad_devstate nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal185: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(31) i221)  processing done 
processing show goal186: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal187: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(31) i221)  processing done 
processing show goal188: "CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE IIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(31) i221)  processing done 
processing show goal189: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(27) i221)  processing done 
processing show goal190: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i579)  processing done 
processing show goal191: "snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal192: "snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 assms i679 i762)  processing done 
processing show goal193: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i656)  processing done 
processing show goal194: "HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE aux4_r42 i798)  processing done 
processing show goal195: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextGOPendingIs i309 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal196: "HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal197: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ (nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE aux4_r42 i861)  processing done 
processing show goal198: "HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ (nextSnpRespIs RspIFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextGOPendingIs i861)  processing done 
processing show goal199: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextGOPendingIs aux4_r42 i313)  processing done 
processing show goal200: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(43) aux4_r42 i1x i221 i2x i320 i725 i772 i811)  processing done 
processing show goal201: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(43) aux4_r42 i1x i221 i2x i320 i725 i772 i811)  processing done 
processing show goal202: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(43) i221)  processing done 
processing show goal203: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_htddatas2 device_perform_op_snpresps1 device_perform_op_snps1 assms i317 i437)  processing done 
processing show goal204: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(43) aux4_r42 i1x i221 i2x i320 i725 i772 i811)  processing done 
processing show goal205: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(43) i221)  processing done 
processing show goal206: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms aux4_r42 i319 i320 i656 i725 i772 i811)  processing done 
processing show goal207: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (λT i. ¬ nextDTHDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(43) aux4_r42 i1x i221 i2x i320 i725 i772 i811)  processing done 
processing show goal208: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(43) i221)  processing done 
processing show goal209: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms aux4_r42 i178 i320 i323 i656 i725 i772 i811)  processing done 
processing show goal210: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 C_msg_P_same_def IMDData_nextEvict MESI_State.distinct(43) i221 i324 nextGOPendingIs_general_rule_7_1)  processing done 
processing show goal211: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextReqIs RdShared T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_different2 CSTATE_otherside_rule_5_0 C_msg_state_def MESI_State.distinct(289) MESI_State.distinct(43) i221 i47 nextReqIs_general_rule_7_0)  processing done 
processing show goal212: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(43) i1x i221 i2x i328 i575 i656 i725 i772 i922 nextGOPendingIs_general_rule_7_1 nextSnoopPending_empty_not_rule_7_1)  processing done 
fixing ill app done 
processing show goal213: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePullDrop ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
Fixed to show goal213:  "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPendingIs GO_WritePullDrop ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(43) i221)  processing done 
processing show goal214: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePullDrop ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
Fixed to show goal214:  "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPendingIs GO_WritePullDrop ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE IB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextGOPendingIs assms i327 i328 i656 i674 i725 i772)  processing done 
processing show goal215: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (λT i. ¬ nextDTHDataPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply (smt (verit) CSTATE_disj1 C_msg_P_same_def HSTATE_rule_6 MESI_State.distinct(43) assms goal176 goal18 goal19 goal214 i221 i2x i656 i674 i725 i772 nextDTHDataPending_def) 
processing done 
fixing ill app done 
processing show goal216: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal217: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) i221)  processing done 
processing show goal218: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i642 i644)  processing done 
processing show goal219: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1)" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i642 i644)  processing done 
processing show goal220: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0)" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i642 i644)  processing done 
processing show goal221: "C_not_C_msg Modified IMAD nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(15) i1x i221 i2x i467 i623 nextGOPending_General_rule_4_1 nextHTDDataPending_def)  processing done 
processing show goal222: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal223: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) i221)  processing done 
processing show goal224: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextStore_otherside i340)  processing done 
processing show goal225: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 device_perform_op_snps2 assms i679)  processing done 
processing show goal226: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_snpresps1 device_perform_op_snps1 assms i342 i437 nextGOPending_DeviceIMDData)  processing done 
processing show goal227: "snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal228: "snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 assms i679 i762)  processing done 
processing show goal229: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal230: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal231: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal232: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal233: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(35) i221)  processing done 
processing show goal234: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i901)  processing done 
processing show goal235: "C_msg_P_same IMA nextGOPending nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_nextStore_otherside MESI_State.distinct(17) i221 i371)  processing done 
processing show goal236: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(17) MESI_State.distinct(37) MESI_State.distinct(9) i221)  processing done 
processing show goal237: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i644)  processing done 
processing show goal238: "C_msg_P_oppo IMA nextGOPending (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(17) assms i221 i831 i835 nextGOPending_DeviceIMDData)  processing done 
processing show goal239: "C_msg_P_oppo SMA nextGOPending (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_different1 CSTATE_otherside_rule_5_0 MESI_State.distinct(37) i1x i221 i2x i467 i633 nextHTDDataPending_def)  processing done 
processing show goal240: "C_msg_P_oppo ISA nextGOPending (λT i. ¬ nextSnoopPending T i) ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(9) assms i221 i644)  processing done 
processing show goal241: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal242: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal243: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ ((CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ ¬ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (metis CSTATE_assign_rule_6 CSTATE_inequality_invariant MESI_State.distinct(15) MESI_State.distinct(19) MESI_State.distinct(35) MESI_State.distinct(39))  processing done 
processing show goal244: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ ((CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ ¬ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (metis CSTATE_otherside_rule_8 assms i468 i901 nextGOPending_General_rule_4_1 nextSnoopIs_general_rule_7_0)  processing done 
processing show goal245: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ (dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]))" 
processing apply  (insert assms)  processing apply (metis device_perform_op_dthdatas2 HTDDataPending_htddatas_invariant1 assms dthdatas1_general_rule_4_0 hstate_invariants(17) hstate_invariants(20) hstate_invariants(24) i165 i189 i220 i406 i425 i437 i644 nextDTHDataFrom_def remove_instr_HSTATE)  processing done 
processing show goal246: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ (dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ HSTATE MB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]))" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_dthdatas1 device_perform_op_dthdatas2 device_perform_op_nextHTDDataPending assms i407 i437 i644 i901)  processing done 
processing show goal247: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_dthdatas1 assms i437)  processing done 
processing show goal248: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (metis CSTATE_otherside_rule_8 device_perform_op_dthdatas2 assms i438 i901 nextGOPending_DeviceIMDData)  processing done 
processing show goal249: "C_msg_P_same SMA nextGOPending nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_nextStore_otherside MESI_State.distinct(37) i221 i371)  processing done 
processing show goal250: "CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal251: "CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i220)  processing done 
processing show goal252: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(11) MESI_State.distinct(13) MESI_State.distinct(7) MESI_State.distinct(9) i221)  processing done 
processing show goal253: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextLoad ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextLoad assms i146 i369 i644 i752old)  processing done 
processing show goal254: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(19) MESI_State.distinct(35) MESI_State.distinct(37) MESI_State.distinct(39) i221)  processing done 
processing show goal255: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextStore ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextStore_otherside assms i340 i371 i901)  processing done 
processing show goal256: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ (dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]))" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_dthdatas1 assms i437 i464)  processing done 
processing show goal257: "CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ (dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ HSTATE SD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]))" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_nextHTDDataPending assms i642 i644 i646 nextGOPending_DeviceIMDData)  processing done 
processing show goal258: "CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(9) i221)  processing done 
processing show goal259: "CSTATE ISA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i644)  processing done 
processing show goal260: "CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(13) i221)  processing done 
processing show goal261: "CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SharedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SB ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_nextHTDDataPending assms i644 i901)  processing done 
processing show goal262: "CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(13) i221)  processing done 
processing show goal263: "CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqresps2 device_perform_op_snpresps1 device_perform_op_snps1 device_perform_op_snps2 assms i378 i437 i679 i901)  processing done 
processing show goal264: "CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ ¬ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(13) i221)  processing done 
processing show goal265: "CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ ¬ HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE i380 nextReqIs_IMDData)  processing done 
processing show goal266: "CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal267: "CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqresps2 assms i382 i437)  processing done 
processing show goal268: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(3) i221)  processing done 
processing show goal269: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i646)  processing done 
processing show goal270: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(3) i221)  processing done 
processing show goal271: "CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i646 i901)  processing done 
processing show goal272: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 device_perform_op_snps2 assms i679 i901)  processing done 
processing show goal273: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i901)  processing done 
processing show goal274: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(35) i221)  processing done 
processing show goal275: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i901)  processing done 
processing show goal276: "nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(331) MESI_State.distinct(405) assms i392 nextReqIs_IMDData)  processing done 
processing show goal277: "nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i393 i901 nextReqIs_IMDData)  processing done 
processing show goal278: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ CXL_SPG_used ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(35) i221)  processing done 
processing show goal279: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ CXL_SPG_used ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i901)  processing done 
processing show goal280: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 MESI_State.distinct(7) i221)  processing done 
processing show goal281: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE assms i401 i467)  processing done 
processing show goal282: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(7) i221)  processing done 
processing show goal283: "CSTATE ISD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(331) MESI_State.distinct(405) assms i352 i467 i472 i511)  processing done 
processing show goal284: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps1 device_perform_op_snpresps2 IMDData_HSTATE assms i408 i642 i679 i762)  processing done 
processing show goal285: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal286: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextGOPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_different1 HOST_State.distinct(19) HOST_State.distinct(37) HSTATE_invariant3 HSTATE_rule_6 MESI_State.distinct(331) i161 i1x i220 i2x i425 i636 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal287: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal288: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i474 nextDTHDataFrom_general_rule_4_0 nextReqIs_IMDData)  processing done 
processing show goal289: "HSTATE MD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ nextGOPendingIs GO_WritePull ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextGOPendingIs aux4_r42 i421)  processing done 
processing show goal290: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal291: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant IMDData_HSTATE MESI_State.distinct(331) assms i425 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal292: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal293: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps1 IMDData_HSTATE i427 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal294: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal295: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE i476 nextDTHDataFrom_general_rule_4_0 nextReqIs_IMDData)  processing done 
processing show goal296: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal297: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqs1 IMDData_HSTATE assms i431 i437 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal298: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 0 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) assms i190 nextDTHDataFrom_general_rule_4_0)  processing done 
processing show goal299: "HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextDTHDataFrom 1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqresps1 assms i762)  processing done 
processing show goal300: "(HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant device_perform_op_snpresps1 MESI_State.distinct(299) assms i159 i358 i366 i445 i642 i801 nextHTDDataPending_various_forms1)  processing done 
processing show goal301: "(HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE SA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∨ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])) ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ≠ [] ⟶ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_htddatas2 device_perform_op_snpresps2 i159 i220 i446 i802)  processing done 
processing show goal302: "nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SIAC ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(109) MESI_State.distinct(405) MESI_State.distinct(413) assms i443 i929 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal303: "nextSnpRespIs RspSFwdM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SIAC ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i444 i646 i901 nextSnpRespIs_general_rule_7_0)  processing done 
processing show goal304: "(CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (metis CSTATE_different1 HSTATE_rule_6 MESI_State.distinct(13) MESI_State.distinct(5) i1x i221 i2x i352 i462 i467 i599 i627 i633 i644 nextReqIs_general_rule_7_0)  processing done 
processing show goal305: "(CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE ISDI ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ (CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0) ∧ nextHTDDataPending ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) HOST_State.distinct(145) HOST_State.distinct(149) HOST_State.distinct(17) HOST_State.distinct(225) HOST_State.distinct(249) HOST_State.distinct(37) HSTATE_invariant3 HSTATE_rule_6 i220)  processing done 
processing show goal306: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextSnoopIs assms i694)  processing done 
processing show goal307: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextSnoopIs i478)  processing done 
processing show goal308: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_otherside_rule_5_0 i1x i624 nextSnoopIs_general_rule_7_0)  processing done 
processing show goal309: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant MESI_State.distinct(331) assms i467 i480)  processing done 
processing show goal310: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextSnoopIs assms i694)  processing done 
processing show goal311: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE assms i468 i694)  processing done 
processing show goal312: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(19) i221)  processing done 
processing show goal313: "CSTATE IMD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_otherside_rule_5_0 i2x i625 nextHTDDataPending_def nextSnoopIs_general_rule_7_0)  processing done 
processing show goal314: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextSnoopIs assms i694)  processing done 
processing show goal315: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextSnoopIs i697)  processing done 
processing show goal316: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) i221)  processing done 
processing show goal317: "CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_otherside_rule_5_0 i2x i623 nextHTDDataPending_def nextSnoopIs_general_rule_7_0)  processing done 
processing show goal318: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextSnoopIs assms i694)  processing done 
processing show goal319: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextSnoopIs i699)  processing done 
processing show goal320: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(17) i221)  processing done 
processing show goal321: "CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_otherside_rule_5_0 HTDDataPending_htddatas_invariant1 i2x i627 nextSnoopIs_general_rule_7_0)  processing done 
processing show goal322: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextSnoopIs assms i689)  processing done 
processing show goal323: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i579)  processing done 
processing show goal324: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextSnoopIs assms i683)  processing done 
processing show goal325: "CSTATE MIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i579)  processing done 
processing show goal326: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE IMDData_nextSnoopIs assms i689)  processing done 
processing show goal327: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE SAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextSnoopIs i486)  processing done 
processing show goal328: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_nextSnoopIs assms i683)  processing done 
processing show goal329: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CSTATE_inequality_invariant IMDData_nextSnoopIs MESI_State.distinct(265) assms i488)  processing done 
processing show goal330: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ reqs1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_reqs1 HTDDataPending_htddatas_invariant1 assms i100)  processing done 
processing show goal331: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ reqs2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_reqs2 i490)  processing done 
processing show goal332: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing by (metis device_perform_op_reqresps1 device_perform_op_snpresps2 device_perform_op_snps2 auxHTD i1x i2x i679 i762) 
processing show goal333: "CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ reqresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ htddatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_htddatas2 device_perform_op_reqresps2 device_perform_op_snpresps1 device_perform_op_snps1 assms i437 i492)  processing done 
processing show goal334: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal335: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdShared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal336: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal337: "nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ ¬ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(5) i221)  processing done 
processing show goal338: "nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ ¬ CSTATE ISAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE Invalid ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside i497 nextReqIs_IMDData)  processing done 
processing show goal339: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal340: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal341: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ dthdatas2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal342: "HSTATE InvalidM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs RdOwn ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ dthdatas1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i674)  processing done 
processing show goal343: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ snps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps2 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) device_perform_op_snpresps2 device_perform_op_snps2 assms i679)  processing done 
processing show goal344: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ snps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = [] ∧ snpresps1 ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) = []" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside device_perform_op_snpresps1 device_perform_op_snps1 assms i317 i437 i467)  processing done 
processing show goal345: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(43) i221)  processing done 
processing show goal346: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ HSTATE MA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ])" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside IMDData_HSTATE IMDData_nextSnoopIs i505)  processing done 
processing show goal347: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ CXL_SPG_used ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(43) i221)  processing done 
processing show goal348: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ CXL_SPG_used ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ nextReqIs CleanEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ nextReqIs CleanEvictNoData ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside CXL_SPG_used_general_rule_4_0 IMDData_nextSnoopIs i507 nextReqIs_IMDData)  processing done 
processing show goal349: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(43) i221)  processing done 
processing show goal350: "CSTATE SIA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing by (smt (verit) HOST_State.simps(150) HOST_State.simps(18) HOST_State.simps(20) HOST_State.simps(250) HSTATE_invariant3 HSTATE_rule_6 goal346 i1x i2x i357 i366 i901) 
processing show goal351: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(35) i221)  processing done 
processing show goal352: "CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ nextSnoopIs SnpInv ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ⟶ CSTATE IMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE IMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMAD ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ CSTATE SMA ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0" 
processing apply  (insert assms)  processing apply (smt (verit) CSTATE_IMDData_otherside assms i901)  processing done 
processing show goal353: "HSTATE ID ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ⟶ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms)  processing apply (smt (verit) IMDData_HSTATE assms i608 i615)  processing done 
processing show goal354: "HSTATE ModifiedM ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) ∧ nextReqIs DirtyEvict ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ⟶ (¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∨ ¬ CSTATE Modified ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1) ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 0 ∧ ¬ CSTATE Shared ( T [ 0 s= Modified] [ 0 :=dd msg] [ -=i 0] [ 0 -=devd ]) 1" 
processing apply  (insert assms) 
processing apply (smt (verit) i2x i316 i455 i584 i617old nextHTDDataPending_def nextReqIs_general_rule_7_0)