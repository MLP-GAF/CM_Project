using LinearAlgebra
import LinearAlgebra.Eigen
using SparseArrays
#this lib will be used to estimate the executon time
using BenchmarkTools
using Test
using Distributions

function svdCm(A)

   #Where A is the real m x n matrix that we wish to decompose 
   # U is an m x m matrix, 
   # S is an m x n diagonal matrix,  
   # V^T is the  transpose of an n x n matrix where T is a superscript.
#   println("1")
  #@time begin
   
    r,c = size(A)
    shorter=min(r,c)
    longer=max(r,c)
  #end

 # println("2")
  #@time begin
    #we need to calulate eigen values so we square the matrix
  Asq = fill(0., (shorter,shorter))
  mul!(Asq, A', A)
  #end

 # println("3")
 # @time begin
 
  a, V = eigen!(Asq)
  #end
  # To calculate the SVD we need to sort the matrix V and the eigenvalues in a decresing order
  #V, a = sortByArray(V, a) #746.018 ns 
  
  #Builiding the S matrix as a diagonal matrix with the eigenvalues decresly orered on the diagonal

  

  S = sparse(fill(0., (longer,shorter)))
  Sin = sparse(fill(0., (shorter,longer)))
#println("4")
 # @time begin
  

 S[diagind(S)] .= (sqrt.(a))
 Sin[diagind(Sin)] .= 1 ./ S[diagind(S)]
#end
  #=
  we know that 
  A = U S V'
  A V = U S
  U = (A V)/S 
  =#

  U1 = fill(0., (r,c))

 #println("5")
  #@time begin
  mul!(U1, A, V)
  #end
 #println("6")
  U = fill(0., (longer,longer))
 # println(size(U1))
 # println(size(Sin))
#@time begin
    #e' una moltiplicazione tra riga e un elemento nella diagonale
   mul!(U,U1,Sin) #sostituire con una for
  
#end
  return U, S, V
end

#given a matrix and an array, it swaps the columns of the matrix if the value in the array get swapped, if decrese = true it sorts in decresing order
function sortByArray(M, array, decres = true)
  
  V = fill(0.,size(M))

  perm=sortperm(array,rev=decres)
  sortedArray =array[perm]

  V=M[:,perm]

  return V, sortedArray
end


R = rand(Uniform(1., 100.), 10000,1000)
MM = [1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0 ]

C = R
println("size of matrix: ", size(C) )
println("Julia SVD time:")
SVD = @time svd(C)
#display(SVD)

println("SVD time:")
U, S, V =  @time svdCm(C)

F = U * S * V'
#display(F)
@test F ≈ C atol=1e-5

#=
println("U", size(U))
display(U)

println("S", size(S))
display(S)

#println("V", size(V))
display(V)
=#