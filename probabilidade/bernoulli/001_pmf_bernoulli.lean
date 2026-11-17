import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.NormNum

/-! # Exercício 001: PMF da distribuição de Bernoulli -/

/-- `bernoulliPMF p x`: PMF de Bernoulli com parâmetro `p : ℝ` em `x : ℕ`. -/
def bernoulliPMF (p : ℝ) (x : ℕ) : ℝ :=
  p^x * (1 - p)^(1 - x)

/-- `bernoulliPMF (p = 0.4, x = 0) -> out 0.6`, provado com `norm_num [bernoulliPMF]`. -/
example : bernoulliPMF 0.4 0 = 0.6 := by
  norm_num [bernoulliPMF]

/-- `bernoulliPMF (p = 0.4, x = 0) -> out 0.6`, provado com `unfold` e `norm_num`. -/
example : bernoulliPMF 0.4 0 = 0.6 := by
  unfold bernoulliPMF
  norm_num

/-- `bernoulliPMF p 0 = 1 - p`, para `p : ℝ` qualquer, provado com `unfold` e `norm_num`. -/
example (p : ℝ) : bernoulliPMF p 0 = 1 - p := by
  unfold bernoulliPMF
  norm_num

/-- `bernoulliPMF p 0 = 1 - p`, para `p : ℝ` qualquer, provado com `unfold` e `simp`. -/
example (p : ℝ) : bernoulliPMF p 0 = 1 - p := by
  unfold bernoulliPMF
  simp

/-- `bernoulliPMF p 1 = p`, para `p : ℝ` qualquer, provado com `unfold` e `norm_num`. -/
example (p : ℝ) : bernoulliPMF p 1 = p := by
  unfold bernoulliPMF
  norm_num
