# TransactionID简化方案：从`Utid nat`到`nat`

## 目标
将 `datatype TransactionID = Utid nat` 简化为 `type_synonym TransactionID = nat`，减少case match嵌套层数。

## 影响范围分析

### 文件修改清单

#### 1. **Transposed.thy** - 主要修改文件

##### 修改点1：类型定义（Line 86）
```isabelle
(* 原定义 *)
datatype TransactionID = Utid nat

(* 新定义 *)
type_synonym TransactionID = nat
```

**影响**：
- ✅ Message定义无需修改（仍然是`TransactionID`类型）
- ✅ 函数签名无需修改（仍然接受/返回`TransactionID`）
- ⚠️ 需要修改所有构造/解构`Utid`的地方

---

##### 修改点2：getSnpID函数（Lines 534-537）
```isabelle
(* 原定义 *)
fun getSnpID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getSnpID []  = Utid 0"
  | "getSnpID (m # ms) = getTid m"

(* 新定义 *)
fun getSnpID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getSnpID []  = 0"
  | "getSnpID (m # ms) = getTid m"
```

---

##### 修改点3：getGOID函数（Lines 540-543）
```isabelle
(* 原定义 *)
fun getGOID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getGOID []  = Utid 0"
  | "getGOID (m # ms) = getTid m"

(* 新定义 *)
fun getGOID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getGOID []  = 0"
  | "getGOID (m # ms) = getTid m"
```

---

##### 修改点4：getSnpRespID函数（Lines 547-550）
```isabelle
(* 原定义 *)
fun getSnpRespID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getSnpRespID []  = Utid 0"
  | "getSnpRespID (m # ms) = getTid m"

(* 新定义 *)
fun getSnpRespID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getSnpRespID []  = 0"
  | "getSnpRespID (m # ms) = getTid m"
```

---

##### 修改点5：getReqID函数（Lines 554-557）
```isabelle
(* 原定义 *)
fun getReqID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getReqID [] = Utid 0"
  | "getReqID (m # ms) = getTid m"

(* 新定义 *)
fun getReqID :: "Message list ⇒ TransactionID"
  where [simp]:
    "getReqID [] = 0"
  | "getReqID (m # ms) = getTid m"
```

---

##### 修改点6：sendReq函数需要检查
搜索`sendReq`定义，检查是否使用`Utid`构造tid：

```bash
grep -A 20 "definition sendReq" Transposed.thy
```

可能的形式：
```isabelle
(* 如果原来是 *)
sendReq reqtype newstate devNum T = 
  ... D2HReq (Utid (counter T)) reqtype (clock T) ...

(* 改为 *)
sendReq reqtype newstate devNum T = 
  ... D2HReq (counter T) reqtype (clock T) ...
```

---

#### 2. **BasicInvariants.thy** - 需要检查和修改

##### 修改点：case_Message相关lemmas（Line 1857+）

```isabelle
(* 原定义中有 *)
lemma nextReqIs_various_forms1: 
  "startsWithProp X (reqs1 T) 
    (case_Message 
      (\<lambda>tid reqtype t. reqtype) 
      (\<lambda>TransactionID SnpRespType nat. ReqMadeup)
      ...
    ) = (nextReqIs X T 0)"

(* 可能需要改为 *)
lemma nextReqIs_various_forms1: 
  "startsWithProp X (reqs1 T) 
    (case_Message 
      (\<lambda>tid reqtype t. reqtype) 
      (\<lambda>tid snptype t. ReqMadeup)  (* 直接用变量名，不用类型名 *)
      ...
    ) = (nextReqIs X T 0)"
```

**注意**：Lambda参数中的`TransactionID`是作为类型注解，改为`nat`后应该改为小写变量名。

---

#### 3. **其他可能使用Utid的地方**

需要全局搜索：
```bash
grep -r "Utid" betterProofAll/Common/*.thy
```

可能的模式：
1. **Pattern matching**: `case tid of Utid n ⇒ ...`
2. **Construction**: `Utid (counter T)`
3. **Comparison**: `tid = Utid 0`

---

## 完整修改步骤

### Step 1: 修改Transposed.thy

```isabelle
(* Line 86: 类型定义 *)
-datatype TransactionID = Utid nat
+type_synonym TransactionID = nat

(* Lines 536, 542, 549, 556: 修改默认值 *)
-    "getSnpID []  = Utid 0"
+    "getSnpID []  = 0"

-    "getGOID []  = Utid 0"
+    "getGOID []  = 0"

-    "getSnpRespID []  = Utid 0"
+    "getSnpRespID []  = 0"

-    "getReqID [] = Utid 0"
+    "getReqID [] = 0"
```

### Step 2: 查找并修改sendReq及相关函数

搜索模式：
```bash
grep -n "Utid" Transposed.thy
```

对于每个`Utid n`的出现：
- 如果是构造：改为`n`
- 如果是pattern match：改为直接使用nat变量

### Step 3: 修改BasicInvariants.thy

搜索pattern：
```bash
grep -n "TransactionID" BasicInvariants.thy
```

修改lambda中的类型注解为小写变量名。

### Step 4: 全局搜索验证

```bash
# 确保没有遗漏的Utid
grep -r "Utid" betterProofAll/Common/*.thy

# 确保TransactionID仍然被使用
grep -r "TransactionID" betterProofAll/Common/*.thy | wc -l
```

---

## 优点

1. **简化代码** ✅
   - 去掉`Utid`构造器/解构器
   - 减少pattern matching嵌套

2. **提高可读性** ✅
   - `let tid = 42 in ...` 比 `let tid = Utid 42 in ...` 更直观
   - `tid = 0` 比 `tid = Utid 0` 更简洁

3. **保持类型安全** ✅
   - 仍然有`TransactionID`类型名
   - 函数签名清晰表明参数是tid

4. **向后兼容** ✅
   - 函数签名不变
   - Message定义不变
   - 只需修改内部实现

---

## 可能的问题与解决

### 问题1：类型推导歧义

**场景**：
```isabelle
definition foo :: "nat ⇒ Type1State ⇒ bool" where
  "foo tid T = (tid = 0)"

definition bar :: "TransactionID ⇒ Type1State ⇒ bool" where
  "bar tid T = (tid = 0)"
```

**解决**：由于`TransactionID = nat`，这两个定义等价，不会有歧义。

---

### 问题2：现有证明可能失效

**场景**：某些lemma可能依赖`Utid`的构造器性质。

**解决**：
- 检查涉及`TransactionID`的所有lemma
- 如果证明涉及`Utid`的injectivity，改为nat的性质
- `Utid x = Utid y ⟺ x = y` 自动变为 `x = y`（更简单）

---

### 问题3：默认值约定

**原来**：`Utid 0` 作为无效/默认tid
**现在**：`0` 作为无效/默认tid

**建议**：添加一个常量定义保持语义清晰：
```isabelle
definition invalidTid :: "TransactionID" where
  "invalidTid = 0"
```

然后在代码中使用`invalidTid`而非`0`。

---

## 修改工作量估算

| 任务 | 文件数 | 行数 | 估计时间 |
|------|--------|------|----------|
| 修改Transposed.thy | 1 | ~10-15行 | 30分钟 |
| 修改BasicInvariants.thy | 1 | ~5-10行 | 20分钟 |
| 全局搜索Utid并修改 | 2-3 | ~20-30行 | 1小时 |
| 测试和验证 | - | - | 1小时 |
| **总计** | **3-4** | **35-55行** | **~3小时** |

---

## 立即行动项

### 1. 备份当前代码
```bash
cd betterProofAll/Common
git add -A
git commit -m "backup before TransactionID simplification"
```

### 2. 修改Transposed.thy
- [ ] Line 86: `datatype TransactionID` → `type_synonym TransactionID`
- [ ] Lines 536, 542, 549, 556: `Utid 0` → `0`
- [ ] 搜索并修改所有`Utid (counter T)`等构造

### 3. 修改BasicInvariants.thy
- [ ] 搜索lambda中的`TransactionID`类型注解
- [ ] 改为小写变量名

### 4. 全局验证
```bash
grep -r "Utid" *.thy  # 应该没有结果
grep -r "TransactionID" *.thy  # 确认仍在使用
```

### 5. 测试编译
```bash
isabelle build -D . 
```

---

## 推荐实施顺序

1. **先修改Transposed.thy的类型定义和4个get函数**（最安全）
2. **编译测试，看哪里报错**
3. **根据错误信息逐个修复**
4. **最后修改BasicInvariants.thy**
5. **全面测试**

这种渐进式方法可以确保每一步都是可控的。

---

*文档创建时间: 2025-10-16*
*基于: Transposed.thy, BasicInvariants.thy, grep搜索结果*
*状态: READY FOR IMPLEMENTATION*

