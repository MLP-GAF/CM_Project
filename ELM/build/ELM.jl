module ELM
using Reexport
@reexport using DataFrames
export HiddenLayer, ExtremeLearningMachine,SVDCM
export activations, fit!, predict, fitSVD!
include("CM_SVD.jl")
include("initializers.jl")
include("activation_fucntions.jl")
include("main.jl")
end