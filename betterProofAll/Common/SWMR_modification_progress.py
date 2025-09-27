# SWMR_state_machine Modification Progress Tracker
# File: CoherenceProperties.thy
# Definition spans: lines 286-771 (486 lines total)
# 
# Status codes:
# 'AI_MODIFIED': Line has been modified by AI to support multi-device
# 'HUMAN_INSPECTED': Line has been inspected by human but deemed correct as-is  
# 'AI_MODIFIED+HUMAN_INSPECTED': Line was AI modified but then reviewed/corrected by human
# 'NEEDS_ATTENTION': Line needs modification or inspection (default state)

# Progress data structure: [line_number, status, description]
progress = [
    [286, 'NEEDS_ATTENTION', '"SWMR_state_machine T = ( (SWMR T) \<and>'],
    [287, 'NEEDS_ATTENTION', 'C_msg_P_oppo ISD nextHTDDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [288, 'NEEDS_ATTENTION', 'H_msg_P_same SD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [289, 'NEEDS_ATTENTION', 'H_msg_P_same SAD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [290, 'NEEDS_ATTENTION', 'C_msg_P_oppo ISAD nextGOPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [291, 'NEEDS_ATTENTION', 'H_msg_P_same SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [292, 'NEEDS_ATTENTION', 'H_msg_P_oppo SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [293, 'NEEDS_ATTENTION', 'H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>'],
    [294, 'NEEDS_ATTENTION', 'H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextDTHDataPending T i) T \<and>'],
    [295, 'NEEDS_ATTENTION', 'H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T \...'],
    [296, 'NEEDS_ATTENTION', 'H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T \...'],
    [297, 'NEEDS_ATTENTION', 'C_H_state IMAD (nextReqIs RdOwn) Modified SD T \<and>'],
    [298, 'NEEDS_ATTENTION', 'C_H_state IMAD (nextReqIs RdOwn) Modified SAD T \<and>'],
    [299, 'NEEDS_ATTENTION', 'C_H_state IMAD (nextReqIs RdOwn) Modified SA T \<and>'],
    [300, 'NEEDS_ATTENTION', 'C_H_state Invalid nextStore Modified SAD T \<and>'],
    [301, 'NEEDS_ATTENTION', 'C_H_state Invalid nextStore Modified SA T \<and>'],
    [302, 'NEEDS_ATTENTION', 'C_H_state Invalid nextStore Modified SD T \<and>'],
    [303, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and> \<comment>\<...'],
    [304, 'AI_MODIFIED', '(HSTATE SD T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and> \<comment>\<open>...'],
    [305, 'AI_MODIFIED', '(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and> \<comment>\<open>...'],
    [306, 'NEEDS_ATTENTION', 'C_msg_not RdShared IMAD T \<and>'],
    [307, 'NEEDS_ATTENTION', 'C_msg_not RdShared Invalid T \<and>'],
    [308, 'NEEDS_ATTENTION', 'H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (\<lambda>T i. CSTATE MIA T i \<or> CSTATE IIA T i)...'],
    [309, 'NEEDS_ATTENTION', 'C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (\<lambda>T. \<not> HSTATE ModifiedM T) T \<and>'],
    [310, 'NEEDS_ATTENTION', 'C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict T \<and>'],
    [311, 'NEEDS_ATTENTION', 'C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) T \<and>'],
    [312, 'NEEDS_ATTENTION', 'C_state_not MIA RdShared T \<and>'],
    [313, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict T \<and> \<comment>\<open>True beca...'],
    [314, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i)...'],
    [315, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i)...'],
    [316, 'NEEDS_ATTENTION', 'H_C_state_msg_same ModifiedM Modified (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>'],
    [317, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict T \<and> \<comment>\<open>True and prem...'],
    [318, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T \...'],
    [319, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T \...'],
    [320, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ModifiedM T \<and> CSTATE IIA T i \<and> (C...'],
    [321, 'NEEDS_ATTENTION', 'C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) T \<and>'],
    [322, 'NEEDS_ATTENTION', 'C_msg_state RdShared ISAD T \<and>'],
    [323, 'NEEDS_ATTENTION', 'C_not_C_msg Modified ISAD nextGOPending T \<and>'],
    [324, 'NEEDS_ATTENTION', 'C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextHTDDataPending T i) T \<and>'],
    [325, 'NEEDS_ATTENTION', 'C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextSnoopIs SnpInv T i) T \<and>'],
    [326, 'NEEDS_ATTENTION', 'C_msg_P_same ISAD nextGOPending (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>'],
    [327, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (snps T j \<noteq> [] \<longrightarrow> reqs T i = ...'],
    [328, 'AI_MODIFIED', '(\<forall>i. length (reqs T i) \<le> 1) \<and> \<comment>\<open>Original: (length (reqs1 T) \<le>...'],
    [329, 'AI_MODIFIED', '(\<forall>i. length (snps T i) \<le> 1) \<and> \<comment>\<open>Original: (length (snps2 T) \<le>...'],
    [330, 'NEEDS_ATTENTION', 'C_msg_P_same Shared (nextSnoopIs SnpInv) (\<lambda>T i. \<not> nextHTDDataPending T i) T \<and>'],
    [331, 'NEEDS_ATTENTION', 'C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T \<and>'],
    [332, 'NEEDS_ATTENTION', 'C_msg_P_oppo Invalid nextStore (\<lambda>T i. \<not> nextSnoopPending T i) T \<and>'],
    [333, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Invalid T i \<longrightarrow> snps T j = []...'],
    [334, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Shared T i \<longrightarrow> snps T j = [] ...'],
    [335, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IIA T i \<longrightarrow> snps T j = [] \<a...'],
    [336, 'AI_MODIFIED', '(\<forall>i. CSTATE Invalid T i \<longrightarrow> reqs T i = []) \<and> \<comment>\<open>Original...'],
    [337, 'AI_MODIFIED', '(\<forall>i. CSTATE Shared T i \<longrightarrow> reqs T i = []) \<and> \<comment>\<open>Original:...'],
    [338, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> \<not>CSTATE...'],
    [339, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<longrightarrow> \<not>HSTATE ModifiedM T) \<and> \<comment>\<open>O...'],
    [340, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<longrightarrow> nextLoad T i) \<and> \<comment>\<open>Original: (CS...'],
    [341, 'NEEDS_ATTENTION', '(C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) T) \<and>'],
    [342, 'AI_MODIFIED', '(\<forall>i. length (htddatas T i) \<le> 1) \<and> \<comment>\<open>Original: (length (htddatas1 ...'],
    [343, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISD T i \<longrightarrow> snps T j = [] \<a...'],
    [344, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<longrightarrow> reqs T i = []) \<and> \<comment>\<open>Original: (C...'],
    [345, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextHTDDataPending T i \<longrightarrow> reqs T i = []) \<and...'],
    [346, 'AI_MODIFIED', '(\<forall>i. length (reqresps T i) \<le> 1) \<and> \<comment>\<open>Original: (length (reqresps1 ...'],
    [347, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> (nextGOPendingIs GO_WritePul...'],
    [348, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<longrightarrow> \<not> nextReqIs DirtyEvict T i) \<and> \<comment>...'],
    [349, 'NEEDS_ATTENTION', '(C_msg_P_same MIA  (nextReqIs DirtyEvict) (nextEvict) T) \<and>'],
    [350, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (reqs T i \<noteq> [] \<longrightarrow> reqresps T ...'],
    [351, 'AI_MODIFIED', '(\<forall>i. (HSTATE ModifiedM T \<and> nextReqIs RdOwn T i \<longrightarrow> (\<exists>j. j \<no...'],
    [352, 'AI_MODIFIED', '(\<forall>i. (HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i ...'],
    [353, 'AI_MODIFIED', '(\<forall>i. (HSTATE MB T \<and> CSTATE IIA T i \<longrightarrow> (\<exists>j. j \<noteq> i \<and...'],
    [354, 'AI_MODIFIED', '(\<forall>i. reqs T i \<noteq> [] \<longrightarrow> reqresps T i = []) \<and> \<comment>\<open>Or...'],
    [355, 'AI_MODIFIED', '(HSTATE SAD T \<longrightarrow> (\<exists>i. CSTATE ISAD T i)) \<and> \<comment>\<open>Original: ...'],
    [356, 'AI_MODIFIED', '(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not>CSTATE Shared T i)) \<and> \<comment>\<o...'],
    [357, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> dthdatas T i \<noteq> [] \<long...'],
    [358, 'AI_MODIFIED', '(\<forall>i. length (dthdatas T i) \<le> 1) \<and> \<comment>\<open>Original: (length (dthdatas1 ...'],
    [359, 'AI_MODIFIED', '(\<forall>i. HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \...'],
    [360, 'AI_MODIFIED', '(\<forall>i. HSTATE SA T \<and> (nextSnpRespIs RspIFwdM T i \<or> nextSnpRespIs RspSFwdM T i) \<l...'],
    [361, 'AI_MODIFIED', '(\<forall>i. (nextSnpRespIs RspIFwdM T i \<or> nextSnpRespIs RspIHitSE T i) \<longrightarrow> CST...'],
    [362, 'AI_MODIFIED', '(\<forall>i. nextReqIs DirtyEvict T i \<longrightarrow> CSTATE MIA T i \<or> CSTATE SIA T i \<or>...'],
    [363, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (snpresps T i \<noteq> [] \<longrightarrow> reqresp...'],
    [364, 'AI_MODIFIED', '(\<forall>i. length (snpresps T i) \<le> 1) \<and> \<comment>\<open>Original: (length (snpresps1 ...'],
    [365, 'AI_MODIFIED', '(\<forall>i. HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T i \<or> nextSnpRespIs RspSFwdM T i) \<...'],
    [366, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MAD T \<and> nextSnpRespIs RspIFwdM T i \<l...'],
    [367, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MA T \<and> snpresps T i \<noteq> [] \<long...'],
    [368, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> snpresps T i \<noteq> [] \<lon...'],
    [369, 'AI_MODIFIED', '(\<forall>i. HSTATE MD T \<and> reqs T i \<noteq> [] \<longrightarrow> dthdatas T i \<noteq> []) ...'],
    [370, 'AI_MODIFIED', '(\<forall>i. HSTATE ID T \<and> dthdatas T i \<noteq> [] \<longrightarrow> CSTATE Invalid T i \<o...'],
    [371, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> dthdatas T i \<noteq> [] \<long...'],
    [372, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (dthdatas T i \<noteq> [] \<and> HSTATE SD T \<long...'],
    [373, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<and> nextHTDDataPending T i \<longrightarrow> nextLoad T i) \<and> ...'],
    [374, 'NEEDS_ATTENTION', '(C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) ...'],
    [375, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextGOPending T i \<longrightarrow> HSTATE SD T \<or> HSTATE ...'],
    [376, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<longrightarrow> nextLoad T i) \<and> \<comment>\<open>Original: (C...'],
    [377, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and> ...'],
    [378, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISAD T i \<and> nextGOPending T i \<longrig...'],
    [379, 'AI_MODIFIED', '(\<forall>i. (CSTATE Invalid T i \<or> CSTATE ISDI T i) \<and> HSTATE ModifiedM T \<longrightarro...'],
    [380, 'AI_MODIFIED', '(\<forall>i. (CSTATE Invalid T i \<or> CSTATE ISDI T i) \<and> HSTATE MD T \<longrightarrow> dthd...'],
    [381, 'AI_MODIFIED', '(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. snpresps T i = [])) \<and> \<comment>\<open>Or...'],
    [382, 'AI_MODIFIED', '(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i ...'],
    [383, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> nextDTHDataFrom i T \<longrigh...'],
    [384, 'AI_MODIFIED', '(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i ...'],
    [385, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longright...'],
    [386, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SharedM T \<and> nextReqIs RdOwn T i \<long...'],
    [387, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SharedM T \<and> nextReqIs RdShared T i \<l...'],
    [388, 'AI_MODIFIED', '(\<forall>i. CSTATE IIA T i \<and> HSTATE ModifiedM T \<longrightarrow> (\<exists>j. j \<noteq> i...'],
    [389, 'AI_MODIFIED', '(\<forall>i. CSTATE IIA T i \<and> HSTATE SharedM T \<longrightarrow> (\<exists>j. j \<noteq> i \...'],
    [390, 'AI_MODIFIED', '(\<forall>i. CSTATE IIA T i \<and> nextGOPendingIs GO_WritePull T i \<longrightarrow> HSTATE IB T...'],
    [391, 'AI_MODIFIED', '(\<forall>i. CSTATE IIA T i \<and> nextGOPendingIs GO_WritePullDrop T i \<longrightarrow> HSTATE ...'],
    [392, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextHTDDataPending T i \<longrightarrow> HSTATE ModifiedM T \...'],
    [393, 'AI_MODIFIED', '(\<forall>i. CSTATE IIA T i \<and> HSTATE SharedM T \<longrightarrow> (\<exists>j. j \<noteq> i \...'],
    [394, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and> \<comment>\<open>Orig...'],
    [395, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<longrightarrow> \<not>CSTATE MIA ...'],
    [396, 'AI_MODIFIED', '(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and> \<comment>\<open>Or...'],
    [397, 'AI_MODIFIED', '(HSTATE MA T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and> \<comment>\<open>Original:...'],
    [398, 'AI_MODIFIED', '(\<forall>i. nextDTHDataFrom i T \<longrightarrow> \<not> nextHTDDataPending T i) \<and> \<commen...'],
    [399, 'AI_MODIFIED', '(\<forall>i. nextDTHDataFrom i T \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<...'],
    [400, 'AI_MODIFIED', '(HSTATE SA T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and> \<comment>\<open>Original:...'],
    [401, 'AI_MODIFIED', '(HSTATE SD T \<longrightarrow> (\<exists>i. \<not> CSTATE IIA T i)) \<and> \<comment>\<open>Origi...'],
    [402, 'AI_MODIFIED', '(HSTATE SAD T \<longrightarrow> (\<forall>i. \<not> CSTATE IIA T i \<or> nextSnpRespIs RspIFwdM T...'],
    [403, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IIA T i \<and> nextGOPendingIs GO_WritePull...'],
    [404, 'AI_MODIFIED', '(\<not> (\<forall>i. CSTATE IIA T i)) \<and> \<comment>\<open>Original: (CSTATE IIA T 0 \<longrig...'],
    [405, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> nextGOPendingIs GO_WritePull...'],
    [406, 'AI_MODIFIED', '(\<forall>i. snpresps T i \<noteq> [] \<longrightarrow> reqresps T i = []) \<and> \<comment>\<ope...'],
    [407, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>...'],
    [408, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longright...'],
    [409, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T i \<...'],
    [410, 'AI_MODIFIED', '(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<an...'],
    [411, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict T) \<and>'],
    [412, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T)...'],
    [413, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<longrightarrow> htddatas T i = [] \<and> (\<exists>j. j \<noteq> i ...'],
    [414, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T) \...'],
    [415, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull T i \<longrightarrow> HSTATE IB T...'],
    [416, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T)...'],
    [417, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull T i \<longrightarrow> (\<forall>j...'],
    [418, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict T) \<and> \<comment>\<open>True, i...'],
    [419, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i...'],
    [420, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) ...'],
    [421, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePullDrop T i \<longrightarrow> HSTATE ...'],
    [422, 'NEEDS_ATTENTION', '(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i...'],
    [423, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextHTDDataPending T i \<longrightarrow>  HSTATE ModifiedM T ...'],
    [424, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextHTDDataPending T i \<longrightarrow>  HSTATE SharedM T \<...'],
    [425, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<not...'],
    [426, 'NEEDS_ATTENTION', '(C_not_C_msg Modified IMAD nextGOPending T) \<and>'],
    [427, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextGOPending T i \<longrightarrow> HSTATE MD T \<or> HSTATE ...'],
    [428, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<longrightarrow> nextStore T i) \<and> \<comment>\<open>Original: (...'],
    [429, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextGOPending T i \<longrightarrow> (\<forall>j. j \<noteq> i...'],
    [430, 'AI_MODIFIED', '(\<forall>i. snpresps T i \<noteq> [] \<longrightarrow> reqresps T i = []) \<and> \<comment>\<ope...'],
    [431, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<longrightarrow>  HSTATE MD T \<or> HSTATE...'],
    [432, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<longrightarrow> nextStore T i) \<and> \<comment>\<open>Original: (...'],
    [433, 'NEEDS_ATTENTION', '(C_msg_P_same IMA (nextGOPending) nextStore T) \<and>'],
    [434, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<or> CSTATE SMA T i \<or> CSTATE ISA T i \<longrightarrow> \<not> ne...'],
    [435, 'NEEDS_ATTENTION', '(C_msg_P_oppo IMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>'],
    [436, 'NEEDS_ATTENTION', '(C_msg_P_oppo SMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>'],
    [437, 'NEEDS_ATTENTION', '(C_msg_P_oppo ISA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>'],
    [438, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<and> nextGOPending T i \<longrightarrow>  HSTATE ModifiedM T \<or> ...'],
    [439, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<or> CSTATE SMD T i \<or> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \...'],
    [440, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<or> CSTATE SMA T i \<or> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \...'],
    [441, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<or> CSTATE SMD T i \<or> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \...'],
    [442, 'NEEDS_ATTENTION', '(C_msg_P_same SMA (nextGOPending) nextStore T) \<and>'],
    [443, 'AI_MODIFIED', '(\<forall>i. (CSTATE SMA T i \<and> nextGOPending T i \<or> CSTATE IMD T i \<and> nextHTDDataPend...'],
    [444, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<or> CSTATE ISAD T i \<or> CSTATE ISA T i \<or> CSTATE ISDI T i \<lo...'],
    [445, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<or> CSTATE IMAD T i \<or> CSTATE IMA T i \<or> CSTATE SMD T i \<or>...'],
    [446, 'AI_MODIFIED', '(\<forall>i. (CSTATE ISAD T i \<and> nextGOPending T i) \<or> CSTATE ISA T i \<or> ( nextHTDDataP...'],
    [447, 'AI_MODIFIED', '(\<forall>i. CSTATE ISA T i \<and> nextGOPending T i \<longrightarrow> HSTATE SharedM T \<or> HST...'],
    [448, 'AI_MODIFIED', '(\<forall>i. CSTATE ISDI T i \<and> nextHTDDataPending T i \<longrightarrow> HSTATE ModifiedM T \...'],
    [449, 'AI_MODIFIED', '(\<forall>i. CSTATE ISDI T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> snps T...'],
    [450, 'AI_MODIFIED', '(\<forall>i. CSTATE ISDI T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<not>...'],
    [451, 'AI_MODIFIED', '(\<forall>i. CSTATE Invalid T i \<longrightarrow> reqresps T i = []) \<and> \<comment>\<open>Orig...'],
    [452, 'AI_MODIFIED', '(\<forall>i. CSTATE Shared T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and...'],
    [453, 'AI_MODIFIED', '(\<forall>i. CSTATE Shared T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<n...'],
    [454, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<not...'],
    [455, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> reqresps T i = [] \<and> htddatas T i = [] \<and> nextSnoopIs...'],
    [456, 'AI_MODIFIED', '(\<forall>i. nextReqIs RdOwn T i \<longrightarrow> CSTATE SMAD T i \<or> CSTATE IMAD T i) \<and> ...'],
    [457, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextSnoopIs SnpInv T i \<and> CXL_SPG_used T i \<longrightarr...'],
    [458, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and> \...'],
    [459, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...'],
    [460, 'AI_MODIFIED', '(HSTATE MD T \<longrightarrow> (\<forall>i. snpresps T i = [])) \<and> \<comment>\<open>Original:...'],
    [461, 'AI_MODIFIED', '(\<forall>i. HSTATE MD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \...'],
    [462, 'AI_MODIFIED', '(\<forall>i. HSTATE MD T \<and> nextDTHDataFrom i T \<longrightarrow>  \<not> nextReqIs CleanEvic...'],
    [463, 'AI_MODIFIED', '(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and> \<co...'],
    [464, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i ...'],
    [465, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. j \<noteq> i ...'],
    [466, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow>  \<not> nextReqIs CleanEvi...'],
    [467, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> \<not> CSTATE Modified T i...'],
    [468, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. j \<noteq> i ...'],
    [469, 'AI_MODIFIED', '(\<forall>i. (HSTATE SAD T \<or> HSTATE MAD T \<or> HSTATE SA T \<or> HSTATE MA T) \<and> snpresp...'],
    [470, 'AI_MODIFIED', '(\<forall>i. nextSnpRespIs RspSFwdM T i \<longrightarrow> CSTATE Shared T i \<or> CSTATE SMAD T i...'],
    [471, 'AI_MODIFIED', '(\<forall>i. (CSTATE Invalid T i  \<or> CSTATE ISDI T i \<or> nextReqIs RdOwn T i) \<and> HSTATE ...'],
    [472, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<...'],
    [473, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \...'],
    [474, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and> ...'],
    [475, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...'],
    [476, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and>...'],
    [477, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<not...'],
    [478, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and> ...'],
    [479, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...'],
    [480, 'AI_MODIFIED', '(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<and>...'],
    [481, 'AI_MODIFIED', '(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpData T i \<longrightarrow> (\<exists>j. j \<not...'],
    [482, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \...'],
    [483, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpData T i \<longrightarrow> (\<exists>j. j ...'],
    [484, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<longrightarrow> reqs T i = []) \<and> \<comment>\<open>Origina...'],
    [485, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> sn...'],
    [486, 'AI_MODIFIED', '(\<forall>i. HSTATE InvalidM T \<and> nextReqIs RdShared T i \<longrightarrow> (\<forall>j. j \<n...'],
    [487, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i \<and> \<not> CSTATE...'],
    [488, 'AI_MODIFIED', '(\<forall>i. nextReqIs RdOwn T i \<longrightarrow> \<not> CSTATE ISAD T i \<and> \<not> CSTATE In...'],
    [489, 'AI_MODIFIED', '(\<forall>i. HSTATE InvalidM T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<an...'],
    [490, 'AI_MODIFIED', '(\<forall>i. HSTATE InvalidM T \<and> nextReqIs RdOwn T i \<longrightarrow> (\<forall>j. j \<note...'],
    [491, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [492, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and> \...'],
    [493, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<and> CXL_SPG_used T i \<longrightarro...'],
    [494, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...'],
    [495, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<not...'],
    [496, 'AI_MODIFIED', '(HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i \<and> \<not> CSTATE Share...'],
    [497, 'AI_MODIFIED', '(\<forall>i. HSTATE ModifiedM T \<and> nextReqIs DirtyEvict T i \<longrightarrow> (\<not> (\<fora...'],
    [498, 'AI_MODIFIED', '(\<forall>i. HSTATE ID T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<and> \<c...'],
    [499, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<longrightarrow> nextHTDDataPending T i) \...'],
    [500, 'NEEDS_ATTENTION', '(C_msg_P_oppo SMAD nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) T) \<and>'],
    [501, 'AI_MODIFIED', '(\<forall>i. HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T i \<longrightarrow> CSTATE SIAC...'],
    [502, 'AI_MODIFIED', '(\<forall>i. nextGOPendingIs GO_WritePull T i \<and> HSTATE InvalidM T \<longrightarrow> (\<foral...'],
    [503, 'AI_MODIFIED', '(\<forall>i. HSTATE SharedM T \<and> (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T...'],
    [504, 'AI_MODIFIED', '(\<forall>i. HSTATE SharedM T \<and> (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T...'],
    [505, 'AI_MODIFIED', '(\<forall>i. HSTATE SharedM T \<and> (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T...'],
    [506, 'AI_MODIFIED', '(\<forall>i. CSTATE Shared T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<n...'],
    [507, 'AI_MODIFIED', '(\<forall>i. nextReqIs DirtyEvict T i \<longrightarrow> nextEvict T i) \<and> \<comment>\<open>Or...'],
    [508, 'AI_MODIFIED', '(\<forall>i. nextReqIs DirtyEvict T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \...'],
    [509, 'AI_MODIFIED', '(\<forall>i. nextReqIs DirtyEvict T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \...'],
    [510, 'AI_MODIFIED', '(\<forall>i. nextReqIs DirtyEvict T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \...'],
    [511, 'AI_MODIFIED', '(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<note...'],
    [512, 'AI_MODIFIED', '(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<and> nextSnoopIs SnpInv T i \<longrig...'],
    [513, 'AI_MODIFIED', '(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<and> nextSnoopIs SnpData T i \<longri...'],
    [514, 'AI_MODIFIED', '(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<note...'],
    [515, 'AI_MODIFIED', '(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<note...'],
    [516, 'AI_MODIFIED', '(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> (C...'],
    [517, 'AI_MODIFIED', '((\<exists>i. CSTATE Shared T i) \<longrightarrow> \<not> HSTATE MD T) \<and> \<comment>\<open>Or...'],
    [518, 'AI_MODIFIED', '(\<forall>i. CSTATE Shared T i \<and> HSTATE MA T \<longrightarrow> (\<exists>j. j \<noteq> i \<a...'],
    [519, 'AI_MODIFIED', '(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> ne...'],
    [520, 'AI_MODIFIED', '(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> \<...'],
    [521, 'AI_MODIFIED', '(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> \<...'],
    [522, 'AI_MODIFIED', '(\<forall>i. CSTATE IIA T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \<noteq> i ...'],
    [523, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE IMA T i \<and> \<not> CSTATE SMA ...'],
    [524, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> ((CSTATE IMAD T i \<or> CSTATE SMAD T i)...'],
    [525, 'AI_MODIFIED', '((\<exists>i. nextGOPendingIs GO_WritePull T i) \<longrightarrow> \<not> HSTATE InvalidM T) \<and...'],
    [526, 'AI_MODIFIED', '(\<forall>i. CSTATE MIA T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<not> ...'],
    [527, 'AI_MODIFIED', '(\<forall>i. nextGOPendingIs GO_WritePull T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longr...'],
    [528, 'AI_MODIFIED', '(\<forall>i. (CSTATE IMA T i \<or> CSTATE SMA T i \<or> (CSTATE IMAD T i \<or> CSTATE SMAD T i) \...'],
    [529, 'AI_MODIFIED', '(\<forall>i. CSTATE MIA T i \<longrightarrow> htddatas T i = [] \<and> (\<forall>j. j \<noteq> i ...'],
    [530, 'AI_MODIFIED', '(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and> ...'],
    [531, 'AI_MODIFIED', '(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...'],
    [532, 'NEEDS_ATTENTION', '((HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE ModifiedM T) \<longrightarrow> (\<forall>...'],
    [533, 'AI_MODIFIED', '(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePullDrop T i \<longrightarrow> (\<fora...'],
    [534, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and> \<comment>\<open>Ori...'],
    [535, 'AI_MODIFIED', '(\<forall>i. CSTATE Invalid T i \<longrightarrow> \<not> nextSnoopIs SnpInv T i) \<and> \<comment...'],
    [536, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<...'],
    [537, 'AI_MODIFIED', '(\<forall>i. HSTATE MA T \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...'],
    [538, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<longrightarrow> (\<forall>j. j \<noteq> i...'],
    [539, 'AI_MODIFIED', '(\<forall>i. HSTATE MA T \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...'],
    [540, 'AI_MODIFIED', '(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE ISD T i \<and> ...'],
    [541, 'AI_MODIFIED', '(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE SMD T i \<and> ...'],
    [542, 'AI_MODIFIED', '(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> ...'],
    [543, 'AI_MODIFIED', '(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> (CSTATE ISAD T i \<and...'],
    [544, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [545, 'AI_MODIFIED', '(\<forall>i. CSTATE ISA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [546, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<not...'],
    [547, 'AI_MODIFIED', '(\<forall>i. CSTATE IMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<not...'],
    [548, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [549, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [550, 'AI_MODIFIED', '(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<and> nextSnoopIs SnpInv T i \<longrightar...'],
    [551, 'AI_MODIFIED', '(\<forall>i. CSTATE SMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [552, 'AI_MODIFIED', '(\<forall>i. CSTATE SMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<note...'],
    [553, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<or> CSTATE ISA T i \<longrightarrow> \<not> HSTATE MD T) \<and> \<c...'],
    [554, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> (nextHTDDataPending T i \<or> nextGOPending T i) \<longrighta...'],
    [555, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<and> HSTATE MA T \<longrightarrow> (\<forall>j. j \<noteq> i \<long...'],
    [556, 'AI_MODIFIED', '(\<forall>i. CSTATE ISA T i \<and> HSTATE MA T \<longrightarrow> (\<forall>j. j \<noteq> i \<long...'],
    [557, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<note...'],
    [558, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<note...'],
    [559, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<note...'],
    [560, 'AI_MODIFIED', '(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and> \...'],
    [561, 'AI_MODIFIED', '(\<forall>i. CSTATE ISA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and> \...'],
    [562, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextGOPending T i \<and> nextSnoopIs SnpInv T i \<longrightar...'],
    [563, 'AI_MODIFIED', '(\<forall>i. CSTATE ISAD T i \<and> nextHTDDataPending T i \<and> nextSnoopIs SnpInv T i \<longri...'],
    [564, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE IMA T i \<and> \<not> CSTATE SMA T...'],
    [565, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<not> CSTATE SMD T...'],
    [566, 'NEEDS_ATTENTION', '(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending T 0 \<or> nextH...'],
    [567, 'NEEDS_ATTENTION', '(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending T 1 \<or> nextH...'],
    [568, 'NEEDS_ATTENTION', '(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> (nextGOPending T 0 \<or> nextH...'],
    [569, 'NEEDS_ATTENTION', '(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> (nextGOPending T 1 \<or> nextH...'],
    [570, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and> \<comment>\<open>...'],
    [571, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and> \<comment>\<open...'],
    [572, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE ISD T i \<and> \<not> CSTATE IMD ...'],
    [573, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> (CSTATE ISAD T i \<and> nextGOPending T ...'],
    [574, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> (CSTATE IMAD T i \<and> nextGOPending T ...'],
    [575, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> (CSTATE SMAD T i \<and> nextGOPending T ...'],
    [576, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i \<and> \<not> CSTATE IMA ...'],
    [577, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> nextHTDDataPending T i)) \<and> \<commen...'],
    [578, 'NEEDS_ATTENTION', '(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 0) \<and>'],
    [579, 'NEEDS_ATTENTION', '(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 1) \<and>'],
    [580, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and> \<comment>\...'],
    [581, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMD T i \<and> nextHTDDataPending T i \<lon...'],
    [582, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextHTDDataPending T i \<an...'],
    [583, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMD T i \<and> nextSnoopIs SnpData T i \<lo...'],
    [584, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextSnoopIs SnpData T i \<lo...'],
    [585, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextSnoopIs SnpData T i \<l...'],
    [586, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<and>...'],
    [587, 'AI_MODIFIED', '(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<and>...'],
    [588, 'NEEDS_ATTENTION', '(CSTATE IMA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>'],
    [589, 'NEEDS_ATTENTION', '(CSTATE IMAD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>'],
    [590, 'NEEDS_ATTENTION', '(CSTATE IMAD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>'],
    [591, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i \<and> \<not> CSTATE Share...'],
    [592, 'AI_MODIFIED', '(\<forall>i. HSTATE IB T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<and> \<c...'],
    [593, 'AI_MODIFIED', '(HSTATE SB T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and> \<comment>\<open>...'],
    [594, 'AI_MODIFIED', '(HSTATE SB T \<longrightarrow> (\<forall>i. length (dthdatas T i) \<le> 1)) \<and> \<comment>\<op...'],
    [595, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. length (dthdatas T i) \<le> 1)) \<and> \<comment>\<op...'],
    [596, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SB T \<and> nextDTHDataFrom i T \<longright...'],
    [597, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. length (dthdatas T i) \<le> 1)) \<and> \<comment>\<op...'],
    [598, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SB T \<and> nextDTHDataFrom i T \<longright...'],
    [599, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longright...'],
    [600, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longright...'],
    [601, 'AI_MODIFIED', '(HSTATE SB T \<longrightarrow> (\<forall>i. snps T i = [])) \<and> \<comment>\<open>Original: (HS...'],
    [602, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. snps T i = [])) \<and> \<comment>\<open>Original: (HS...'],
    [603, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. snps T i = [])) \<and> \<comment>\<open>Original: (HS...'],
    [604, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SB T \<and> nextDTHDataFrom i T \<longright...'],
    [605, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longright...'],
    [606, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longright...'],
    [607, 'AI_MODIFIED', '(HSTATE SB T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<not> CSTATE SMD T i)) ...'],
    [608, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<not> CSTATE SMD T i)) ...'],
    [609, 'AI_MODIFIED', '(\<forall>i. HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T i \<longrig...'],
    [610, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SharedM T \<and> lastSharer T \<and> nextRe...'],
    [611, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISAD T i \<and> nextHTDDataPending T i \<lo...'],
    [612, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> nextDTHDataFrom i T \<longrigh...'],
    [613, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISAD T i \<and> nextHTDDataPending T i \<an...'],
    [614, 'AI_MODIFIED', '(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not> CSTATE SIA T i \<or> nextGOPendingIs GO...'],
    [615, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MA T \<and> snpresps T i \<noteq> [] \<long...'],
    [616, 'AI_MODIFIED', '(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE SIA T i)) \<and> \<comment>\<open>Origi...'],
    [617, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<longrightarrow> \<not> (CSTATE IM...'],
    [618, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<longrightarrow> \<not> (CSTATE SM...'],
    [619, 'AI_MODIFIED', '(\<forall>i. HSTATE ModifiedM T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<a...'],
    [620, 'AI_MODIFIED', '(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i)) \<and> \<comment>\<ope...'],
    [621, 'AI_MODIFIED', '(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i)) \<and> \<comment>\<open>Origi...'],
    [622, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MA T \<and> snpresps T i \<noteq> [] \<long...'],
    [623, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> HSTATE ModifiedM T \<longrig...'],
    [624, 'NEEDS_ATTENTION', '(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> C...'],
    [625, 'NEEDS_ATTENTION', '(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> C...'],
    [626, 'NEEDS_ATTENTION', '(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextG...'],
    [627, 'NEEDS_ATTENTION', '(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextG...'],
    [628, 'NEEDS_ATTENTION', '(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>'],
    [629, 'NEEDS_ATTENTION', '(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>'],
    [630, 'AI_MODIFIED', '(\<forall>i. CSTATE IMD T i \<longrightarrow> reqresps T i = []) \<and> \<comment>\<open>Original...'],
    [631, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longright...'],
    [632, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i \<and> \<not> CSTATE ISD T i)) ...'],
    [633, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE SMA T i \<and> \<not> CSTATE SMD T i)) ...'],
    [634, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE IMA T i \<and> \<not> CSTATE IMD T i)) ...'],
    [635, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and> \<comment>\<open>Origi...'],
    [636, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> nextHTDDataPending T i)) \<and> \<comment>\<op...'],
    [637, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longright...'],
    [638, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longright...'],
    [639, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longright...'],
    [640, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ModifiedM T \<and> nextReqIs RdShared T i \...'],
    [641, 'AI_MODIFIED', '(HSTATE SD T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and> \<comment>\<open>Origi...'],
    [642, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> snpresps T i \<noteq> [] \<lon...'],
    [643, 'AI_MODIFIED', '(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and> \<comment>\<open>Origi...'],
    [644, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (snpresps T i \<noteq> [] \<and> HSTATE MAD T \<lon...'],
    [645, 'NEEDS_ATTENTION', '(snpresps2 T \<noteq> [] \<and> HSTATE MAD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not...'],
    [646, 'NEEDS_ATTENTION', '(CSTATE IMD T 0 \<and> HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snps1 T = [] \<and> ...'],
    [647, 'NEEDS_ATTENTION', '(CSTATE IMD T 1 \<and> HSTATE MD T \<longrightarrow> snpresps2 T = [] \<and> snps2 T = [] \<and> ...'],
    [648, 'NEEDS_ATTENTION', '(nextDTHDataFrom 0 T \<and> HSTATE MD T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD ...'],
    [649, 'NEEDS_ATTENTION', '(nextDTHDataFrom 1 T \<and> HSTATE MD T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD ...'],
    [650, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> nextSnpRespIs RspSFwdM T i \<l...'],
    [651, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextGOPending T i \<longrigh...'],
    [652, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longright...'],
    [653, 'AI_MODIFIED', '(HSTATE SA T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and> \<co...'],
    [654, 'AI_MODIFIED', '(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>...'],
    [655, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IIA T i \<and> HSTATE SA T \<longrightarrow...'],
    [656, 'AI_MODIFIED', '(\<forall>i. HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrightarrow> htddatas T i = [] \<or...'],
    [657, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE ISD T i)) \<and> \<comment>\<open>Origi...'],
    [658, 'AI_MODIFIED', '(\<forall>i. HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarrow> CSTATE Invalid T i \<or> CS...'],
    [659, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE Shared T i)) \<and> \<comment>\<open>Or...'],
    [660, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. snpresps T i = [])) \<and> \<comment>\<open>Original:...'],
    [661, 'AI_MODIFIED', '(\<forall>i. HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> nextGOP...'],
    [662, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE SIA T i)) \<and> \<comment>\<open>Origi...'],
    [663, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longright...'],
    [664, 'AI_MODIFIED', '(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i)) \<and> \<comment>\<open>Origi...'],
    [665, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull...'],
    [666, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longright...'],
    [667, 'AI_MODIFIED', '(\<forall>i. HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> nextGOP...'],
    [668, 'AI_MODIFIED', '(\<forall>i. HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE ...'],
    [669, 'AI_MODIFIED', '(\<forall>i. HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> nextGOP...'],
    [670, 'AI_MODIFIED', '(\<forall>i. CSTATE Modified T i \<longrightarrow> \<not> nextReqIs RdOwn T i) \<and> \<comment>\...'],
    [671, 'NEEDS_ATTENTION', '(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE ISD T 1) \<and>'],
    [672, 'NEEDS_ATTENTION', '(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE ISD T 0) \<and>'],
    [673, 'NEEDS_ATTENTION', '(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOP...'],
    [674, 'NEEDS_ATTENTION', '(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOP...'],
    [675, 'NEEDS_ATTENTION', '(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE IMA T 1 \<and> nextGOPe...'],
    [676, 'NEEDS_ATTENTION', '(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE IMA T 0 \<and> nextGOPe...'],
    [677, 'NEEDS_ATTENTION', '(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISA T 1 \<and> nextGOPe...'],
    [678, 'NEEDS_ATTENTION', '(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISA T 0 \<and> nextGOPe...'],
    [679, 'NEEDS_ATTENTION', '((CSTATE ISAD T 0 \<and> nextGOPending T 0) \<or> CSTATE ISA T 0 \<or> ( nextHTDDataPending T 0) ...'],
    [680, 'NEEDS_ATTENTION', '((CSTATE ISAD T 1 \<and> nextGOPending T 1) \<or> CSTATE ISA T 1 \<or> ( nextHTDDataPending T 1) ...'],
    [681, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MAD T \<and> nextDTHDataFrom i T \<longrigh...'],
    [682, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> \<not> CSTATE MIA T i) \<a...'],
    [683, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE...'],
    [684, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> \<not> CSTAT...'],
    [685, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> \<not> CSTAT...'],
    [686, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> snpresps T j...'],
    [687, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrigh...'],
    [688, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrigh...'],
    [689, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrigh...'],
    [690, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrigh...'],
    [691, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Invalid T i \<longrightarrow> snps T j = []...'],
    [692, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longright...'],
    [693, 'AI_MODIFIED', '(HSTATE SAD T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and> \<c...'],
    [694, 'AI_MODIFIED', '(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE...'],
    [695, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<and> ne...'],
    [696, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<and> ne...'],
    [697, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<and> ne...'],
    [698, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull...'],
    [699, 'NEEDS_ATTENTION', '(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE SB T \<longrightarrow> \<no...'],
    [700, 'NEEDS_ATTENTION', '(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE SB T \<longrightarrow> \<no...'],
    [701, 'NEEDS_ATTENTION', '(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 0 \<longrightarrow> CSTATE IIA T 0) \<and>'],
    [702, 'NEEDS_ATTENTION', '(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 1 \<longrightarrow> CSTATE IIA T 1) \<and>'],
    [703, 'NEEDS_ATTENTION', '(HSTATE InvalidM T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDro...'],
    [704, 'NEEDS_ATTENTION', '(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE ...'],
    [705, 'NEEDS_ATTENTION', '(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE ...'],
    [706, 'NEEDS_ATTENTION', '(length (dthdatas1 T) \<le> 1) \<and>'],
    [707, 'NEEDS_ATTENTION', '(length (dthdatas2 T) \<le> 1) \<and>'],
    [708, 'NEEDS_ATTENTION', '(HSTATE IB T \<and> CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<no...'],
    [709, 'NEEDS_ATTENTION', '(HSTATE IB T \<and> CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<no...'],
    [710, 'AI_MODIFIED', '(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE...'],
    [711, 'AI_MODIFIED', '(\<forall>i. HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrightarrow> (\<forall>j. \<not> CS...'],
    [712, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextGOPending T i \<and> HS...'],
    [713, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextGOPending T i \<longrigh...'],
    [714, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrigh...'],
    [715, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> dthdatas T j...'],
    [716, 'AI_MODIFIED', '(\<forall>i. nextSnpRespIs RspIHitSE T i \<longrightarrow> \<not> CSTATE IMA T i \<and> \<not> CS...'],
    [717, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMD T i \<and> nextHTDDataPending T i \<lon...'],
    [718, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMD T i \<and> nextHTDDataPending T i \<lon...'],
    [719, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextGOPending T i \<longrigh...'],
    [720, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrigh...'],
    [721, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextGOPending T i \<longrig...'],
    [722, 'AI_MODIFIED', '(\<forall>i. HSTATE MD T \<and> nextDTHDataFrom i T \<longrightarrow> \<not> CSTATE SMAD T i) \<a...'],
    [723, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<longrig...'],
    [724, 'AI_MODIFIED', '(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE SMAD T i)) \<and> \<comment>\<ope...'],
    [725, 'AI_MODIFIED', '(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE SMAD T i)) \<and> \<comment>\<open>Orig...'],
    [726, 'AI_MODIFIED', '(HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE SMAD T i)) \<and> \<comment>\<open>Orig...'],
    [727, 'AI_MODIFIED', '(\<forall>i. HSTATE MA T \<and> nextSnpRespIs RspIHitSE T i \<longrightarrow> \<not> nextReqIs Di...'],
    [728, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> htddatas T j...'],
    [729, 'NEEDS_ATTENTION', '(HSTATE ModifiedM T \<longrightarrow> snps1 T = [] \<and> snps2 T = []) \<and>'],
    [730, 'NEEDS_ATTENTION', '(CSTATE SMAD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CS...'],
    [731, 'NEEDS_ATTENTION', '(CSTATE SMAD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CS...'],
    [732, 'NEEDS_ATTENTION', '(CSTATE SMAD T 1 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> ne...'],
    [733, 'NEEDS_ATTENTION', '(CSTATE SMAD T 0 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> ne...'],
    [734, 'NEEDS_ATTENTION', '(CSTATE SIAC T 0 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 1) \<and>'],
    [735, 'NEEDS_ATTENTION', '(CSTATE SIAC T 1 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 0) \<and>'],
    [736, 'NEEDS_ATTENTION', '(CSTATE SIAC T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) \<and>'],
    [737, 'NEEDS_ATTENTION', '(CSTATE SIAC T 1 \<longrightarrow> \<not> nextHTDDataPending T 1) \<and>'],
    [738, 'NEEDS_ATTENTION', '((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) --> snps2 T = [...'],
    [739, 'NEEDS_ATTENTION', '((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) --> snps1 T = [...'],
    [740, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> ((CSTATE SIAC T i \<and> nextGOPending T i \<and> n...'],
    [741, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> ((CSTATE SIAC T i \<and> nextGOPending T i \<and> n...'],
    [742, 'AI_MODIFIED', '(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) \<a...'],
    [743, 'AI_MODIFIED', '(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) \<a...'],
    [744, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> ((CSTATE SIAC T i \<and> nextGOPending T i \<and> n...'],
    [745, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> ((CSTATE SIAC T i \<and> nextGOPending T i \<and> n...'],
    [746, 'AI_MODIFIED', '(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) -->...'],
    [747, 'AI_MODIFIED', '(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) -->...'],
    [748, 'AI_MODIFIED', '(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) -->...'],
    [749, 'AI_MODIFIED', '(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) -->...'],
    [750, 'AI_MODIFIED', '(\<forall>i. HSTATE MA T \<and> nextSnpRespIs RspIFwdM T i \<longrightarrow> \<not> nextHTDDataPe...'],
    [751, 'AI_MODIFIED', '(HSTATE SB T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and> \<comment>\<open>Origi...'],
    [752, 'AI_MODIFIED', '(\<forall>i. nextReqIs CleanEvictNoData T i \<longrightarrow> CSTATE SIAC T i) \<and> \<comment>\...'],
    [753, 'AI_MODIFIED', '(\<forall>i. nextSnpRespIs RspIHitSE T i \<longrightarrow> \<not> nextDTHDataFrom i T) \<and> \<c...'],
    [754, 'AI_MODIFIED', '(\<forall>i. nextSnpRespIs RspIFwdM T i \<longrightarrow> \<not> nextReqIs CleanEvictNoData T i) ...'],
    [755, 'AI_MODIFIED', '(\<forall>i. CSTATE SMA T i \<and> nextSnoopIs SnpData T i \<and> nextGOPending T i \<longrightar...'],
    [756, 'NEEDS_ATTENTION', '((CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0) \<and> HSTATE ModifiedM T \<longrig...'],
    [757, 'NEEDS_ATTENTION', '((CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1) \<and> HSTATE ModifiedM T \<longrig...'],
    [758, 'NEEDS_ATTENTION', '((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<no...'],
    [759, 'NEEDS_ATTENTION', '((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<no...'],
    [760, 'NEEDS_ATTENTION', '((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<no...'],
    [761, 'NEEDS_ATTENTION', '((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<no...'],
    [762, 'NEEDS_ATTENTION', '((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<no...'],
    [763, 'NEEDS_ATTENTION', '((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<no...'],
    [764, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longright...'],
    [765, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longright...'],
    [766, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longright...'],
    [767, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longright...'],
    [768, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> nextGOPendingIs GO_WritePull...'],
    [769, 'AI_MODIFIED', '(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> nextGOPendingIs GO_WritePull...'],
    [770, 'AI_MODIFIED', '(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE...'],
    [771, 'NEEDS_ATTENTION', ')"'],
]

# Summary statistics
def get_stats():
    total_lines = len(progress)
    ai_modified = len([p for p in progress if p[1] == 'AI_MODIFIED'])
    human_inspected = len([p for p in progress if p[1] == 'AI_MODIFIED+HUMAN_INSPECTED'])
    needs_attention = len([p for p in progress if p[1] == 'NEEDS_ATTENTION'])
    completed = len([p for p in progress if p[1] == 'completed'])
    
    return {
        'total_lines': total_lines,
        'ai_modified': ai_modified,
        'human_inspected': human_inspected,
        'needs_attention': needs_attention,
        'completed': completed,
        'progress_percentage': round((ai_modified + human_inspected + completed) / total_lines * 100, 1) if total_lines > 0 else 0
    }

# Get current statistics
current_stats = get_stats()
print(f"SWMR Modification Progress:")
print(f"Total lines: {current_stats['total_lines']}")
print(f"AI Modified: {current_stats['ai_modified']}")
print(f"Human Inspected: {current_stats['human_inspected']}")
print(f"Needs Attention: {current_stats['needs_attention']}")
print(f"Completed: {current_stats['completed']}")
print(f"Progress: {current_stats['progress_percentage']}%")

# Progress bar visualization
def print_progress_bar():
    stats = get_stats()
    total = stats['total_lines']
    completed = stats['ai_modified'] + stats['human_inspected'] + stats['completed']
    
    bar_length = 50
    filled_length = int(bar_length * completed / total) if total > 0 else 0
    bar = '█' * filled_length + '-' * (bar_length - filled_length)
    
    print(f"\nProgress Bar: [{bar}] {stats['progress_percentage']}%")
    print(f"Completed: {completed}/{total} lines")

# Call progress bar
print_progress_bar()

if __name__ == "__main__":
    print_progress_bar()


def get_mapping_relationships():
    """Get all mapping relationships between original and current conjuncts"""
    return [
        {
            'original_lines': [200],
            'current_line': 286,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [201],
            'current_line': 287,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [202],
            'current_line': 288,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [203],
            'current_line': 289,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [204],
            'current_line': 290,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [205],
            'current_line': 291,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [206],
            'current_line': 292,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [207],
            'current_line': 293,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [208],
            'current_line': 294,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [209],
            'current_line': 295,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [210],
            'current_line': 296,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [211],
            'current_line': 297,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [212],
            'current_line': 298,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [213],
            'current_line': 299,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [214],
            'current_line': 300,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [215],
            'current_line': 301,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [216],
            'current_line': 302,
            'consolidation_type': '1_to_1',
            'transformation_type': 'no_change',
            'confidence_score': 1.000
        },
        {
            'original_lines': [],
            'current_line': 306,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 307,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 308,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 309,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 310,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 311,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 312,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 316,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 318,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 319,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 321,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 322,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 323,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 324,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 325,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 326,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 330,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 331,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 332,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 341,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 349,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 411,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 412,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 414,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 416,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 426,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 433,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 435,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 436,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 437,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 442,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 500,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [217],
            'current_line': 566,
            'consolidation_type': '1_to_1',
            'transformation_type': 'single_conjunct_transformation',
            'confidence_score': 0.707
        },
        {
            'original_lines': [],
            'current_line': 567,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 568,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 569,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 578,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [218],
            'current_line': 579,
            'consolidation_type': '1_to_1',
            'transformation_type': 'single_conjunct_transformation',
            'confidence_score': 0.708
        },
        {
            'original_lines': [],
            'current_line': 588,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 589,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 590,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [219],
            'current_line': 624,
            'consolidation_type': '1_to_1',
            'transformation_type': 'single_conjunct_transformation',
            'confidence_score': 0.790
        },
        {
            'original_lines': [],
            'current_line': 625,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 626,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 627,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 628,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 629,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 645,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 646,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 647,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 648,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 649,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 671,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 672,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 673,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 674,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 675,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 676,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 677,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 678,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 679,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 680,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 699,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 700,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 701,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 702,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 703,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 704,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 705,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 706,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 707,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 708,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 709,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 729,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 730,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 731,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 732,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 733,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 734,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 735,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 736,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 737,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 738,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 739,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 756,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 757,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 758,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 759,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 760,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 761,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 762,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
        {
            'original_lines': [],
            'current_line': 763,
            'consolidation_type': 'no_match',
            'transformation_type': 'unknown',
            'confidence_score': 0.000
        },
    ]

def get_consolidation_summary():
    """Get summary of consolidation patterns"""
    relationships = get_mapping_relationships()
    consolidation_counts = {}
    for rel in relationships:
        cons_type = rel['consolidation_type']
        consolidation_counts[cons_type] = consolidation_counts.get(cons_type, 0) + 1
    return consolidation_counts

def get_mapping_coverage():
    """Calculate mapping coverage statistics"""
    relationships = get_mapping_relationships()
    total_original_lines = set()
    for rel in relationships:
        total_original_lines.update(rel['original_lines'])
    
    return {
        'total_mappings': len(relationships),
        'original_lines_mapped': len(total_original_lines),
        'expected_original_lines': 796,
        'coverage_percentage': (len(total_original_lines) / 796) * 100.0
    }

def print_mapping_summary():
    """Print comprehensive mapping summary"""
    coverage = get_mapping_coverage()
    consolidation = get_consolidation_summary()
    
    print('=== CONJUNCT MAPPING ANALYSIS SUMMARY ===')
    print(f'Total mappings: {coverage["total_mappings"]}')
    print(f'Original lines mapped: {coverage["original_lines_mapped"]}/796')
    print(f'Coverage: {coverage["coverage_percentage"]:.1f}%')
    print()
    print('Consolidation patterns:')
    for pattern, count in consolidation.items():
        print(f'  {pattern}: {count}')
    print('=' * 45)