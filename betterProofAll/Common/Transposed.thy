theory Transposed imports "Main"   
begin
(*
Enforcing CXL's snoop-pushes-GO rule (faithfully) is not straightforward:
A. It shouldn't be expressed at the Host side as "the host must not send
a snoop if a GO has been sent but not consumed" because i)this is not realistic as 
in CXL there's no 'GO-ack' messages ii)The SPG rule is enforced at the interconnect level, not host, it
would be inaccurate to do it at host level.

B. It shouldn't be expressed at the device side as "the device must block snoop messages on seeing a GO message
with an earlier timestamp" because again, CXL guarantees this ordering at the interconnect leve, it shouldn't expose
the device to such a "racing" situation

In summary, this seem to suggest a "message to process" buffer between a device and a cxl link. 
The device always picks the next message to process from the buffer, and there's some arbitration logic
in CXL.cache link that picks a message from the channels. An SPG restriction is enforced at the arbitration logic.

But this brings a new problem: where there are multiple messages in both H2DReq and H2DResp channels,  
[req1, req2, ..., Snp, ...]
[resp1, resp2, ..., GO,...]
neither Snoop nor GO are at the front of the message queues, the arbitration logic cannot have any say
on how the Snoop or GO is allowed to travel. It is only until the arbitration unit starts to pick
the Snoop will it check whether there is an earlier GO in the response channel.
In other words, whether CXL puts a message into the end of its channel (the message buffer)
depends on all the content in another message queue.
This is almost certainly not how the interconnect is implemented, but nevertheless expresses the SPG rule
in a reasonably precise way.
*)






























datatype MESI_State = Modified | Exclusive | Shared | Invalid | 
                      ISD      | ISA       | ISAD   | ISDI    | 
                      IMAD     | IMA       | IMD    |
                      IMAS     | IMASI     | IMAI   | 
                      MIA     | 
                      IIAD     | IIA       | IID    |
                      SMAD     | SMA       | SMD    |
                      SIAD     | SIA       | SID    | SIAC

datatype HOST_State = ModifiedM | ExclusiveM | SharedM | InvalidM |
                      SAD      | SD        | SA     | ID      |     




                      MAD      | MA        | MD     |
                      ESAD     | ESA       | ESD    |
                      EMAD     | EMA       | EMD    |
                      MB       | SB        | IB
(* MEM_M    | MEM_S     | MEM_E  | MEM_I*)
                      


datatype DeviceID = Dev1 | Dev2 


(*TODO: Change all Utid to Tid?*)
type_synonym TransactionID =  int



record CLEntry = 
  content :: "int option"
  block_state :: MESI_State

record HostEntry = 
  content :: "int option"
  block_state :: "HOST_State"




(*Alternative of using tuples, waiting to be seen which is better*)
(*
type_synonym Cluster_State_Table = "DeviceID \<Rightarrow> MESI_State "
text \<open>the name cl_state_mapping seems quite un-friendly for first time readers*)


(*
record HostCLMap = 
  cl_content_mapping  :: "int"
  cl_state_mapping    :: " Cluster_State_Table"

*)

datatype Instruction = 
      Write      int  
    | Read       int 
    | Evict  
    


(*a sequence of events one cluster issues, a sequence of events another cluster issues
read event v.s. load
cluster  issue messages *)
type_synonym Program = "DeviceID \<Rightarrow> Instruction list"


datatype ReqType = RdShared | RdOwn | RdOwnNoData | RdAny | RdCurr | CleanEvict | DirtyEvict | CleanEvictNoData | 
  ItoMWrite | WrCur | CLFlush | CacheFlushed | WOWrInv | WOWrInvF | WrInv | ReqMadeup

datatype SnoopType = SnpInv | SnpData | SnpCur | SnpMadeup

datatype SnpRespType = RspIHitI | RspIHitSE |RspSHitSE | RspVHitV | RspIFwdM  | RspVFwdV  | RspSFwdM | SnpRespMadeup

datatype ReqRespType = GO | GO_WritePull | GO_WritePullDrop | WritePull | 
    GO_Err | FastGO_WritePull | GO_Err_WritePull | ExtCmp | ReqRespMadeup


datatype  Message = 
    D2HReq   TransactionID ReqType  nat
  | D2HResp  TransactionID SnpRespType  nat
  | D2HData  TransactionID int  nat
  | H2DReq   TransactionID SnoopType  nat
  | H2DResp  TransactionID ReqRespType  MESI_State nat
  | H2DData  TransactionID int  nat


type_synonym  Messages = "DeviceID \<Rightarrow>  Message list"



(* definition update_snoops :: "Snoops \<Rightarrow> Snoop \<Rightarrow> Snoops" where: "update_sn*)


(*dispose of trackers*)


record  Type1State = 
  hostcache         ::  HostEntry
  devcaches         :: "nat \<Rightarrow> CLEntry" 
  reqs              :: "nat \<Rightarrow> Message list"
  snpresps          :: "nat \<Rightarrow> Message list"
  dthdatas          :: "nat \<Rightarrow> Message list"
  snps              :: "nat \<Rightarrow> Message list"
  reqresps          :: "nat \<Rightarrow> Message list"
  htddatas          :: "nat \<Rightarrow> Message list"
  programs          :: "nat \<Rightarrow> Instruction list"
  counter           :: int
  clock             :: nat
  buffers            :: "nat \<Rightarrow> Message option"














definition config_differ_host_mapping_value :: "Type1State  \<Rightarrow> int   \<Rightarrow> Type1State"
 (" _ [    =hv _]" [100, 0] 101)
 where [simp]: "\<Sigma> [  =hv v] =
    \<Sigma> \<lparr> hostcache := (hostcache \<Sigma>) \<lparr>HostEntry.content := (Some v) \<rparr> \<rparr> "

definition config_differ_dev_mapping :: "Type1State \<Rightarrow> nat \<Rightarrow>   MESI_State   \<Rightarrow> Type1State"
 (" _ [ _ =dm _]" [100, 0] 101)
 where [simp]: "\<Sigma> [dv =dm mesi] = (\<Sigma> \<lparr> devcaches := ((devcaches \<Sigma>)(dv := ((devcaches \<Sigma> dv) \<lparr>CLEntry.block_state  := mesi\<rparr> ))) \<rparr>)"


fun nat_to_id :: "nat \<Rightarrow> DeviceID" where [simp]:
  "nat_to_id 0 = Dev1"
| "nat_to_id _ = Dev2"

fun read_from_cache :: "int option \<Rightarrow> int" where [simp]:
  "read_from_cache None = 0"
| "read_from_cache (Some v) = v"

definition "ERROR_VAL = (-9999::int)"

definition extractValFromMessage :: "Message \<Rightarrow> int option " where [simp]:
  "extractValFromMessage m = (case m of H2DData tid v time \<Rightarrow> Some v | _ \<Rightarrow> Some ERROR_VAL)"


(*inspect what's the data value inside first message of the HTDData channel of device devNum*)
definition nextHTDDataValue :: "Type1State \<Rightarrow> nat \<Rightarrow>  int option"
  where [simp]:
  "nextHTDDataValue T devNum = ( (case (htddatas T devNum ) of [] \<Rightarrow> None 
                                           | (headData # tailData) \<Rightarrow> extractValFromMessage headData)  ) "

definition device_copy_in_data :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State" 
  ("_ [ _ :=dd _]" [100] 101)
  where [simp]: "T [ devNum :=dd msg] = (let v' = extractValFromMessage msg in 
              T \<lparr> devcaches :=  (devcaches T) ( devNum := (devcaches T devNum) \<lparr>CLEntry.content := v' \<rparr> ) \<rparr> 
)"


(*perform a memory access for device devNum, does not check state is valid for operation (for ISDI like states) 
TODO 20240219: Bug: Read for register 1 does not remove current instruction.
definition device_perform_op :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State" 
  ("_ [ :=i _]" [100] 101) where [simp]:
  "T [ :=i devNum] = (
          let v = read_from_cache (CLEntry.content ((devcaches T devNum) )) in
            (case ((programs T devNum) ) of [] \<Rightarrow> T 
                                      | Read  regNum # tlI \<Rightarrow> ( if regNum = 0 then T \<lparr>registers11 := v \<rparr> else T \<lparr>registers12 := v \<rparr> \<lparr> program1 := tlI \<rparr> )                                                                      
                                      | Write  v' # tlI \<Rightarrow> (T \<lparr>devcache1 := ( (devcache1 T)  \<lparr>CLEntry.content := Some v'\<rparr>)\<rparr> \<lparr> program1 := tlI \<rparr>)
                                      | Evict  # tlI \<Rightarrow> (T \<lparr>devcache1 := ((devcache1 T)  \<lparr>CLEntry.block_state := Invalid \<rparr>) \<rparr> \<lparr> program1 := tlI \<rparr>)
                     ) 
)"

 *)




definition device_delete_op :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State" 
  ("_ [ -=i _]" [100] 101) where [simp]:
  "T [ -=i devNum] = ( 
     (case ((programs T devNum) ) of [] \<Rightarrow> T | Instr # tlI \<Rightarrow> ( T \<lparr> programs := (programs T) (devNum := tlI) \<rparr> )) 
  )"


(*update device/host cache state, 0 represents device 1, 1 represents device 2, others stands for host *)
definition change_state :: "Type1State \<Rightarrow> nat \<Rightarrow> MESI_State \<Rightarrow> Type1State"
  (" _ [ _ s= _]"  [100, 0] 101)
 where [simp]: "\<Sigma> [dv s= mesi] = (\<Sigma> \<lparr> devcaches := ((devcaches \<Sigma>)(dv := ((devcaches \<Sigma> dv) \<lparr>CLEntry.block_state  := mesi\<rparr> ))) \<rparr>)"



(*update host cache state, 0 represents device 1, 1 represents device 2, others stands for host *)
definition change_host_state :: "Type1State \<Rightarrow> nat \<Rightarrow> HOST_State \<Rightarrow> Type1State"
  (" _ [ _ sHost= _]" [100, 0] 101)
  where [simp]: "T [i sHost= host_state] = ( T \<lparr>hostcache := (hostcache T) \<lparr> HostEntry.block_state := host_state\<rparr> \<rparr>)"



definition increment_counter :: "Type1State \<Rightarrow> Type1State"
  ("_ ++c" [100] 101)
  where [simp]: "T++c = T \<lparr>counter := counter T + 1 \<rparr>"
(*
definition config_differ_dev_entry :: "Type1State \<Rightarrow> DeviceID   \<Rightarrow> CLEntry \<Rightarrow> Type1State"
 (" _ [ _  =dmentry _]" [100, 0] 101)
 where "\<Sigma> [cl =dmentry entry] = 
    \<Sigma> \<lparr> devclmap := update_dev_cl_map_with_entry cl co block entry (devclmap \<Sigma>) \<rparr>"
*)


(*Change for JustEventsMode from NonAtomic: For every +=d2hreq operation (@ [msg]), record it in "issuedEvents"*)
definition config_differ_dthreq :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ +=d2hreq _]" [100, 0] 101)
  where [simp]: " \<Sigma>  [dev_i +=d2hreq msg] = 
    (( \<Sigma> \<lparr>reqs := (reqs \<Sigma>) (dev_i := (reqs \<Sigma> dev_i) @ [msg]) \<rparr> )) "

(*
definition config_differ_dthreq' :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ -=d2hreq _]" [100, 0] 101)
  where " \<Sigma>  [dev_i -=d2hreq msg] = 
    ( \<Sigma> \<lparr>reqs := ((reqs \<Sigma>) 
      (dev_i :=  (case (reqs \<Sigma>) dev_i of [] \<Rightarrow> [] 
                                          | msg' # tail \<Rightarrow> (if (Req.transaction_id msg = Req.transaction_id msg') then tail 
                                                                                                    else msg' # tail) )  )) \<rparr> ) "
*)
(*
definition addToIssuedEvents :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ +=issued _]" [100, 0] 101)
  where " \<Sigma>  [dev_i +=issued msg] = 
    ( \<Sigma> \<lparr>issuedEvents := ((issuedEvents \<Sigma>) 
      (dev_i :=  ( msg # (reqs \<Sigma>) dev_i   ))) \<rparr> ) "

*)


(* TODO: TransactionID needs to be given rather than arbitrary number, return T originally if i not equal to 0 or 1? *) 
definition prepend_d2hreq :: "Type1State \<Rightarrow> nat \<Rightarrow> ReqType \<Rightarrow> Type1State"
  ("_ [ _ +=rdreq _]" [100, 0] 101)
  where [simp]:  "T [i +=rdreq rdtype] = ( let sentMsg = D2HReq (counter T) rdtype (clock T) in 
                                  T [i +=d2hreq sentMsg]++c 
                                 )"

(*send snoop from dev_i, snoop message already composed*)
definition config_differ_htdreq :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ +=h2dreq _]" [100, 0] 101)
  where [simp]: " \<Sigma>  [dev_i +=h2dreq msg] = 
    \<Sigma>\<lparr> snps := (snps \<Sigma>)(dev_i := (snps \<Sigma> dev_i) @ [msg]) \<rparr>"

(*consume snoop from host, snoop's transaction id needs to match
definition config_differ_htdreq' :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Snoop \<Rightarrow> Type1State"
  ("_ [ _ -=h2dreq _]" [100, 0] 101)
  where " \<Sigma>  [dev_i -=h2dreq msg] = 
    ( \<Sigma> \<lparr>snoops := ((snoops \<Sigma>) 
      (dev_i :=  (case (snoops \<Sigma>) dev_i of [] \<Rightarrow> [] 
                                          | msg' # tail \<Rightarrow> (if (Snoop.transaction_id msg = Snoop.transaction_id msg') then tail 
                                                                                                    else msg' # tail) )  )) \<rparr> ) "
(Unused at the moment
*)


fun getHTDDataOrMakeup :: "Type1State \<Rightarrow> nat \<Rightarrow> Message" where
  "getHTDDataOrMakeup T i = ( case ((htddatas T) i) of [] \<Rightarrow> H2DData (-1) ERROR_VAL   999999 | mhead # tail \<Rightarrow> mhead )"

fun getSnoopOrMakeup :: "Message list \<Rightarrow> Message" where
    "getSnoopOrMakeup [] = H2DReq (-1) SnpMadeup  99999999"
  | "getSnoopOrMakeup (snp # snplist) = snp"

(*recordsnoop: given a snoop message and a device id, record it into the snoopsReceived buffer inside the type 1 device
fun recordSnoop :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State" ("_ [ _ +=recordSnp _]" [100, 0] 101) where
  "T [devid +=recordSnp snpmsg] = (T \<lparr>snoopsReceived := (snoopsReceived T) (devid := snpmsg # (snoopsReceived T) devid) \<rparr>)"
*)


(*TODO: Current only removes head message, but for empty queue return the same queue, maybe an option monad?
also if not always removing head need to re-write,
record the snoop consumed into the "snoopsReceived" queue*)
definition consume_snoop :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State"
  (" _ [_ -=snp ]" [100, 0] 101) where [simp]:
  "\<Sigma> [devNum -=snp] =
    \<Sigma>\<lparr> snps := (snps \<Sigma>)
       (devNum := (case snps \<Sigma> devNum of
                     [] \<Rightarrow> []
                   | _ # tail \<Rightarrow> tail))
     \<rparr>"


definition config_differ_dthresp :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ +=d2hres _]" [100, 0] 101)
where
  "\<Sigma> [dev_i +=d2hres msg] =
    \<Sigma>\<lparr> snpresps := (snpresps \<Sigma>)
         (dev_i := (snpresps \<Sigma> dev_i) @ [msg]) \<rparr>"


(*
definition config_differ_dthresp' :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ -=d2hres _]" [100, 0] 101)
  where [simp]: " \<Sigma>  [dev_i -=d2hres msg] = 
    ( \<Sigma> \<lparr>snpresps := ((snpresps \<Sigma>) 
      (dev_i :=  (case (snpresps \<Sigma>) dev_i of [] \<Rightarrow> [] 
                                          | msg' # tail \<Rightarrow> (if (SnpResp.transaction_id msg = SnpResp.transaction_id msg') then tail 
                                                                                                    else msg' # tail) )  )) \<rparr> ) "
*)

(*
definition recordReqResponse :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State" 
  ("_ [ _ +=respDGot _]" [100, 0] 101)
where [simp]: " T  [dev_i +=respDGot msg] = (let devId = nat_to_id dev_i in 
          T \<lparr> respDevReceived := ((respDevReceived T) (devId := (msg # ((respDevReceived T) devId ) ))) \<rparr> )"

*)

(*Host sends response to requestor devNum, with the provided resptype, mesi state to be granted, and transactionid.
this response is also recorded in the respDevReceived queue (via the +=respDGot operator)*)
definition host_sends_response :: "Type1State \<Rightarrow> nat \<Rightarrow> ReqRespType \<Rightarrow> MESI_State \<Rightarrow> TransactionID \<Rightarrow> Type1State" 
  ("_ [ _ +=reqresp _ _ _]" [100, 0] 101)
  where [simp]: "T [devNum +=reqresp resptype mesi tid] = ( let resmsg = 
            H2DResp tid resptype  mesi  (clock T) in 
            (T \<lparr>reqresps := (reqresps T) (devNum := (reqresps T devNum)  @ [resmsg]) \<rparr> ))"
(*
definition recordSnpResponse :: "Type1State  \<Rightarrow> Message \<Rightarrow> Type1State" 
  ("_ [  +=snprespHGot _]" [100, 0] 101)
where " T  [ +=snprespHGot msg] = (  
          T \<lparr> snprespReceived := (msg # (snprespReceived T) ) \<rparr> )"
Not needed as snprespReceived field is abolished
*)

definition consume_snoopresp :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State"
  ("_ [ _ -=snpresp ]" [100, 0] 101)
where
  "T [i -=snpresp] =
    T\<lparr> snpresps := (snpresps T)
         (i := (case snpresps T i of
                  []       \<Rightarrow> []
                | _ # tail \<Rightarrow> tail))
     \<rparr>"


definition send_snoop_response :: 
  "Type1State \<Rightarrow> nat \<Rightarrow> SnpRespType \<Rightarrow> TransactionID \<Rightarrow> Type1State"
  (" _ [_ +=snpresp _ _]" [100, 0] 101)
where
  "T [i +=snpresp snprsptype txid] =
      T [i +=d2hres D2HResp txid snprsptype (clock T)]"


definition send_snoop :: "Type1State \<Rightarrow> nat \<Rightarrow> SnoopType \<Rightarrow> TransactionID \<Rightarrow> Type1State"
  ("_ [ _ +=snp _ _] "  [100, 0] 101)
  where [simp]: "T [i +=snp snptype txid] = ( T [ i +=h2dreq H2DReq txid snptype  ( clock T ) ])"




(*
definition config_differ_htdresp' :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ -=h2dres _]" [100, 0] 101)
  where " \<Sigma>  [dev_i -=h2dres msg] = 
    ( \<Sigma> \<lparr>reqresps := ((reqresps \<Sigma>) 
      (dev_i :=  (case (reqresps \<Sigma>) dev_i of [] \<Rightarrow> [] 
                                          | msg' # tail \<Rightarrow> (if (ReqResp.transaction_id msg = ReqResp.transaction_id msg') then tail 
                                                                                                    else msg' # tail) )  )) \<rparr> ) "
*)




definition config_differ_dthdata :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ +=d2hd _]" [100, 0] 101)
where
  "\<Sigma> [dev_i +=d2hd msg] =
    \<Sigma>\<lparr> dthdatas := (dthdatas \<Sigma>)
         (dev_i := (dthdatas \<Sigma> dev_i) @ [msg]) \<rparr>"

(*
definition config_differ_dthdata' :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ -=d2hd _]" [100, 0] 101)
  where " \<Sigma>  [dev_i -=d2hd msg] = 
    ( \<Sigma> \<lparr>dthdatas := ((dthdatas \<Sigma>)
        (dev_i := (case (dthdatas \<Sigma>) dev_i of [] \<Rightarrow> [] 
                                          | msg' # tail \<Rightarrow> (if (DTHData.transaction_id msg = DTHData.transaction_id msg') then tail 
                                                                                                    else msg' # tail) )  )) \<rparr> ) "
*)

definition config_differ_dthdata'' :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State"
  ("_ [ _ -=d2hdHead ]" [100, 0] 101)
where
  "\<Sigma> [dev_i -=d2hdHead ] =
    \<Sigma>\<lparr> dthdatas := (dthdatas \<Sigma>)
         (dev_i := (case dthdatas \<Sigma> dev_i of
                      []       \<Rightarrow> []
                    | _ # tail \<Rightarrow> tail))
     \<rparr>"
      
(*TODONEW: make sure no such 1/2 error occurs in anywhere*)
definition config_differ_htddata :: "Type1State \<Rightarrow> nat \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ +=h2dd _]" [100, 0] 101)
  where [simp]: " \<Sigma>  [dev_i +=h2dd msg] = (
    ( \<Sigma> \<lparr>htddatas := (htddatas \<Sigma>) (dev_i := ((htddatas \<Sigma> dev_i)  @ [msg] )) \<rparr> )  ) "

definition send_htddata :: "Type1State \<Rightarrow> nat \<Rightarrow> TransactionID \<Rightarrow> Type1State"
  ("_ [ _ +=hostdata  _]" [100, 0] 101) where [simp]:
  "T  [devNum +=hostdata tid] = T [ devNum +=h2dd 
    H2DData tid  (read_from_cache (HostEntry.content (hostcache T)))  (clock T)]"

(*
definition config_differ_htddata' :: "Type1State \<Rightarrow> DeviceID \<Rightarrow> Message \<Rightarrow> Type1State"
  ("_ [ _ -=h2dd _]" [100, 0] 101)
  where " \<Sigma>  [dev_i -=h2dd msg] = 
    ( \<Sigma> \<lparr>htddatas := ((htddatas \<Sigma>) 
        (dev_i := (case (htddatas \<Sigma>) dev_i of [] \<Rightarrow> [] 
                                          | msg' # tail \<Rightarrow> (if (HTDData.transaction_id msg = HTDData.transaction_id msg') then tail 
                                                                                                    else msg' # tail) )  )) \<rparr> ) "
*)


definition CACHE_TRANS::nat where "CACHE_TRANS =  100"



definition CSTATE :: "MESI_State \<Rightarrow> Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "CSTATE st T n =  (CLEntry.block_state ((devcaches T) n ) = st)"


fun startsLoad :: "Instruction list \<Rightarrow> bool"
  where [simp]: 
    "startsLoad [] = False"
  | "startsLoad (Read  y # tail) = True"
  | "startsLoad (other  # tail) = False"



fun startsStore :: "Instruction list \<Rightarrow> bool"
  where [simp]: 
    "startsStore [] = False"
  | "startsStore (Write  y # tail) = True"
  | "startsStore (other  # tail) = False"

fun startsEvict :: "Instruction list \<Rightarrow> bool" where [simp]:
    "startsEvict [] = False"
  | "startsEvict (Evict  # tail) = True"
  | "startsEvict other = False"

definition getSnoopType :: "Message \<Rightarrow> SnoopType" where [simp]:
  "getSnoopType msg = (case msg of H2DReq tid snptype t \<Rightarrow> snptype)"

definition getTid :: "Message \<Rightarrow> TransactionID" where [simp]:
  "getTid msg = (case msg of H2DReq tid snptype  t \<Rightarrow> tid
                              |   H2DResp txid reqresptype  mesi t \<Rightarrow> txid
                              |   D2HResp txid reqresptype  t  \<Rightarrow> txid
                              |   D2HReq  txid reqtype  t \<Rightarrow> txid
                              |   D2HData txid v  t \<Rightarrow> txid
                              |   H2DData txid v  t \<Rightarrow> txid

)"

definition getTime :: "Message \<Rightarrow> nat" where [simp]:
  "getTime msg = (case msg of H2DReq txid snptype   t \<Rightarrow> t
                              |   H2DResp txid reqresptype   mesi t \<Rightarrow> t
                              |   D2HResp txid reqresptype   t  \<Rightarrow> t
                              |   D2HReq  txid reqtype   t \<Rightarrow> t
                              |   D2HData txid v   t \<Rightarrow> t
                              |   H2DData txid v   t \<Rightarrow> t

)"


fun startsSnp :: "Message list \<Rightarrow> SnoopType \<Rightarrow> bool"
  where [simp]:
    "startsSnp [] snp = False"
  | "startsSnp (req # tail) snp = (getSnoopType req = snp)"

(*TODO: After adding reorderings this function needs to accpet a single Snoop, or Snoop list plus a location *)
fun getSnpID :: "Message list \<Rightarrow> TransactionID"
  where [simp]:
    "getSnpID []  = (-1)"
  | "getSnpID (req # tail)  = getTid req"


fun getGOID :: "Message list \<Rightarrow> TransactionID"
  where [simp]:
    "getGOID []  = (-1)"
  | "getGOID (req # tail)  = getTid req"



fun getSnpRespID :: "Message list \<Rightarrow> TransactionID"
  where [simp]:
    "getSnpRespID []  = (-1)"
  | "getSnpRespID (req # tail)  = getTid req"

(*TODO: the first clause should in theory never be executed, better implementaion would return TransactionID option. May
need an assertion *)
fun getReqID :: "Message list \<Rightarrow> TransactionID "
  where [simp]:
    "getReqID [] = (-1)"
  | "getReqID (req # tail) = getTid req"


definition nextLoad :: "Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextLoad T devNum = (startsLoad ((programs T) devNum ))"

definition nextStore :: "Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextStore T devNum = (startsStore ((programs T) devNum))"


definition nextSnoopIs :: "SnoopType \<Rightarrow> Type1State \<Rightarrow> nat  \<Rightarrow> bool"
  where [simp]:
  "nextSnoopIs snp T devNum  = (startsSnp ((snps T) devNum) snp)"


definition getSnoopTypeOption :: "Message option \<Rightarrow> SnoopType" where [simp]:
  "getSnoopTypeOption msg = (case msg of Some (H2DReq tid snptype  t) \<Rightarrow> snptype
                                      |   None \<Rightarrow> SnpMadeup)"


definition nextBufferSnoopIs :: "SnoopType \<Rightarrow> Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextBufferSnoopIs snpt T i = (getSnoopTypeOption ((buffers T) i ) = snpt) "


(*get tid from head of the snoops channel messages*)
definition nextSnoopID :: "Type1State \<Rightarrow> nat \<Rightarrow> TransactionID"
  where [simp]:
  "nextSnoopID T devNum  = (getSnpID ((snps T) devNum) )"


(*get snoop message from head of the snoops channel messages, if channel empty, make up one
should not be called when snoop channel is empty*)
definition nextSnoop :: "Type1State \<Rightarrow> nat \<Rightarrow> Message"
  where [simp]:
  "nextSnoop T devNum  = (case ((snps T) devNum) of [] \<Rightarrow> H2DReq (-1) SnpMadeup  999 
                                                    | (snoop # tail) \<Rightarrow> snoop)"

(*get reqresp (h2dresp) message from head of the snoops channel messages, if channel empty, make up one
should not be called when snoop channel is empty*)
definition nextGO :: "Type1State \<Rightarrow> nat \<Rightarrow> Message"
  where [simp]:
  "nextGO T devNum  = ( case ((reqresps T) devNum ) of [] \<Rightarrow> H2DResp (-1) ReqRespMadeup   Invalid 999
                                                    | (snoop # tail) \<Rightarrow> snoop )"


(*get tid from head of the snoops channel messages*)
definition nextGOID :: "Type1State \<Rightarrow> nat \<Rightarrow> TransactionID"
  where [simp]:
  "nextGOID T devNum  = (getGOID ((reqresps T) devNum))"


(*get tid from head of the snoopresps channel messages*)
definition nextSnoopRespID :: "Type1State \<Rightarrow> nat \<Rightarrow> TransactionID"
  where [simp]:
  "nextSnoopRespID T devNum  = ( getSnpRespID ((snpresps T) devNum))"


(*get tid from head of the reqs channel messages*)
definition nextReqID :: "Type1State \<Rightarrow> nat \<Rightarrow> TransactionID" where [simp]:
  "nextReqID T devNum = (getReqID ((reqs T) devNum))"


definition HOST_DEVNUM:: "nat" where [simp]: "HOST_DEVNUM = 2"


(*OFFSET for device number denoting host, for example,
an offset = 3 means there are 3 devices(device 0, 1, 2), and then the host (device 3)*)
definition OFFSET :: "nat" where "OFFSET = 5"



definition getSpecificTypeReqResp :: "Message \<Rightarrow> ReqRespType" where [simp]:
  "getSpecificTypeReqResp msg = (case msg of  H2DResp tid reqresptype   mesi t \<Rightarrow> reqresptype | other \<Rightarrow> ReqRespMadeup
)"

(*
returns invalid when not of H2DResp type, which should be corrected to return a bogus state in the future
*)

definition getGrantedState :: "Message \<Rightarrow> MESI_State" where [simp]:
  "getGrantedState msg = (case msg of  H2DResp tid reqresptype   mesi t \<Rightarrow> mesi | other \<Rightarrow> Invalid
)"

definition getSpecificTypeReq :: "Message \<Rightarrow> ReqType" where [simp]:
  "getSpecificTypeReq msg = (case msg of D2HReq  tid reqtype   t \<Rightarrow> reqtype | other \<Rightarrow> ReqMadeup 

)"
definition getSpecificTypeSnoop :: "Message \<Rightarrow> SnoopType" where [simp]:
  "getSpecificTypeSnoop msg = (case msg of H2DReq tid snptype   t \<Rightarrow> snptype | other \<Rightarrow> SnpMadeup
)"

definition getSpecificTypeSnpResp :: "Message \<Rightarrow> SnpRespType" where [simp]:
  "getSpecificTypeSnpResp msg = (case msg of D2HResp tid reqresptype   t  \<Rightarrow> reqresptype | other \<Rightarrow> SnpRespMadeup
)"

definition getSpecificValD2H :: "Message \<Rightarrow> int" where [simp]:
  "getSpecificValD2H msg = (case msg of D2HData tid v  t \<Rightarrow> v | other \<Rightarrow> -1
)"

definition getSpecificValH2D :: "Message \<Rightarrow> int" where [simp]:
  "getSpecificValH2D msg = (case msg of H2DData tid v   t \<Rightarrow> v | other \<Rightarrow> -1
)"

(*Test that the head of list of D2HResp is of type tp *)
fun nextReqRespIs :: "ReqRespType \<Rightarrow> Message list \<Rightarrow> bool" where [simp]:
  "nextReqRespIs tp [] = False"
| "nextReqRespIs tp (respHead # respTail) = (getSpecificTypeReqResp respHead = tp)"

(*

*)
fun nextReqRespStateIs :: "MESI_State \<Rightarrow> Message list \<Rightarrow> bool" where [simp]:
  "nextReqRespStateIs mesi [] = False"
| "nextReqRespStateIs mesi (respHead # respTail) = (getGrantedState respHead = mesi)"


fun startsWithProp :: "'a \<Rightarrow> 'b list \<Rightarrow> ('b \<Rightarrow> 'a) \<Rightarrow> bool" where [simp]:
  "startsWithProp tp [] f = False"
| "startsWithProp tp (bhead # btail) f = (f bhead = tp)" 

definition startsWithReq :: "ReqType \<Rightarrow> Message list \<Rightarrow> bool" where [simp]:
  "startsWithReq reqtype reqlist = startsWithProp reqtype reqlist (\<lambda>req. getSpecificTypeReq req)"

definition startsWithSnpResp :: "SnpRespType \<Rightarrow> Message list \<Rightarrow> bool" where [simp]:
  "startsWithSnpResp snprespt snpresplist = startsWithProp snprespt snpresplist (\<lambda>resp. getSpecificTypeSnpResp resp)"

definition nextEvict :: "Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextEvict T devNum = (startsEvict ( (programs T) devNum) )"

(*next pending reqresp is  GO*)
definition nextGOPending :: "Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextGOPending T devNum = (nextReqRespIs GO ((reqresps T) devNum))" 

(*next pending reqresp is reqrespt type*)
definition nextGOPendingIs :: "ReqRespType \<Rightarrow> Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextGOPendingIs reqrespt T devNum = (nextReqRespIs reqrespt ( (reqresps T) devNum) )"


definition nextHTDDataPending :: "Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextHTDDataPending T devNum = (((htddatas T) devNum)  \<noteq> []) "


definition nextSnpRespPending :: "Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextSnpRespPending T devNum =  ((snpresps T) devNum  \<noteq> []) "


definition DirM :: "Type1State \<Rightarrow> bool"
  where [simp]:
  "DirM T = ( \<exists>i. (CSTATE Modified T i) \<and> (\<forall>j. j \<noteq> i \<longrightarrow> CSTATE Invalid T j) )" \<comment>\<open>Original: ( ((CSTATE Modified T 0 ) \<and> (CSTATE Invalid T 1)) \<or> ((CSTATE Modified T 1) \<and> (CSTATE Invalid T 0)) ) - exactly one device is Modified and all others are Invalid\<close>

definition DirI :: "Type1State \<Rightarrow> bool"
  where [simp]:
  "DirI T =  ( \<exists>i. ((CSTATE Invalid T i) \<or> (CSTATE IMAD T i) \<or> (CSTATE ISAD T i)) \<and> (\<forall>j. j \<noteq> i \<longrightarrow> CSTATE Invalid T j) )" \<comment>\<open>Original: ( (  ((CSTATE Invalid T 0 ) \<or> (CSTATE IMAD T 0) \<or> (CSTATE ISAD T 0)  ) \<and> (CSTATE Invalid T 1)) \<or> ((CSTATE Invalid T 0) \<and> (CSTATE Invalid T 1 \<or> CSTATE IMAD T 1 \<or> CSTATE ISAD T 1))    ) - exactly one device is Invalid/IMAD/ISAD and all others are Invalid\<close>

definition HSTATE :: "HOST_State \<Rightarrow> Type1State \<Rightarrow> bool" where [simp]:
  "HSTATE st T =  (block_state (hostcache T) = st)"



definition nextReqIs :: "ReqType \<Rightarrow> Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextReqIs reqt T devNum = (startsWithReq reqt ((reqs T) devNum )  )"


definition nextSnpRespIs :: "SnpRespType \<Rightarrow> Type1State \<Rightarrow> nat \<Rightarrow> bool"
  where [simp]:
  "nextSnpRespIs snprespt  T devNum =  
    (startsWithSnpResp snprespt ((snpresps T) devNum) )"


(**)
(*Removes the instruction at the head of devNum's program
definition consumeInstruction :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State" ("_ [ _ -=i ]" [100, 0] 101) where
  "\<Sigma> [ devNum -=i ] = (if devNum = 0 then ( \<Sigma> \<lparr>program1 :=
    (case (program1 \<Sigma>)  of [] \<Rightarrow> [] 
                                          | I # tail \<Rightarrow>  tail)
                                                       \<rparr>) else  ( \<Sigma> \<lparr>program2 :=
    (case (program2 \<Sigma>)  of [] \<Rightarrow> [] 
                                          | I # tail \<Rightarrow>  tail)
                                                       \<rparr>) )"
*)

(*consume one htddata from the H2DData channel (TODO: currently only consumes from the head of channel)*)
definition devConsumeData :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State" ("_ [ _ -=devd ]" [100, 0] 101) where [simp]:
  "\<Sigma> [ devNum -=devd ] =  
    \<Sigma> \<lparr>htddatas := (htddatas \<Sigma>)
      (devNum := (case htddatas \<Sigma> devNum of 
                  [] \<Rightarrow> [] 
                 | _ # tail \<Rightarrow>  tail)) \<rparr>"




(*record the reqresp that has been received by a device: not used anymore as we don't record at the moment
definition recordReqRespReceived :: "Type1State \<Rightarrow> nat \<Rightarrow> ReqResp \<Rightarrow> Type1State" ("_ [ _ +=reqresDR _]" [100, 0] 101) where
  "T [devNum +=reqresDR resmsg] = (let dev_i = nat_to_id devNum in 
            (T \<lparr>respDevReceived := ((respDevReceived T) (dev_i := (respDevReceived T) dev_i @ 
              [resmsg])) \<rparr> ) [devNum  +=respDGot resmsg ]   )"
*)

(* consume the reqresp, make sure record the reqresp by the recordReqRespReceived function *)
definition consumeReqresp :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State" ("_ [ _ -=reqresp ]" [100, 0] 101) where [simp]:
  "\<Sigma> [ devNum -=reqresp ] = 
    \<Sigma> \<lparr>reqresps := (reqresps \<Sigma>)
      (devNum := (case reqresps \<Sigma> devNum of [] \<Rightarrow> [] 
                                          | _ # tail \<Rightarrow>  tail))\<rparr>"



(*consume a request. TODO: record it in a list as "HostReceivedRequest"*)
definition consumeReq :: "Type1State \<Rightarrow> nat \<Rightarrow> Type1State" ("_ [ _ -=req ]" [100, 0] 101) where [simp]:
  "\<Sigma> [ devNum -=req ] = 
    \<Sigma> \<lparr>reqs := (reqs \<Sigma>)  
        (devNum := (case reqs \<Sigma> devNum of [] \<Rightarrow> [] | _ # tail \<Rightarrow>  tail)) \<rparr>"

(*Device copies data from HTDData channel into its cache, updates its own cache state, and consumes that HTDData message from channel*)
definition copyInData :: "Message \<Rightarrow> nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "copyInData msg devNum mesi T = T[devNum s= mesi][ devNum :=dd msg ][devNum -=devd ] "


(*device copies in data, set the new state of its cache, execute an instruction, consumes that HTDData message from channel*)
definition copyInDataPerformInstr :: "Message \<Rightarrow> nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "copyInDataPerformInstr msg devNum mesi T = T[devNum s= mesi][devNum :=dd msg][ -=i devNum ][devNum -=devd ] "


(*send out request, upgrade block to transient state*)
definition sendReq :: " ReqType \<Rightarrow> MESI_State \<Rightarrow> nat \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendReq reqt mesi devNum T =T[devNum +=rdreq reqt][devNum s= mesi]"

(*TODO: Should not implicitly execute an Instruction as it should wait until the data and acess rights arrived,
which means this function will almost never be used *)
definition sendReqPerformInstruction :: " ReqType \<Rightarrow> MESI_State \<Rightarrow> nat \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendReqPerformInstruction reqt mesi devNum T =T[devNum +=rdreq reqt][devNum s= mesi][ -=i devNum]"



definition read_dev_value :: "nat \<Rightarrow> Type1State \<Rightarrow> int" where [simp]:
  "read_dev_value devNum T = ( read_from_cache (CLEntry.content ((devcaches T) devNum) ))"

(*
definition moveToBuffer :: "Type1State \<Rightarrow> Message \<Rightarrow> Type1State" 
  ("_ =h2dbuf _" [100, 0] 101) where "T =h2dbuf m = (T \<lparr> buffer := m\<rparr>)"
*)
(*Given a snoop msg, send a snoop response.
IE addition: add newly consumed snoop to the message buffer
issue: Should buffer be cleared after each run that does not involve buffer?*)
definition sendSnpResp :: "Message \<Rightarrow> SnpRespType \<Rightarrow> MESI_State \<Rightarrow> nat \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendSnpResp msg snpres mesi devNum T  = (let m = nextSnoop T devNum in let devid = nat_to_id devNum in  
    ( ( T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum +=snpresp snpres (getTid msg) ][devNum -=snp ][devNum s= mesi]) ) 
)"



(*
IE addition: add newly consumed snoop to the message buffer
issue: Should buffer be cleared after each run that does not involve buffer?*)
definition sendSnpRespAndData :: "SnpRespType \<Rightarrow> MESI_State \<Rightarrow> nat \<Rightarrow>  Type1State \<Rightarrow> Type1State" where [simp]:
  "sendSnpRespAndData snpres mesi devNum T  =  
    (let devID = nat_to_id devNum in let v = read_dev_value devNum T in let tid = nextSnoopID  T devNum in 
      let m = nextSnoop T devNum in
      let dthd = D2HData tid  v   (clock T ) in 
         T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum +=snpresp snpres tid ][devNum -=snp ][devNum s= mesi][devNum +=d2hd dthd]
    )"



(*Putting m into H2DReq/Resp buffer*)
definition consumeGOPerform :: "nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "consumeGOPerform devNum mesi T = (let devid = nat_to_id devNum in let m = nextGO T devNum in 
    T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum s= mesi][ devNum -=reqresp ][ -=i devNum]
) "

definition consumeGODiscard :: "nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "consumeGODiscard devNum mesi T = (let devid = nat_to_id devNum in let m = nextGO T devNum in  
    T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum s= mesi][ devNum -=reqresp ][ -=i devNum] 
) "

(*Putting m into H2DReq/Resp buffer*)
(*only difference between consumeGO and consumeGOPerform: consumeGOPerform also performs an instruction*)
definition consumeGO :: "nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "consumeGO devNum mesi T = (let m = nextGO T devNum in let devid = nat_to_id devNum in  
    T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum s= mesi][ devNum -=reqresp ]
)"

(*Putting m into H2DReq/Resp buffer*)
(*for Evictions: GO_Writepull results in a data message send*)
definition consumeGOSendData :: "nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "  consumeGOSendData devNum mesi T =  (let devID = nat_to_id devNum in let v = read_dev_value devNum T in let tid = nextGOID  T devNum in 
      let dthd = D2HData tid v  (clock T) in let m = nextGO T devNum in
         T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum s= mesi][ devNum -=reqresp ][devNum +=d2hd dthd][ -=i devNum])"


(*Perform instruction*)
definition consumeGOSendDataPerform :: "nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "  consumeGOSendDataPerform devNum mesi T =  (let devID = nat_to_id devNum in let v = read_dev_value devNum T in let tid = nextGOID  T devNum in 
      let dthd = D2HData tid v  (clock T) in let m = nextGO T devNum in
         T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum s= mesi][ devNum -=reqresp ][devNum +=d2hd dthd][ -=i devNum])"


definition consumeGOSendDataPerformEvict :: "nat \<Rightarrow> MESI_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "  consumeGOSendDataPerformEvict devNum mesi T =  (let devID = nat_to_id devNum in let v = read_dev_value devNum T in let tid = nextGOID  T devNum in 
      let dthd = D2HData tid v  (clock T) in let m = nextGO T devNum in
         T\<lparr>buffers := ((buffers T) (devNum := (Some m)))\<rparr>[devNum s= mesi][ devNum -=reqresp ][devNum +=d2hd dthd][ -=i devNum])"

(*unnecessary
definition perform :: "nat \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "perform devNum T = T[ -=i devNum]"
*)
(*
A function like 
fun getHead :: "'a list \<Rightarrow> 'a" where [simp]:
  "getHead (a # as) = a"
might be a better solution, but our current
approach will make up a data if list is empty.
If the guard_transition function works correctly it should never
have allowed do to call getDTHDataOrMakeup with an empty list
TODO: making up a dthdata message bit is very suspicious*)
fun getDTHDataOrMakeup :: "Message list \<Rightarrow> Message" where [simp]:
    "getDTHDataOrMakeup [] = (D2HData (-1)  (-42)   9999999) "
  | "getDTHDataOrMakeup (d # dlist) = d"


definition DTH_HTD :: "Message \<Rightarrow> Message" where [simp]:
  "DTH_HTD dthd = (let ut = getTid dthd in 
let v = getSpecificValD2H dthd  in 
H2DData ut v  (getTime dthd))"

(*some device sent a D2HData, Host forwards it to the requestor*)
definition copyInAndForwardData :: "nat \<Rightarrow> HOST_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "copyInAndForwardData dataSenderNum hostDestState T = (let requestorNum = (dataSenderNum + 1) mod 2 in 
    let senderDev = nat_to_id dataSenderNum in
    (let reqDev = nat_to_id requestorNum in (
    let dataMsg = getDTHDataOrMakeup ((dthdatas T) dataSenderNum) in let v = getSpecificValD2H dataMsg in 
      T [ requestorNum +=h2dd DTH_HTD dataMsg][ =hv v][5 sHost= hostDestState][dataSenderNum -=d2hdHead ] 
)
))"


(*TODO: Check d2hdHead actually does the job of removing head of D2HData channel*)
definition copyInDataHost :: "nat \<Rightarrow> HOST_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "copyInDataHost dataSenderNum hostDestState T = ( let senderDev = nat_to_id dataSenderNum in
    ( let dataMsg = getDTHDataOrMakeup ((dthdatas T) dataSenderNum) in let v = getSpecificValD2H dataMsg in 
      T [ =hv v][5 sHost= hostDestState][dataSenderNum -=d2hdHead ] ) )"



definition discardDataHost :: "nat \<Rightarrow> HOST_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "discardDataHost dataSenderNum hostDestState T = ( let senderDev = nat_to_id dataSenderNum in 
    ( let dataMsg = getDTHDataOrMakeup ((dthdatas T) dataSenderNum) in 
      T [5 sHost= hostDestState][dataSenderNum -=d2hdHead ] ) )"


(*Send host's copy of data and GO, the transactionID is usually obtained from the request at the top of the list,
but this version's function supplied tid directly
Things done here: i) send Data to requestor ii) grant Host mesi state iii) send response to requestor (usually GO) 
iv)delete the request that initiated this reqresponse
Part iv relies on the fact that we always take from top of list. Only suitable for a D2HReq that immediately sends an H2DResponse back*)
(*TODO: set devNum - 5 to requestor, and 5 to Host for better readability
shou why should the transactionID be obtained from requests? shouldn't it be snoopresp?
  for GO/Data sent without a snoop (for example immediately after host goes from I to S), the tid should be
  obtained from reqs channel, but if host sends this after a snoopresponse, then it must get tid from previous snoop
 TODO 2: Is it correct at all to assume that GO-X and Host's destination state X are the same (both mesi in this function)*)
definition sendHostDataGO :: "TransactionID \<Rightarrow> nat \<Rightarrow> HOST_State \<Rightarrow> MESI_State \<Rightarrow> ReqRespType  \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendHostDataGO tid devNum hmesi mesi reqt  T = (  
                                        T[ devNum +=hostdata tid][5 sHost= hmesi][ devNum +=reqresp reqt mesi tid][devNum -=req ])"


(*20230919 TODO: added function for sending GO while in MA state *)
(*
definition sendGOOnly :: "TransactionID \<Rightarrow> nat \<Rightarrow> HOST_State \<Rightarrow> MESI_State \<Rightarrow> ReqRespType  \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendGOOnly tid devNum hmesi mesi reqt  T = (  
                                        T[5 sHost= hmesi][ devNum - 5 +=reqresp reqt mesi tid][devNum - 5 -=req ])"
*)



(*TODO: Special actions for 2 devices: devNum is snprespSender, then original requestor is the other device*)
definition sendGOFromSnpResp :: "TransactionID \<Rightarrow> nat \<Rightarrow> MESI_State \<Rightarrow> ReqRespType  \<Rightarrow> HOST_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendGOFromSnpResp tid snprespSender mesi reqt hostDestState T = ( let reqNum = (snprespSender + 1) mod 2 in
                                        T[ reqNum  +=reqresp reqt mesi (tid)][5 sHost= hostDestState][snprespSender -=snpresp ])"



definition sendGOFromSnpRespForwardData :: "TransactionID \<Rightarrow> nat \<Rightarrow> MESI_State \<Rightarrow> ReqRespType  \<Rightarrow> HOST_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendGOFromSnpRespForwardData tid snprespSender mesi reqt hostDestState T = ( let reqNum = (snprespSender + 1) mod 2 in                                      
                                        T[ reqNum  +=reqresp reqt mesi tid][5 sHost= hostDestState][ reqNum +=hostdata tid][snprespSender -=snpresp ])"

(*TODO: Special actions for 2 devices: devNum is snprespSender, then original requestor is the other device*)
definition consumeSnpResp :: " nat \<Rightarrow>Type1State \<Rightarrow> Type1State" where [simp]:
  "consumeSnpResp  snprespSender  T = (T [snprespSender  -=snpresp ])"

(*TODO: returning random req if no message in issueEvents list to issue, should be fixed to a more *)
fun getEventToIssueOrMakeup :: "Message list \<Rightarrow> Message" where [simp]:
    "getEventToIssueOrMakeup [] = D2HReq (-1) RdAny 99999999"
  | "getEventToIssueOrMakeup (d # dlist) = d"

(*Issuing event without a memory instruction temporarily disabled
definition issueEvent :: "nat \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "issueEvent devNum T = (let devId = nat_to_id devNum in let reqt = dthreqtype (getEventToIssueOrMakeup ((eventsToIssue T) devId))  in 
T [devNum +=rdreq reqt])"

*)


(*Send host's copy of data ONLY,
  and change host cache state to mesi. We assume +=hostdata correctly implements sending an HTDData from host*)
definition sendHostData :: "nat \<Rightarrow> HOST_State   \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "sendHostData devNum mesi   T = (let tid = nextReqID T devNum in 
                                        T[ devNum +=hostdata tid][5 sHost= mesi])"


(*Helper function: send SnpInv to all devices in a list*)
fun sendSnpInvToAll :: "Type1State \<Rightarrow> TransactionID \<Rightarrow> nat list \<Rightarrow> Type1State" where
  "sendSnpInvToAll T tid [] = T"
| "sendSnpInvToAll T tid (j # js) = sendSnpInvToAll (T[j +=snp SnpInv tid]) tid js"

(*Multi-device version: send snoop to ALL sharers in sharersList
For RdOwn request from device reqNum with sharers in sharersList:
1. Send host data to requestor
2. Update host state to MA (waiting for snoop responses)
3. Send SnpInv to ALL devices in sharersList
4. Consume the request

IMPORTANT: sharersList should contain all devices in Shared/SMAD state (excluding reqNum)
This is checked in the guard of the calling rule (e.g., HostSharedRdOwn')
*)
definition invalidateSharers :: "TransactionID \<Rightarrow> nat \<Rightarrow> nat list \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "invalidateSharers tid reqNum sharersList T = (
    let T' = sendHostData reqNum MA T in
    let T'' = sendSnpInvToAll T' tid sharersList in
    T''[reqNum -=req]
  )"


\<comment>\<open>ORIGINAL 2-device version - NEEDS REVIEW for N-device extension
  Line 1000 uses: (reqNum + 1) mod 2 to compute "otherNum" but doesn't use it
  May need removal or fix for N-device compatibility
  Status: UNMODIFIED as of 2025-10-21\<close>
definition noInvalidateSharers :: "TransactionID \<Rightarrow> nat   \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
  "noInvalidateSharers tid reqNum   T = (let otherNum = (reqNum + 1) mod 2 in 
    (  sendHostDataGO tid   reqNum ModifiedM Modified GO T))"


\<comment>\<open>ORIGINAL 2-device version - NEEDS MODIFICATION for N-device extension
  Line 1011 uses: owner = (devNum + 1) mod 2 (assumes "the other device")
  For N-device: need dynamic owner lookup based on CSTATE (likely Modified or Exclusive)
  Status: UNMODIFIED as of 2025-10-21
  
  Original comment: send snoop to other device. devNum - 5 is the requestor, 
  TODO: We made simplifying assumptions: (i) 2 devices (ii) no device already having M ownership
  IE Addition:\<close>
definition sendSnoop :: "SnoopType \<Rightarrow> nat \<Rightarrow> HOST_State \<Rightarrow> Type1State \<Rightarrow> Type1State" where [simp]:
   "sendSnoop snoopt devNum mesi T = (let owner = (devNum  + 1) mod 2 in (let requestor = devNum in 
                                            T[ owner +=snp snoopt (nextReqID T requestor) ][5 sHost= mesi][ requestor -=req ]) )"

(*send response to an Eviction. do three things: i) set access state for Host ii)send response to requestor and iii)delete req message
For example, for a DirtyEvict on an M Host state, i) state_into = ID ii) respt = GO_WritePull iii) deleted DirtyEvict *)
definition sendEvictResp :: "ReqRespType \<Rightarrow> nat => HOST_State \<Rightarrow> TransactionID \<Rightarrow> Type1State  \<Rightarrow> Type1State" where [simp]:
  "sendEvictResp respt requestorNum state_into tid T = 
  ( T[5 sHost= state_into][ requestorNum +=reqresp respt Invalid tid][requestorNum  -=req ])"

(*last Sharer: exists exactly one device in Shared state, all others are Invalid*)
definition lastSharer :: "Type1State \<Rightarrow> bool" where [simp]:
  "lastSharer T = (\<exists>j. CSTATE Shared T j \<and> (\<forall>i. i \<noteq> j \<longrightarrow> CSTATE Invalid T i))"

\<comment>\<open>═══════════════════════════════════════════════════════════════════════════
  NEW FUNCTION added 2025-10-21 by Chengsong (multi-device extension)
  
  BEFORE: This function did NOT exist in the codebase
  
  PURPOSE: Dynamically compute list of all sharers for BuggyRules.thy HostSharedRdOwn'
  Previously, HostSharedRdOwn' required explicit sharersList parameter, making
  caller responsible for computing sharers. This helper encapsulates that logic.
  
  ADJACENT DEFINITIONS: lastSharer (above, line 1018), ISSUE_EVENT_ROW (below, line 1032)
═══════════════════════════════════════════════════════════════════════════\<close>
definition getSharersList :: "Type1State \<Rightarrow> nat \<Rightarrow> nat list" where [simp]:
  "getSharersList T i = [j. j \<leftarrow> [0..<2], j \<noteq> i \<and> (CSTATE Shared T j \<or> CSTATE SMAD T j)]"
  \<comment>\<open>Current 2-device version: [0..<2] is placeholder for compatibility
  Future N-device version will use: [j. j \<leftarrow> [0..<maxDevices], ...]
  Returns empty list [] if no sharers found (safe for guards like "sharers \<noteq> []")\<close>


definition ISSUE_EVENT_ROW ::"nat" where "ISSUE_EVENT_ROW = 100"

definition getTop :: "Message list \<Rightarrow> Message"
  where [simp]: "getTop ls = (if ls = [] then H2DReq (-1) SnpMadeup 42 else hd ls)"
  
(*currently assumes only takes snoop from list head
TODO: Next iteration make CXL_SPG take an additional snoop message as input,
which is the snoop message to be put into buffer (when we allow non-det choose from any location in a message list
to process
idea: for a snoop to propagate to the buffer, it should never see any GOs with an earlier timestamp in the H2DResp queue. 

definition CXL_SPG_non_computable :: "Type1State \<Rightarrow> nat \<Rightarrow>  bool"
  where [simp]: "CXL_SPG_non_computable T i =(let devid = nat_to_id i in let snoopToProcess = getTop ((snoops T) devid) 
          in (\u00E2\u0088\u0084x. x \u00E2\u0088\u0088 set ((reqresps T) devid) \<and>  getTime x < getTime snoopToProcess))"
 *)


(*An earlier issued GO is not processed yet before time t1*)
fun exists_earlier_GO :: "nat \<Rightarrow> Message list \<Rightarrow> bool"
  where [simp]: "exists_earlier_GO t1 (respH # respT) = ((getTime respH < t1 \<and> getSpecificTypeReqResp respH = GO)\<or> exists_earlier_GO t1 respT)"
  |     "exists_earlier_GO t1 [] = False"  






lemma impconjI: "\<lbrakk>A  \<longrightarrow> C; A \<longrightarrow> D \<rbrakk> \<Longrightarrow> A \<longrightarrow>  (C \<and> D)"
  by metis








end