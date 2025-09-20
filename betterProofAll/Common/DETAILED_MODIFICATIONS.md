# SWMR_state_machine 详细修改记录

## 修改批次：Lines 351-368

### Line 351
**原始内容:**
```isabelle
(HSTATE ModifiedM T ∧ nextReqIs RdOwn T 0 → (CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1)) ∧ (HSTATE ModifiedM T ∧ nextReqIs RdOwn T 1 → (CSTATE Modified T 0 ∨ ...))
```

**原始含义:**
当主机追踪Modified状态且设备0请求RdOwn时，设备1必须是owner；设备1请求RdOwn时，设备0必须是owner。这确保了RdOwn请求时有明确的数据owner。

**修改后内容:**
```isabelle
(∀i. (HSTATE ModifiedM T ∧ nextReqIs RdOwn T i → (∃j. j ≠ i ∧ (CSTATE Modified T j ∨ CSTATE MIA T j ∨ (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ nextHTDDataPending T j ∧ nextGOPending T j ∨ (CSTATE IMA T j ∨ CSTATE SMA T j) ∧ nextGOPending T j ∨ (CSTATE IMD T j ∨ CSTATE SMD T j) ∧ nextHTDDataPending T j))))
```

**修改后含义:**
当主机追踪Modified状态且设备i请求RdOwn时，必须存在某个不同的设备j是owner。保持了原始语义：请求ownership的设备需要有明确的当前owner。

**MARKER - 发现类似语义错误**: 原始AI修改错误地要求所有其他设备都是owner，实际应该是存在一个不同的owner。

---

### Line 352
**原始内容:**
```isabelle
(HSTATE MB T ∧ nextDTHDataFrom 0 T → (CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1))
```

**原始含义:**
当主机处于MB状态且设备0发送DTHData时，设备1必须处于某种owner状态（Modified、MIA或各种transitional states with pending operations）。这确保了只有一个设备可以作为数据的owner。

**修改后内容:**
```isabelle
(∀i. (HSTATE MB T ∧ nextDTHDataFrom i T → (∃j. j ≠ i ∧ (CSTATE Modified T j ∨ CSTATE MIA T j ∨ (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ nextHTDDataPending T j ∧ nextGOPending T j ∨ (CSTATE IMA T j ∨ CSTATE SMA T j) ∧ nextGOPending T j ∨ (CSTATE IMD T j ∨ CSTATE SMD T j) ∧ nextHTDDataPending T j))))
```

**修改后含义:**
当主机处于MB状态且设备i发送DTHData时，必须存在某个不同的新owner设备j处于owner状态。保持了原始语义：老owner i发送DTHData，系统中必须有一个不同的新owner j。

**MARKER - 用户指出语义错误**: 原始AI修改错误地要求所有其他设备都是owner（∀i j. i ≠ j），实际应该是存在一个新owner（∀i. ∃j）。
**MARKER - 用户精度修正**: 需要添加j ≠ i约束，设备不能是自己的新owner。

---

### Line 353  
**原始内容:**
```isabelle
(HSTATE MB T ∧ CSTATE IIA T 0 → (CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1))
```

**原始含义:**
当主机处于MB状态且设备0处于IIA状态时，设备1必须是owner。IIA表示Invalid state with pending invalidation acknowledgment，此时需要确保有明确的数据owner。

**修改后内容:**
```isabelle
(∀i. (HSTATE MB T ∧ CSTATE IIA T i → (∃j. j ≠ i ∧ (CSTATE Modified T j ∨ CSTATE MIA T j ∨ (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ nextHTDDataPending T j ∧ nextGOPending T j ∨ (CSTATE IMA T j ∨ CSTATE SMA T j) ∧ nextGOPending T j ∨ (CSTATE IMD T j ∨ CSTATE SMD T j) ∧ nextHTDDataPending T j))))
```

**修改后含义:**
当主机处于MB状态且设备i处于IIA状态时，必须存在某个不同的设备j是owner。保持了原始语义：IIA设备等待invalidation确认，系统中必须有一个不同的owner。

**MARKER - 发现类似语义错误**: 原始AI修改错误地要求所有其他设备都是owner，实际应该是存在一个不同的owner。

---

### Line 354
**原始内容:**
```isabelle
(reqs1 T ≠ [] → reqresps1 T = []) ∧ (reqs2 T ≠ [] → reqresps2 T = [])
```

**原始含义:**
设备1有pending request时，其request response队列必须为空；设备2有pending request时，其request response队列也必须为空。这防止了request和response的并发冲突。

**修改后内容:**
```isabelle
(∀i. reqs T i ≠ [] → reqresps T i = [])
```

**修改后含义:**
对于任意设备i，如果有pending request，其request response队列必须为空。将约束推广到任意数量设备。

**人类已检查。正确**

---

### Line 355
**原始内容:**
```isabelle
(HSTATE SAD T → (CSTATE ISAD T 0 ∨ CSTATE ISAD T 1))
```

**原始含义:**
当主机处于SAD（Shared Acknowledge Data）状态时，至少有一个设备（设备0或设备1）必须处于ISAD状态。SAD表示主机在等待shared data的acknowledgment。

**修改后内容:**
```isabelle
(HSTATE SAD T → (∃i. CSTATE ISAD T i))
```

**修改后含义:**
当主机处于SAD状态时，存在至少一个设备处于ISAD状态。使用存在量词扩展到任意数量设备。

**人类已检查。正确**

---

### Line 356
**原始内容:**
```isabelle
(HSTATE ModifiedM T → ¬CSTATE Shared T 0 ∧ ¬CSTATE Shared T 1)
```

**原始含义:**
当主机追踪某个设备拥有Modified权限时，两个设备都不能处于Shared状态。这符合MESI协议的互斥性：Modified状态排斥所有其他缓存状态。

**修改后内容:**
```isabelle
(HSTATE ModifiedM T → (∀i. ¬CSTATE Shared T i))
```

**修改后含义:**
当主机追踪Modified状态时，所有设备都不能处于Shared状态。确保MESI协议在多设备环境下的正确性。

**人类已检查。正确**

---

### Line 357
**原始内容:**
```isabelle
(HSTATE SD T ∧ dthdatas1 T ≠ [] → htddatas2 T = []) ∧ (HSTATE SD T ∧ dthdatas2 T ≠ [] → htddatas1 T = [])
```

**原始含义:**
当主机处于SD状态时，如果设备1有DTH data pending，则设备2的HTD data队列必须为空，反之亦然。这防止了数据传输的冲突。

**修改后内容:**
```isabelle
(∀i. HSTATE SD T ∧ dthdatas T i ≠ [] → (∀j. j ≠ i → htddatas T j = []))
```

**修改后含义:**
当主机处于SD状态时，如果任意设备i有DTH data pending，则所有其他设备j的HTD data队列必须为空。确保数据传输的互斥性。

**人类已检查。正确**

---

### Line 358
**原始内容:**
```isabelle
(length (dthdatas1 T) ≤ 1) ∧ (length (dthdatas2 T) ≤ 1)
```

**原始含义:**
每个设备的DTH data队列长度最多为1。这确保了简单的队列管理和避免过多的pending data传输。

**修改后内容:**
```isabelle
(∀i. length (dthdatas T i) ≤ 1)
```

**修改后含义:**
每个设备的DTH data队列长度最多为1。约束推广到任意数量设备。

**正确。**

---

### Line 359
**原始内容:**
```isabelle
(HSTATE SD T ∧ nextDTHDataFrom 0 T → (CSTATE ISAD T 1 ∨ CSTATE ISD T 1)) ∧ (HSTATE SD T ∧ nextDTHDataFrom 1 T → (CSTATE ISAD T 0 ∨ CSTATE ISD T 0))
```

**原始含义:**
当主机处于SD状态且从设备0接收DTH data时，设备1必须处于ISAD或ISD状态；反之亦然。这确保了数据传输的协调性。

**修改后内容:**
```isabelle
(∀i. HSTATE SD T ∧ nextDTHDataFrom i T → (∃j. j ≠ i ∧ (CSTATE ISAD T j ∨ CSTATE ISD T j)))
```

**修改后含义:**
当主机处于SD状态且从设备i接收DTH data时，必须存在某个不同的设备j处于ISAD或ISD状态。修正了语义错误：从"所有其他设备"改为"存在某个其他设备"。

**MARKER - 用户发现语义错误**: 应该是存在一个设备j不等于i，j的状态是ISD/ISAD，不是所有别的device都这样

---

### Line 360
**原始内容:**
```isabelle
(HSTATE SA T ∧ (nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspSFwdM T 0) → CSTATE ISAD T 1 ∨ CSTATE ISA T 1) ∧ (HSTATE SA T ∧ (nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspSFwdM T 1) → CSTATE ISAD T 0 ∨ CSTATE ISA T 0)
```

**原始含义:**
当主机处于SA状态且设备0发送forward response时，设备1必须处于ISAD或ISA状态；反之亦然。这协调了snoop response的处理。

**修改后内容:**
```isabelle
(∀i. HSTATE SA T ∧ (nextSnpRespIs RspIFwdM T i ∨ nextSnpRespIs RspSFwdM T i) → (∃j. j ≠ i ∧ (CSTATE ISAD T j ∨ CSTATE ISA T j)))
```

**修改后含义:**
当主机处于SA状态且设备i发送forward response时，必须存在某个不同的设备j处于ISAD或ISA状态。

**MARKER - 发现类似语义错误**: 同Line 359，应该是存在某个其他设备，而不是所有其他设备。

---

### Line 361
**原始内容:**
```isabelle
((nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspIHitSE T 0) → CSTATE Invalid T 0 ∨ CSTATE ISDI T 0 ∨ CSTATE ISAD T 0 ∨ CSTATE IMAD T 0 ∨ CSTATE IIA T 0) ∧ ((nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspIHitSE T 1) → CSTATE Invalid T 1 ∨ CSTATE ISDI T 1 ∨ CSTATE ISAD T 1 ∨ CSTATE IMAD T 1 ∨ CSTATE IIA T 1)
```

**原始含义:**
当设备发送特定类型的snoop response时，该设备必须处于特定的invalid-family状态。这确保了snoop response与设备状态的一致性。

**修改后内容:**
```isabelle
(∀i. (nextSnpRespIs RspIFwdM T i ∨ nextSnpRespIs RspIHitSE T i) → CSTATE Invalid T i ∨ CSTATE ISDI T i ∨ CSTATE ISAD T i ∨ CSTATE IMAD T i ∨ CSTATE IIA T i)
```

**修改后含义:**
对于任意设备，当发送特定snoop response时，该设备必须处于相应的invalid-family状态。约束推广到任意数量设备。

---

### Line 362
**原始内容:**
```isabelle
(nextReqIs DirtyEvict T 0 → CSTATE MIA T 0 ∨ CSTATE SIA T 0 ∨ CSTATE IIA T 0) ∧ (nextReqIs DirtyEvict T 1 → CSTATE MIA T 1 ∨ CSTATE SIA T 1 ∨ CSTATE IIA T 1)
```

**原始含义:**
当设备发送DirtyEvict请求时，该设备必须处于MIA、SIA或IIA状态。这些都是准备evict dirty data的合法状态。

**修改后内容:**
```isabelle
(∀i. nextReqIs DirtyEvict T i → CSTATE MIA T i ∨ CSTATE SIA T i ∨ CSTATE IIA T i)
```

**修改后含义:**
对于任意设备，发送DirtyEvict请求时必须处于相应的eviction状态。约束推广到任意数量设备。

---

### Line 363
**原始内容:**
```isabelle
(snpresps1 T ≠ [] → reqresps2 T = []) ∧ (snpresps2 T ≠ [] → reqresps1 T = [])
```

**原始含义:**
当设备1有pending snoop response时，设备2的request response队列必须为空；反之亦然。这避免了不同类型response的冲突。

**修改后内容:**
```isabelle
(∀i. snpresps T i ≠ [] → (∀j. j ≠ i → reqresps T j = []))
```

**修改后含义:**
当任意设备i有pending snoop response时，其他设备j的request response队列必须为空。确保多设备间response处理的互斥性。

---

### Line 364
**原始内容:**
```isabelle
(length (snpresps1 T) ≤ 1) ∧ (length (snpresps2 T) ≤ 1)
```

**原始含义:**
每个设备的snoop response队列长度最多为1。简化队列管理并避免复杂的并发处理。

**修改后内容:**
```isabelle
(∀i. length (snpresps T i) ≤ 1)
```

**修改后含义:**
每个设备的snoop response队列长度最多为1。约束推广到任意数量设备。

---

### Line 365
**原始内容:**
```isabelle
(HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspSFwdM T 0) → CSTATE ISAD T 1) ∧ (HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 1 ∨ nextSnpRespIs RspSFwdM T 1) → CSTATE ISAD T 0)
```

**原始含义:**
当主机处于SAD状态且设备发送forward response时，其他设备必须处于ISAD状态。这确保了shared data acknowledgment期间的状态一致性。

**修改后内容:**
```isabelle
(∀i. HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T i ∨ nextSnpRespIs RspSFwdM T i) → (∃j. j ≠ i ∧ CSTATE ISAD T j))
```

**修改后含义:**
当主机处于SAD状态且设备i发送forward response时，必须存在某个不同的设备j处于ISAD状态。

**MARKER - 发现类似语义错误**: 同Lines 359, 360，应该是存在某个其他设备，而不是所有其他设备。

---

### Line 366
**原始内容:**
```isabelle
(HSTATE MAD T ∧ nextSnpRespIs RspIFwdM T 0 → (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ dthdatas1 T ≠ [] ∧ htddatas2 T = []) ∧ (HSTATE MAD T ∧ nextSnpRespIs RspIFwdM T 1 → (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ dthdatas2 T ≠ [] ∧ htddatas1 T = [])
```

**原始含义:**
当主机处于MAD状态且设备发送RspIFwdM时，其他设备必须处于IMAD/SMAD状态，且有相应的数据传输约束。MAD表示Modified Acknowledge Data状态。

**修改后内容:**
```isabelle
(∀i. HSTATE MAD T ∧ nextSnpRespIs RspIFwdM T i → (∀j. j ≠ i → (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ dthdatas T i ≠ [] ∧ htddatas T j = []))
```

**修改后含义:**
当主机处于MAD状态且设备i发送RspIFwdM时，其他设备j必须处于IMAD/SMAD状态，且有对应的数据传输约束。

---

### Line 367
**原始内容:**
```isabelle
(HSTATE MA T ∧ snpresps1 T ≠ [] → (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ htddatas2 T ≠ [] ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ htddatas2 T = []) ∧ (HSTATE MA T ∧ snpresps2 T ≠ [] → (CSTATE IMAD T 0 ∨ CSTATE SMAD T 0) ∧ htddatas1 T ≠ [] ∨ (CSTATE IMA T 0 ∨ CSTATE SMA T 0) ∧ htddatas1 T = [])
```

**原始含义:**
当主机处于MA状态且有snoop response时，其他设备的状态和HTD data必须满足特定组合：要么是IMAD/SMAD状态且有HTD data，要么是IMA/SMA状态且无HTD data。

**修改后内容:**
```isabelle
(∀i. HSTATE MA T ∧ snpresps T i ≠ [] → (∀j. j ≠ i → (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ htddatas T j ≠ [] ∨ (CSTATE IMA T j ∨ CSTATE SMA T j) ∧ htddatas T j = []))
```

**修改后含义:**
当主机处于MA状态且设备i有snoop response时，其他设备j的状态和HTD data必须满足特定组合约束。

---

### Line 368
**原始内容:**
```isabelle
(HSTATE SAD T ∧ snpresps1 T ≠ [] → htddatas2 T = []) ∧ (HSTATE SAD T ∧ snpresps2 T ≠ [] → htddatas1 T = [])
```

**原始含义:**
当主机处于SAD状态且有snoop response时，其他设备的HTD data队列必须为空。这确保了shared data acknowledgment期间的数据传输约束。

**修改后内容:**
```isabelle
(∀i. HSTATE SAD T ∧ snpresps T i ≠ [] → (∀j. j ≠ i → htddatas T j = []))
```

**修改后含义:**
当主机处于SAD状态且设备i有snoop response时，其他设备j的HTD data队列必须为空。确保多设备间的数据传输协调。

---

## Lines 384-397: 数据传输互斥与状态协调约束

### Line 384
**原始内容:**
```isabelle
(HSTATE SAD T ∧ nextDTHDataFrom 0 T → reqs2 T = []) ∧
(HSTATE SAD T ∧ nextDTHDataFrom 1 T → reqs1 T = [])
```
**原始含义:**
当主机处于SAD状态且设备0发送DTHData时，设备1的请求队列必须为空；当设备1发送DTHData时，设备0的请求队列必须为空。这是针对同一缓存事务中的两个设备的约束。

**修改后内容:**
```isabelle
(∀i. HSTATE SAD T ∧ nextDTHDataFrom i T → (∃j. j ≠ i ∧ reqs T j = []))
```
**修改后含义:**
当主机处于SAD状态且设备i发送DTHData时，必须存在某个其他设备j（同一缓存事务中）的请求队列为空。保持了原始语义：只有同一事务中的设备才需要满足约束，第三方设备可以独立发送请求。

**MARKER - 用户语义纠正**: 原始AI修改错误地要求所有其他设备都满足约束（∀i j. i ≠ j），实际应该是存在性约束（∀i. ∃j），因为只有同一缓存事务中的设备才需要协调。

### Line 385
**原始内容:**
```isabelle
(HSTATE SD T ∧ nextDTHDataFrom 0 T → reqs2 T = []) ∧
(HSTATE SD T ∧ nextDTHDataFrom 1 T → reqs1 T = [])
```
**原始含义:**
当主机处于SD状态且某设备发送DTHData时，另一设备的请求队列必须为空。确保共享数据传输期间的互斥性。

**修改后内容:**
```isabelle
(∀i. HSTATE SD T ∧ nextDTHDataFrom i T → (∀j. j ≠ i → reqs T j = []))
```
**修改后含义:**
当主机处于SD状态且设备i发送DTHData时，所有其他设备j的请求队列都必须为空。保持了共享数据传输的互斥性。

### Line 386
**原始内容:**
```isabelle
(HSTATE SharedM T ∧ nextReqIs RdOwn T 0 → dthdatas2 T = []) ∧
(HSTATE SharedM T ∧ nextReqIs RdOwn T 1 → dthdatas1 T = [])
```
**原始含义:**
当主机处于SharedM状态且某设备发送RdOwn请求时，另一设备的DTHData队列必须为空。确保所有权获取期间数据传输的清洁性。

**修改后内容:**
```isabelle
(∀i. HSTATE SharedM T ∧ nextReqIs RdOwn T i → (∀j. j ≠ i → dthdatas T j = []))
```
**修改后含义:**
当主机处于SharedM状态且设备i发送RdOwn请求时，所有其他设备j的DTHData队列都必须为空。保持了所有权获取的清洁性。

### Line 387
**原始内容:**
```isabelle
(HSTATE SharedM T ∧ nextReqIs RdShared T 0 → dthdatas2 T = []) ∧
(HSTATE SharedM T ∧ nextReqIs RdShared T 1 → dthdatas1 T = [])
```
**原始含义:**
当主机处于SharedM状态且某设备发送RdShared请求时，另一设备的DTHData队列必须为空。确保共享读取期间数据传输的一致性。

**修改后内容:**
```isabelle
(∀i. HSTATE SharedM T ∧ nextReqIs RdShared T i → (∀j. j ≠ i → dthdatas T j = []))
```
**修改后含义:**
当主机处于SharedM状态且设备i发送RdShared请求时，所有其他设备j的DTHData队列都必须为空。保持了共享读取的数据一致性。

### Line 388
**原始内容:**
```isabelle
(CSTATE IIA T 0 ∧ HSTATE ModifiedM T → CSTATE Modified T 1 ∨ CSTATE MIA T 1 ∨ (CSTATE IMAD T 1 ∨ CSTATE SMAD T 1) ∧ nextHTDDataPending T 1 ∧ nextGOPending T 1 ∨ (CSTATE IMA T 1 ∨ CSTATE SMA T 1) ∧ nextGOPending T 1 ∨ (CSTATE IMD T 1 ∨ CSTATE SMD T 1) ∧ nextHTDDataPending T 1) ∧
(CSTATE IIA T 1 ∧ HSTATE ModifiedM T → CSTATE Modified T 0 ∨ CSTATE MIA T 0 ∨ ...)
```
**原始含义:**
当设备0处于IIA状态且主机处于ModifiedM状态时，设备1必须是owner；当设备1处于IIA状态时，设备0必须是owner。确保系统中有明确的数据owner。

**修改后内容:**
```isabelle
(∀i. CSTATE IIA T i ∧ HSTATE ModifiedM T → (∃j. j ≠ i ∧ (CSTATE Modified T j ∨ CSTATE MIA T j ∨ (CSTATE IMAD T j ∨ CSTATE SMAD T j) ∧ nextHTDDataPending T j ∧ nextGOPending T j ∨ (CSTATE IMA T j ∨ CSTATE SMA T j) ∧ nextGOPending T j ∨ (CSTATE IMD T j ∨ CSTATE SMD T j) ∧ nextHTDDataPending T j)))
```
**修改后含义:**
当设备i处于IIA状态且主机处于ModifiedM状态时，必须存在某个其他设备j作为owner。保持了owner存在性的语义。

### Line 389
**原始内容:**
```isabelle
(CSTATE IIA T 0 ∧ HSTATE SharedM T → reqs2 T = [] ∨ nextReqIs CleanEvict T 1 ∨ nextReqIs CleanEvictNoData T 1 ∨ nextReqIs RdOwn T 1) ∧
(CSTATE IIA T 1 ∧ HSTATE SharedM T → reqs1 T = [] ∨ nextReqIs CleanEvict T 0 ∨ nextReqIs CleanEvictNoData T 0 ∨ nextReqIs RdOwn T 0)
```
**原始含义:**
当某设备处于IIA状态且主机处于SharedM状态时，另一设备的请求队列要么为空，要么只能发送特定类型的请求（CleanEvict、CleanEvictNoData或RdOwn）。这是针对同一共享事务中的设备约束。

**修改后内容:**
```isabelle
(∀i. CSTATE IIA T i ∧ HSTATE SharedM T → (∃j. j ≠ i ∧ (reqs T j = [] ∨ nextReqIs CleanEvict T j ∨ nextReqIs CleanEvictNoData T j ∨ nextReqIs RdOwn T j)))
```
**修改后含义:**
当设备i处于IIA状态且主机处于SharedM状态时，必须存在某个其他设备j（同一共享事务中）满足请求类型限制。保持了原始语义：只有同一事务中的设备才需要满足约束，第三方设备可以独立操作。

**MARKER - 用户语义纠正**: 原始AI修改错误地要求所有其他设备都满足约束（∀i j. i ≠ j），实际应该是存在性约束（∀i. ∃j），因为只有同一共享事务中的设备才需要协调请求类型。

### Line 390
**原始内容:**
```isabelle
(CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 → HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T) ∧
(CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 → HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T)
```
**原始含义:**
当任一设备处于IIA状态且有GO_WritePull待处理时，主机必须处于特定状态（IB、SB或MB）。

**修改后内容:**
```isabelle
(∀i. CSTATE IIA T i ∧ nextGOPendingIs GO_WritePull T i → HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T)
```
**修改后含义:**
当任意设备i处于IIA状态且有GO_WritePull待处理时，主机必须处于相应状态。保持了主机状态约束。

### Line 391
**原始内容:**
```isabelle
(CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePullDrop T 0 → HSTATE SharedM T ∨ HSTATE InvalidM T ∨ HSTATE ModifiedM T ∨ HSTATE SB T ∨ HSTATE ID T) ∧
(CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePullDrop T 1 → HSTATE SharedM T ∨ HSTATE InvalidM T ∨ HSTATE ModifiedM T ∨ HSTATE SB T ∨ HSTATE ID T)
```
**原始含义:**
当任一设备处于IIA状态且有GO_WritePullDrop待处理时，主机必须处于特定状态集合中。

**修改后内容:**
```isabelle
(∀i. CSTATE IIA T i ∧ nextGOPendingIs GO_WritePullDrop T i → HSTATE SharedM T ∨ HSTATE InvalidM T ∨ HSTATE ModifiedM T ∨ HSTATE SB T ∨ HSTATE ID T)
```
**修改后含义:**
当任意设备i处于IIA状态且有GO_WritePullDrop待处理时，主机必须处于允许的状态集合中。保持了状态约束。

### Line 392
**原始内容:**
```isabelle
(CSTATE IMAD T 0 ∧ nextHTDDataPending T 0 → HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
(CSTATE IMAD T 1 ∧ nextHTDDataPending T 1 → HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T)
```
**原始含义:**
当任一设备处于IMAD状态且有HTDData待处理时，主机必须处于特定状态（ModifiedM、MA、MAD或SAD）。

**修改后内容:**
```isabelle
(∀i. CSTATE IMAD T i ∧ nextHTDDataPending T i → HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T)
```
**修改后含义:**
当任意设备i处于IMAD状态且有HTDData待处理时，主机必须处于相应状态。保持了主机-设备状态协调。

### Line 393
**原始内容:**
```isabelle
(CSTATE IIA T 0 ∧ HSTATE SharedM T → CSTATE Shared T 1 ∨ CSTATE SIA T 1 ∨ CSTATE SMAD T 1 ∨ CSTATE ISAD T 1 ∧ nextGOPending T 1 ∧ nextHTDDataPending T 1 ∨ CSTATE ISA T 1 ∧ nextGOPending T 1 ∨ CSTATE ISD T 1 ∧ nextHTDDataPending T 1 ∨ CSTATE SIAC T 1) ∧
(CSTATE IIA T 1 ∧ HSTATE SharedM T → CSTATE Shared T 0 ∨ ...)
```
**原始含义:**
当设备0处于IIA状态且主机处于SharedM状态时，设备1必须处于某种共享相关状态；反之亦然。确保共享状态的一致性。

**修改后内容:**
```isabelle
(∀i. CSTATE IIA T i ∧ HSTATE SharedM T → (∃j. j ≠ i ∧ (CSTATE Shared T j ∨ CSTATE SIA T j ∨ CSTATE SMAD T j ∨ CSTATE ISAD T j ∧ nextGOPending T j ∧ nextHTDDataPending T j ∨ CSTATE ISA T j ∧ nextGOPending T j ∨ CSTATE ISD T j ∧ nextHTDDataPending T j ∨ CSTATE SIAC T j)))
```
**修改后含义:**
当设备i处于IIA状态且主机处于SharedM状态时，必须存在某个其他设备j处于共享相关状态。保持了共享状态的存在性。

### Line 394
**原始内容:**
```isabelle
(HSTATE SharedM T → dthdatas1 T = [] ∧ dthdatas2 T = [])
```
**原始含义:**
当主机处于SharedM状态时，两个设备的DTHData队列都必须为空。这是一个全局性质。

**修改后内容:**
```isabelle
(HSTATE SharedM T → (∀i. dthdatas T i = []))
```
**修改后含义:**
当主机处于SharedM状态时，所有设备的DTHData队列都必须为空。保持了共享状态下数据传输的清洁性。

**MARKER - 用户确认**: 这是全局互斥约束，正确使用∀i模式。

### Line 395
**原始内容:**
```isabelle
(CSTATE MIA T 1 → ¬CSTATE MIA T 0) ∧
(CSTATE MIA T 0 → ¬CSTATE MIA T 1)
```
**原始含义:**
设备0和设备1不能同时处于MIA状态，确保MIA状态的互斥性。这是一个类SWMR的全局性质。

**修改后内容:**
```isabelle
(∀i. CSTATE MIA T i → (∀j. j ≠ i → ¬CSTATE MIA T j))
```
**修改后含义:**
任意两个不同设备不能同时处于MIA状态。保持了MIA状态在整个系统中的互斥性。

**MARKER - 用户确认**: 这是全局互斥约束，正确使用∀i j. i ≠ j模式。

### Line 396
**原始内容:**
```isabelle
(HSTATE ModifiedM T → dthdatas2 T = [] ∧ dthdatas1 T = [])
```
**原始含义:**
当主机处于ModifiedM状态时，两个设备的DTHData队列都必须为空。这是一个全局性质。

**修改后内容:**
```isabelle
(HSTATE ModifiedM T → (∀i. dthdatas T i = []))
```
**修改后含义:**
当主机处于ModifiedM状态时，所有设备的DTHData队列都必须为空。保持了修改状态下数据传输的清洁性。

**MARKER - 用户确认**: 这是全局互斥约束，正确使用∀i模式。

### Line 397
**原始内容:**
```isabelle
(HSTATE MA T → dthdatas2 T = [] ∧ dthdatas1 T = [])
```
**原始含义:**
当主机处于MA状态时，两个设备的DTHData队列都必须为空。这是一个全局性质。

**修改后内容:**
```isabelle
(HSTATE MA T → (∀i. dthdatas T i = []))
```
**修改后含义:**
当主机处于MA状态时，所有设备的DTHData队列都必须为空。保持了MA状态下数据传输的清洁性。

**MARKER - 用户确认**: 这是全局互斥约束，正确使用∀i模式。

---

## Lines 398-409: 数据传输互斥与状态协调约束 (第二批)

### Line 398
**原始内容:**
```isabelle
(nextDTHDataFrom 0 T → ¬nextHTDDataPending T 0) ∧
(nextDTHDataFrom 1 T → ¬nextHTDDataPending T 1)
```
**原始含义:**
设备不能同时发送和接收数据。这是每个设备内部的约束。

**修改后内容:**
```isabelle
(∀i. nextDTHDataFrom i T → ¬nextHTDDataPending T i)
```
**修改后含义:**
任意设备i不能同时发送DTHData和等待HTDData。保持了设备内部数据传输的互斥性。

### Line 399
**原始内容:**
```isabelle
(nextDTHDataFrom 0 T → ¬nextDTHDataFrom 1 T) ∧
(nextDTHDataFrom 1 T → ¬nextDTHDataFrom 0 T)
```
**原始含义:**
两个设备不能同时发送DTHData，确保数据传输的全局互斥性。

**修改后内容:**
```isabelle
(∀i. nextDTHDataFrom i T → (∀j. j ≠ i → ¬nextDTHDataFrom j T))
```
**修改后含义:**
对于任意设备i，如果i发送DTHData，则任意其他设备j≠i都不能发送DTHData。保持了全局数据传输互斥性，使用嵌套量词的清晰表述。

**MARKER - 用户语义斟酌**: 用户建议使用"若i发送了dthdata，则任意j neq i都必须不能dthdata"的表述方式，比原来的双重量词嵌套更直观。

**MARKER - 用户优化尝试**: 用户尝试去掉对i的量化以减少嵌套，但Isabelle要求所有变量都必须被量化，因此回到嵌套量词版本。

### Line 400
**原始内容:**
```isabelle
(HSTATE SA T → dthdatas2 T = [] ∧ dthdatas1 T = [])
```
**原始含义:**
当主机处于SA状态时，所有设备的DTHData队列都必须为空。这是全局约束。

**修改后内容:**
```isabelle
(HSTATE SA T → (∀i. dthdatas T i = []))
```
**修改后含义:**
当主机处于SA状态时，所有设备的DTHData队列都必须为空。保持了SA状态下的全局清洁性。

### Line 401
**原始内容:**
```isabelle
(HSTATE SD T → ¬CSTATE IIA T 0 ∨ ¬CSTATE IIA T 1)
```
**原始含义:**
当主机处于SD状态时，至少有一个设备不能处于IIA状态。

**修改后内容:**
```isabelle
(HSTATE SD T → (∃i. ¬CSTATE IIA T i))
```
**修改后含义:**
当主机处于SD状态时，必须存在至少一个设备不处于IIA状态。保持了原始的存在性约束。

### Line 402
**原始内容:**
```isabelle
(HSTATE SAD T → (¬CSTATE IIA T 0 ∨ nextSnpRespIs RspIFwdM T 0) ∧ (¬CSTATE IIA T 1 ∨ nextSnpRespIs RspIFwdM T 1))
```
**原始含义:**
当主机处于SAD状态时，每个设备要么不是IIA状态，要么有RspIFwdM响应。这是对所有设备的全局约束。

**修改后内容:**
```isabelle
(HSTATE SAD T → (∀i. ¬CSTATE IIA T i ∨ nextSnpRespIs RspIFwdM T i))
```
**修改后含义:**
当主机处于SAD状态时，所有设备都必须满足：要么不是IIA状态，要么有RspIFwdM响应。保持了全局约束。

### Line 403
**原始内容:**
```isabelle
(CSTATE IIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 → ¬nextDTHDataFrom 1 T) ∧
(CSTATE IIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 → ¬nextDTHDataFrom 0 T)
```
**原始含义:**
当某设备处于IIA状态且有GO_WritePull待处理时，另一设备不能发送DTHData。

**修改后内容:**
```isabelle
(∀i. CSTATE IIA T i ∧ nextGOPendingIs GO_WritePull T i → (∀j. j ≠ i → ¬nextDTHDataFrom j T))
```
**修改后含义:**
当设备i处于IIA状态且有GO_WritePull待处理时，所有其他设备j都不能发送DTHData。保持了数据传输的互斥性。

### Line 404
**原始内容:**
```isabelle
(CSTATE IIA T 0 → ¬CSTATE IIA T 1) ∧
(CSTATE IIA T 1 → ¬CSTATE IIA T 0)
```
**原始含义:**
两个设备不能同时处于IIA状态，确保IIA状态的全局互斥性。

**修改后内容:**
```isabelle
(¬(∀i. CSTATE IIA T i))
```
**修改后含义:**
不是所有设备都可以同时处于IIA状态，即至少有一个设备不处于IIA状态。这比严格的互斥性更宽松，允许多个（但不是全部）设备同时处于IIA状态。

**MARKER - 用户语义纠正**: 用户指出当设备数量多于2个时，原来的严格互斥约束过于严格。正确的语义应该是"不是所有设备都可以同时持有IIA"，而不是"只有一个设备可以是IIA"。

### Line 405
**原始内容:**
```isabelle
(CSTATE MIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 → ¬nextDTHDataFrom 1 T) ∧
(CSTATE MIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 → ¬nextDTHDataFrom 0 T)
```
**原始含义:**
当某设备处于MIA状态且有GO_WritePull待处理时，另一设备不能发送DTHData。

**修改后内容:**
```isabelle
(∀i. CSTATE MIA T i ∧ nextGOPendingIs GO_WritePull T i → (∀j. j ≠ i → ¬nextDTHDataFrom j T))
```
**修改后含义:**
当设备i处于MIA状态且有GO_WritePull待处理时，所有其他设备j都不能发送DTHData。保持了数据传输的互斥性。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：正确                                                        │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 406
**原始内容:**
```isabelle
(snpresps1 T ≠ [] → reqresps1 T = []) ∧
(snpresps2 T ≠ [] → reqresps2 T = [])
```
**原始含义:**
当设备有待处理的snoop响应时，其请求响应队列必须为空。这是每个设备内部的约束。

**修改后内容:**
```isabelle
(∀i. snpresps T i ≠ [] → reqresps T i = [])
```
**修改后含义:**
当任意设备i有待处理的snoop响应时，其请求响应队列必须为空。保持了设备内部队列的互斥性。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：正确                                                        │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 407
**原始内容:**
```isabelle
(HSTATE SharedM T ∧ nextReqIs RdShared T 1 → ¬nextGOPendingIs GO_WritePull T 0) ∧
(HSTATE SharedM T ∧ nextReqIs RdShared T 0 → ¬nextGOPendingIs GO_WritePull T 1)
```
**原始含义:**
在SharedM状态下，当某设备请求RdShared时，另一设备不能有GO_WritePull待处理。

**修改后内容:**
```isabelle
(HSTATE SharedM T → (∀i. ¬nextGOPendingIs GO_WritePull T i))
```
**修改后含义:**
在SharedM状态下，任何设备都不可以有GO_WritePull待处理。简化为全局约束，避免了复杂的多设备语义问题。

**MARKER - 用户语义纠正**: 原始语义在多设备环境下难以准确表达，用户建议简化为全局约束并标记SPECIAL TODO需要双重检查。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：语义不对。两设备时语义为：当设备处于SharedM，并且0设备发   │
│ RdShared，说明0是刚刚从Invalid尝试上升到shared,那么另一个必定处于Shared，不可能  │
│ evict而且还被host知道了--host知道了就绝不是SharedM状态了。                      │
│ 我不知道多设备状态下怎么做到完全等价的表述。可能直接这么写试试：                 │
│ 若host处于SharedM状态，则任何设备都不可以有GO_WritePull 在（直接略去RdShared相关）。│
│ 但记得在注释帮我标记一个SPECIAL TODO: double check                             │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 408
**原始内容:**
```isabelle
(HSTATE SD T ∧ nextDTHDataFrom 1 T → ¬nextGOPendingIs GO_WritePull T 0) ∧
(HSTATE SD T ∧ nextDTHDataFrom 0 T → ¬nextGOPendingIs GO_WritePull T 1)
```
**原始含义:**
在SD状态下，当某设备发送DTHData时，另一设备不能有GO_WritePull待处理。

**修改后内容:**
```isabelle
(∀i. HSTATE SD T ∧ nextDTHDataFrom i T → (∀j. j ≠ i → ¬nextGOPendingIs GO_WritePull T j))
```
**修改后含义:**
在SD状态下，当设备i发送DTHData时，所有其他设备j都不能有GO_WritePull待处理。保持了数据传输与写入拉取的互斥性。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：意思应该没问题，但我prefer这样的描述：                      │
│ 对任意i，HSTATE SD T AND nextdthdatafrom i T -->则对任意j \neq i 都满足 not    │
│ nextGOPENDINGIS GO_WRITEPULL T j                                               │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 409
**原始内容:**
```isabelle
(HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T 0 ∨ nextSnpRespIs RspSFwdM T 0) → ¬nextGOPendingIs GO_WritePull T 1)
```
**原始含义:**
在SAD状态下，当设备0有转发响应时，设备1不能有GO_WritePull待处理。

**修改后内容:**
```isabelle
(∀i. HSTATE SAD T ∧ (nextSnpRespIs RspIFwdM T i ∨ nextSnpRespIs RspSFwdM T i) → (∀j. j ≠ i → ¬nextGOPendingIs GO_WritePull T j))
```
**修改后含义:**
在SAD状态下，当设备i有转发响应时，所有其他设备j都不能有GO_WritePull待处理。保持了转发响应与写入拉取的互斥性。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：正确，但同408，建议修改逻辑表达方式。                      │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 410
**原始内容:**
```isabelle
(HSTATE ModifiedM T → ¬nextGOPendingIs GO_WritePull T 0 ∧ ¬nextGOPendingIs GO_WritePull T 1)
```
**原始含义:**
当主机处于ModifiedM状态时，两个设备都不能有GO_WritePull待处理。

**修改后内容:**
```isabelle
(HSTATE ModifiedM T → (∀i. ¬nextGOPendingIs GO_WritePull T i))
```
**修改后含义:**
当主机处于ModifiedM状态时，所有设备都不能有GO_WritePull待处理。这是一个全局约束。

### Line 413 (修正)
**原始内容:**
```isabelle
(CSTATE SIA T 0 → snps2 T = [] ∧ snpresps2 T = [] ∧ htddatas1 T = []) ∧
(CSTATE SIA T 1 → snps1 T = [] ∧ snpresps1 T = [] ∧ htddatas2 T = [])
```
**原始含义:**
当设备0处于SIA状态时，设备1的snoop和snoop响应为空，设备0的htddatas为空；当设备1处于SIA状态时，设备0的snoop和snoop响应为空，设备1的htddatas为空。

**修改后内容:**
```isabelle
(∀i. CSTATE SIA T i → htddatas T i = [] ∧ (∃j. j ≠ i ∧ snps T j = [] ∧ snpresps T j = []))
```
**修改后含义:**
当设备i处于SIA状态时，设备i的htddatas为空，且存在某个其他设备j的snoop和snoop响应为空。

**MARKER - 用户语义纠正**: 原始约束依赖于二设备互斥性，在多设备环境下第三方设备可能触发snoops，因此修正为存在性约束。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：原conjunct依赖于二设备互斥性：逻辑是，若设备0处于SIA状态，  │
│ 则其正在发起一缓存弹出事务，不可能还同时发动一会导致snoop/snoopresponse的事务--这 │
│ 类事务通常会发生在一设备获取而不是放弃某些状态时，例如RdShared/RdOwn，而唯一可能  │
│ 触发设备1的snoop的设备就只有0.当有多余设备时，，有可能别的设备会发送请求，使得1 │
│ 被snoop。例如设备3发送RdOwn，导致0和1同时被snoop。这种时候snps T j = [] ∧      │
│ snpresps T j = []  就不再成立了。htddatas T i = []依旧成立。所以新修改（最贴近  │
│ 原本语义）应当为：                                                              │
│ 对任意i设备，若其状态为SIA，则它自己的htddatas列表为空。并且，存在一j，使得设备j │
│ 满足如下性质：snpresps T j 和snps T j都为空。                                  │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 415
**原始内容:**
```isabelle
(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 → HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T) ∧
(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 → HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T)
```
**原始含义:**
当任一设备处于SIA状态且有GO_WritePull待处理时，主机必须处于特定状态。

**修改后内容:**
```isabelle
(∀i. CSTATE SIA T i ∧ nextGOPendingIs GO_WritePull T i → HSTATE IB T ∨ HSTATE SB T ∨ HSTATE MB T)
```
**修改后含义:**
当任意设备i处于SIA状态且有GO_WritePull待处理时，主机必须处于特定状态。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：正确                                                        │
└─────────────────────────────────────────────────────────────────────────────────┘

### Line 417 (修正)
**原始内容:**
```isabelle
(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePull T 0 → ¬nextDTHDataFrom 1 T) ∧
(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePull T 1 → ¬nextDTHDataFrom 0 T)
```
**原始含义:**
当设备0处于SIA状态且有GO_WritePull待处理时，设备1不能发送DTHData；当设备1处于SIA状态且有GO_WritePull待处理时，设备0不能发送DTHData。

**修改后内容:**
```isabelle
(∀i. CSTATE SIA T i ∧ nextGOPendingIs GO_WritePull T i → (∀j. j ≠ i → ¬nextDTHDataFrom j T))
```
**修改后含义:**
当设备i处于SIA状态且有GO_WritePull待处理时，所有其他设备j都不能发送DTHData。这表达了Host正在处理的事务的互斥性：若Host在处理设备i的事务（发GO_WritePull去抽取正在evict的设备），则不应该同时处理其他设备j的事务（接收来自j的DTHData）。

**MARKER - 用户语义纠正**: 需要使用存在性约束而不是全称约束，参考前面弱约束修改模式。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：不对，需要重新改，参考前面弱约束修改（存在j neq i而不是所有）│
└─────────────────────────────────────────────────────────────────────────────────┘
检查：我再次思考了此处含义，其实表达的是被Host正在处理的事务的互斥性，不是弱约束。你的前一版本是对的。即，若Host在处理i的事务（发GO_WritePull去抽取一个正在evict的设备），则不应该也在同时处理j的事务（接收来自j的DTHData）。但我这里有疑问了：到底是
\forall i.  cstate sia T i \and nextgopendingis go_writepull T i --> (\forall j. j \neq i --> \not nextdthdatafrom j T)
比较好，还是
\forall i j. i \neq j -->  (cstate sia T i \and nextgopendingis go_writepull T i --> (\not nextdthdatafrom j T))
比较好？按照复杂程度，两个都有两层量词嵌套（\forall i j 等价于 \forall i. \forall j），但第二个略短。第一个跟第二个是等价的。第一个更符合我的思维方式，但前面所有地方都已经改成第二种方式了，我担心两者之间的转换会对后续证明造成麻烦。可否把之前你已经改过的所有符合第二种方式模式的formula改回第一种？

**MARKER - 用户最终决定**: 采用第一种模式 `(∀i. ... → (∀j. j ≠ i → ...))` 以保持思维一致性，并要求将之前所有第二种模式改回第一种。

### Line 421
**原始内容:**
```isabelle
(CSTATE SIA T 0 ∧ nextGOPendingIs GO_WritePullDrop T 0 → HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T ∨ HSTATE IB T ∨ HSTATE ModifiedM T ∨ HSTATE ID T) ∧
(CSTATE SIA T 1 ∧ nextGOPendingIs GO_WritePullDrop T 1 → HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T ∨ HSTATE IB T ∨ HSTATE ModifiedM T ∨ HSTATE ID T)
```
**原始含义:**
当任一设备处于SIA状态且有GO_WritePullDrop待处理时，主机必须处于特定状态。

**修改后内容:**
```isabelle
(∀i. CSTATE SIA T i ∧ nextGOPendingIs GO_WritePullDrop T i → HSTATE InvalidM T ∨ HSTATE SharedM T ∨ HSTATE SB T ∨ HSTATE IB T ∨ HSTATE ModifiedM T ∨ HSTATE ID T)
```
**修改后含义:**
当任意设备i处于SIA状态且有GO_WritePullDrop待处理时，主机必须处于特定状态（应该在后续进一步细化）。

┌─────────────────────────────────────────────────────────────────────────────────┐
│ 【用户检查笔记】检查：正确                                                        │
└─────────────────────────────────────────────────────────────────────────────────┘

---

## 总结

这些约束的修改体现了以下主要模式：

1. **单设备约束** → **全设备约束**: 使用 `∀i` 模式
2. **双设备互斥** → **多设备互斥**: 使用 `∀i. ... → (∀j. j ≠ i → ...)` 模式  
3. **存在性约束**: 使用 `∃i` 代替具体设备编号
4. **跨设备状态协调**: 确保一个设备的状态变化对其他设备的约束
5. **数据传输互斥**: 确保不同设备间的数据传输不冲突

所有修改都保持了原有约束的语义意图，只是将2设备的硬编码扩展到任意数量设备。用户的详细检查笔记帮助识别和修正了多个重要的语义问题，确保了多设备扩展的正确性。

---

## Lines 423-434: SMAD/IMAD/ISAD状态约束

### Line 423
**原始内容:**
```isabelle
(CSTATE SMAD T 0 ∧ nextHTDDataPending T 0 → HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
```
**原始含义:**
当设备0处于SMAD状态且有HTDData待处理时，主机必须处于特定状态（ModifiedM、MA、MAD或SAD）。

**修改后内容:**
```isabelle
(∀i. CSTATE SMAD T i ∧ nextHTDDataPending T i → HSTATE ModifiedM T ∨ HSTATE MA T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
```
**修改后含义:**
当任意设备i处于SMAD状态且有HTDData待处理时，主机必须处于特定状态。确保主机状态与设备SMAD状态的协调。

### Line 424
**原始内容:**
```isabelle
(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 → HSTATE SharedM T ∨ HSTATE SA T ∨ HSTATE MA T ∨ HSTATE SB T) ∧
(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 → HSTATE SharedM T ∨ HSTATE SA T ∨ HSTATE MA T ∨ HSTATE SB T) ∧
```
**原始含义:**
当任一设备处于ISAD状态且有HTDData待处理时，主机必须处于特定状态。SharedM表示GO已在传输中，SA表示GO尚未发送，MA表示其他设备正尝试获取Modified权限。

**修改后内容:**
```isabelle
(∀i. CSTATE ISAD T i ∧ nextHTDDataPending T i → HSTATE SharedM T ∨ HSTATE SA T ∨ HSTATE MA T ∨ HSTATE SB T) ∧
```
**修改后含义:**
当任意设备i处于ISAD状态且有HTDData待处理时，主机必须处于相应状态。保持了主机-设备状态协调。

### Line 425
**原始内容:**
```isabelle
(CSTATE ISAD T 0 ∧ nextHTDDataPending T 0 → ¬(CSTATE IMAD T 1 ∧ nextHTDDataPending T 1)) ∧
(CSTATE ISAD T 1 ∧ nextHTDDataPending T 1 → ¬(CSTATE IMAD T 0 ∧ nextHTDDataPending T 0)) ∧
```
**原始含义:**
ISAD和IMAD状态且都有HTDData待处理时不能共存，确保状态转换的互斥性。

**修改后内容:**
```isabelle
(∀i. CSTATE ISAD T i ∧ nextHTDDataPending T i → (∀j. j ≠ i → ¬(CSTATE IMAD T j ∧ nextHTDDataPending T j))) ∧
```
**修改后含义:**
当设备i处于ISAD状态且有HTDData待处理时，所有其他设备j不能同时处于IMAD状态且有HTDData待处理。保持了状态互斥性。

### Line 427
**原始内容:**
```isabelle
(CSTATE IMAD T 0 ∧ nextGOPending T 0 → HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
```
**原始含义:**
当设备0处于IMAD状态且有GO待处理时，主机必须处于特定状态。

**修改后内容:**
```isabelle
(∀i. CSTATE IMAD T i ∧ nextGOPending T i → HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
```
**修改后含义:**
当任意设备i处于IMAD状态且有GO待处理时，主机必须处于相应状态。

### Line 428
**原始内容:**
```isabelle
(CSTATE IMAD T 0 → nextStore T 0) ∧ (CSTATE IMAD T 1 → nextStore T 1) ∧
```
**原始含义:**
处于IMAD状态的设备必须有待处理的store操作。

**修改后内容:**
```isabelle
(∀i. CSTATE IMAD T i → nextStore T i) ∧
```
**修改后含义:**
任意处于IMAD状态的设备i必须有待处理的store操作。确保IMAD状态的语义一致性。

### Line 429
**原始内容:**
```isabelle
(CSTATE IMAD T 0 ∧ nextGOPending T 0 → snps2 T = [] ∧ snpresps2 T = []) ∧
(CSTATE IMAD T 1 ∧ nextGOPending T 1 → snps1 T = [] ∧ snpresps1 T = []) ∧
```
**原始含义:**
当设备处于IMAD状态且有GO待处理时，其他设备的snoop和snoop响应队列必须为空。

**修改后内容:**
```isabelle
(∀i. CSTATE IMAD T i ∧ nextGOPending T i → (∀j. j ≠ i → snps T j = [] ∧ snpresps T j = [])) ∧
```
**修改后含义:**
当设备i处于IMAD状态且有GO待处理时，所有其他设备j的snoop和snoop响应队列必须为空。

### Line 430
**原始内容:**
```isabelle
(snpresps1 T ≠ [] → reqresps1 T = []) ∧ (snpresps2 T ≠ [] → reqresps2 T = []) ∧
```
**原始含义:**
设备有snoop响应时，其请求响应队列必须为空。这是设备内部的队列互斥约束。

**修改后内容:**
```isabelle
(∀i. snpresps T i ≠ [] → reqresps T i = []) ∧
```
**修改后含义:**
任意设备i有snoop响应时，其请求响应队列必须为空。保持了设备内部队列的互斥性。

### Line 431
**原始内容:**
```isabelle
(CSTATE SMAD T 0 ∧ nextGOPending T 0 → HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
(CSTATE SMAD T 1 ∧ nextGOPending T 1 → HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
```
**原始含义:**
当任一设备处于SMAD状态且有GO待处理时，主机必须处于特定状态。

**修改后内容:**
```isabelle
(∀i. CSTATE SMAD T i ∧ nextGOPending T i → HSTATE MD T ∨ HSTATE ModifiedM T ∨ HSTATE MAD T ∨ HSTATE SAD T) ∧
```
**修改后含义:**
当任意设备i处于SMAD状态且有GO待处理时，主机必须处于相应状态。

### Line 432
**原始内容:**
```isabelle
(CSTATE SMAD T 0 → nextStore T 0) ∧ (CSTATE SMAD T 1 → nextStore T 1) ∧
```
**原始含义:**
处于SMAD状态的设备必须有待处理的store操作。

**修改后内容:**
```isabelle
(∀i. CSTATE SMAD T i → nextStore T i) ∧
```
**修改后含义:**
任意处于SMAD状态的设备i必须有待处理的store操作。确保SMAD状态的语义一致性。

### Line 434
**原始内容:**
```isabelle
(CSTATE IMA T 0 ∨ CSTATE SMA T 0 ∨ CSTATE ISA T 0 → ¬nextHTDDataPending T 0) ∧
(CSTATE IMA T 1 ∨ CSTATE SMA T 1 ∨ CSTATE ISA T 1 → ¬nextHTDDataPending T 1) ∧
```
**原始含义:**
处于IMA、SMA或ISA状态的设备不能有HTDData待处理。

**修改后内容:**
```isabelle
(∀i. CSTATE IMA T i ∨ CSTATE SMA T i ∨ CSTATE ISA T i → ¬nextHTDDataPending T i) ∧
```
**修改后含义:**
任意处于IMA、SMA或ISA状态的设备i不能有HTDData待处理。确保这些状态下数据传输的正确性。

---

## 总结

这批约束主要涉及SMAD、IMAD、ISAD等transitional states的协调约束，体现了以下模式：

1. **主机-设备状态协调**: 设备的特定状态要求主机处于相应状态
2. **设备内部约束**: 设备状态与其内部操作的一致性（如store操作）
3. **跨设备互斥**: 某些状态组合在多设备间不能共存
4. **队列互斥**: 不同类型的消息队列之间的互斥约束

所有修改都保持了原有约束的语义意图，将2设备的硬编码扩展到任意数量设备，确保了缓存一致性协议在多设备环境下的正确性。