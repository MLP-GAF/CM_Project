module ELM
using Reexport
@reexport using DataFrames
export HiddenLayer, ExtremeLearningMachine
export activations, fit!, predict
include("initializers.jl")
include("activation_fucntions.jl")
include("main.jl")
end