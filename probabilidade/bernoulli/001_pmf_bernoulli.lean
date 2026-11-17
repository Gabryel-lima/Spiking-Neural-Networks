import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.NormNum

/-! # Exercício 001: PMF da distribuição de Bernoulli -/

/--
Entrada: `(p : ℝ, x : ℕ)`.
Saída esperada: `ℝ`, igual a `1 - p` se `x = 0`, `p` se `x = 1` e `0` nos demais casos.

Obs.: a fórmula `p^x * (1 - p)^(1 - x)` coincide com esta apenas para `x ∈ {0, 1}`.

Prova: não há, esta é a definição.
-/
def bernoulliPMF (p : ℝ) (x : ℕ) : ℝ :=
  if x = 0 then 1 - p else if x = 1 then p else 0

/- -/

/--
Entrada: `(p = 0.4, x = 0)`.
Saída esperada: `0.6`.

Prova:
1. `norm_num [bernoulliPMF]` substitui a definição na meta e calcula os numerais.
   Cadeia: `bernoulliPMF 0.4 0 = 1 - 0.4 = 0.6`.
-/
example : bernoulliPMF 0.4 0 = 0.6 := by
  norm_num [bernoulliPMF]

/--
Entrada: `(p = 0.4, x = 0)`.
Saída esperada: `0.6`.

Prova:
1. `unfold bernoulliPMF` expande a definição na meta.
2. `norm_num` decide `0 = 0`, escolhe o ramo `1 - p` e calcula `1 - 0.4 = 0.6`.
   Cadeia: `bernoulliPMF 0.4 0 = 1 - 0.4 = 0.6`.
-/
example : bernoulliPMF 0.4 0 = 0.6 := by
  unfold bernoulliPMF
  norm_num

/- -/

/--
Entrada: `(p : ℝ)` qualquer, `x = 0`.
Saída esperada: `1 - p`.

Prova:
1. `unfold bernoulliPMF` expande a definição na meta.
2. `norm_num` decide `0 = 0` e escolhe o ramo `1 - p`.
-/
example (p : ℝ) : bernoulliPMF p 0 = 1 - p := by
  unfold bernoulliPMF
  norm_num

/--
Entrada: `(p : ℝ)` qualquer, `x = 0`.
Saída esperada: `1 - p`.

Prova:
1. `unfold bernoulliPMF` expande a definição na meta.
2. `simp` decide `0 = 0` e escolhe o ramo `1 - p`.
-/
example (p : ℝ) : bernoulliPMF p 0 = 1 - p := by
  unfold bernoulliPMF
  simp

/--
Entrada: `(p : ℝ)` qualquer, `x = 1`.
Saída esperada: `p`.

Prova:
1. `unfold bernoulliPMF` expande a definição na meta.
2. `norm_num` decide `1 = 0` (falso) e `1 = 1` (verdadeiro), e escolhe o ramo `p`.
-/
example (p : ℝ) : bernoulliPMF p 1 = p := by
  unfold bernoulliPMF
  norm_num

/--
Entrada: `(p : ℝ, x : ℕ)`, com as hipóteses `h0 : x ≠ 0` e `h1 : x ≠ 1`.
Saída esperada: `0` (lado direito do `=`).

Prova:
1. `unfold` expande a definição de `bernoulliPMF`.
2. `simp [h0, h1]` usa as hipóteses para eliminar os dois casos
   `x = 0` e `x = 1`.
-/
example (p : ℝ) (x : ℕ) (h0 : x ≠ 0) (h1 : x ≠ 1) :
    bernoulliPMF p x = 0 := by
  unfold bernoulliPMF
  simp [h0, h1]
