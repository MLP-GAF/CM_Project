using CSV
using DataFrames

csv_reader = CSV.File("Datasets/monk1/monks-1.csv")
println(typeof(csv_reader))


df = DataFrame(CSV.File("Datasets/monk1/monks-1.csv",header=0))
select!(df, Not(:Column1))
select!(df, Not(:Column9))
classes=Matrix(select(df,:Column2))
select!(df, Not(:Column2))
df=Matrix(df)
unique(df) .== permutedims(df)