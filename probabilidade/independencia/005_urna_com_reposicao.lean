import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.NormNum

/-! # Exercício 005: Duas retiradas com reposição -/

/--
Entrada: nenhuma (constante). Urna com `3` bolas vermelhas e `2` azuis;
a bola retirada é devolvida antes da segunda retirada.
Saída esperada: `ℝ`, igual a `3 / 5`, a probabilidade de uma retirada ser vermelha.

Obs.: como há reposição, a urna volta a `3V + 2A` e este valor vale para as duas retiradas.

Prova: não há, esta é a definição.
-/
noncomputable def probVermelha : ℝ :=
  3 / 5

/- -/

/--
Entrada: nenhuma.
Saída esperada: `0.6`.

Prova:
1. `norm_num [probVermelha]` substitui a definição na meta e calcula os numerais.
   Cadeia: `probVermelha = 3 / 5 = 0.6`.
-/
example : probVermelha = 0.6 := by
  norm_num [probVermelha]
