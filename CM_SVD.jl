using LinearAlgebra
import LinearAlgebra.Eigen
using SparseArrays
#this lib will be used to estimate the executon time
using BenchmarkTools
using Test
using Distributions


struct SVDCM
	U::Matrix{Float64}
	S::SparseMatrixCSC{Float64, Int64}
	V::Matrix{Float64}

	function SVDCM(A::Matrix{Float64})
		U, S, V = svdCm(A)
		return new( U, S, V)
	end
	function svdCm(A::Matrix{Float64})

		r,c = size(A)
		shorter=min(r,c)
		longer=max(r,c)

		Asq = zeros(shorter,shorter) #fill(0., (shorter,shorter))
		mul!(Asq, A', A)
		a, V = eigen!(Asq)

		S = sparse(zeros(longer,shorter))#fill(0., (longer,shorter)))
		Sin = sparse(zeros(shorter,longer))#fill(0., (shorter,longer)))

		S[diagind(S)] .= (sqrt.(a))
		Sin[diagind(Sin)] .= 1 ./ S[diagind(S)]

		U1 = zeros(r,c) #fill(0., (r,c))
		U = zeros(longer,longer)#fill(0., (longer,longer))

		mul!(U1, A, V)
		mul!(U,U1,Sin) #sostituire con una for
		#mul!(U,(A*V),Sin)
		return U, S, V
	end
end



R = rand(Uniform(1., 100.), 10000,1000)
MM = [1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0 ]

C = R
println("size of matrix: ", size(C) )
println("Julia SVD time:")
SVD = @time svd(C)

println("SVD time:")
#U, S, V =  @time svdCm(C)
mySvd = @time SVDCM(C)

F = mySvd.U * mySvd.S * mySvd.V'
#display(F)
@test F ≈ C atol=1e-5

