
## Conjunct Mapping Analysis

This section documents the detailed mapping between original conjuncts (OldCohProp.thy lines 200-995) and current conjuncts (CoherenceProperties.thy lines 286-771).

### Mapping Summary
- **Original Conjuncts**: 796 (lines 200-995)
- **Current Conjuncts**: 486 (lines 286-771)
- **Mapping Coverage**: 93.0% (740/796 original conjuncts mapped)
- **Consolidation Ratio**: 1.64 (796 original → 486 current)

### Consolidation Patterns
- **2_to_1**: 251 cases
- **4_to_1**: 1 cases
- **6_to_1**: 1 cases
- **1_to_1**: 228 cases

### Transformation Patterns
- **hardcoded_to_quantified**: 228 cases
- **multi_conjunct_consolidation**: 25 cases
- **no_change**: 56 cases
- **enhanced_quantification**: 134 cases
- **single_conjunct_transformation**: 38 cases

### Detailed Line-by-Line Mapping

#### Current Line 286 ← Original Lines 200
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 200: `"SWMR_state_machine T = ( (SWMR T) \<and>`

**Current Conjunct**:
- Line 286: `"SWMR_state_machine T = ( (SWMR T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 287 ← Original Lines 201
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 201: `C_msg_P_oppo ISD nextHTDDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 287: `C_msg_P_oppo ISD nextHTDDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 288 ← Original Lines 202
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 202: `H_msg_P_same SD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 288: `H_msg_P_same SD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 289 ← Original Lines 203
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 203: `H_msg_P_same SAD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 289: `H_msg_P_same SAD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 290 ← Original Lines 204
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 204: `C_msg_P_oppo ISAD nextGOPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 290: `C_msg_P_oppo ISAD nextGOPending (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 291 ← Original Lines 205
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 205: `H_msg_P_same SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 291: `H_msg_P_same SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 292 ← Original Lines 206
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 206: `H_msg_P_oppo SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 292: `H_msg_P_oppo SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 293 ← Original Lines 207
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 207: `H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Current Conjunct**:
- Line 293: `H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 294 ← Original Lines 208
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 208: `H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextDTHDataPending T i) T \<and>`

**Current Conjunct**:
- Line 294: `H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextDTHDataPending T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 295 ← Original Lines 209
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 209: `H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T \<an...`

**Current Conjunct**:
- Line 295: `H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T \<an...`

**Explanation**: Single conjunct transformation

---

#### Current Line 296 ← Original Lines 210
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 210: `H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T \<an...`

**Current Conjunct**:
- Line 296: `H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T \<an...`

**Explanation**: Single conjunct transformation

---

#### Current Line 297 ← Original Lines 211
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 211: `C_H_state IMAD (nextReqIs RdOwn) Modified SD T \<and>`

**Current Conjunct**:
- Line 297: `C_H_state IMAD (nextReqIs RdOwn) Modified SD T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 298 ← Original Lines 212
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 212: `C_H_state IMAD (nextReqIs RdOwn) Modified SAD T \<and>`

**Current Conjunct**:
- Line 298: `C_H_state IMAD (nextReqIs RdOwn) Modified SAD T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 299 ← Original Lines 213
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 213: `C_H_state IMAD (nextReqIs RdOwn) Modified SA T \<and>`

**Current Conjunct**:
- Line 299: `C_H_state IMAD (nextReqIs RdOwn) Modified SA T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 300 ← Original Lines 214
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 214: `C_H_state Invalid nextStore Modified SAD T \<and>`

**Current Conjunct**:
- Line 300: `C_H_state Invalid nextStore Modified SAD T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 301 ← Original Lines 215
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 215: `C_H_state Invalid nextStore Modified SA T \<and>`

**Current Conjunct**:
- Line 301: `C_H_state Invalid nextStore Modified SA T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 302 ← Original Lines 216
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 216: `C_H_state Invalid nextStore Modified SD T \<and>`

**Current Conjunct**:
- Line 302: `C_H_state Invalid nextStore Modified SD T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 303 ← Original Lines 217
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.903
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 217: `(HSTATE SharedM T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1) \<...`

**Current Conjunct**:
- Line 303: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 304 ← Original Lines 258, 259
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 258: `(CSTATE Modified T 0 \<longrightarrow> \<not>CSTATE Modified T 1) \<and>`
- Line 259: `(CSTATE Modified T 1 \<longrightarrow> \<not>CSTATE Modified T 0) \<and>`

**Current Conjunct**:
- Line 304: `(HSTATE SD T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 305 ← Original Lines 218
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.872
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 218: `(HSTATE SD T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1) \<and>`

**Current Conjunct**:
- Line 305: `(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 306 ← Original Lines 220
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 220: `C_msg_not RdShared IMAD T \<and>`

**Current Conjunct**:
- Line 306: `C_msg_not RdShared IMAD T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 307 ← Original Lines 221
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 221: `C_msg_not RdShared Invalid T \<and>`

**Current Conjunct**:
- Line 307: `C_msg_not RdShared Invalid T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 308 ← Original Lines 222
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 222: `H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (\<lambda>T i. CSTATE MIA T i \<or> CSTATE IIA T i) T ...`

**Current Conjunct**:
- Line 308: `H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (\<lambda>T i. CSTATE MIA T i \<or> CSTATE IIA T i) T ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 309 ← Original Lines 223
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 223: `C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (\<lambda>T. \<not> HSTATE ModifiedM T) T \<and>`

**Current Conjunct**:
- Line 309: `C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (\<lambda>T. \<not> HSTATE ModifiedM T) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 310 ← Original Lines 224
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 224: `C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict T \<and>`

**Current Conjunct**:
- Line 310: `C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 311 ← Original Lines 225
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 225: `C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) T \<and>`

**Current Conjunct**:
- Line 311: `C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 312 ← Original Lines 226
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 226: `C_state_not MIA RdShared T \<and>`

**Current Conjunct**:
- Line 312: `C_state_not MIA RdShared T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 313 ← Original Lines 227
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 227: `C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict T \<and>`

**Current Conjunct**:
- Line 313: `C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 314 ← Original Lines 228
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 228: `C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) T ...`

**Current Conjunct**:
- Line 314: `C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) T ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 315 ← Original Lines 229
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 229: `C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) T ...`

**Current Conjunct**:
- Line 315: `C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) T ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 316 ← Original Lines 230
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 230: `H_C_state_msg_same ModifiedM Modified (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>`

**Current Conjunct**:
- Line 316: `H_C_state_msg_same ModifiedM Modified (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 317 ← Original Lines 231
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 231: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict T \<and>`

**Current Conjunct**:
- Line 317: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 318 ← Original Lines 232
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 232: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<an...`

**Current Conjunct**:
- Line 318: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<an...`

**Explanation**: Single conjunct transformation

---

#### Current Line 319 ← Original Lines 233
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 233: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T \<an...`

**Current Conjunct**:
- Line 319: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T \<an...`

**Explanation**: Single conjunct transformation

---

#### Current Line 321 ← Original Lines 235
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 235: `C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) T \<and>`

**Current Conjunct**:
- Line 321: `C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 322 ← Original Lines 236
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 236: `C_msg_state RdShared ISAD T \<and>`

**Current Conjunct**:
- Line 322: `C_msg_state RdShared ISAD T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 323 ← Original Lines 237
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 237: `C_not_C_msg Modified ISAD nextGOPending T \<and>`

**Current Conjunct**:
- Line 323: `C_not_C_msg Modified ISAD nextGOPending T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 324 ← Original Lines 238
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 238: `C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextHTDDataPending T i) T \<and>`

**Current Conjunct**:
- Line 324: `C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextHTDDataPending T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 325 ← Original Lines 239
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 239: `C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextSnoopIs SnpInv T i) T \<and>`

**Current Conjunct**:
- Line 325: `C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextSnoopIs SnpInv T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 326 ← Original Lines 234
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: other
**Confidence Score**: 0.446
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 234: `H_C_state_msg_oppo ModifiedM IIA (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>`

**Current Conjunct**:
- Line 326: `C_msg_P_same ISAD nextGOPending (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 327 ← Original Lines 242
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.376
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 242: `(snps1 T \<noteq> [] \<longrightarrow> reqs2 T = [] \<and> snpresps1 T = [] \<and> dthdatas1 T = [] ...`

**Current Conjunct**:
- Line 327: `(\<forall>i j. i \<noteq> j \<longrightarrow> (snps T j \<noteq> [] \<longrightarrow> reqs T i = [] ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 328 ← Original Lines 265, 266
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: channel_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 265: `(length (htddatas1 T) \<le> 1) \<and>`
- Line 266: `(length (htddatas2 T) \<le> 1) \<and>`

**Current Conjunct**:
- Line 328: `(\<forall>i. length (reqs T i) \<le> 1) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 329 ← Original Lines 244
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.417
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 244: `(length (snps2 T) \<le> 1   \<and> length (snps1 T) \<le> 1) \<and>`

**Current Conjunct**:
- Line 329: `(\<forall>i. length (snps T i) \<le> 1) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 330 ← Original Lines 245
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 245: `C_msg_P_same Shared (nextSnoopIs SnpInv) (\<lambda>T i. \<not> nextHTDDataPending T i) T \<and>`

**Current Conjunct**:
- Line 330: `C_msg_P_same Shared (nextSnoopIs SnpInv) (\<lambda>T i. \<not> nextHTDDataPending T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 331 ← Original Lines 246
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 246: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T \<and>`

**Current Conjunct**:
- Line 331: `C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 332 ← Original Lines 247
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 247: `C_msg_P_oppo Invalid nextStore (\<lambda>T i. \<not> nextSnoopPending T i) T \<and>`

**Current Conjunct**:
- Line 332: `C_msg_P_oppo Invalid nextStore (\<lambda>T i. \<not> nextSnoopPending T i) T \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 333 ← Original Lines 248
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.426
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 248: `(CSTATE Invalid T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \...`

**Current Conjunct**:
- Line 333: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Invalid T i \<longrightarrow> snps T j = [] \<...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 334 ← Original Lines 250
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.425
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 250: `(CSTATE Shared T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<...`

**Current Conjunct**:
- Line 334: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Shared T i \<longrightarrow> snps T j = [] \<a...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 335 ← Original Lines 530
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.321
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 530: `(CSTATE Modified T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] ...`

**Current Conjunct**:
- Line 335: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IIA T i \<longrightarrow> snps T j = [] \<and>...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 336 ← Original Lines 463, 464
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 463: `(CSTATE Invalid T 0 \<longrightarrow> reqresps1 T = []) \<and>`
- Line 464: `(CSTATE Invalid T 1 \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 336: `(\<forall>i. CSTATE Invalid T i \<longrightarrow> reqs T i = []) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 337 ← Original Lines 251
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.379
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 251: `(CSTATE Shared T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \<...`

**Current Conjunct**:
- Line 337: `(\<forall>i. CSTATE Shared T i \<longrightarrow> reqs T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 338 ← Original Lines 389
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.314
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 389: `(snpresps2 T \<noteq> [] \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 338: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> \<not>CSTATE Mo...`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 339 ← Original Lines 260, 261
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 260: `(CSTATE ISD T 0 \<longrightarrow> \<not>HSTATE ModifiedM T) \<and>`
- Line 261: `(CSTATE ISD T 1 \<longrightarrow> \<not>HSTATE ModifiedM T) \<and>`

**Current Conjunct**:
- Line 339: `(\<forall>i. CSTATE ISD T i \<longrightarrow> \<not>HSTATE ModifiedM T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 340 ← Original Lines 262, 263
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 262: `(CSTATE ISD T 0 \<longrightarrow> nextLoad T 0) \<and>`
- Line 263: `(CSTATE ISD T 1 \<longrightarrow> nextLoad T 1) \<and>`

**Current Conjunct**:
- Line 340: `(\<forall>i. CSTATE ISD T i \<longrightarrow> nextLoad T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 341 ← Original Lines 264
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 264: `(C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) T) \<and>`

**Current Conjunct**:
- Line 341: `(C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 342 ← Original Lines 312
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.467
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 312: `(length (snpresps1 T) \<le> 1) \<and>`

**Current Conjunct**:
- Line 342: `(\<forall>i. length (htddatas T i) \<le> 1) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 343 ← Original Lines 267
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.436
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 267: `(CSTATE ISD T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = []) \<an...`

**Current Conjunct**:
- Line 343: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISD T i \<longrightarrow> snps T j = [] \<and>...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 344 ← Original Lines 255
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.428
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 255: `(CSTATE Invalid T 1 \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 344: `(\<forall>i. CSTATE ISD T i \<longrightarrow> reqs T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 345 ← Original Lines 271
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.700
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 271: `(CSTATE IMAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 345: `(\<forall>i. CSTATE IMAD T i \<and> nextHTDDataPending T i \<longrightarrow> reqs T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 346 ← Original Lines 273
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.531
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 273: `(length (reqresps1 T) \<le> 1) \<and>`

**Current Conjunct**:
- Line 346: `(\<forall>i. length (reqresps T i) \<le> 1) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 347 ← Original Lines 899
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.385
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 899: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE SB T \<longrightarrow> \<not> ...`

**Current Conjunct**:
- Line 347: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> (nextGOPendingIs GO_WritePull T...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 348 ← Original Lines 279, 280
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 279: `(CSTATE ISAD T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) \<and>`
- Line 280: `(CSTATE ISAD T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) \<and>`

**Current Conjunct**:
- Line 348: `(\<forall>i. CSTATE ISAD T i \<longrightarrow> \<not> nextReqIs DirtyEvict T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 349 ← Original Lines 281
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: other
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 281: `(C_msg_P_same MIA  (nextReqIs DirtyEvict) (nextEvict) T) \<and>`

**Current Conjunct**:
- Line 349: `(C_msg_P_same MIA  (nextReqIs DirtyEvict) (nextEvict) T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 351 ← Original Lines 288, 289
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 288: `(HSTATE ModifiedM T  \<and> nextReqIs RdOwn T 0 \<longrightarrow> (CSTATE Modified T 1 \<or> CSTATE ...`
- Line 289: `(HSTATE ModifiedM T  \<and> nextReqIs RdOwn T 1 \<longrightarrow> (CSTATE Modified T 0 \<or> CSTATE ...`

**Current Conjunct**:
- Line 351: `(\<forall>i. (HSTATE ModifiedM T \<and> nextReqIs RdOwn T i \<longrightarrow> (\<exists>j. j \<noteq...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 352 ← Original Lines 290, 291
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 290: `(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> (CSTATE Modified T 1 \<or> CSTATE MIA T 1 ...`
- Line 291: `(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> (CSTATE Modified T 0 \<or> CSTATE MIA T 0 ...`

**Current Conjunct**:
- Line 352: `(\<forall>i. (HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 353 ← Original Lines 292, 293
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 292: `(HSTATE MB T \<and> CSTATE IIA T 0 \<longrightarrow> (CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or>...`
- Line 293: `(HSTATE MB T \<and> CSTATE IIA T 1 \<longrightarrow> (CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or>...`

**Current Conjunct**:
- Line 353: `(\<forall>i. (HSTATE MB T \<and> CSTATE IIA T i \<longrightarrow> (\<exists>j. j \<noteq> i \<and> (...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 354 ← Original Lines 282
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.469
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 282: `(reqs1 T \<noteq> [] \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 354: `(\<forall>i. reqs T i \<noteq> [] \<longrightarrow> reqresps T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 355 ← Original Lines 296
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.904
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 296: `(HSTATE SAD T \<longrightarrow> (CSTATE ISAD T 0 \<or> CSTATE ISAD T 1)) \<and>`

**Current Conjunct**:
- Line 355: `(HSTATE SAD T \<longrightarrow> (\<exists>i. CSTATE ISAD T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → existential

---

#### Current Line 356 ← Original Lines 297
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.903
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 297: `(HSTATE ModifiedM T \<longrightarrow> \<not>CSTATE Shared T 0 \<and> \<not>CSTATE Shared T 1) \<and>`

**Current Conjunct**:
- Line 356: `(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not>CSTATE Shared T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 357 ← Original Lines 298, 299
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 298: `(HSTATE SD T \<and> dthdatas1 T \<noteq> [] \<longrightarrow> htddatas2 T = []) \<and>`
- Line 299: `(HSTATE SD T \<and> dthdatas2 T \<noteq> [] \<longrightarrow> htddatas1 T = []) \<and>`

**Current Conjunct**:
- Line 357: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> dthdatas T i \<noteq> [] \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 358 ← Original Lines 313
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.467
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 313: `(length (snpresps2 T) \<le> 1) \<and>`

**Current Conjunct**:
- Line 358: `(\<forall>i. length (dthdatas T i) \<le> 1) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 359 ← Original Lines 302, 303
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 302: `(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> (CSTATE ISAD T 1 \<or> CSTATE ISD T 1)) \<...`
- Line 303: `(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> (CSTATE ISAD T 0 \<or> CSTATE ISD T 0)) \<...`

**Current Conjunct**:
- Line 359: `(\<forall>i. HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 360 ← Original Lines 304, 305
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 304: `(HSTATE SA T \<and> (nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspSFwdM T 0) \<longrightarrow> ...`
- Line 305: `(HSTATE SA T \<and> (nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspSFwdM T 1) \<longrightarrow> ...`

**Current Conjunct**:
- Line 360: `(\<forall>i. HSTATE SA T \<and> (nextSnpRespIs RspIFwdM T i \<or> nextSnpRespIs RspSFwdM T i) \<long...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 361 ← Original Lines 306, 307
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 306: `((nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspIHitSE T 0) \<longrightarrow> CSTATE Invalid T 0...`
- Line 307: `((nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspIHitSE T 1) \<longrightarrow> CSTATE Invalid T 1...`

**Current Conjunct**:
- Line 361: `(\<forall>i. (nextSnpRespIs RspIFwdM T i \<or> nextSnpRespIs RspIHitSE T i) \<longrightarrow> CSTATE...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 362 ← Original Lines 308, 309
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 308: `(nextReqIs DirtyEvict T 0 \<longrightarrow> CSTATE MIA T 0 \<or>  CSTATE SIA T 0 \<or> CSTATE IIA T ...`
- Line 309: `(nextReqIs DirtyEvict T 1 \<longrightarrow> CSTATE MIA T 1 \<or>  CSTATE SIA T 1 \<or> CSTATE IIA T ...`

**Current Conjunct**:
- Line 362: `(\<forall>i. nextReqIs DirtyEvict T i \<longrightarrow> CSTATE MIA T i \<or> CSTATE SIA T i \<or> CS...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 363 ← Original Lines 285
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.375
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 285: `(reqs2 T \<noteq> [] \<longrightarrow> snpresps1 T = []) \<and>`

**Current Conjunct**:
- Line 363: `(\<forall>i j. i \<noteq> j \<longrightarrow> (snpresps T i \<noteq> [] \<longrightarrow> reqresps T...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 364 ← Original Lines 274
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.503
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 274: `(length (reqresps2 T) \<le> 1) \<and>`

**Current Conjunct**:
- Line 364: `(\<forall>i. length (snpresps T i) \<le> 1) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 365 ← Original Lines 314, 315
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 314: `(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspSFwdM T 0) \<longrightarrow>...`
- Line 315: `(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspSFwdM T 1) \<longrightarrow>...`

**Current Conjunct**:
- Line 365: `(\<forall>i. HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T i \<or> nextSnpRespIs RspSFwdM T i) \<lon...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 366 ← Original Lines 316, 317
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 316: `(HSTATE MAD T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD...`
- Line 317: `(HSTATE MAD T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD...`

**Current Conjunct**:
- Line 366: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MAD T \<and> nextSnpRespIs RspIFwdM T i \<long...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 367 ← Original Lines 318, 319
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 318: `(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1...`
- Line 319: `(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0...`

**Current Conjunct**:
- Line 367: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 368 ← Original Lines 320, 321
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 320: `(HSTATE SAD T \<and> snpresps1 T \<noteq> [] \<longrightarrow> htddatas2 T = []) \<and>`
- Line 321: `(HSTATE SAD T \<and> snpresps2 T \<noteq> [] \<longrightarrow> htddatas1 T = []) \<and>`

**Current Conjunct**:
- Line 368: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> snpresps T i \<noteq> [] \<longri...`

**Explanation**: 2 hardcoded conjuncts (device_1, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 369 ← Original Lines 286
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.380
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 286: `(reqs1 T \<noteq> [] \<longrightarrow> htddatas1 T = []) \<and>`

**Current Conjunct**:
- Line 369: `(\<forall>i. HSTATE MD T \<and> reqs T i \<noteq> [] \<longrightarrow> dthdatas T i \<noteq> []) \<a...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 370 ← Original Lines 324, 325
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 324: `(HSTATE ID T \<and> dthdatas1 T \<noteq> [] \<longrightarrow> CSTATE Invalid T 0 \<or> CSTATE ISAD T...`
- Line 325: `(HSTATE ID T \<and> dthdatas2 T \<noteq> [] \<longrightarrow> CSTATE Invalid T 1 \<or> CSTATE ISAD T...`

**Current Conjunct**:
- Line 370: `(\<forall>i. HSTATE ID T \<and> dthdatas T i \<noteq> [] \<longrightarrow> CSTATE Invalid T i \<or> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 371 ← Original Lines 326, 327
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 326: `(HSTATE ID T \<and> dthdatas1 T \<noteq> [] \<longrightarrow> \<not>CSTATE MIA T 1) \<and>`
- Line 327: `(HSTATE ID T \<and> dthdatas2 T \<noteq> [] \<longrightarrow> \<not>CSTATE MIA T 0) \<and>`

**Current Conjunct**:
- Line 371: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> dthdatas T i \<noteq> [] \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 372 ← Original Lines 322
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.436
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 322: `(HSTATE MD T \<and> reqs1 T \<noteq> [] \<longrightarrow> dthdatas1 T \<noteq> []) \<and>`

**Current Conjunct**:
- Line 372: `(\<forall>i j. i \<noteq> j \<longrightarrow> (dthdatas T i \<noteq> [] \<and> HSTATE SD T \<longrig...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 373 ← Original Lines 330, 331
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 330: `(CSTATE ISD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> nextLoad T 0) \<and>`
- Line 331: `(CSTATE ISD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> nextLoad T 1) \<and>`

**Current Conjunct**:
- Line 373: `(\<forall>i. CSTATE ISD T i \<and> nextHTDDataPending T i \<longrightarrow> nextLoad T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 374 ← Original Lines 332
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 332: `(C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) T) ...`

**Current Conjunct**:
- Line 374: `(C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) T) ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 375 ← Original Lines 333, 334
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 333: `(CSTATE ISAD T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE SD T \<or> HSTATE SharedM T \<or>...`
- Line 334: `(CSTATE ISAD T 1 \<and> nextGOPending T 1 \<longrightarrow> HSTATE SD T \<or> HSTATE SharedM T \<or>...`

**Current Conjunct**:
- Line 375: `(\<forall>i. CSTATE ISAD T i \<and> nextGOPending T i \<longrightarrow> HSTATE SD T \<or> HSTATE Sha...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 376 ← Original Lines 335, 336
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 335: `(CSTATE ISAD T 0 \<longrightarrow> nextLoad T 0) \<and>`
- Line 336: `(CSTATE ISAD T 1 \<longrightarrow> nextLoad T 1) \<and>`

**Current Conjunct**:
- Line 376: `(\<forall>i. CSTATE ISAD T i \<longrightarrow> nextLoad T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 377 ← Original Lines 337, 338
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 337: `(CSTATE ISAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) \<and>`
- Line 338: `(CSTATE ISAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) \<and>`

**Current Conjunct**:
- Line 377: `(\<forall>i. CSTATE ISAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 378 ← Original Lines 763
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.401
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 763: `(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snpresps2 T = []) \<and>`

**Current Conjunct**:
- Line 378: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISAD T i \<and> nextGOPending T i \<longrighta...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 379 ← Original Lines 341, 342
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 341: `((CSTATE Invalid T 0 \<or> CSTATE ISDI T 0) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modif...`
- Line 342: `((CSTATE Invalid T 1 \<or> CSTATE ISDI T 1) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modif...`

**Current Conjunct**:
- Line 379: `(\<forall>i. (CSTATE Invalid T i \<or> CSTATE ISDI T i) \<and> HSTATE ModifiedM T \<longrightarrow> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 380 ← Original Lines 343, 344
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 343: `((CSTATE Invalid T 0 \<or> CSTATE ISDI T 0) \<and> HSTATE MD T \<longrightarrow> dthdatas1 T \<noteq...`
- Line 344: `((CSTATE Invalid T 1 \<or> CSTATE ISDI T 1) \<and> HSTATE MD T \<longrightarrow> dthdatas2 T \<noteq...`

**Current Conjunct**:
- Line 380: `(\<forall>i. (CSTATE Invalid T i \<or> CSTATE ISDI T i) \<and> HSTATE MD T \<longrightarrow> dthdata...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 381 ← Original Lines 345
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.564
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 345: `(HSTATE ModifiedM T \<longrightarrow> snpresps2 T = [] \<and> snpresps1 T = []) \<and>`

**Current Conjunct**:
- Line 381: `(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. snpresps T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 382 ← Original Lines 346, 347
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 346: `(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE ISAD T 1) \<and>`
- Line 347: `(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE ISAD T 0) \<and>`

**Current Conjunct**:
- Line 382: `(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 383 ← Original Lines 348, 349
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 348: `(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> htddatas2 T = []) \<and>`
- Line 349: `(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> htddatas1 T = []) \<and>`

**Current Conjunct**:
- Line 383: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 384 ← Original Lines 350
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.593
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 350: `(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 384: `(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \<a...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal, existential

---

#### Current Line 385 ← Original Lines 739, 740
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 739: `(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) \<and>`
- Line 740: `(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 385: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 386 ← Original Lines 354, 355
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 354: `(HSTATE SharedM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> dthdatas2 T = []) \<and>`
- Line 355: `(HSTATE SharedM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 386: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SharedM T \<and> nextReqIs RdOwn T i \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 387 ← Original Lines 356, 357
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 356: `(HSTATE SharedM T \<and> nextReqIs RdShared T 0 \<longrightarrow> dthdatas2 T = []) \<and>`
- Line 357: `(HSTATE SharedM T \<and> nextReqIs RdShared T 1 \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 387: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SharedM T \<and> nextReqIs RdShared T i \<long...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 388 ← Original Lines 358, 359
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 358: `(CSTATE IIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 1 \<or> CSTATE MIA T 1...`
- Line 359: `(CSTATE IIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 0 \<or> CSTATE MIA T 0...`

**Current Conjunct**:
- Line 388: `(\<forall>i. CSTATE IIA T i \<and> HSTATE ModifiedM T \<longrightarrow> (\<exists>j. j \<noteq> i \<...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 389 ← Original Lines 360
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.667
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 360: `(CSTATE IIA T 0 \<and> HSTATE SharedM T \<longrightarrow> reqs2 T = [] \<or> nextReqIs CleanEvict T ...`

**Current Conjunct**:
- Line 389: `(\<forall>i. CSTATE IIA T i \<and> HSTATE SharedM T \<longrightarrow> (\<exists>j. j \<noteq> i \<an...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal, existential

---

#### Current Line 390 ← Original Lines 362, 363
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 362: `(CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> HSTATE IB T \<or> HSTATE S...`
- Line 363: `(CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> HSTATE IB T \<or> HSTATE S...`

**Current Conjunct**:
- Line 390: `(\<forall>i. CSTATE IIA T i \<and> nextGOPendingIs GO_WritePull T i \<longrightarrow> HSTATE IB T \<...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 391 ← Original Lines 364, 365
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 364: `(CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0 \<longrightarrow> HSTATE SharedM T \<or>...`
- Line 365: `(CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1 \<longrightarrow> HSTATE SharedM T \<or>...`

**Current Conjunct**:
- Line 391: `(\<forall>i. CSTATE IIA T i \<and> nextGOPendingIs GO_WritePullDrop T i \<longrightarrow> HSTATE Sha...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 392 ← Original Lines 366, 367
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 366: `(CSTATE IMAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA...`
- Line 367: `(CSTATE IMAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA...`

**Current Conjunct**:
- Line 392: `(\<forall>i. CSTATE IMAD T i \<and> nextHTDDataPending T i \<longrightarrow> HSTATE ModifiedM T \<or...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 393 ← Original Lines 368, 369
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 368: `(CSTATE IIA T 0 \<and> HSTATE SharedM T \<longrightarrow> CSTATE Shared T 1 \<or> CSTATE SIA T 1 \<o...`
- Line 369: `(CSTATE IIA T 1 \<and> HSTATE SharedM T \<longrightarrow> CSTATE Shared T 0 \<or> CSTATE SIA T 0 \<o...`

**Current Conjunct**:
- Line 393: `(\<forall>i. CSTATE IIA T i \<and> HSTATE SharedM T \<longrightarrow> (\<exists>j. j \<noteq> i \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 394 ← Original Lines 370
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.562
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 370: `(HSTATE SharedM T \<longrightarrow> dthdatas1 T = [] \<and> dthdatas2 T = []) \<and>`

**Current Conjunct**:
- Line 394: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 395 ← Original Lines 371, 372
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 371: `(CSTATE MIA T 1 \<longrightarrow> \<not>CSTATE MIA T 0) \<and>`
- Line 372: `(CSTATE MIA T 0 \<longrightarrow> \<not>CSTATE MIA T 1) \<and>`

**Current Conjunct**:
- Line 395: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<longrightarrow> \<not>CSTATE MIA T j...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 396 ← Original Lines 373
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.564
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 373: `(HSTATE ModifiedM T \<longrightarrow> dthdatas2 T = [] \<and> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 396: `(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 397 ← Original Lines 374
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.467
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 374: `(HSTATE MA T \<longrightarrow> dthdatas2 T = [] \<and> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 397: `(HSTATE MA T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 398 ← Original Lines 375, 376
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: other
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 375: `(nextDTHDataFrom  0 T \<longrightarrow> \<not> nextHTDDataPending T 0) \<and>`
- Line 376: `(nextDTHDataFrom  1 T \<longrightarrow> \<not> nextHTDDataPending T 1) \<and>`

**Current Conjunct**:
- Line 398: `(\<forall>i. nextDTHDataFrom i T \<longrightarrow> \<not> nextHTDDataPending T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 399 ← Original Lines 377
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: other
**Confidence Score**: 0.567
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 377: `(nextDTHDataFrom 0 T \<longrightarrow> \<not> nextDTHDataFrom 1 T) \<and>`

**Current Conjunct**:
- Line 399: `(\<forall>i. nextDTHDataFrom i T \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<not...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 400 ← Original Lines 379
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.467
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 379: `(HSTATE SA T \<longrightarrow> dthdatas2 T = [] \<and> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 400: `(HSTATE SA T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 401 ← Original Lines 380
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.898
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 380: `(HSTATE SD T \<longrightarrow> \<not> CSTATE IIA T 0 \<or> \<not> CSTATE IIA T 1) \<and>`

**Current Conjunct**:
- Line 401: `(HSTATE SD T \<longrightarrow> (\<exists>i. \<not> CSTATE IIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → existential

---

#### Current Line 402 ← Original Lines 381
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.861
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 381: `(HSTATE SAD T \<longrightarrow> (\<not> CSTATE IIA T 0 \<or> nextSnpRespIs RspIFwdM T 0) \<and> (\<n...`

**Current Conjunct**:
- Line 402: `(HSTATE SAD T \<longrightarrow> (\<forall>i. \<not> CSTATE IIA T i \<or> nextSnpRespIs RspIFwdM T i)...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 403 ← Original Lines 382, 383
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 382: `(CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextDTHDataFrom 1 T...`
- Line 383: `(CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextDTHDataFrom 0 T...`

**Current Conjunct**:
- Line 403: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IIA T i \<and> nextGOPendingIs GO_WritePull T ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 404 ← Original Lines 252, 253
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 252: `(CSTATE IIA T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) \<an...`
- Line 253: `(CSTATE IIA T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = []) \<an...`

**Current Conjunct**:
- Line 404: `(\<not> (\<forall>i. CSTATE IIA T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 405 ← Original Lines 275, 276
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 275: `(CSTATE MIA T 0 \<and> (nextGOPendingIs GO_WritePull T 0)  \<longrightarrow> snps1 T = [] ) \<and>`
- Line 276: `(CSTATE MIA T 1 \<and> (nextGOPendingIs GO_WritePull T 1)  \<longrightarrow> snps2 T = [] ) \<and>`

**Current Conjunct**:
- Line 405: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> nextGOPendingIs GO_WritePull T ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 406 ← Original Lines 283
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.453
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 283: `(reqs2 T \<noteq> [] \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 406: `(\<forall>i. snpresps T i \<noteq> [] \<longrightarrow> reqresps T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 407 ← Original Lines 390, 391
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 390: `(HSTATE SharedM T \<and> nextReqIs RdShared T 1 \<longrightarrow> \<not> nextGOPendingIs GO_WritePul...`
- Line 391: `(HSTATE SharedM T \<and> nextReqIs RdShared T 0 \<longrightarrow> \<not> nextGOPendingIs GO_WritePul...`

**Current Conjunct**:
- Line 407: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 408 ← Original Lines 743
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.428
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 743: `(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) \<and>`

**Current Conjunct**:
- Line 408: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 409 ← Original Lines 394, 395
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 394: `(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspSFwdM T 0) \<longrightarrow>...`
- Line 395: `(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspSFwdM T 1) \<longrightarrow>...`

**Current Conjunct**:
- Line 409: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T i \<or>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 410 ← Original Lines 396
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.882
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 396: `(HSTATE ModifiedM T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPe...`

**Current Conjunct**:
- Line 410: `(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 411 ← Original Lines 397
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 397: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict T) \<and>`

**Current Conjunct**:
- Line 411: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 412 ← Original Lines 240
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: go_pending_constraint
**Confidence Score**: 0.579
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 240: `C_msg_P_same ISAD nextGOPending (\<lambda>T i. \<not> nextReqIs RdShared T i) T \<and>`

**Current Conjunct**:
- Line 412: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T) \<...`

**Explanation**: Single conjunct transformation

---

#### Current Line 413 ← Original Lines 771
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.360
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 771: `(HSTATE MD T \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTATE SIA T 1) \<and>`

**Current Conjunct**:
- Line 413: `(\<forall>i. CSTATE SIA T i \<longrightarrow> htddatas T i = [] \<and> (\<exists>j. j \<noteq> i \<a...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal, existential

---

#### Current Line 414 ← Original Lines 401
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 401: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<an...`

**Current Conjunct**:
- Line 414: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<an...`

**Explanation**: Single conjunct transformation

---

#### Current Line 415 ← Original Lines 402, 403
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 402: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> HSTATE IB T \<or> HSTATE S...`
- Line 403: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> HSTATE IB T \<or> HSTATE S...`

**Current Conjunct**:
- Line 415: `(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull T i \<longrightarrow> HSTATE IB T \<...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 416 ← Original Lines 404
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 404: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T) \<...`

**Current Conjunct**:
- Line 416: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T) \<...`

**Explanation**: Single conjunct transformation

---

#### Current Line 417 ← Original Lines 405, 406
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 405: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextDTHDataFrom 1 T...`
- Line 406: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextDTHDataFrom 0 T...`

**Current Conjunct**:
- Line 417: `(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull T i \<longrightarrow> (\<forall>j. j...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 418 ← Original Lines 407
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 407: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict T) \<and>`

**Current Conjunct**:
- Line 418: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 419 ← Original Lines 398
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: go_pending_constraint
**Confidence Score**: 0.821
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 398: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T) \<...`

**Current Conjunct**:
- Line 419: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) T...`

**Explanation**: Single conjunct transformation

---

#### Current Line 420 ← Original Lines 409
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 409: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) T) ...`

**Current Conjunct**:
- Line 420: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) T) ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 421 ← Original Lines 410, 411
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 410: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0 \<longrightarrow> HSTATE InvalidM T \<or...`
- Line 411: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1 \<longrightarrow> HSTATE InvalidM T \<or...`

**Current Conjunct**:
- Line 421: `(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePullDrop T i \<longrightarrow> HSTATE Inv...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 422 ← Original Lines 408
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: go_pending_constraint
**Confidence Score**: 0.698
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 408: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) T...`

**Current Conjunct**:
- Line 422: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) T...`

**Explanation**: Single conjunct transformation

---

#### Current Line 423 ← Original Lines 413, 426
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 413: `(CSTATE SMAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA...`
- Line 426: `(CSTATE SMAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA...`

**Current Conjunct**:
- Line 423: `(\<forall>i. CSTATE SMAD T i \<and> nextHTDDataPending T i \<longrightarrow>  HSTATE ModifiedM T \<o...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 424 ← Original Lines 414, 415
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 414: `(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow>  HSTATE SharedM T \<or> HSTATE SA T...`
- Line 415: `(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow>  HSTATE SharedM T \<or> HSTATE SA T...`

**Current Conjunct**:
- Line 424: `(\<forall>i. CSTATE ISAD T i \<and> nextHTDDataPending T i \<longrightarrow>  HSTATE SharedM T \<or>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 425 ← Original Lines 416, 417
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 416: `(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> next...`
- Line 417: `(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> next...`

**Current Conjunct**:
- Line 425: `(\<forall>i. CSTATE ISAD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 426 ← Original Lines 418
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 418: `(C_not_C_msg Modified IMAD nextGOPending T) \<and>`

**Current Conjunct**:
- Line 426: `(C_not_C_msg Modified IMAD nextGOPending T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 427 ← Original Lines 419, 427
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 419: `(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE MD T \<or> HSTATE ModifiedM T \<o...`
- Line 427: `(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<longrightarrow>  HSTATE MD T \<or> HSTATE ModifiedM T \<...`

**Current Conjunct**:
- Line 427: `(\<forall>i. CSTATE IMAD T i \<and> nextGOPending T i \<longrightarrow> HSTATE MD T \<or> HSTATE Mod...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 428 ← Original Lines 420, 421
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 420: `(CSTATE IMAD T 0 \<longrightarrow> nextStore T 0) \<and>`
- Line 421: `(CSTATE IMAD T 1 \<longrightarrow> nextStore T 1) \<and>`

**Current Conjunct**:
- Line 428: `(\<forall>i. CSTATE IMAD T i \<longrightarrow> nextStore T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 429 ← Original Lines 716
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.449
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 716: `(CSTATE IMAD T 0 \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<longrightarrow> snpresps2 ...`

**Current Conjunct**:
- Line 429: `(\<forall>i. CSTATE IMAD T i \<and> nextGOPending T i \<longrightarrow> (\<forall>j. j \<noteq> i \<...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 430 ← Original Lines 284
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.437
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 284: `(reqs1 T \<noteq> [] \<longrightarrow> snpresps2 T = []) \<and>`

**Current Conjunct**:
- Line 430: `(\<forall>i. snpresps T i \<noteq> [] \<longrightarrow> reqresps T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 431 ← Original Lines 428, 429
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 428: `(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<longrightarrow>  HSTATE MD T \<or> HSTATE ModifiedM T \<...`
- Line 429: `(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<longrightarrow>  HSTATE MD T \<or> HSTATE ModifiedM T \<...`

**Current Conjunct**:
- Line 431: `(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<longrightarrow>  HSTATE MD T \<or> HSTATE Mo...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 432 ← Original Lines 430, 431
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 430: `(CSTATE SMAD T 0 \<longrightarrow> nextStore T 0) \<and>`
- Line 431: `(CSTATE SMAD T 1 \<longrightarrow> nextStore T 1) \<and>`

**Current Conjunct**:
- Line 432: `(\<forall>i. CSTATE SMAD T i \<longrightarrow> nextStore T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 433 ← Original Lines 432
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 432: `(C_msg_P_same IMA (nextGOPending) nextStore T) \<and>`

**Current Conjunct**:
- Line 433: `(C_msg_P_same IMA (nextGOPending) nextStore T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 434 ← Original Lines 433, 434
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 433: `(CSTATE IMA T 0 \<or> CSTATE SMA T 0 \<or> CSTATE ISA T 0 \<longrightarrow> \<not> nextHTDDataPendin...`
- Line 434: `(CSTATE IMA T 1 \<or> CSTATE SMA T 1 \<or> CSTATE ISA T 1 \<longrightarrow> \<not> nextHTDDataPendin...`

**Current Conjunct**:
- Line 434: `(\<forall>i. CSTATE IMA T i \<or> CSTATE SMA T i \<or> CSTATE ISA T i \<longrightarrow> \<not> nextH...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 435 ← Original Lines 435
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 435: `(C_msg_P_oppo IMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>`

**Current Conjunct**:
- Line 435: `(C_msg_P_oppo IMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 436 ← Original Lines 436
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 436: `(C_msg_P_oppo SMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>`

**Current Conjunct**:
- Line 436: `(C_msg_P_oppo SMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 437 ← Original Lines 437
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 437: `(C_msg_P_oppo ISA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>`

**Current Conjunct**:
- Line 437: `(C_msg_P_oppo ISA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 438 ← Original Lines 438, 439
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 438: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MAD T \<...`
- Line 439: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MAD T \<...`

**Current Conjunct**:
- Line 438: `(\<forall>i. CSTATE IMA T i \<and> nextGOPending T i \<longrightarrow>  HSTATE ModifiedM T \<or> HST...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 439 ← Original Lines 440, 441
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 440: `(CSTATE IMD T 0 \<or> CSTATE SMD T 0 \<or> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextGOPen...`
- Line 441: `(CSTATE IMD T 1 \<or> CSTATE SMD T 1 \<or> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextGOPen...`

**Current Conjunct**:
- Line 439: `(\<forall>i. CSTATE IMD T i \<or> CSTATE SMD T i \<or> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 440 ← Original Lines 442, 443
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 442: `(CSTATE IMA T 0 \<or> CSTATE SMA T 0 \<or> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDa...`
- Line 443: `(CSTATE IMA T 1 \<or> CSTATE SMA T 1 \<or> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDa...`

**Current Conjunct**:
- Line 440: `(\<forall>i. CSTATE IMA T i \<or> CSTATE SMA T i \<or> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 441 ← Original Lines 444, 445
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 444: `(CSTATE IMD T 0 \<or> CSTATE SMD T 0 \<or> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextGOPen...`
- Line 445: `(CSTATE IMD T 1 \<or> CSTATE SMD T 1 \<or> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextGOPen...`

**Current Conjunct**:
- Line 441: `(\<forall>i. CSTATE IMD T i \<or> CSTATE SMD T i \<or> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 442 ← Original Lines 446
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 446: `(C_msg_P_same SMA (nextGOPending) nextStore T) \<and>`

**Current Conjunct**:
- Line 442: `(C_msg_P_same SMA (nextGOPending) nextStore T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 443 ← Original Lines 447, 448
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 447: `((CSTATE SMA T 0 \<and> nextGOPending T 0 \<or> CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<or> C...`
- Line 448: `((CSTATE SMA T 1 \<and> nextGOPending T 1 \<or> CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<or> C...`

**Current Conjunct**:
- Line 443: `(\<forall>i. (CSTATE SMA T i \<and> nextGOPending T i \<or> CSTATE IMD T i \<and> nextHTDDataPending...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 444 ← Original Lines 449, 450
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 449: `(CSTATE ISD T 0 \<or> CSTATE ISAD T 0 \<or> CSTATE ISA T 0 \<or> CSTATE ISDI T 0 \<longrightarrow> n...`
- Line 450: `(CSTATE ISD T 1 \<or> CSTATE ISAD T 1 \<or> CSTATE ISA T 1 \<or> CSTATE ISDI T 1 \<longrightarrow> n...`

**Current Conjunct**:
- Line 444: `(\<forall>i. CSTATE ISD T i \<or> CSTATE ISAD T i \<or> CSTATE ISA T i \<or> CSTATE ISDI T i \<longr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 445 ← Original Lines 451, 452
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 451: `(CSTATE IMD T 0 \<or> CSTATE IMAD T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMD T 0 \<or> CSTATE SMAD T ...`
- Line 452: `(CSTATE IMD T 1 \<or> CSTATE IMAD T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMD T 1 \<or> CSTATE SMAD T ...`

**Current Conjunct**:
- Line 445: `(\<forall>i. CSTATE IMD T i \<or> CSTATE IMAD T i \<or> CSTATE IMA T i \<or> CSTATE SMD T i \<or> CS...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 446 ← Original Lines 453, 454
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 453: `((CSTATE ISAD T 0 \<and> nextGOPending T 0) \<or> CSTATE ISA T 0 \<or> ( nextHTDDataPending T 0) \<o...`
- Line 454: `((CSTATE ISAD T 1 \<and> nextGOPending T 1) \<or> CSTATE ISA T 1 \<or> ( nextHTDDataPending T 1) \<o...`

**Current Conjunct**:
- Line 446: `(\<forall>i. (CSTATE ISAD T i \<and> nextGOPending T i) \<or> CSTATE ISA T i \<or> ( nextHTDDataPend...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 447 ← Original Lines 455, 456
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 455: `(CSTATE ISA T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE SharedM T \<or> HSTATE MAD T \<or>...`
- Line 456: `(CSTATE ISA T 1 \<and> nextGOPending T 1 \<longrightarrow> HSTATE SharedM T \<or> HSTATE MAD T \<or>...`

**Current Conjunct**:
- Line 447: `(\<forall>i. CSTATE ISA T i \<and> nextGOPending T i \<longrightarrow> HSTATE SharedM T \<or> HSTATE...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 448 ← Original Lines 457, 458
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 457: `(CSTATE ISDI T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> HSTATE ModifiedM T \<or> HSTATE MAD...`
- Line 458: `(CSTATE ISDI T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> HSTATE ModifiedM T \<or> HSTATE MAD...`

**Current Conjunct**:
- Line 448: `(\<forall>i. CSTATE ISDI T i \<and> nextHTDDataPending T i \<longrightarrow> HSTATE ModifiedM T \<or...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 449 ← Original Lines 459
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.423
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 459: `(CSTATE ISDI T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<an...`

**Current Conjunct**:
- Line 449: `(\<forall>i. CSTATE ISDI T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> snps T j ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 450 ← Original Lines 461, 462
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 461: `(CSTATE ISDI T 0 \<longrightarrow> \<not>nextReqIs RdOwn T 1 \<or> \<not>HSTATE ModifiedM T) \<and>`
- Line 462: `(CSTATE ISDI T 1 \<longrightarrow> \<not>nextReqIs RdOwn T 0 \<or> \<not>HSTATE ModifiedM T) \<and>`

**Current Conjunct**:
- Line 450: `(\<forall>i. CSTATE ISDI T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<not>nex...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 451 ← Original Lines 249
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.404
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 249: `(CSTATE Invalid T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \...`

**Current Conjunct**:
- Line 451: `(\<forall>i. CSTATE Invalid T i \<longrightarrow> reqresps T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 452 ← Original Lines 465, 466
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 465: `(CSTATE Shared T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) \<and>`
- Line 466: `(CSTATE Shared T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) \<and>`

**Current Conjunct**:
- Line 452: `(\<forall>i. CSTATE Shared T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 453 ← Original Lines 467, 468
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 467: `(CSTATE Shared T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA ...`
- Line 468: `(CSTATE Shared T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA ...`

**Current Conjunct**:
- Line 453: `(\<forall>i. CSTATE Shared T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 454 ← Original Lines 469, 470
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 469: `(CSTATE SMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [...`
- Line 470: `(CSTATE SMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [...`

**Current Conjunct**:
- Line 454: `(\<forall>i. CSTATE SMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 455 ← Original Lines 471, 472
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 471: `(CSTATE SMAD T 0 \<and> reqresps1 T = [] \<and> htddatas1 T = [] \<and> nextSnoopIs SnpInv T 0 \<lon...`
- Line 472: `(CSTATE SMAD T 1 \<and> reqresps2 T = [] \<and> htddatas2 T = [] \<and> nextSnoopIs SnpInv T 1 \<lon...`

**Current Conjunct**:
- Line 455: `(\<forall>i. CSTATE SMAD T i \<and> reqresps T i = [] \<and> htddatas T i = [] \<and> nextSnoopIs Sn...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 456 ← Original Lines 473, 474
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 473: `(nextReqIs RdOwn T 0 \<longrightarrow> CSTATE SMAD T 0 \<or> CSTATE IMAD T 0) \<and>`
- Line 474: `(nextReqIs RdOwn T 1 \<longrightarrow> CSTATE SMAD T 1 \<or> CSTATE IMAD T 1) \<and>`

**Current Conjunct**:
- Line 456: `(\<forall>i. nextReqIs RdOwn T i \<longrightarrow> CSTATE SMAD T i \<or> CSTATE IMAD T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 457 ← Original Lines 475, 476
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 475: `(CSTATE SMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<and> CXL_SPG_used T 0 \<longrightarrow> nextReqIs R...`
- Line 476: `(CSTATE SMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<and> CXL_SPG_used T 1 \<longrightarrow> nextReqIs R...`

**Current Conjunct**:
- Line 457: `(\<forall>i. CSTATE SMAD T i \<and> nextSnoopIs SnpInv T i \<and> CXL_SPG_used T i \<longrightarrow>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 458 ← Original Lines 477, 478, 680, 681
**Consolidation Type**: 4_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 477: `(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) \<and>`
- Line 478: `(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) \<and>`
- Line 680: `(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) \<and>`
- Line 681: `(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) \<and>`

**Current Conjunct**:
- Line 458: `(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and>`

**Explanation**: 4 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 459 ← Original Lines 479, 480
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 479: `(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T 1...`
- Line 480: `(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T 0...`

**Current Conjunct**:
- Line 459: `(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 460 ← Original Lines 481
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.467
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 481: `(HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snpresps2 T = []) \<and>`

**Current Conjunct**:
- Line 460: `(HSTATE MD T \<longrightarrow> (\<forall>i. snpresps T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 461 ← Original Lines 482, 483
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 482: `(HSTATE MD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE IMAD T 1 \<and> nextGOPending T 1 \...`
- Line 483: `(HSTATE MD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE IMAD T 0 \<and> nextGOPending T 0 \...`

**Current Conjunct**:
- Line 461: `(\<forall>i. HSTATE MD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 462 ← Original Lines 484, 485
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 484: `(HSTATE MD T \<and> nextDTHDataFrom 0 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 0 \<and> \<...`
- Line 485: `(HSTATE MD T \<and> nextDTHDataFrom 1 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 1 \<and> \<...`

**Current Conjunct**:
- Line 462: `(\<forall>i. HSTATE MD T \<and> nextDTHDataFrom i T \<longrightarrow>  \<not> nextReqIs CleanEvict T...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 463 ← Original Lines 612, 613
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: go_pending_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 612: `(nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) \<and>`
- Line 613: `(nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) \<and>`

**Current Conjunct**:
- Line 463: `(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 464 ← Original Lines 487, 488
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 487: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE IMAD T 1) \<and>`
- Line 488: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE IMAD T 0) \<and>`

**Current Conjunct**:
- Line 464: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<exists>j. j \<noteq> i \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 465 ← Original Lines 489, 490
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 489: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> snpresps2 T = []) \<and>`
- Line 490: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> snpresps1 T = []) \<and>`

**Current Conjunct**:
- Line 465: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. j \<noteq> i \<l...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 466 ← Original Lines 491, 492
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 491: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 0 \<and> \...`
- Line 492: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 1 \<and> \...`

**Current Conjunct**:
- Line 466: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow>  \<not> nextReqIs CleanEvict ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 467 ← Original Lines 493
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.674
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 493: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> reqs2 T...`

**Current Conjunct**:
- Line 467: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> \<not> CSTATE Modified T i \<...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 468 ← Original Lines 424
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.301
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 424: `(snpresps1 T \<noteq> [] \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 468: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. j \<noteq> i \<l...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 469 ← Original Lines 497, 498
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 497: `((HSTATE SAD T \<or> HSTATE MAD T \<or> HSTATE SA T \<or> HSTATE MA T) \<and> snpresps1 T \<noteq> [...`
- Line 498: `((HSTATE SAD T \<or> HSTATE MAD T \<or> HSTATE SA T \<or> HSTATE MA T) \<and> snpresps2 T \<noteq> [...`

**Current Conjunct**:
- Line 469: `(\<forall>i. (HSTATE SAD T \<or> HSTATE MAD T \<or> HSTATE SA T \<or> HSTATE MA T) \<and> snpresps T...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 470 ← Original Lines 499, 500
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 499: `(nextSnpRespIs RspSFwdM T 0 \<longrightarrow> CSTATE Shared T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE S...`
- Line 500: `(nextSnpRespIs RspSFwdM T 1 \<longrightarrow> CSTATE Shared T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE S...`

**Current Conjunct**:
- Line 470: `(\<forall>i. nextSnpRespIs RspSFwdM T i \<longrightarrow> CSTATE Shared T i \<or> CSTATE SMAD T i \<...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 471 ← Original Lines 501, 502
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 501: `((CSTATE Invalid T 0  \<or> CSTATE ISDI T 0 \<or> nextReqIs RdOwn T 0) \<and> HSTATE MA T \<longrigh...`
- Line 502: `((CSTATE Invalid T 1  \<or> CSTATE ISDI T 1 \<or> nextReqIs RdOwn T 1) \<and> HSTATE MA T \<longrigh...`

**Current Conjunct**:
- Line 471: `(\<forall>i. (CSTATE Invalid T i  \<or> CSTATE ISDI T i \<or> nextReqIs RdOwn T i) \<and> HSTATE MA ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 472 ← Original Lines 503, 504
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 503: `(CSTATE Modified T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) \<and>`
- Line 504: `(CSTATE Modified T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) \<and>`

**Current Conjunct**:
- Line 472: `(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 473 ← Original Lines 505, 506
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 505: `(CSTATE Modified T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 ) \<and>`
- Line 506: `(CSTATE Modified T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 ) \<and>`

**Current Conjunct**:
- Line 473: `(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<no...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 474 ← Original Lines 507, 508
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 507: `(CSTATE IMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) \<and>`
- Line 508: `(CSTATE IMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) \<and>`

**Current Conjunct**:
- Line 474: `(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 475 ← Original Lines 509, 510
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 509: `(CSTATE IMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 ) \<and>`
- Line 510: `(CSTATE IMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 ) \<and>`

**Current Conjunct**:
- Line 475: `(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 476 ← Original Lines 511, 512
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 511: `(CSTATE IMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) \<and>`
- Line 512: `(CSTATE IMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) \<and>`

**Current Conjunct**:
- Line 476: `(\<forall>i. CSTATE IMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 477 ← Original Lines 513, 514
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 513: `(CSTATE IMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 ) \<and>`
- Line 514: `(CSTATE IMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 ) \<and>`

**Current Conjunct**:
- Line 477: `(\<forall>i. CSTATE IMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 478 ← Original Lines 515, 516
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 515: `(CSTATE IMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) \<and>`
- Line 516: `(CSTATE IMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) \<and>`

**Current Conjunct**:
- Line 478: `(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 479 ← Original Lines 517, 518
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 517: `(CSTATE IMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 ) \<and>`
- Line 518: `(CSTATE IMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 ) \<and>`

**Current Conjunct**:
- Line 479: `(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 480 ← Original Lines 519, 520
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 519: `(CSTATE MIA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>`
- Line 520: `(CSTATE MIA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Current Conjunct**:
- Line 480: `(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 481 ← Original Lines 521, 522
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 521: `(CSTATE MIA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1 ) \<and>`
- Line 522: `(CSTATE MIA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0 ) \<and>`

**Current Conjunct**:
- Line 481: `(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpData T i \<longrightarrow> (\<exists>j. j \<noteq>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 482 ← Original Lines 523, 524
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 523: `(CSTATE Modified T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>`
- Line 524: `(CSTATE Modified T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Current Conjunct**:
- Line 482: `(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 483 ← Original Lines 525, 526
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 525: `(CSTATE Modified T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1 ) \<and>`
- Line 526: `(CSTATE Modified T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0 ) \<and>`

**Current Conjunct**:
- Line 483: `(\<forall>i. CSTATE Modified T i \<and> nextSnoopIs SnpData T i \<longrightarrow> (\<exists>j. j \<n...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 484 ← Original Lines 527
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.635
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 527: `(CSTATE Modified T 0 \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 484: `(\<forall>i. CSTATE Modified T i \<longrightarrow> reqs T i = []) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 485 ← Original Lines 460
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.328
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 460: `(CSTATE ISDI T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \<an...`

**Current Conjunct**:
- Line 485: `(\<forall>i. CSTATE Modified T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> snps ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 486 ← Original Lines 531, 532
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 531: `(HSTATE InvalidM T \<and> nextReqIs RdShared T 0 \<longrightarrow> dthdatas2 T = []) \<and>`
- Line 532: `(HSTATE InvalidM T \<and> nextReqIs RdShared T 1 \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 486: `(\<forall>i. HSTATE InvalidM T \<and> nextReqIs RdShared T i \<longrightarrow> (\<forall>j. j \<note...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 487 ← Original Lines 710, 711
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 710: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 0) \<and>`
- Line 711: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 1) \<and>`

**Current Conjunct**:
- Line 487: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i \<and> \<not> CSTATE Sh...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 488 ← Original Lines 534, 535
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 534: `(nextReqIs RdOwn T 0 \<longrightarrow> \<not> CSTATE ISAD T 0 \<and> \<not> CSTATE Invalid T 0) \<an...`
- Line 535: `(nextReqIs RdOwn T 1 \<longrightarrow> \<not> CSTATE ISAD T 1 \<and> \<not> CSTATE Invalid T 1) \<an...`

**Current Conjunct**:
- Line 488: `(\<forall>i. nextReqIs RdOwn T i \<longrightarrow> \<not> CSTATE ISAD T i \<and> \<not> CSTATE Inval...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 489 ← Original Lines 536, 537
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 536: `(HSTATE InvalidM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) \<and>`
- Line 537: `(HSTATE InvalidM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) \<and>`

**Current Conjunct**:
- Line 489: `(\<forall>i. HSTATE InvalidM T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 490 ← Original Lines 538
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.631
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 538: `(HSTATE InvalidM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> dthdatas2 T = []) \<and>`

**Current Conjunct**:
- Line 490: `(\<forall>i. HSTATE InvalidM T \<and> nextReqIs RdOwn T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 491 ← Original Lines 657
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.420
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 657: `(CSTATE IMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T =...`

**Current Conjunct**:
- Line 491: `(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 492 ← Original Lines 540, 541
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 540: `(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []...`
- Line 541: `(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []...`

**Current Conjunct**:
- Line 492: `(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 493 ← Original Lines 544, 545
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 544: `(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<and> CXL_SPG_used T 0 \<longrightarrow> (nextReqIs C...`
- Line 545: `(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<and> CXL_SPG_used T 1 \<longrightarrow> (nextReqIs C...`

**Current Conjunct**:
- Line 493: `(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<and> CXL_SPG_used T i \<longrightarrow> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 494 ← Original Lines 546, 547
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 546: `(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T 1...`
- Line 547: `(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T 0...`

**Current Conjunct**:
- Line 494: `(\<forall>i. CSTATE SIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 495 ← Original Lines 548, 549
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 548: `(CSTATE SMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T ...`
- Line 549: `(CSTATE SMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T ...`

**Current Conjunct**:
- Line 495: `(\<forall>i. CSTATE SMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 496 ← Original Lines 528
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.432
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 528: `(CSTATE Modified T 1 \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 496: `(HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i \<and> \<not> CSTATE Shared T...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 497 ← Original Lines 551, 552
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 551: `(HSTATE ModifiedM T \<and> nextReqIs DirtyEvict T 0 \<longrightarrow> (\<not> CSTATE Modified T 0 \<...`
- Line 552: `(HSTATE ModifiedM T \<and> nextReqIs DirtyEvict T 1 \<longrightarrow> (\<not> CSTATE Modified T 0 \<...`

**Current Conjunct**:
- Line 497: `(\<forall>i. HSTATE ModifiedM T \<and> nextReqIs DirtyEvict T i \<longrightarrow> (\<not> (\<forall>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 498 ← Original Lines 553, 554
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 553: `(HSTATE ID T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) \<and>`
- Line 554: `(HSTATE ID T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) \<and>`

**Current Conjunct**:
- Line 498: `(\<forall>i. HSTATE ID T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 499 ← Original Lines 555, 556
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 555: `(CSTATE SMAD T 0 \<and> nextGOPending T 0\<longrightarrow> nextHTDDataPending T 0) \<and>`
- Line 556: `(CSTATE SMAD T 1 \<and> nextGOPending T 1\<longrightarrow> nextHTDDataPending T 1) \<and>`

**Current Conjunct**:
- Line 499: `(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<longrightarrow> nextHTDDataPending T i) \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 500 ← Original Lines 557
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: go_pending_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 557: `(C_msg_P_oppo SMAD nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) T) \<and>`

**Current Conjunct**:
- Line 500: `(C_msg_P_oppo SMAD nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 501 ← Original Lines 558, 559
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 558: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> CSTATE SIAC T 0) \<and>`
- Line 559: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> CSTATE SIAC T 1) \<and>`

**Current Conjunct**:
- Line 501: `(\<forall>i. HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T i \<longrightarrow> CSTATE SIAC T ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 502 ← Original Lines 560, 561
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 560: `(nextGOPendingIs GO_WritePull T 0 \<and> HSTATE InvalidM T \<longrightarrow> reqresps2 T = [] \<or> ...`
- Line 561: `(nextGOPendingIs GO_WritePull T 1 \<and> HSTATE InvalidM T \<longrightarrow> reqresps1 T = [] \<or> ...`

**Current Conjunct**:
- Line 502: `(\<forall>i. nextGOPendingIs GO_WritePull T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 503 ← Original Lines 562, 563
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 562: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> nextEvict T 0) \<and>`
- Line 563: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> nextEvict T 1) \<and>`

**Current Conjunct**:
- Line 503: `(\<forall>i. HSTATE SharedM T \<and> (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i)...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 504 ← Original Lines 566, 567
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 566: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not> CSTATE ISDI T 0) \<...`
- Line 567: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not> CSTATE ISDI T 1) \<...`

**Current Conjunct**:
- Line 504: `(\<forall>i. HSTATE SharedM T \<and> (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i)...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 505 ← Original Lines 570, 571
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 570: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not> CSTATE MIA T 0) \<a...`
- Line 571: `(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not> CSTATE MIA T 1) \<a...`

**Current Conjunct**:
- Line 505: `(\<forall>i. HSTATE SharedM T \<and> (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i)...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 506 ← Original Lines 574
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.559
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 574: `(CSTATE Shared T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SM...`

**Current Conjunct**:
- Line 506: `(\<forall>i. CSTATE Shared T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<note...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal, existential

---

#### Current Line 507 ← Original Lines 576, 577
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: other
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 576: `(nextReqIs DirtyEvict T 0 \<longrightarrow> nextEvict T 0) \<and>`
- Line 577: `(nextReqIs DirtyEvict T 1 \<longrightarrow> nextEvict T 1) \<and>`

**Current Conjunct**:
- Line 507: `(\<forall>i. nextReqIs DirtyEvict T i \<longrightarrow> nextEvict T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 508 ← Original Lines 578, 579
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 578: `(nextReqIs DirtyEvict T 0 \<and> HSTATE InvalidM T \<longrightarrow> \<not> nextDTHDataFrom 1 T) \<a...`
- Line 579: `(nextReqIs DirtyEvict T 1 \<and> HSTATE InvalidM T \<longrightarrow> \<not> nextDTHDataFrom 0 T) \<a...`

**Current Conjunct**:
- Line 508: `(\<forall>i. nextReqIs DirtyEvict T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \<no...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 509 ← Original Lines 580, 581
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 580: `(nextReqIs DirtyEvict T 0 \<and> HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISDI T 1) \<and>`
- Line 581: `(nextReqIs DirtyEvict T 1 \<and> HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISDI T 0) \<and>`

**Current Conjunct**:
- Line 509: `(\<forall>i. nextReqIs DirtyEvict T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \<no...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 510 ← Original Lines 582, 583
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 582: `(nextReqIs DirtyEvict T 0 \<and> HSTATE InvalidM T \<longrightarrow> (reqresps2 T = [] \<or> nextReq...`
- Line 583: `(nextReqIs DirtyEvict T 1 \<and> HSTATE InvalidM T \<longrightarrow> (reqresps1 T = [] \<or> nextReq...`

**Current Conjunct**:
- Line 510: `(\<forall>i. nextReqIs DirtyEvict T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \<no...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 511 ← Original Lines 584, 585
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 584: `(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not>(CSTATE ISA T 1 \<or> nextHTDD...`
- Line 585: `(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not>(CSTATE ISA T 0 \<or> nextHTDD...`

**Current Conjunct**:
- Line 511: `(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 512 ← Original Lines 586, 587
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 586: `(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE...`
- Line 587: `(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE...`

**Current Conjunct**:
- Line 512: `(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<and> nextSnoopIs SnpInv T i \<longrighta...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 513 ← Original Lines 588, 589
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 588: `(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTAT...`
- Line 589: `(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTAT...`

**Current Conjunct**:
- Line 513: `(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<and> nextSnoopIs SnpData T i \<longright...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 514 ← Original Lines 590
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.484
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 590: `(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []...`

**Current Conjunct**:
- Line 514: `(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 515 ← Original Lines 592, 593
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 592: `(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) \<a...`
- Line 593: `(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) \<a...`

**Current Conjunct**:
- Line 515: `(\<forall>i. CSTATE SMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 516 ← Original Lines 594, 595
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 594: `((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> (CSTATE SIA T 0 \...`
- Line 595: `((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> (CSTATE SIA T 1 \...`

**Current Conjunct**:
- Line 516: `(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> (CSTA...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 517 ← Original Lines 256
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.565
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 256: `(CSTATE Shared T 0 \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 517: `((\<exists>i. CSTATE Shared T i) \<longrightarrow> \<not> HSTATE MD T) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → existential

---

#### Current Line 518 ← Original Lines 597, 598
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 597: `(CSTATE Shared T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<an...`
- Line 598: `(CSTATE Shared T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<an...`

**Current Conjunct**:
- Line 518: `(\<forall>i. CSTATE Shared T i \<and> HSTATE MA T \<longrightarrow> (\<exists>j. j \<noteq> i \<and>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 519 ← Original Lines 599, 600
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: other
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 599: `((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> nextEvict T 0) \<...`
- Line 600: `((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> nextEvict T 1) \<...`

**Current Conjunct**:
- Line 519: `(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> nextE...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 520 ← Original Lines 601, 602
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 601: `((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> \<not> CSTATE ISD...`
- Line 602: `((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> \<not> CSTATE ISD...`

**Current Conjunct**:
- Line 520: `(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> \<not...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 521 ← Original Lines 603, 604
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 603: `((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> \<not> CSTATE MIA...`
- Line 604: `((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> \<not> CSTATE MIA...`

**Current Conjunct**:
- Line 521: `(\<forall>i. (nextReqIs CleanEvictNoData T i \<or> nextReqIs CleanEvict T i) \<longrightarrow> \<not...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 522 ← Original Lines 605, 606
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 605: `(CSTATE IIA T 1 \<and> HSTATE InvalidM T \<and> nextReqIs RdShared T 0 \<longrightarrow> CSTATE ISAD...`
- Line 606: `(CSTATE IIA T 0 \<and> HSTATE InvalidM T \<and> nextReqIs RdShared T 1 \<longrightarrow> CSTATE ISAD...`

**Current Conjunct**:
- Line 522: `(\<forall>i. CSTATE IIA T i \<and> HSTATE InvalidM T \<longrightarrow> (\<forall>j. j \<noteq> i \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 523 ← Original Lines 607
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.850
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 607: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> \<not...`

**Current Conjunct**:
- Line 523: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE IMA T i \<and> \<not> CSTATE SMA T i...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 524 ← Original Lines 643, 646
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 643: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending...`
- Line 646: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending...`

**Current Conjunct**:
- Line 524: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> ((CSTATE IMAD T i \<or> CSTATE SMAD T i) \<...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 525 ← Original Lines 609
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.905
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 609: `(nextGOPendingIs GO_WritePull T 0 \<or> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> HS...`

**Current Conjunct**:
- Line 525: `((\<exists>i. nextGOPendingIs GO_WritePull T i) \<longrightarrow> \<not> HSTATE InvalidM T) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → existential

---

#### Current Line 526 ← Original Lines 610, 611
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 610: `(CSTATE MIA T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> \<not> n...`
- Line 611: `(CSTATE MIA T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> \<not> n...`

**Current Conjunct**:
- Line 526: `(\<forall>i. CSTATE MIA T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<not> CST...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 527 ← Original Lines 792
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.482
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 792: `(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) \...`

**Current Conjunct**:
- Line 527: `(\<forall>i. nextGOPendingIs GO_WritePull T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrigh...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 528 ← Original Lines 614, 615
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 614: `((CSTATE IMA T 0 \<or> CSTATE SMA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDa...`
- Line 615: `((CSTATE IMA T 1 \<or> CSTATE SMA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDa...`

**Current Conjunct**:
- Line 528: `(\<forall>i. (CSTATE IMA T i \<or> CSTATE SMA T i \<or> (CSTATE IMAD T i \<or> CSTATE SMAD T i) \<an...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 529 ← Original Lines 616
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.356
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 616: `(CSTATE MIA T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) \<an...`

**Current Conjunct**:
- Line 529: `(\<forall>i. CSTATE MIA T i \<longrightarrow> htddatas T i = [] \<and> (\<forall>j. j \<noteq> i \<l...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 530 ← Original Lines 618, 619
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 618: `(CSTATE MIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) \<and>`
- Line 619: `(CSTATE MIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) \<and>`

**Current Conjunct**:
- Line 530: `(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 531 ← Original Lines 620, 621
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 620: `(CSTATE MIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1) \<and>`
- Line 621: `(CSTATE MIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0) \<and>`

**Current Conjunct**:
- Line 531: `(\<forall>i. CSTATE MIA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<exists>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal, existential quantifiers

---

#### Current Line 532 ← Original Lines 622
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.931
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 622: `((HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE ModifiedM T) \<longrightarrow> (\<not> nextG...`

**Current Conjunct**:
- Line 532: `((HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE ModifiedM T) \<longrightarrow> (\<forall>i. ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 533 ← Original Lines 623, 624
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 623: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0 \<and> CSTATE IIA T 1 \<longrightarrow> ...`
- Line 624: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1 \<and> CSTATE IIA T 0 \<longrightarrow> ...`

**Current Conjunct**:
- Line 533: `(\<forall>i. CSTATE SIA T i \<and> nextGOPendingIs GO_WritePullDrop T i \<longrightarrow> (\<forall>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 534 ← Original Lines 625
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.563
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 625: `(HSTATE InvalidM T \<longrightarrow> dthdatas1 T = [] \<and> dthdatas2 T = []) \<and>`

**Current Conjunct**:
- Line 534: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. dthdatas T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 535 ← Original Lines 626, 627
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 626: `(CSTATE Invalid T 0 \<longrightarrow> \<not> nextSnoopIs SnpInv T 0) \<and>`
- Line 627: `(CSTATE Invalid T 1 \<longrightarrow> \<not> nextSnoopIs SnpInv T 1) \<and>`

**Current Conjunct**:
- Line 535: `(\<forall>i. CSTATE Invalid T i \<longrightarrow> \<not> nextSnoopIs SnpInv T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 536 ← Original Lines 628, 629
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 628: `(CSTATE Modified T 0 \<longrightarrow> \<not> CSTATE MIA T 1) \<and>`
- Line 629: `(CSTATE Modified T 1 \<longrightarrow> \<not> CSTATE MIA T 0) \<and>`

**Current Conjunct**:
- Line 536: `(\<forall>i. CSTATE Modified T i \<longrightarrow> (\<forall>j. j \<noteq> i \<longrightarrow> \<not...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 537 ← Original Lines 630, 631
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 630: `(HSTATE MA T \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1)...`
- Line 631: `(HSTATE MA T \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0)...`

**Current Conjunct**:
- Line 537: `(\<forall>i. HSTATE MA T \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> i \...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 538 ← Original Lines 633
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.514
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 633: `(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []) \<...`

**Current Conjunct**:
- Line 538: `(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<longrightarrow> (\<forall>j. j \<noteq> i \<...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 539 ← Original Lines 634, 635
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 634: `(HSTATE MA T \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1)...`
- Line 635: `(HSTATE MA T \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0)...`

**Current Conjunct**:
- Line 539: `(\<forall>i. HSTATE MA T \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> i \...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 540 ← Original Lines 636, 637
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 636: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE ISD T 0 \<and> \<not> CSTATE IS...`
- Line 637: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE ISD T 1 \<and> \<not> CSTATE IS...`

**Current Conjunct**:
- Line 540: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE ISD T i \<and> \<n...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 541 ← Original Lines 638, 639
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 638: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE SMD T 0 \<and> \<not> CSTATE SM...`
- Line 639: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE SMD T 1 \<and> \<not> CSTATE SM...`

**Current Conjunct**:
- Line 541: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE SMD T i \<and> \<n...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 542 ← Original Lines 640, 641
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 640: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE IM...`
- Line 641: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE IM...`

**Current Conjunct**:
- Line 542: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<n...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 543 ← Original Lines 608
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.663
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 608: `(HSTATE InvalidM T \<longrightarrow> \<not> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> (nextGOP...`

**Current Conjunct**:
- Line 543: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> (\<forall>i. \<not> (CSTATE ISAD T i \<and> (...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 544 ← Original Lines 648
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.680
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 648: `(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD ...`

**Current Conjunct**:
- Line 544: `(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 545 ← Original Lines 650, 651
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 650: `(CSTATE ISA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD ...`
- Line 651: `(CSTATE ISA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD ...`

**Current Conjunct**:
- Line 545: `(\<forall>i. CSTATE ISA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 546 ← Original Lines 652, 653
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 652: `(CSTATE ISAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD...`
- Line 653: `(CSTATE ISAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD...`

**Current Conjunct**:
- Line 546: `(\<forall>i. CSTATE ISAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 547 ← Original Lines 654
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.634
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 654: `(CSTATE IMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T ...`

**Current Conjunct**:
- Line 547: `(\<forall>i. CSTATE IMAD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq>...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 548 ← Original Lines 655
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.589
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 655: `(CSTATE IMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T ...`

**Current Conjunct**:
- Line 548: `(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 549 ← Original Lines 649
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.536
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 649: `(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD ...`

**Current Conjunct**:
- Line 549: `(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 550 ← Original Lines 660, 661
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 660: `(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMA...`
- Line 661: `(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMA...`

**Current Conjunct**:
- Line 550: `(\<forall>i. CSTATE SMAD T i \<and> nextGOPending T i \<and> nextSnoopIs SnpInv T i \<longrightarrow...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 551 ← Original Lines 662, 663
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 662: `(CSTATE SMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T =...`
- Line 663: `(CSTATE SMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T =...`

**Current Conjunct**:
- Line 551: `(\<forall>i. CSTATE SMD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 552 ← Original Lines 664, 665
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 664: `(CSTATE SMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T =...`
- Line 665: `(CSTATE SMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T =...`

**Current Conjunct**:
- Line 552: `(\<forall>i. CSTATE SMA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 553 ← Original Lines 666, 667
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 666: `(CSTATE ISD T 0 \<or> CSTATE ISA T 0 \<longrightarrow> \<not> HSTATE MD T) \<and>`
- Line 667: `(CSTATE ISD T 1 \<or> CSTATE ISA T 1 \<longrightarrow> \<not> HSTATE MD T) \<and>`

**Current Conjunct**:
- Line 553: `(\<forall>i. CSTATE ISD T i \<or> CSTATE ISA T i \<longrightarrow> \<not> HSTATE MD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 554 ← Original Lines 339, 340
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 339: `(CSTATE ISAD T 0 \<and> nextGOPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] ) \...`
- Line 340: `(CSTATE ISAD T 1 \<and> nextGOPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] ) \...`

**Current Conjunct**:
- Line 554: `(\<forall>i. CSTATE ISAD T i \<and> (nextHTDDataPending T i \<or> nextGOPending T i) \<longrightarro...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 555 ← Original Lines 670, 671
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 670: `(CSTATE ISD T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> ...`
- Line 671: `(CSTATE ISD T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> ...`

**Current Conjunct**:
- Line 555: `(\<forall>i. CSTATE ISD T i \<and> HSTATE MA T \<longrightarrow> (\<forall>j. j \<noteq> i \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 556 ← Original Lines 672, 673
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 672: `(CSTATE ISA T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> ...`
- Line 673: `(CSTATE ISA T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> ...`

**Current Conjunct**:
- Line 556: `(\<forall>i. CSTATE ISA T i \<and> HSTATE MA T \<longrightarrow> (\<forall>j. j \<noteq> i \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 557 ← Original Lines 674, 675
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 674: `(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextG...`
- Line 675: `(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextG...`

**Current Conjunct**:
- Line 557: `(\<forall>i. CSTATE IMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 558 ← Original Lines 676, 677
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 676: `(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> ...`
- Line 677: `(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> ...`

**Current Conjunct**:
- Line 558: `(\<forall>i. CSTATE IMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 559 ← Original Lines 678, 679
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 678: `(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE Shared T 1) \<and>`
- Line 679: `(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE Shared T 0) \<and>`

**Current Conjunct**:
- Line 559: `(\<forall>i. CSTATE IMD T i \<and> nextHTDDataPending T i \<longrightarrow> (\<forall>j. j \<noteq> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 560 ← Original Lines 542
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.736
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 542: `(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) \<and>`

**Current Conjunct**:
- Line 560: `(\<forall>i. CSTATE ISD T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 561 ← Original Lines 682, 683
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 682: `(CSTATE ISA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) \<and>`
- Line 683: `(CSTATE ISA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) \<and>`

**Current Conjunct**:
- Line 561: `(\<forall>i. CSTATE ISA T i \<and> nextSnoopIs SnpInv T i \<longrightarrow> HSTATE MA T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 562 ← Original Lines 684, 685
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 684: `(CSTATE ISAD T 0 \<and> nextGOPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA ...`
- Line 685: `(CSTATE ISAD T 1 \<and> nextGOPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA ...`

**Current Conjunct**:
- Line 562: `(\<forall>i. CSTATE ISAD T i \<and> nextGOPending T i \<and> nextSnoopIs SnpInv T i \<longrightarrow...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 563 ← Original Lines 686, 687
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 686: `(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTAT...`
- Line 687: `(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTAT...`

**Current Conjunct**:
- Line 563: `(\<forall>i. CSTATE ISAD T i \<and> nextHTDDataPending T i \<and> nextSnoopIs SnpInv T i \<longright...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 564 ← Original Lines 688, 689
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 688: `(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0) \<and>`
- Line 689: `(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1) \<and>`

**Current Conjunct**:
- Line 564: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE IMA T i \<and> \<not> CSTATE SMA T i)...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 565 ← Original Lines 690, 691
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 690: `(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) \<and>`
- Line 691: `(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) \<and>`

**Current Conjunct**:
- Line 565: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<not> CSTATE SMD T i)...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 566 ← Original Lines 692, 693
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 692: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDD...`
- Line 693: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDD...`

**Current Conjunct**:
- Line 566: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDD...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 567 ← Original Lines 642
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.661
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 642: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> (nextGOPending...`

**Current Conjunct**:
- Line 567: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDD...`

**Explanation**: Single conjunct transformation

---

#### Current Line 568 ← Original Lines 694, 695
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 694: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDD...`
- Line 695: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDD...`

**Current Conjunct**:
- Line 568: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDD...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 569 ← Original Lines 644
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.792
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 644: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> (nextGOPending...`

**Current Conjunct**:
- Line 569: `(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDD...`

**Explanation**: Single conjunct transformation

---

#### Current Line 570 ← Original Lines 568
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.522
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 568: `(HSTATE SharedM T \<and> nextReqIs CleanEvict T 0 \<longrightarrow> \<not> CSTATE ISDI T 0) \<and>`

**Current Conjunct**:
- Line 570: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 571 ← Original Lines 696
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.643
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 696: `(HSTATE SharedM T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) \<and>`

**Current Conjunct**:
- Line 571: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 572 ← Original Lines 698, 699
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 698: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISD T 0 \<and> \<not> CSTATE IMD T 0 \<and> \<not...`
- Line 699: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISD T 1 \<and> \<not> CSTATE IMD T 1 \<and> \<not...`

**Current Conjunct**:
- Line 572: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE ISD T i \<and> \<not> CSTATE IMD T i...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 573 ← Original Lines 700, 701
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 700: `(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPending T 0)) \<and>`
- Line 701: `(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPending T 1)) \<and>`

**Current Conjunct**:
- Line 573: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> (CSTATE ISAD T i \<and> nextGOPending T i))...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 574 ← Original Lines 422, 423
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 422: `(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] ) \...`
- Line 423: `(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] ) \...`

**Current Conjunct**:
- Line 574: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> (CSTATE IMAD T i \<and> nextGOPending T i))...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 575 ← Original Lines 704, 705
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 704: `(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> nextGOPending T 0)) \<and>`
- Line 705: `(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> nextGOPending T 1)) \<and>`

**Current Conjunct**:
- Line 575: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> (CSTATE SMAD T i \<and> nextGOPending T i))...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 576 ← Original Lines 706, 707
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 706: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE IMA T 0 \<and> \<not...`
- Line 707: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> CSTATE IMA T 1 \<and> \<not...`

**Current Conjunct**:
- Line 576: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i \<and> \<not> CSTATE IMA T i...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 577 ← Original Lines 708, 709
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 708: `(HSTATE InvalidM T \<longrightarrow> \<not> nextHTDDataPending T 0) \<and>`
- Line 709: `(HSTATE InvalidM T \<longrightarrow> \<not> nextHTDDataPending T 1) \<and>`

**Current Conjunct**:
- Line 577: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> nextHTDDataPending T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 578 ← Original Lines 533
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.705
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 533: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1 \<...`

**Current Conjunct**:
- Line 578: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 0) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 579 ← Original Lines 550
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.569
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 550: `(HSTATE ID T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1 \<and> \...`

**Current Conjunct**:
- Line 579: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 1) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 580 ← Original Lines 712, 713
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 712: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Modified T 0) \<and>`
- Line 713: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Modified T 1) \<and>`

**Current Conjunct**:
- Line 580: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 581 ← Original Lines 591
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.373
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 591: `(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []...`

**Current Conjunct**:
- Line 581: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMD T i \<and> nextHTDDataPending T i \<longri...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 582 ← Original Lines 669
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.449
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 669: `(CSTATE ISAD T 1 \<and> (nextHTDDataPending T 1 \<or> nextGOPending T 1) \<longrightarrow> \<not> HS...`

**Current Conjunct**:
- Line 582: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextHTDDataPending T i \<and> ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 583 ← Original Lines 718, 719
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 718: `(CSTATE IMD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1) \<and>`
- Line 719: `(CSTATE IMD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0) \<and>`

**Current Conjunct**:
- Line 583: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMD T i \<and> nextSnoopIs SnpData T i \<longr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 584 ← Original Lines 720, 721
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 720: `(CSTATE IMA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1) \<and>`
- Line 721: `(CSTATE IMA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0) \<and>`

**Current Conjunct**:
- Line 584: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextSnoopIs SnpData T i \<longr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 585 ← Original Lines 722, 723
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 722: `(CSTATE IMAD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1) \<and>`
- Line 723: `(CSTATE IMAD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0) \<and>`

**Current Conjunct**:
- Line 585: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextSnoopIs SnpData T i \<long...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 586 ← Original Lines 724, 725
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 724: `(CSTATE IMD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>`
- Line 725: `(CSTATE IMD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Current Conjunct**:
- Line 586: `(\<forall>i. CSTATE IMD T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 587 ← Original Lines 726, 727
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 726: `(CSTATE IMA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>`
- Line 727: `(CSTATE IMA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Current Conjunct**:
- Line 587: `(\<forall>i. CSTATE IMA T i \<and> nextSnoopIs SnpData T i \<longrightarrow> HSTATE SAD T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 588 ← Original Lines 543
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.599
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 543: `(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) \<and>`

**Current Conjunct**:
- Line 588: `(CSTATE IMA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 589 ← Original Lines 728, 729
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 728: `(CSTATE IMAD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>`
- Line 729: `(CSTATE IMAD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Current Conjunct**:
- Line 589: `(CSTATE IMAD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 590 ← Original Lines 656
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.521
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 656: `(CSTATE IMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T =...`

**Current Conjunct**:
- Line 590: `(CSTATE IMAD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 591 ← Original Lines 529
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.325
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 529: `(CSTATE Modified T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] ...`

**Current Conjunct**:
- Line 591: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i \<and> \<not> CSTATE Shared T...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 592 ← Original Lines 539
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.545
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 539: `(HSTATE InvalidM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 592: `(\<forall>i. HSTATE IB T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 593 ← Original Lines 219
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.868
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 219: `(HSTATE MD T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1) \<and>`

**Current Conjunct**:
- Line 593: `(HSTATE SB T \<longrightarrow> (\<forall>i. \<not> CSTATE Modified T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 594 ← Original Lines 734
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.551
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 734: `(HSTATE SB T \<longrightarrow> length (dthdatas1 T) \<le> 1 \<and> length (dthdatas2 T) \<le> 1) \<a...`

**Current Conjunct**:
- Line 594: `(HSTATE SB T \<longrightarrow> (\<forall>i. length (dthdatas T i) \<le> 1)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 595 ← Original Lines 735
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.551
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 735: `(HSTATE IB T \<longrightarrow> length (dthdatas1 T) \<le> 1 \<and> length (dthdatas2 T) \<le> 1) \<a...`

**Current Conjunct**:
- Line 595: `(HSTATE IB T \<longrightarrow> (\<forall>i. length (dthdatas T i) \<le> 1)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 596 ← Original Lines 736, 737
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 736: `(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE IIA T 1) \<and>`
- Line 737: `(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE IIA T 0) \<and>`

**Current Conjunct**:
- Line 596: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 597 ← Original Lines 738
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.551
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 738: `(HSTATE MB T \<longrightarrow> length (dthdatas1 T) \<le> 1 \<and> length (dthdatas2 T) \<le> 1) \<a...`

**Current Conjunct**:
- Line 597: `(HSTATE MB T \<longrightarrow> (\<forall>i. length (dthdatas T i) \<le> 1)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 598 ← Original Lines 353
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.510
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 353: `(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 598: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 599 ← Original Lines 741
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.535
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 741: `(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) \<and>`

**Current Conjunct**:
- Line 599: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 600 ← Original Lines 495
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.464
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 495: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 600: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 601 ← Original Lines 745
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.442
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 745: `(HSTATE SB T \<longrightarrow> snps2 T = [] \<and> snps1 T = []) \<and>`

**Current Conjunct**:
- Line 601: `(HSTATE SB T \<longrightarrow> (\<forall>i. snps T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 602 ← Original Lines 746
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.442
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 746: `(HSTATE IB T \<longrightarrow> snps2 T = [] \<and> snps1 T = []) \<and>`

**Current Conjunct**:
- Line 602: `(HSTATE IB T \<longrightarrow> (\<forall>i. snps T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 603 ← Original Lines 747
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.442
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 747: `(HSTATE MB T \<longrightarrow> snps2 T = [] \<and> snps1 T = []) \<and>`

**Current Conjunct**:
- Line 603: `(HSTATE MB T \<longrightarrow> (\<forall>i. snps T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 604 ← Original Lines 295
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.327
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 295: `(reqs2 T \<noteq> [] \<longrightarrow> reqresps2 T = [] ) \<and>`

**Current Conjunct**:
- Line 604: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 605 ← Original Lines 310
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.323
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 310: `(snpresps1 T \<noteq> [] \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 605: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 606 ← Original Lines 311
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.323
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 311: `(snpresps2 T \<noteq> [] \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 606: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 607 ← Original Lines 754, 755
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 754: `(HSTATE SB T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) \<and>`
- Line 755: `(HSTATE SB T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) \<and>`

**Current Conjunct**:
- Line 607: `(HSTATE SB T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<not> CSTATE SMD T i)) \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 608 ← Original Lines 730
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.449
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 730: `(HSTATE IB T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1 \<and> \...`

**Current Conjunct**:
- Line 608: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE IMD T i \<and> \<not> CSTATE SMD T i)) \<a...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 609 ← Original Lines 758, 759
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 758: `(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not>...`
- Line 759: `(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not>...`

**Current Conjunct**:
- Line 609: `(\<forall>i. HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T i \<longrighta...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 610 ← Original Lines 760, 761
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 760: `(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not>...`
- Line 761: `(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not>...`

**Current Conjunct**:
- Line 610: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 611 ← Original Lines 668
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.480
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 668: `(CSTATE ISAD T 0 \<and> (nextHTDDataPending T 0 \<or> nextGOPending T 0) \<longrightarrow> \<not> HS...`

**Current Conjunct**:
- Line 611: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISAD T i \<and> nextHTDDataPending T i \<longr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 612 ← Original Lines 351
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.583
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 351: `(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 612: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightar...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 613 ← Original Lines 766, 767
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 766: `(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1...`
- Line 767: `(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0...`

**Current Conjunct**:
- Line 613: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE ISAD T i \<and> nextHTDDataPending T i \<and> ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 614 ← Original Lines 412
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: go_pending_constraint
**Confidence Score**: 0.404
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 412: `(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) T...`

**Current Conjunct**:
- Line 614: `(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not> CSTATE SIA T i \<or> nextGOPendingIs GO_Wr...`

**Explanation**: Single conjunct transformation

---

#### Current Line 615 ← Original Lines 769, 770
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 769: `(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CS...`
- Line 770: `(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CS...`

**Current Conjunct**:
- Line 615: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 616 ← Original Lines 399, 400
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 399: `(CSTATE SIA T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) \<an...`
- Line 400: `(CSTATE SIA T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = []) \<an...`

**Current Conjunct**:
- Line 616: `(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE SIA T i)) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 617 ← Original Lines 772, 773
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 772: `(CSTATE MIA T 0 \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> nextGOPending T 1)) \<and>`
- Line 773: `(CSTATE MIA T 1 \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> nextGOPending T 0)) \<and>`

**Current Conjunct**:
- Line 617: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<longrightarrow> \<not> (CSTATE IMAD ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 618 ← Original Lines 774, 775
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 774: `(CSTATE MIA T 0 \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> nextGOPending T 1)) \<and>`
- Line 775: `(CSTATE MIA T 1 \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> nextGOPending T 0)) \<and>`

**Current Conjunct**:
- Line 618: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<longrightarrow> \<not> (CSTATE SMAD ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 619 ← Original Lines 776, 777
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 776: `(HSTATE ModifiedM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) \<and>`
- Line 777: `(HSTATE ModifiedM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) \<and>`

**Current Conjunct**:
- Line 619: `(\<forall>i. HSTATE ModifiedM T \<and> nextReqIs RdOwn T i \<longrightarrow> CSTATE IMAD T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 620 ← Original Lines 752
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.305
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 752: `(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 620: `(HSTATE ModifiedM T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 621 ← Original Lines 751
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.334
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 751: `(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 621: `(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 622 ← Original Lines 780, 781
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 780: `(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CS...`
- Line 781: `(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CS...`

**Current Conjunct**:
- Line 622: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrig...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 623 ← Original Lines 782, 783
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 782: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMA T 1 \<and> \<not> CSTA...`
- Line 783: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMA T 0 \<and> \<not> CSTA...`

**Current Conjunct**:
- Line 623: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> HSTATE ModifiedM T \<longrighta...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 624 ← Original Lines 784, 785
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 784: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTA...`
- Line 785: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTA...`

**Current Conjunct**:
- Line 624: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTA...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 625 ← Original Lines 697
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.583
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 697: `(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) \<and>`

**Current Conjunct**:
- Line 625: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTA...`

**Explanation**: Single conjunct transformation

---

#### Current Line 626 ← Original Lines 786, 787
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 786: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPe...`
- Line 787: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPe...`

**Current Conjunct**:
- Line 626: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPe...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 627 ← Original Lines 645
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.622
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 645: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> (nextGOPending...`

**Current Conjunct**:
- Line 627: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPe...`

**Explanation**: Single conjunct transformation

---

#### Current Line 628 ← Original Lines 788, 789
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 788: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 789: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 628: `(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 629 ← Original Lines 617
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.347
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 617: `(CSTATE MIA T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = []) \<an...`

**Current Conjunct**:
- Line 629: `(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 630 ← Original Lines 790, 791
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 790: `(CSTATE IMD T 1 \<longrightarrow> reqresps2 T = []) \<and>`
- Line 791: `(CSTATE IMD T 0 \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 630: `(\<forall>i. CSTATE IMD T i \<longrightarrow> reqresps T i = []) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 631 ← Original Lines 742
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.434
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 742: `(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 631: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 632 ← Original Lines 270
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.447
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 270: `(CSTATE ISD T 1 \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 632: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i \<and> \<not> CSTATE ISD T i)) \<a...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 633 ← Original Lines 796, 797
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 796: `(HSTATE IB T \<longrightarrow> \<not> CSTATE SMA T 0 \<and> \<not> CSTATE SMD T 0) \<and>`
- Line 797: `(HSTATE IB T \<longrightarrow> \<not> CSTATE SMA T 1 \<and> \<not> CSTATE SMD T 1) \<and>`

**Current Conjunct**:
- Line 633: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE SMA T i \<and> \<not> CSTATE SMD T i)) \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 634 ← Original Lines 798, 799
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 798: `(HSTATE IB T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE IMD T 0) \<and>`
- Line 799: `(HSTATE IB T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE IMD T 1) \<and>`

**Current Conjunct**:
- Line 634: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE IMA T i \<and> \<not> CSTATE IMD T i)) \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 635 ← Original Lines 385
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.455
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 385: `(CSTATE IIA T 1 \<longrightarrow> \<not> CSTATE IIA T 0) \<and>`

**Current Conjunct**:
- Line 635: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 636 ← Original Lines 749
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.358
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 749: `(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 636: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> nextHTDDataPending T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 637 ← Original Lines 744
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.428
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 744: `(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) \<and>`

**Current Conjunct**:
- Line 637: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 638 ← Original Lines 352
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.522
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 352: `(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 638: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 639 ← Original Lines 806, 807
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 806: `(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextHTDDataPending T 1) \<and>`
- Line 807: `(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextHTDDataPending T 0) \<and>`

**Current Conjunct**:
- Line 639: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 640 ← Original Lines 808, 809
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 808: `(HSTATE ModifiedM T \<and> nextReqIs RdShared T 0 \<longrightarrow> \<not> CSTATE ISDI T 1) \<and>`
- Line 809: `(HSTATE ModifiedM T \<and> nextReqIs RdShared T 1 \<longrightarrow> \<not> CSTATE ISDI T 0) \<and>`

**Current Conjunct**:
- Line 640: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ModifiedM T \<and> nextReqIs RdShared T i \<lo...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 641 ← Original Lines 572
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.556
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 572: `(HSTATE SharedM T \<and> nextReqIs CleanEvict T 0 \<longrightarrow> \<not> CSTATE MIA T 0) \<and>`

**Current Conjunct**:
- Line 641: `(HSTATE SD T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 642 ← Original Lines 811, 812
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 811: `(HSTATE SAD T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> C...`
- Line 812: `(HSTATE SAD T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> C...`

**Current Conjunct**:
- Line 642: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> snpresps T i \<noteq> [] \<longri...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 643 ← Original Lines 573
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.556
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 573: `(HSTATE SharedM T \<and> nextReqIs CleanEvict T 1 \<longrightarrow> \<not> CSTATE MIA T 1) \<and>`

**Current Conjunct**:
- Line 643: `(HSTATE MD T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 644 ← Original Lines 756
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.334
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 756: `(HSTATE IB T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) \<and>`

**Current Conjunct**:
- Line 644: `(\<forall>i j. i \<noteq> j \<longrightarrow> (snpresps T i \<noteq> [] \<and> HSTATE MAD T \<longri...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 645 ← Original Lines 814, 815
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 814: `(snpresps1 T \<noteq> [] \<and> HSTATE MAD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> C...`
- Line 815: `(snpresps2 T \<noteq> [] \<and> HSTATE MAD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> C...`

**Current Conjunct**:
- Line 645: `(snpresps2 T \<noteq> [] \<and> HSTATE MAD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> C...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 646 ← Original Lines 714, 715
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 714: `(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snpresps2 T = [] \<and> reqresps1 T ...`
- Line 715: `(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snpresps1 T = [] \<and> reqresps2 T ...`

**Current Conjunct**:
- Line 646: `(CSTATE IMD T 0 \<and> HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snps1 T = [] \<and> req...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 647 ← Original Lines 241
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: channel_constraint
**Confidence Score**: 0.489
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 241: `(snps2 T \<noteq> [] \<longrightarrow> reqs1 T = [] \<and> snpresps2 T = [] \<and> dthdatas2 T = [] ...`

**Current Conjunct**:
- Line 647: `(CSTATE IMD T 1 \<and> HSTATE MD T \<longrightarrow> snpresps2 T = [] \<and> snps2 T = [] \<and> req...`

**Explanation**: Single conjunct transformation

---

#### Current Line 648 ← Original Lines 564
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.407
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 564: `(HSTATE SharedM T \<and> nextReqIs CleanEvict T 0 \<longrightarrow> nextEvict T 0) \<and>`

**Current Conjunct**:
- Line 648: `(nextDTHDataFrom 0 T \<and> HSTATE MD T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0...`

**Explanation**: Single conjunct transformation

---

#### Current Line 649 ← Original Lines 565
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.407
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 565: `(HSTATE SharedM T \<and> nextReqIs CleanEvict T 1 \<longrightarrow> nextEvict T 1) \<and>`

**Current Conjunct**:
- Line 649: `(nextDTHDataFrom 1 T \<and> HSTATE MD T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1...`

**Explanation**: Single conjunct transformation

---

#### Current Line 650 ← Original Lines 820, 821
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 820: `(HSTATE SAD T \<and> nextSnpRespIs RspSFwdM T 0 \<longrightarrow> \<not> CSTATE Modified T 1) \<and>`
- Line 821: `(HSTATE SAD T \<and> nextSnpRespIs RspSFwdM T 1 \<longrightarrow> \<not> CSTATE Modified T 0) \<and>`

**Current Conjunct**:
- Line 650: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SAD T \<and> nextSnpRespIs RspSFwdM T i \<long...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 651 ← Original Lines 822, 823
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 822: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE Modified T 1 \<and> \<not> ...`
- Line 823: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> ...`

**Current Conjunct**:
- Line 651: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 652 ← Original Lines 496
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.464
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 496: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 652: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 653 ← Original Lines 486
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.868
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 486: `(HSTATE MD T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs...`

**Current Conjunct**:
- Line 653: `(HSTATE SA T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 654 ← Original Lines 778
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.306
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 778: `(HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISA T 1) \<and>`

**Current Conjunct**:
- Line 654: `(HSTATE SharedM T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 655 ← Original Lines 828, 829
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 828: `(CSTATE IIA T 0 \<and> HSTATE SA T \<longrightarrow> CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \...`
- Line 829: `(CSTATE IIA T 1 \<and> HSTATE SA T \<longrightarrow> CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \...`

**Current Conjunct**:
- Line 655: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IIA T i \<and> HSTATE SA T \<longrightarrow> C...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 656 ← Original Lines 323
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.434
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 323: `(HSTATE MD T \<and> reqs2 T \<noteq> [] \<longrightarrow> dthdatas2 T \<noteq> []) \<and>`

**Current Conjunct**:
- Line 656: `(\<forall>i. HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrightarrow> htddatas T i = [] \<or> C...`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 657 ← Original Lines 268
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.377
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 268: `(CSTATE ISD T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = []) \<an...`

**Current Conjunct**:
- Line 657: `(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE ISD T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 658 ← Original Lines 833, 834
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 833: `(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE Invalid T 0 \<or> CSTATE ISAD T 0 \...`
- Line 834: `(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE Invalid T 1 \<or> CSTATE ISAD T 1 \...`

**Current Conjunct**:
- Line 658: `(\<forall>i. HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarrow> CSTATE Invalid T i \<or> CSTAT...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 659 ← Original Lines 257
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.536
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 257: `(CSTATE Shared T 1 \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 659: `(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE Shared T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 660 ← Original Lines 748
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.410
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 748: `(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 660: `(HSTATE MB T \<longrightarrow> (\<forall>i. snpresps T i = [])) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 661 ← Original Lines 392, 393
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 392: `(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) \...`
- Line 393: `(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) \...`

**Current Conjunct**:
- Line 661: `(\<forall>i. HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> nextGOPend...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 662 ← Original Lines 732
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.442
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 732: `(HSTATE IB T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) \<and>`

**Current Conjunct**:
- Line 662: `(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE SIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 663 ← Original Lines 840, 841
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 840: `(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextReqIs RdOwn T 1) \<and>`
- Line 841: `(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextReqIs RdOwn T 0) \<and>`

**Current Conjunct**:
- Line 663: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 664 ← Original Lines 733
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.567
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 733: `(HSTATE SB T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1) \<and>`

**Current Conjunct**:
- Line 664: `(HSTATE MB T \<longrightarrow> (\<forall>i. \<not> CSTATE ISA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 665 ← Original Lines 843, 844
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 843: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE SB T \<longrightarrow> \<not> ...`
- Line 844: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE SB T \<longrightarrow> \<not> ...`

**Current Conjunct**:
- Line 665: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull T ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 666 ← Original Lines 845, 846
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 845: `(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) \<and>`
- Line 846: `(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) \<and>`

**Current Conjunct**:
- Line 666: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE IB T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 667 ← Original Lines 378
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: other
**Confidence Score**: 0.374
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 378: `(nextDTHDataFrom 1 T \<longrightarrow> \<not> nextDTHDataFrom 0 T) \<and>`

**Current Conjunct**:
- Line 667: `(\<forall>i. HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> nextGOPend...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 668 ← Original Lines 849, 850
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 849: `(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE...`
- Line 850: `(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE...`

**Current Conjunct**:
- Line 668: `(\<forall>i. HSTATE SB T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE MIA...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 669 ← Original Lines 386
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.480
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 386: `(CSTATE MIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextDTHDataFrom 1 T...`

**Current Conjunct**:
- Line 669: `(\<forall>i. HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> nextGOPend...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 670 ← Original Lines 853, 854
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 853: `(CSTATE Modified T 0 \<longrightarrow> \<not> nextReqIs RdOwn T 0) \<and>`
- Line 854: `(CSTATE Modified T 1 \<longrightarrow> \<not> nextReqIs RdOwn T 1) \<and>`

**Current Conjunct**:
- Line 670: `(\<forall>i. CSTATE Modified T i \<longrightarrow> \<not> nextReqIs RdOwn T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 671 ← Original Lines 855, 856
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 855: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE ISD T 1) \<and>`
- Line 856: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE ISD T 0) \<and>`

**Current Conjunct**:
- Line 671: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE ISD T 1) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 672 ← Original Lines 269
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.482
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 269: `(CSTATE ISD T 0 \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 672: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE ISD T 0) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 673 ← Original Lines 857, 858
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 857: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPend...`
- Line 858: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPend...`

**Current Conjunct**:
- Line 673: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPend...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 674 ← Original Lines 659
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.461
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 659: `(CSTATE IMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T =...`

**Current Conjunct**:
- Line 674: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPend...`

**Explanation**: Single conjunct transformation

---

#### Current Line 675 ← Original Lines 859, 860
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 859: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE IMA T 1 \<and> nextGOPendi...`
- Line 860: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE IMA T 0 \<and> nextGOPendi...`

**Current Conjunct**:
- Line 675: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE IMA T 1 \<and> nextGOPendi...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 676 ← Original Lines 658
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.484
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 658: `(CSTATE IMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T =...`

**Current Conjunct**:
- Line 676: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE IMA T 0 \<and> nextGOPendi...`

**Explanation**: Single conjunct transformation

---

#### Current Line 677 ← Original Lines 861, 862
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 861: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISA T 1 \<and> nextGOPendi...`
- Line 862: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISA T 0 \<and> nextGOPendi...`

**Current Conjunct**:
- Line 677: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISA T 1 \<and> nextGOPendi...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 678 ← Original Lines 702
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.489
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 702: `(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> nextGOPending T 0)) \<and>`

**Current Conjunct**:
- Line 678: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISA T 0 \<and> nextGOPendi...`

**Explanation**: Single conjunct transformation

---

#### Current Line 679 ← Original Lines 863, 864
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 863: `((CSTATE ISAD T 0 \<and> nextGOPending T 0) \<or> CSTATE ISA T 0 \<or> ( nextHTDDataPending T 0) \<o...`
- Line 864: `((CSTATE ISAD T 1 \<and> nextGOPending T 1) \<or> CSTATE ISA T 1 \<or> ( nextHTDDataPending T 1) \<o...`

**Current Conjunct**:
- Line 679: `((CSTATE ISAD T 0 \<and> nextGOPending T 0) \<or> CSTATE ISA T 0 \<or> ( nextHTDDataPending T 0) \<o...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 680 ← Original Lines 762
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.407
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 762: `(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snpresps1 T = []) \<and>`

**Current Conjunct**:
- Line 680: `((CSTATE ISAD T 1 \<and> nextGOPending T 1) \<or> CSTATE ISA T 1 \<or> ( nextHTDDataPending T 1) \<o...`

**Explanation**: Single conjunct transformation

---

#### Current Line 681 ← Original Lines 425
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.300
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 425: `(snpresps2 T \<noteq> [] \<longrightarrow> reqresps2 T = []) \<and>`

**Current Conjunct**:
- Line 681: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightar...`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 682 ← Original Lines 867, 868
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 867: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE MIA T 0) \<and>`
- Line 868: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE MIA T 1) \<and>`

**Current Conjunct**:
- Line 682: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> \<not> CSTATE MIA T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 683 ← Original Lines 869, 870
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 869: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTAT...`
- Line 870: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE SIA T 1 \<and> \<not> CSTAT...`

**Current Conjunct**:
- Line 683: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE SI...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 684 ← Original Lines 871, 872
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 871: `(CSTATE Modified T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> (ht...`
- Line 872: `(CSTATE Modified T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> (ht...`

**Current Conjunct**:
- Line 684: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> \<not> CSTATE I...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 685 ← Original Lines 873, 874
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 873: `(CSTATE Modified T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 874: `(CSTATE Modified T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 685: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> \<not> CSTATE S...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 686 ← Original Lines 294
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.342
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 294: `(reqs1 T \<noteq> [] \<longrightarrow> reqresps1 T = [] ) \<and>`

**Current Conjunct**:
- Line 686: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> snpresps T j = ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 687 ← Original Lines 877, 878
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 877: `(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPend...`
- Line 878: `(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPend...`

**Current Conjunct**:
- Line 687: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 688 ← Original Lines 879, 880
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 879: `(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> CSTAT...`
- Line 880: `(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTAT...`

**Current Conjunct**:
- Line 688: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 689 ← Original Lines 830
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.327
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 830: `(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> htddatas1 T = [] \<or> CSTATE ISDI T 0...`

**Current Conjunct**:
- Line 689: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 690 ← Original Lines 883, 884
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 883: `(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE IMA T 1) \<and>`
- Line 884: `(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE IMA T 0) \<and>`

**Current Conjunct**:
- Line 690: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 691 ← Original Lines 254
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.429
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 254: `(CSTATE Invalid T 0 \<longrightarrow> reqs1 T = []) \<and>`

**Current Conjunct**:
- Line 691: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Invalid T i \<longrightarrow> snps T j = [])) ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 692 ← Original Lines 887, 888
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 887: `(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE ISD T 1 \<or> CSTATE ISAD T 1 \<and...`
- Line 888: `(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE ISD T 0 \<or> CSTATE ISAD T 0 \<and...`

**Current Conjunct**:
- Line 692: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 693 ← Original Lines 757
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.307
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 757: `(HSTATE IB T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) \<and>`

**Current Conjunct**:
- Line 693: `(HSTATE SAD T \<longrightarrow> (\<forall>i. \<not> nextGOPendingIs GO_WritePull T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 694 ← Original Lines 890, 993
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 890: `(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTAT...`
- Line 993: `(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTAT...`

**Current Conjunct**:
- Line 694: `(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE MI...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 695 ← Original Lines 891, 892
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 891: `(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpData T...`
- Line 892: `(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpData T...`

**Current Conjunct**:
- Line 695: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<and> nextH...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 696 ← Original Lines 893, 894
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 893: `(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> nex...`
- Line 894: `(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> nex...`

**Current Conjunct**:
- Line 696: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<and> nextH...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 697 ← Original Lines 717
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.423
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 717: `(CSTATE IMAD T 1 \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<longrightarrow> snpresps1 ...`

**Current Conjunct**:
- Line 697: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<and> nextH...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 698 ← Original Lines 897, 898
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 897: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE IB T \<longrightarrow> \<not> ...`
- Line 898: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE IB T \<longrightarrow> \<not> ...`

**Current Conjunct**:
- Line 698: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SIA T i \<and> nextGOPendingIs GO_WritePull T ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 699 ← Original Lines 277
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.528
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 277: `(CSTATE MIA T 0 \<and> (nextGOPendingIs GO_WritePull T 0) \<longrightarrow> snps2 T = [] \<and> snpr...`

**Current Conjunct**:
- Line 699: `(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE SB T \<longrightarrow> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 700 ← Original Lines 278
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.528
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 278: `(CSTATE MIA T 1 \<and> (nextGOPendingIs GO_WritePull T 1) \<longrightarrow> snps1 T = [] \<and> snpr...`

**Current Conjunct**:
- Line 700: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE SB T \<longrightarrow> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 701 ← Original Lines 901, 902
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 901: `(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 0 \<longrightarrow> CSTATE IIA T 0) \<and>`
- Line 902: `(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 1 \<longrightarrow> CSTATE IIA T 1) \<and>`

**Current Conjunct**:
- Line 701: `(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 0 \<longrightarrow> CSTATE IIA T 0) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 702 ← Original Lines 384
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.494
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 384: `(CSTATE IIA T 0 \<longrightarrow> \<not> CSTATE IIA T 1) \<and>`

**Current Conjunct**:
- Line 702: `(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 1 \<longrightarrow> CSTATE IIA T 1) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 703 ← Original Lines 768
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.816
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 768: `(HSTATE ModifiedM T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDrop ...`

**Current Conjunct**:
- Line 703: `(HSTATE InvalidM T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDrop T...`

**Explanation**: Single conjunct transformation

---

#### Current Line 704 ← Original Lines 904, 905
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 904: `(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMA...`
- Line 905: `(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMA...`

**Current Conjunct**:
- Line 704: `(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMA...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 705 ← Original Lines 801
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.300
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 801: `(HSTATE IB T \<longrightarrow> \<not> nextHTDDataPending T 0 \<and> \<not> nextHTDDataPending T 1) \...`

**Current Conjunct**:
- Line 705: `(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMA...`

**Explanation**: Single conjunct transformation

---

#### Current Line 706 ← Original Lines 300, 301
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: channel_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 300: `(length (dthdatas1 T ) \<le> 1) \<and>`
- Line 301: `(length (dthdatas2 T ) \<le> 1) \<and>`

**Current Conjunct**:
- Line 706: `(length (dthdatas1 T) \<le> 1) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 707 ← Original Lines 243
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: length_constraint
**Confidence Score**: 0.396
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 243: `(length (reqs1 T) \<le> 1 \<and> (length (reqs2 T) \<le> 1)) \<and>`

**Current Conjunct**:
- Line 707: `(length (dthdatas2 T) \<le> 1) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 708 ← Original Lines 908, 909
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 908: `(HSTATE IB T \<and> CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> ...`
- Line 909: `(HSTATE IB T \<and> CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> ...`

**Current Conjunct**:
- Line 708: `(HSTATE IB T \<and> CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> ...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 709 ← Original Lines 361
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.410
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 361: `(CSTATE IIA T 1 \<and> HSTATE SharedM T \<longrightarrow> reqs1 T = [] \<or> nextReqIs CleanEvict T ...`

**Current Conjunct**:
- Line 709: `(HSTATE IB T \<and> CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 710 ← Original Lines 910, 911
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 910: `(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CS...`
- Line 911: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CS...`

**Current Conjunct**:
- Line 710: `(\<forall>i. HSTATE MAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE Sh...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 711 ← Original Lines 912, 913
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 912: `(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not>...`
- Line 913: `(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not>...`

**Current Conjunct**:
- Line 711: `(\<forall>i. HSTATE MA T \<and> snpresps T i \<noteq> [] \<longrightarrow> (\<forall>j. \<not> CSTAT...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 712 ← Original Lines 816
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.390
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 816: `(CSTATE IMD T 0 \<and> HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snps1 T = [] \<and> req...`

**Current Conjunct**:
- Line 712: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextGOPending T i \<and> HSTAT...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 713 ← Original Lines 916, 917
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 916: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTAT...`
- Line 917: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTAT...`

**Current Conjunct**:
- Line 713: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 714 ← Original Lines 918
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.673
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 918: `(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTAT...`

**Current Conjunct**:
- Line 714: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0, hardcoded_channel → universal

---

#### Current Line 715 ← Original Lines 287
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.353
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 287: `(reqs2 T \<noteq> [] \<longrightarrow> htddatas2 T = []) \<and>`

**Current Conjunct**:
- Line 715: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> dthdatas T j = ...`

**Explanation**: Single conjunct enhanced with quantifiers: hardcoded_channel → universal

---

#### Current Line 716 ← Original Lines 922, 923
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 922: `(nextSnpRespIs RspIHitSE T 0 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0) \...`
- Line 923: `(nextSnpRespIs RspIHitSE T 1 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1) \...`

**Current Conjunct**:
- Line 716: `(\<forall>i. nextSnpRespIs RspIHitSE T i \<longrightarrow> \<not> CSTATE IMA T i \<and> \<not> CSTAT...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 717 ← Original Lines 924, 925
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 924: `(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 925: `(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 717: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMD T i \<and> nextHTDDataPending T i \<longri...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 718 ← Original Lines 926, 927
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 926: `(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 927: `(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 718: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMD T i \<and> nextHTDDataPending T i \<longri...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 719 ← Original Lines 928, 929
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 928: `(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 929: `(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 719: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 720 ← Original Lines 930, 931
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 930: `(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 931: `(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 720: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMA T i \<and> nextGOPending T i \<longrightar...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 721 ← Original Lines 932, 933
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 932: `(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`
- Line 933: `(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`

**Current Conjunct**:
- Line 721: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE IMAD T i \<and> nextGOPending T i \<longrighta...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 722 ← Original Lines 934, 935
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 934: `(HSTATE MD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE SMAD T 0) \<and>`
- Line 935: `(HSTATE MD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE SMAD T 1) \<and>`

**Current Conjunct**:
- Line 722: `(\<forall>i. HSTATE MD T \<and> nextDTHDataFrom i T \<longrightarrow> \<not> CSTATE SMAD T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 723 ← Original Lines 632
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.523
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 632: `(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []) \<...`

**Current Conjunct**:
- Line 723: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE SMAD T i \<and> nextGOPending T i \<longrighta...`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 724 ← Original Lines 647
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.628
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 647: `(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> (nextGOPending...`

**Current Conjunct**:
- Line 724: `(HSTATE InvalidM T \<longrightarrow> (\<forall>i. \<not> CSTATE SMAD T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 725 ← Original Lines 703
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.468
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 703: `(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> nextGOPending T 1)) \<and>`

**Current Conjunct**:
- Line 725: `(HSTATE IB T \<longrightarrow> (\<forall>i. \<not> CSTATE SMAD T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 726 ← Original Lines 731
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.446
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 731: `(HSTATE IB T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) \<and>`

**Current Conjunct**:
- Line 726: `(HSTATE ID T \<longrightarrow> (\<forall>i. \<not> CSTATE SMAD T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_0 → universal

---

#### Current Line 727 ← Original Lines 941, 942
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 941: `(HSTATE MA T \<and> nextSnpRespIs RspIHitSE T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) \...`
- Line 942: `(HSTATE MA T \<and> nextSnpRespIs RspIHitSE T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) \...`

**Current Conjunct**:
- Line 727: `(\<forall>i. HSTATE MA T \<and> nextSnpRespIs RspIHitSE T i \<longrightarrow> \<not> nextReqIs Dirty...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 728 ← Original Lines 388
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: channel_constraint
**Confidence Score**: 0.316
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 388: `(snpresps1 T \<noteq> [] \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 728: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE Modified T i \<longrightarrow> htddatas T j = ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1 → universal

---

#### Current Line 729 ← Original Lines 985, 986
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 985: `(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> snps2 T = []) \<and>`
- Line 986: `(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> snps1 T = []) \<and>`

**Current Conjunct**:
- Line 729: `(HSTATE ModifiedM T \<longrightarrow> snps1 T = [] \<and> snps2 T = []) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 730 ← Original Lines 946, 947
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 946: `(CSTATE SMAD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTAT...`
- Line 947: `(CSTATE SMAD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTAT...`

**Current Conjunct**:
- Line 730: `(CSTATE SMAD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTAT...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 731 ← Original Lines 575
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.577
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 575: `(CSTATE Shared T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SM...`

**Current Conjunct**:
- Line 731: `(CSTATE SMAD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTAT...`

**Explanation**: Single conjunct transformation

---

#### Current Line 732 ← Original Lines 948, 949
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 948: `(CSTATE SMAD T 1 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextR...`
- Line 949: `(CSTATE SMAD T 0 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextR...`

**Current Conjunct**:
- Line 732: `(CSTATE SMAD T 1 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextR...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 733 ← Original Lines 569
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.439
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 569: `(HSTATE SharedM T \<and> nextReqIs CleanEvict T 1 \<longrightarrow> \<not> CSTATE ISDI T 1) \<and>`

**Current Conjunct**:
- Line 733: `(CSTATE SMAD T 0 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextR...`

**Explanation**: Single conjunct transformation

---

#### Current Line 734 ← Original Lines 950, 951
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 950: `(CSTATE SIAC T 0 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 1) \<and>`
- Line 951: `(CSTATE SIAC T 1 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 0) \<and>`

**Current Conjunct**:
- Line 734: `(CSTATE SIAC T 0 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 1) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 735 ← Original Lines 494
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.547
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 494: `(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE Modified T 1 \<and> reqs1 T...`

**Current Conjunct**:
- Line 735: `(CSTATE SIAC T 1 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 0) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 736 ← Original Lines 952, 953
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 952: `(CSTATE SIAC T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) \<and>`
- Line 953: `(CSTATE SIAC T 1 \<longrightarrow> \<not> nextHTDDataPending T 1) \<and>`

**Current Conjunct**:
- Line 736: `(CSTATE SIAC T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) \<and>`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 737 ← Original Lines 272
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.516
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 272: `(CSTATE IMAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> reqs2 T = []) \<and>`

**Current Conjunct**:
- Line 737: `(CSTATE SIAC T 1 \<longrightarrow> \<not> nextHTDDataPending T 1) \<and>`

**Explanation**: Single conjunct transformation

---

#### Current Line 738 ← Original Lines 881
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.408
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 881: `(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> htddatas2 T = []) \<and>`

**Current Conjunct**:
- Line 738: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0)`

**Explanation**: Single conjunct transformation

---

#### Current Line 739 ← Original Lines 882
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.408
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 882: `(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> htddatas1 T = []) \<and>`

**Current Conjunct**:
- Line 739: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1)`

**Explanation**: Single conjunct transformation

---

#### Current Line 740 ← Original Lines 956, 957
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 956: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) \<and> HSTATE Modi...`
- Line 957: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) \<and> HSTATE Modi...`

**Current Conjunct**:
- Line 740: `(\<forall>i j. i \<noteq> j \<longrightarrow> ((CSTATE SIAC T i \<and> nextGOPending T i \<and> next...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 742 ← Original Lines 958, 959
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 958: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) \<and> HSTATE MD T...`
- Line 959: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) \<and> HSTATE MD T...`

**Current Conjunct**:
- Line 742: `(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) \<and>...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0, hardcoded_channel) consolidated using universal quantifiers

---

#### Current Line 743 ← Original Lines 831
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.309
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 831: `(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> htddatas2 T = [] \<or> CSTATE ISDI T 1...`

**Current Conjunct**:
- Line 743: `(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i) \<and>...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 744 ← Original Lines 960, 961
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 960: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) \<and> HSTATE MA T...`
- Line 961: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) \<and> HSTATE MA T...`

**Current Conjunct**:
- Line 744: `(\<forall>i j. i \<noteq> j \<longrightarrow> ((CSTATE SIAC T i \<and> nextGOPending T i \<and> next...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 746 ← Original Lines 954, 955, 962, 963, 964, 965
**Consolidation Type**: 6_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 954: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0)`
- Line 955: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1)`
- Line 962: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0)`
- Line 963: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1)`
- Line 964: `((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0)`
- Line 965: `((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1)`

**Current Conjunct**:
- Line 746: `(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i)`

**Explanation**: 6 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 747 ← Original Lines 885
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.303
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 885: `(CSTATE Invalid T 0 \<longrightarrow> snps1 T = []) \<and>`

**Current Conjunct**:
- Line 747: `(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i)`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 748 ← Original Lines 886
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.303
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 886: `(CSTATE Invalid T 1 \<longrightarrow> snps2 T = []) \<and>`

**Current Conjunct**:
- Line 748: `(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i)`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 749 ← Original Lines 895
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.335
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 895: `(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snps2 T = ...`

**Current Conjunct**:
- Line 749: `(\<forall>i. (CSTATE SIAC T i \<and> nextGOPending T i \<and> nextGOPendingState Invalid T i)`

**Explanation**: Single conjunct enhanced with quantifiers: device_0, hardcoded_channel → universal

---

#### Current Line 750 ← Original Lines 966, 967
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 966: `(HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) \<an...`
- Line 967: `(HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextHTDDataPending T 1) \<an...`

**Current Conjunct**:
- Line 750: `(\<forall>i. HSTATE MA T \<and> nextSnpRespIs RspIFwdM T i \<longrightarrow> \<not> nextHTDDataPendi...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 751 ← Original Lines 596
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.545
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 596: `((CSTATE Shared T 0 \<or> CSTATE Shared T 1) \<longrightarrow> \<not> HSTATE MD T) \<and>`

**Current Conjunct**:
- Line 751: `(HSTATE SB T \<longrightarrow> (\<forall>i. \<not> CSTATE MIA T i)) \<and>`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 752 ← Original Lines 969, 970
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 969: `(nextReqIs CleanEvictNoData T 0 \<longrightarrow> CSTATE SIAC T 0) \<and>`
- Line 970: `(nextReqIs CleanEvictNoData T 1 \<longrightarrow> CSTATE SIAC T 1) \<and>`

**Current Conjunct**:
- Line 752: `(\<forall>i. nextReqIs CleanEvictNoData T i \<longrightarrow> CSTATE SIAC T i) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 753 ← Original Lines 971, 972
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: other
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 971: `(nextSnpRespIs RspIHitSE T 0 \<longrightarrow> \<not> nextDTHDataFrom 0 T) \<and>`
- Line 972: `(nextSnpRespIs RspIHitSE T 1 \<longrightarrow> \<not> nextDTHDataFrom 1 T) \<and>`

**Current Conjunct**:
- Line 753: `(\<forall>i. nextSnpRespIs RspIHitSE T i \<longrightarrow> \<not> nextDTHDataFrom i T) \<and>`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 754 ← Original Lines 973, 974
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: other
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 973: `(nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextReqIs CleanEvictNoData T 0) \<and>`
- Line 974: `(nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextReqIs CleanEvictNoData T 1) \<and>`

**Current Conjunct**:
- Line 754: `(\<forall>i. nextSnpRespIs RspIFwdM T i \<longrightarrow> \<not> nextReqIs CleanEvictNoData T i) \<a...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 755 ← Original Lines 975, 976
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 975: `(CSTATE SMA T 0 \<and> nextSnoopIs SnpData T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE SAD...`
- Line 976: `(CSTATE SMA T 1 \<and> nextSnoopIs SnpData T 1 \<and> nextGOPending T 1 \<longrightarrow> HSTATE SAD...`

**Current Conjunct**:
- Line 755: `(\<forall>i. CSTATE SMA T i \<and> nextSnoopIs SnpData T i \<and> nextGOPending T i \<longrightarrow...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 756 ← Original Lines 977, 978
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 977: `((CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0) \<and> HSTATE ModifiedM T \<longrighta...`
- Line 978: `((CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1) \<and> HSTATE ModifiedM T \<longrighta...`

**Current Conjunct**:
- Line 756: `((CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0) \<and> HSTATE ModifiedM T \<longrighta...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 757 ← Original Lines 900
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.321
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 900: `(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE SB T \<longrightarrow> \<not> ...`

**Current Conjunct**:
- Line 757: `((CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1) \<and> HSTATE ModifiedM T \<longrighta...`

**Explanation**: Single conjunct transformation

---

#### Current Line 758 ← Original Lines 979
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 979: `((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> ...`

**Current Conjunct**:
- Line 758: `((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 759 ← Original Lines 980
**Consolidation Type**: 1_to_1
**Transformation**: no_change
**Pattern Type**: state_constraint
**Confidence Score**: 1.000
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 980: `((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> ...`

**Current Conjunct**:
- Line 759: `((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 760 ← Original Lines 981, 982
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 981: `((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> ...`
- Line 982: `((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> ...`

**Current Conjunct**:
- Line 760: `((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> ...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 761 ← Original Lines 994
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.387
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 994: `(CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<longrightarrow> (\<not> HSTATE SAD T \<and> \<not> ...`

**Current Conjunct**:
- Line 761: `((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 762 ← Original Lines 983, 984
**Consolidation Type**: 2_to_1
**Transformation**: multi_conjunct_consolidation
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 983: `((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> ...`
- Line 984: `((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> ...`

**Current Conjunct**:
- Line 762: `((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> ...`

**Explanation**: 2 conjuncts consolidated into single conjunct

---

#### Current Line 763 ← Original Lines 995
**Consolidation Type**: 1_to_1
**Transformation**: single_conjunct_transformation
**Pattern Type**: state_constraint
**Confidence Score**: 0.313
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 995: `(CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<longrightarrow> (\<not> HSTATE SAD T \<and> \<not> ...`

**Current Conjunct**:
- Line 763: `((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> ...`

**Explanation**: Single conjunct transformation

---

#### Current Line 764 ← Original Lines 328
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.457
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 328: `(dthdatas1 T \<noteq> [] \<and> HSTATE SD T \<longrightarrow> snpresps2 T = []) \<and>`

**Current Conjunct**:
- Line 764: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 765 ← Original Lines 329
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.456
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 329: `(dthdatas2 T \<noteq> [] \<and> HSTATE SD T \<longrightarrow> snpresps1 T = []) \<and>`

**Current Conjunct**:
- Line 765: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE SD T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, hardcoded_channel → universal

---

#### Current Line 766 ← Original Lines 989, 990
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 989: `(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> (\<not> CSTATE SIA T 1 \<or> nextGOPending...`
- Line 990: `(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPending...`

**Current Conjunct**:
- Line 766: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 767 ← Original Lines 750
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.352
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 750: `(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) \<and>`

**Current Conjunct**:
- Line 767: `(\<forall>i j. i \<noteq> j \<longrightarrow> (HSTATE ID T \<and> nextDTHDataFrom i T \<longrightarr...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 768 ← Original Lines 991, 992
**Consolidation Type**: 2_to_1
**Transformation**: hardcoded_to_quantified
**Pattern Type**: state_constraint
**Confidence Score**: 0.800
**Semantic Equivalence**: preserved

**Original Conjuncts**:
- Line 991: `(CSTATE MIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE ID T \<longrightarrow> (\<not>...`
- Line 992: `(CSTATE MIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE ID T \<longrightarrow> (\<not>...`

**Current Conjunct**:
- Line 768: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> nextGOPendingIs GO_WritePull T ...`

**Explanation**: 2 hardcoded conjuncts (device_1, device_0) consolidated using universal quantifiers

---

#### Current Line 769 ← Original Lines 793
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.305
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 793: `(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) \...`

**Current Conjunct**:
- Line 769: `(\<forall>i j. i \<noteq> j \<longrightarrow> (CSTATE MIA T i \<and> nextGOPendingIs GO_WritePull T ...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

#### Current Line 770 ← Original Lines 387
**Consolidation Type**: 1_to_1
**Transformation**: enhanced_quantification
**Pattern Type**: state_constraint
**Confidence Score**: 0.452
**Semantic Equivalence**: needs_verification

**Original Conjuncts**:
- Line 387: `(CSTATE MIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextDTHDataFrom 0 T...`

**Current Conjunct**:
- Line 770: `(\<forall>i. HSTATE SAD T \<and> nextDTHDataFrom i T \<longrightarrow> (\<forall>j. \<not> CSTATE MI...`

**Explanation**: Single conjunct enhanced with quantifiers: device_1, device_0 → universal

---

