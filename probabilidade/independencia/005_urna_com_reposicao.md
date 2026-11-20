# Exercício 005 — Duas retiradas com reposição

## Enunciado

Uma urna contém 3 bolas vermelhas e 2 bolas azuis.

Uma bola é retirada, sua cor é anotada e ela é devolvida à urna. Depois, uma segunda bola é retirada.

Defina:

$$
A = \text{a primeira bola é vermelha}
$$

$$
B = \text{a segunda bola é vermelha}
$$

Determine:

1. $P(A)$
2. $P(B)$, antes de qualquer retirada.
3. Quantas bolas vermelhas e azuis existem na urna antes da segunda retirada, sabendo que $A$ aconteceu.
4. $P(B\mid A)$
5. Se a probabilidade de $B$ mudou depois de sabermos que $A$ aconteceu.
6. Se $A$ e $B$ são eventos independentes ou dependentes.
7. Explique, com suas próprias palavras, por que a reposição da bola interfere na independência dos eventos.

## Representação do experimento

Estado inicial:

$$
3V + 2A
$$

Primeira retirada:

$$
\text{retira} \rightarrow \text{anota} \rightarrow \text{devolve}
$$

Estado antes da segunda retirada:

$$
3V + 2A
$$

## Observação

Não utilizar inicialmente fórmulas de independência. Primeiro identificar o que acontece fisicamente com a urna e, depois, traduzir o raciocínio para a notação matemática.

## Objetivo

Praticar a passagem:

$$
\text{situação}
\rightarrow
\text{representação}
\rightarrow
\text{probabilidade}
\rightarrow
\text{notação matemática}
$$

e posteriormente formalizar o raciocínio em Lean.
