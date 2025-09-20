theory goodproofs
  imports  BasicInvariants
begin
declare [[ML_print_depth = 4000000]]
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/pred.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/ops.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/get.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/sections.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/seps.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/actions.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/data.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/print.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/json_maker.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/g2tac_formatter.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/writer.ML"
ML_file "~/Documents/GitHub/betterProof/HammerAlt.ML"


ML \<open>
val s = "Try this: using SARspSFwdM_invariant2 i489 nextSnpRespIs_general_rule_13_0 by blast (0.0 ms)"

val t = Hammer_Alt.extract_one_liner_proof s
\<close>
