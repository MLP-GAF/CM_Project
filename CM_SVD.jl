using LinearAlgebra
import LinearAlgebra.Eigen

#this lib will be used to estimate the executon time
using BenchmarkTools

function svdCm(A)

   #Where A is the real m x n matrix that we wish to decompose 
   # U is an m x m matrix, 
   # S is an m x n diagonal matrix,  
   # V^T is the  transpose of an n x n matrix where T is a superscript.
  n,m = size(A)
  shortSize = min(n,m)
  longSize = max(n,m)

  #Asq = fill(0., (longSize,longSize))
  #we need to calulate eigen values so we square the matrix
  #mul!(Asq, A', A) 
  Asq = A' * A
  #display(Asq)

  # V is equal to the eigenvectors of the eigenvalues of A
  a = eigvals(Asq) #1.930 ms
  V = eigvecs(Asq) #4.857 ms
  # To calculate the SVD we need to sort the matrix V and the eigenvalues in a decresing order
  V, a = sortByArray(V, a) #746.018 ns

  
  #Builiding the S matrix as a diagonal matrix with the eigenvalues decresly orered on the diagonal
  S = fill(0., (n,m))
  Sin = fill(0., (shortSize,longSize))

  i=1
  while i<= shortSize

    if (a[i]>1e-6)
      S[i,i] = sqrt(Complex(a[i])) 
      
      Sin[i,i] = 1/sqrt(Complex(a[i]))    
        
    else
      S[i,i] = 0
      
      Sin[i,i] = 0
      
    end 

    i+=1
  end

  #println("sin size ", size(Sin))
  #=
  we know that 
  A = U S V'
  A V = U S
  U = (A V)/S 
  =#

  #Folowing two lines 22.900 ms
  U1 = fill(0., size(A))
  mul!(U1, A, V)

  if (n<m)
    U = U1 / S 
  else
    #U = U1 / S 
    U = fill(0., (longSize,longSize))
    mul!(U,U1,Sin)
  end

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

M = [4. 0.; 3. -5.]
D = [-4. -17.; 2. 2.]
PP=[1. 2.; 3. 4.]
B = [3 2 2 1 2 3; 2 3 -2 1 2 3]
C = [0.8147 0.6324 0.9575; 0.9058 0.0975 0.9649; 0.1270 0.2785 0.1576; 0.9134 0.5469 0.9706] 

MM = [1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0 ]

println("Julia SVD time:")
SVD = @btime svd(C)
#display(SVD)

println("SVD time:")
U, S, V = @btime svdCm(C)
println("U", size(U))
println("S", size(S))
println("V", size(V))

F = U * S * V'
display(F)
#=
println("U")
display(U)
println("S")
display(S)
println("V")
display(V)
=#