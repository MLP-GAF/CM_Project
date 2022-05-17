using Test
elm = ExtremeLearningMachine(100)

# Testing XOR
x = [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]
y = [0.0, 1.0, 0.0, 1.0]
println("Fitting")
fit!(elm, x, y)
println("predicting")
y_pred = predict(elm, [1 1.; 0 1; 1 1])
@testset "test predictions" begin
    @test y_pred[1] < 0.2
    @test y_pred[2] > 0.8
    @test y_pred[3] < 0.2
end
println("Done")
