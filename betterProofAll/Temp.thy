theory Temp
imports Complex_Main

begin

declare [[ML_print_depth = 4000000]]
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/pred.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/ops.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/get.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/sections.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/seps.ML"
ML_file "~/Documents/GitHub/DeepIsaHOL/src/main/ml/actions.ML"

(* SECTION 1: Here I write the error location process step-by-step *)
ML ‹
val file_with_errors = "~/Documents/GitHub/betterProof/Toy.thy"
val thy_text = File.read (Path.explode file_with_errors);
val actions = Actions.make' \<^theory> thy_text;
›

ML ‹
val trace = Actions.timed_apply_all {timeout_in_secs=60, no_batches=10, debug=false} actions (Toplevel.make_state NONE);
›

ML ‹
(* separation from the long-running process above *)
›

ML ‹
fun is_timout (_, _, err) = is_some err andalso (snd (the err) = "TIMEOUT_ERROR")
›
ML ‹
(* errors with their corresponding pairs of action-states *)
val timeouts = filter is_timout trace;
›

ML ‹
(* errors and the action-states immediately before and after the errors *)
val timeouts_w_nhds = Pred.nhds is_timout 1 trace
›
(* This is the renamed version of the file that you passed me (actions.ML) *)


ML ‹
fun get_fix (_, st, _) = Hammer_Alt.hammer_away 1 (Toplevel.proof_of st);
›
ML ‹map (fn (res, nhd) => (res, get_fix (hd nhd))) timeouts_w_nhds›
(* THIS IS THE OUTPUT PRODUCED BY THIS CODE.
Sledgehammering...
spass found a proof...
vampire found a proof...
zipperposition found a proof...
spass: Try this: using wellorder_Inf_lemma(2) by blast (2 ms)
zipperposition: Duplicate proof
zipperposition found a proof...
zipperposition: Duplicate proof
vampire: Try this: by (smt (verit, del_insts) mem_Collect_eq wellorder_InfI) (327 ms)
Done
val it =
   [((Action
       {text = "apply metis", transition =
        Transition
         {markers = [], name = "apply", pos = {line=540, offset=15765, end_offset=15770}, timing = 0.000, trans =
          [Transaction (fn, NONE)]}},
      <Isar in proof mode>, SOME (TIMEOUT 60.000, "TIMEOUT_ERROR")),
     ("success", "Try this: <markup> (327 ms)"))]:
   ((Actions.T * Toplevel.state * (exn * string) option) * (string * string)) list
*)

(* SECTION 2: Grouping the above process in a single function *)
ML ‹
fun first_draft_fix_timeouts thy0 thy_file =
  let
    val thy_text = File.read (Path.explode thy_file);
    val acts = Actions.make' thy0 thy_text;
    val config = {timeout_in_secs=60, no_batches=10, debug=false};
    val _ = tracing "Finding the errors"
    val st_err_trace = Actions.timed_apply_all config acts (Toplevel.make_state NONE);
    fun get_fix (_, st, _) = Hammer_Alt.hammer_away 1 (Toplevel.proof_of st);
    fun is_timout (_, _, err) = is_some err andalso (snd (the err) = "TIMEOUT_ERROR")
    val timeouts = Pred.nhds is_timout 1 st_err_trace
    val _ = tracing ("Found " ^ (Value.print_int (length timeouts)) ^ " timeout errors.")
    val _ = tracing "Hammer: finding alternative proofs"
    val hammer_fixes = map (fn (res, nhd) => (res, get_fix (hd nhd))) timeouts
  in hammer_fixes end;
›

ML ‹
first_draft_fix_timeouts \<^theory> file_with_errors
›

end
