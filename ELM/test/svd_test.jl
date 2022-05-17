using LinearAlgebra
import LinearAlgebra.Eigen
using SparseArrays
using BenchmarkTools
using Test
using Distributions
using ELM
R = rand(Uniform(1., 100.), 10000,1000)
MM = [1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0; 1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0;1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 2 0 0 0 ]

C = R
println("size of matrix: ", size(C) )


SVD =  svd(C)
mySvd =  SVDCM(C)

println("Julia SVD time:")
SVD = @time svd(C)

println("SVD time:")
mySvd = @time SVDCM(C)

F = mySvd.U * mySvd.S * mySvd.V'
#display(F)
@testset "test predictions" begin
    @test F ≈ C atol=1e-5
end


