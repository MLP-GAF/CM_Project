using Distributions
using LinearAlgebra
#the following are the initializer that can be used
function glorot_uniform(fan_in, fan_out)
    sd = sqrt(6.0 / fan_in + fan_out)
    m = rand(Uniform(-sd, sd), fan_in,fan_out)
    return m
end

function glorot_normal(fan_in, fan_out)
    sd = sqrt(2.0 / fan_in + fan_out)
    m = rand(Uniform(0, sd), fan_in,fan_out)
    return m
end

#The “xavier” weight initialization was found to have problems when used 
#to initialize networks that use the rectified linear (ReLU) activation function.
#Added he
function he_normal(fan_in, fan_out)
    sd = sqrt(2.0 / fan_in)
    m = rand(Uniform(0, (1000*sd)), fan_in,fan_out)
end


