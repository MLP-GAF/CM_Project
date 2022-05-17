using  DataFrames

mutable struct HiddenLayer

    number_of_neurons::Integer
    weight_matrix::Matrix{Float64}
    weight_initializer::Function
    bias_vector::Vector{Float64}
    activation_function::Function


end

function return_name(x)
    return String(Symbol(x))
end

function activations(layer::HiddenLayer,x::Matrix{Float64})
    # Calculates the activations of the hidden layer neurons
    #
    # Parameters
    # ----------
    # `layer` is the HiddenLayer with neurons
    # `x` is the input matrix
    #
    # Returns
    # -------
    # Activation matrix after passing through hidden layer
    
    n_observations = size(x)[1]
    activation_matrix = zeros(layer.n_of_neurons, n_observations)
    
        for i = 1:n_observations
            activation_matrix[:, i] = layer.activation_func(layer.weight_matrix * x[i, :]' + layer.bias_vector)
        end
    
    activation_matrix
 end 


 mutable struct ExtremeLearningMachine
    # Extreme Learning Machine
    #
    # Properties
    # ----------
    # `hidden_layer` is the hidden layer inside this ELM
    # `output_weights` is the weight matrix calculated during training
    
    hidden_layer::HiddenLayer
    output_weights::Matrix{Float64}
	
    function ExtremeLearningMachine(n_hidden_neurons::Integer)
	this = new()
	
	weight_matrix =Array{Float64}(undef,0,0)
	bias_vector = rand(n_hidden_neurons)
	this.hidden_layer = HiddenLayer(n_hidden_neurons, weight_matrix,glorot_uniform, bias_vector, sigmoid)
        println("TUTTO OK")
	println("######################### ELM STRUCTURE ##############################")
    println("# Number of Hidden Neurons: ",this.hidden_layer.number_of_neurons)
    println("# Activation Function: ",return_name(this.hidden_layer.activation_function))
    println("######################################################################")
    this

    end
    
end

function compile(elm::ExtremeLearningMachine,input_dim::Integer)
    elm.hidden_layer.weight_matrix=elm.hidden_layer.weight_initializer(input_dim,elm.hidden_layer.number_of_neurons)
    println("compiled")
end

function find_activations(layer::HiddenLayer,x::Matrix{Float64})
# Calculates the activations of the hidden layer neurons
#
# Parameters
# ----------
# `layer` is the HiddenLayer with neurons
# `x` is the input matrix
#
# Returns
# -------
# Activation matrix after passing through hidden layer

n_observations = size(x)[1]
act_matrix = zeros(layer.number_of_neurons, n_observations)
transposedx=x'
for i = 1:n_observations
    act_matrix[:, i] =layer.weight_matrix * transposedx[ :,i] + layer.bias_vector
end
for i=1:size(act_matrix)[1]
    for j=1:size(act_matrix)[2]
        act_matrix[i,j]=layer.activation_function( act_matrix[i,j] ) 
    end
end
act_matrix
end 

function fit!(elm::ExtremeLearningMachine,x,y)
# Trains the elm using the given training data
#
# Parameters
# ----------
# `elm` the ELM to train
# `x` input data
# `y` output data

if typeof(x) == DataFrame
x_mat = float(array(x))
else
x_mat = x
end

if typeof(y) != Vector{Float64}
y_vec = float(array(y))
else
y_vec = y
end


n_observations, n_inputs = size(x_mat)
weight_matrix = rand(elm.hidden_layer.number_of_neurons, n_inputs) * 2 .- 1
elm.hidden_layer.weight_matrix = weight_matrix

act_matrix = find_activations(elm.hidden_layer, x_mat)

output_weights = y_vec' * pinv(act_matrix)
elm.output_weights = output_weights
end

function predict(elm::ExtremeLearningMachine,x)
# Predicts the output
#
# Parameters
# ----------
# `elm` the trained ELM
# `x` input data to predict (Matrix)

if typeof(x) == DataFrame
x_mat = float(array(x))
else
x_mat = x
end

act_matrix = find_activations(elm.hidden_layer, x_mat)
vec(elm.output_weights * act_matrix)
end