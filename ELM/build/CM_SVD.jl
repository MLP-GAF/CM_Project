using LinearAlgebra
import LinearAlgebra.Eigen
using SparseArrays
#this lib will be used to estimate the executon time



struct SVDCM
	U::Matrix{Float64}
	S::SparseMatrixCSC{Float64, Int64}
	S_inv::SparseMatrixCSC{Float64, Int64}
	V::Matrix{Float64}

	function SVDCM(A::Matrix{Float64})
		U, S, V,S_inv = svdCm(A)
		return new( U, S, S_inv,V)
	end
	function svdCm(A::Matrix{Float64})

		r,c = size(A)
		shorter=min(r,c)
		longer=max(r,c)

		Asq = zeros(shorter,shorter) 
		mul!(Asq, A', A)
		a, V = eigen!(Asq)

		S = sparse(zeros(longer,shorter))
		Sin = sparse(zeros(shorter,longer))

		S[diagind(S)] .= (sqrt.(a))
		Sin[diagind(Sin)] .= 1 ./ S[diagind(S)]

		U1 = zeros(r,c) 
		U = zeros(longer,longer)

		mul!(U1, A, V)
		mul!(U,U1,Sin) 
		return U, S, V, Sin
	end
end

