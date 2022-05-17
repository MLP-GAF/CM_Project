using ELM

tests = ["xor.jl","svd_test.jl"]
				
println("Running test:")

for tst in tests
	println(" * $(tst)")
	include(tst)
end