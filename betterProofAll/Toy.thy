theory Toy imports BasicInvariants
begin
lemma funn:
  fixes x :: nat
  assumes "foo x \<and> bar x \<and> baz x \<and> qux x \<and> SWMR_state_machine t"
  shows "SWMR t \<and>(foo (f x) \<or> x < x * x + 1) \<and>(bar (f x) \<or> 3 * x \<le> x\<^sup>2 + 3)  \<and>(baz (f x) \<or> x < x + 1)  \<and> (qux (f x) \<or> x < x + 1) "
proof -
  show ?thesis
    
  proof (intro conjI)
    show g1p: "foo (f x) \<or> x < x * x + 1"
      apply (smt (verit) less_add_one add_le_same_cancel1 divisors_zero le_square less_add_same_cancel2 less_one linorder_neqE_nat mult.right_neutral nat_0_less_mult_iff nat_mult_less_cancel_disj not_add_less2 not_one_le_zero trans_less_add1 trans_less_add2) done
      show g2p: "SWMR t"
        apply(insert assms) sledgehammer sorry
    show g3p: "baz (f x) \<or> x + 1< x + 1"
      apply (smt (verit) less_add_one) done

    show g4p: "qux (f x) \<or> x < x + 1"
      apply (smt (verit) less_add_one) done
  qed
qed

lemma funn1: fixes x :: nat shows "(foo (f x) \<or> x < x * x + 1) \<and>(bar (f x) \<or> 2 * x \<le> x\<^sup>2 + 1)  \<and>(baz (f x) \<or> x < x + 1)  \<and> (qux (f x) \<or> x < x + 1)"
  using funn sorry

end