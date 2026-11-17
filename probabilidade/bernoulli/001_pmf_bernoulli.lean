import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.NormNum

def bernoulliPMF (p : ℝ) (x : ℕ) : ℝ :=
  p^x * (1 - p)^(1 - x)

example : bernoulliPMF 0.4 0 = 0.6 := by
  norm_num [bernoulliPMF]
