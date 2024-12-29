using DataFrames
using CSV

diamonds = DataFrame(CSV.File("diamonds.csv"))
println(typeof(diamonds))

# print first 7 rows of diamond data
println(first(diamonds,7))

# print dimensions
println(size(diamonds))

# summary statistics
println(describe(diamonds))