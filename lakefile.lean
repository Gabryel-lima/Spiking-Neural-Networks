import Lake
open Lake DSL

package «spiking-neural-networks» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.36.0"

lean_lib SpikingNeuralNetworks

@[default_target]
lean_exe snn where
  root := `Main
