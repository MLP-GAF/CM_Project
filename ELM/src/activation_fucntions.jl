#the followng are all the activatoin functions avalible
function sigmoid(x)  
    return 1 ./ (1 + exp(-x))
 end
 
 function hardlim(x)
     if x <0 
         return 0
     else
         return 1
     end    
 end
 
 function linear(x)
     return x
 end
 
 function LeakyReLU(x::Float64,alpha=0.3)
 
     if x<0
         return alpha*x
     else
         return x
     end
 end
 
 function relu(x)
     return maximum!(0,x)
 end
 
 function elu(x,alpha)
     if z >= 0
         z = x
     else
         alpha*(exp(z) -1)
     end
     return z 
 end
 
 