# Spiking Neural Networks — Lean 4

Formalização em [Lean 4](https://lean-lang.org/) de definições, resultados e
exercícios relacionados a redes neurais spiking (SNNs), com foco inicial em
probabilidade (distribuição de Bernoulli, binomial etc.). O projeto usa o
[Mathlib](https://github.com/leanprover-community/mathlib4).

> Projeto de **estudo pessoal**: pode conter provas incompletas, erros e
> mudanças frequentes. Sugestões são bem-vindas via issue.

## Estrutura

```
.
├── lean-toolchain        # versão do Lean usada (v4.36.0)
├── lakefile.lean         # configuração do Lake (declara o Mathlib)
├── lake-manifest.json    # versões exatas das dependências
├── docs/                 # artigos de referência (PDF)
├── .vscode/              # configurações do VS Code (autocomplete do Lean)
└── probabilidade/        # estudos de probabilidade (.lean + notas .md)
    ├── bernoulli/
    ├── binomial/
    └── independencia/
```

## Referências e créditos

Os artigos abaixo embasam os estudos de redes neurais spiking deste repositório.
Os arquivos originais estão disponíveis em [`docs/`](docs/).

1. Ernst Niebur, "Generation of Synthetic Spike Trains with Defined Pairwise
   Correlations", *Neural Computation*, 19(7), 1720-1738 (2007).
   DOI: [10.1162/neco.2007.19.7.1720](https://doi.org/10.1162/neco.2007.19.7.1720).
   Arquivo: [`01_2007_Generation of Synthetic Spike Trains with Defined Pairwise Correlations.pdf`](docs/01_2007_Generation%20of%20Synthetic%20Spike%20Trains%20with%20Defined%20Pairwise%20Correlations.pdf)

2. Filip Ponulak e Andrzej Kasiński, "Supervised Learning in Spiking Neural
   Networks with ReSuMe: Sequence Learning, Classification, and Spike Shifting",
   *Neural Computation*, 22(2), 467-510 (2010).
   DOI: [10.1162/neco.2009.11-08-901](https://doi.org/10.1162/neco.2009.11-08-901).
   Arquivo: [`02_2010_Supervised Learning in Spiking Neural Networks with ReSuMe.pdf`](docs/02_2010_Supervised%20Learning%20in%20Spiking%20Neural%20Networks%20with%20ReSuMe.pdf)

3. Friedemann Zenke e Surya Ganguli, "SuperSpike: Supervised Learning in
   Multilayer Spiking Neural Networks", *Neural Computation*, 30(6),
   1514-1541 (2018).
   Arquivo: [`03_2018_SuperSpike_Supervised Learning in Multilayer Spiking Neural Networks.pdf`](docs/03_2018_SuperSpike_Supervised%20Learning%20in%20Multilayer%20Spiking%20Neural%20Networks.pdf)

4. Emre O. Neftci, Hesham Mostafa e Friedemann Zenke, "Surrogate Gradient
   Learning in Spiking Neural Networks: Bringing the Power of Gradient-based
   Optimization to Spiking Neural Networks", *IEEE Signal Processing Magazine*,
   36(6), 51-63 (2019).
   Arquivo: [`04_2019_Surrogate Gradient Learning in Spiking Neural Networks.pdf`](docs/04_2019_Surrogate%20Gradient%20Learning%20in%20Spiking%20Neural%20Networks.pdf)

5. Eimantas Ledinauskas, Julius Ruseckas, Alfonsas Juršėnas e Giedrius Buračas,
   "Training Deep Spiking Neural Networks", preprint arXiv:2006.04436 (2020).
   Arquivo: [`05_2020_Training Deep Spiking Neural Networks.pdf`](docs/05_2020_Training%20Deep%20Spiking%20Neural%20Networks.pdf)

Esta seção fornece crédito bibliográfico aos autores originais; ela não atribui
a autoria dos artigos ou dos resultados a este projeto.

## Requisitos

- Linux, macOS ou Windows (WSL recomendado), com `git` e `curl`.
- **Recomendado: 8 GB de RAM ou mais** e ~10 GB de disco livre. O Mathlib já
  compilado ocupa ~7 GB. Veja [Dicas de memória](#dicas-de-memória).

## Instalação

### 1. Instalar o Lean (via elan)

O Lean é gerenciado pelo **elan**, que baixa automaticamente a versão correta
indicada em `lean-toolchain`. Não existe pacote oficial do Lean no `apt`; use
uma destas opções:

**Opção A — pelo terminal (Linux/macOS):**

```sh
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
```

Depois abra um novo terminal (ou rode `source ~/.profile`) para `elan`, `lean`
e `lake` entrarem no `PATH`.

**Opção B — pelo VS Code:** instale a extensão **Lean 4**
(`leanprover.lean4`). Ela oferece instalar o elan para você.

**Opção C — pelo site:** siga o guia oficial em
<https://lean-lang.org/install/> (inclui Windows).

Dependências básicas no Debian/Ubuntu:

```sh
sudo apt update
sudo apt install git curl
```

Confirme:

```sh
elan --version
lean --version
lake --version
```

### 2. Clonar o projeto

```sh
git clone https://github.com/Gabryel-lima/Spiking-Neural-Networks-(SNNs).git
cd "Spiking Neural Networks (SNNs)"   # aspas por causa dos espaços e parênteses
```

### 3. Baixar o Mathlib já compilado

**Não compile o Mathlib na mão** (leva horas). Baixe o cache pronto:

```sh
lake exe cache get
```

Na primeira vez o elan também baixa a toolchain `v4.36.0` automaticamente. Se o
`lake` reclamar de dependências ausentes, rode antes `lake update`.

### 4. Conferir

O projeto não define biblioteca nem executável: cada arquivo `.lean` é
verificado individualmente (veja [Uso](#uso)).

## Uso

### Verificar um arquivo `.lean`

A partir da raiz do projeto:

```sh
lake env lean probabilidade/bernoulli/001_pmf_bernoulli.lean
```

Sem nenhuma saída = a prova está correta. Erros aparecem no terminal. Esses
arquivos contêm provas (`example`, `theorem`), não programas, então não imprimem
resultado. Para ver valores, use `#eval`/`#check`/`#print` no arquivo.

Use sempre `lake env` para arquivos que importam Mathlib. Rodar
`lean arquivo.lean` direto não conhece os caminhos das bibliotecas do projeto.

### VS Code

1. Instale a extensão **Lean 4**.
2. Abra a **pasta raiz** do projeto (`File → Open Folder`), não um arquivo solto.
3. Abra um `.lean`: o painel *Lean Infoview* mostra objetivos e erros.

Na primeira abertura de um arquivo, o servidor pode levar cerca de 1 minuto
conferindo o Mathlib. É normal.

### Autocomplete no VS Code

O Lean **tem autocomplete** — vem do servidor de linguagem da extensão
**Lean 4**, então não há nada extra para instalar. Para funcionar:

1. Abra a **pasta raiz** do projeto (senão o servidor não acha o Mathlib).
2. Espere o arquivo terminar de carregar (a barra do Infoview deixa de mostrar
   "processing"). Antes disso não há sugestões.
3. Comece a digitar, ou use `Ctrl+Space` para forçar a lista.

O projeto já traz [.vscode/settings.json](.vscode/settings.json) com as
configurações recomendadas (sugestões automáticas ligadas, `Tab`/`Enter` aceitam,
sugestões por palavras do texto desligadas, para só aparecerem nomes do Lean).

O que o autocomplete enxerga:

- Só nomes dos módulos **importados** no arquivo. Se `Real.sqrt` não aparece,
  falta o `import` correspondente (veja [Dicas de memória](#dicas-de-memória)).
- Depois de um ponto (`h.`, `Real.`) lista os campos e lemas relacionados ao
  tipo.

Símbolos Unicode: digite `\` + abreviação e aperte `Tab` (ou espaço):

| Digite | Resultado | Digite | Resultado |
| --- | --- | --- | --- |
| `\R` | ℝ | `\N` | ℕ |
| `\to` | → | `\forall` | ∀ |
| `\exists` | ∃ | `\le` | ≤ |
| `\sum` | ∑ | `\in` | ∈ |

Busca de lemas pelo próprio Lean (aparecem no Infoview e podem ser aplicadas
com *Code Action*, a lâmpada): `exact?`, `apply?`, `rw?` e `simp?`.

Se o autocomplete parar de responder: `Ctrl+Shift+P` → **Lean 4: Restart File**
(ou **Restart Server**).

## Dicas de memória

**Evite `import Mathlib`.** Ele carrega a biblioteca inteira (~5 GB de
`.olean`). Em máquinas com pouca RAM (~6 GB), o computador entra em swap e o
servidor do Lean pode travar tudo. Importe só o que o arquivo usa:

```lean
import Mathlib.Basic.Real.Basic   -- números reais (ℝ)
import Mathlib.Tactic.NormNum     -- norm_num
```

Com imports específicos, o arquivo de Bernoulli compila em ~1,5 s.

Como achar o import certo:

- Se o Lean avisar `'X' has been deprecated: please replace this import by Y`,
  troque pelo `Y` indicado.
- Se faltar algo (`unknown identifier`, `unknown tactic`), procure o módulo:

  ```sh
  grep -rl "theorem nome_do_teorema" .lake/packages/mathlib/Mathlib | head
  ```

- Para probabilidade, prefira módulos `Mathlib.Probability.*` em vez do Mathlib
  inteiro.

## Solução de problemas

| Sintoma | O que fazer |
| --- | --- |
| VS Code/servidor do Lean travando o PC | Confira os imports (veja acima). Use `Ctrl+Shift+P` → **Lean 4: Restart File**. Se preciso: `pkill -f "lean --server"` e `pkill -f "lake serve"`. |
| `unknown package 'Mathlib'` / `unknown module prefix` | Você rodou fora da raiz ou sem `lake env`. Entre na pasta do projeto e use `lake env lean ...`. |
| Lake tentando compilar o Mathlib (muito demorado) | Interrompa (`Ctrl+C`) e rode `lake exe cache get`. |
| Versão errada do Lean | Entre na pasta do projeto: o elan usa o `lean-toolchain`. Confirme com `lean --version`. |
| Mudou o `lakefile.lean` ou o `lean-toolchain` | Rode `lake update` e depois `lake exe cache get`. |

Importante: a versão do Mathlib no `lakefile.lean` (`@ "v4.36.0"`) deve ser a
mesma do `lean-toolchain`.

## Recursos para aprender

- [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/)
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)
- [Documentação do Mathlib](https://leanprover-community.github.io/mathlib4_docs/)
- [Lean Zulip](https://leanprover.zulipchat.com/) (comunidade)

## Licença

Distribuído sob a licença MIT — veja [LICENSE](LICENSE).
