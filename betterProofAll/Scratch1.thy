
theory Scratch1 imports Main Super2023 begin
sledgehammer_params[max_proofs = 4, preplay_timeout = 1]
lemma
  fixes x :: nat
  assumes "foo x"
  and " bar x"
  and "baz x"
  and "qux x"
  and "(x-1)^2 \<ge>0"
  shows "(foo x \<or>  (x < x * x + 1)) \<and>(baz x \<or> (2 * x \<le> 2 * x\<^sup>2 + 1))  \<and>( (2 *x \<le> x^2 + 1))  \<and> (bar x \<or> (x < x + 1))"
proof -
show ?thesis
proof (intro conjI)
show goal1:  "foo x \<or> x < x * x + 1"
by (simp add: assms(1))
 
show goal2:  "baz x \<or> 2 * x \<le> 2 * x\<^sup>2 + 1"
by (simp add: assms(3))
 
show goal3:  "2 * x \<le> x\<^sup>2 + 1"
by (smt (verit) add.commute le_add_diff_inverse le_eq_less_or_eq less_eq_iff_succ_less linordered_semidom_class.add_diff_inverse mult_le_mono1 mult_nonneg_nonpos mult_numeral_1_right nat_1_add_1 nat_add_left_cancel_le nat_less_le numerals(1) one_power2 power_add_numeral power_one_right semiring_norm(2) trans_le_add1 zero_le_numeral zero_less_one_class.zero_le_one)
 
show goal4:  "bar x \<or> x < x + 1"
by simp
 
qed
qed


end