using DataFrames
using CSV

#=
Create a csv file based on data found on bookmarks of interest.
=#

function addindex(gdf,Type="space")
    gdfspace  = gdf[(Type,)]
    gdfspace = select(gdfspace, Cols(in(["Type","Growth","URL"])))
    quantity  = 1:nrow(gdfspace)
    # gdfspace.Number = quantity # this will insert to far right which is not what we want
    # gdfspace = select(gdfspace, Not(:Number)) # do not use this since will fail if there is no Number column
    insertcols!(gdfspace, 1, :Number => quantity)
    return gdfspace
end

df = DataFrame(

# what type is it
Type = ["space",
     "space",
     "space",
     "space",
     "culture",
     "culture",
     "culture",
     "culture",
     "culture",
     "culture",
     "zaviation",
     "zaviation",
     "zaviation",
     "zaviation",
     "technology",],

Growth = ["career",
     "life",
     "hobby",
     "career",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",     
     "knowledge",
     "knowledge",],

URL = ["https://wellfound.com/company/silicon-valley-space-center", 
     "https://wellfound.com/startups/industry/aerospace",
     "https://www.seti.org/",
     "https://transastra.com/",
     "https://en.wikipedia.org/wiki/Dean_Martin",
     "https://en.wikipedia.org/wiki/1968_Chicago_riots",
     "https://en.wikipedia.org/wiki/Hi,_Bob",
     "https://en.wikipedia.org/wiki/American_Woman",
     "https://en.wikipedia.org/wiki/Grateful_Dead",
     "https://en.wikipedia.org/wiki/Look_(American_magazine)",
     "https://en.wikipedia.org/wiki/Pitts_Special",
     "https://en.wikipedia.org/wiki/Piper_J-3_Cub",
     "https://en.wikipedia.org/wiki/North_American_T-6_Texan",
     "https://en.wikipedia.org/wiki/Cavalier_Aircraft",
     "https://literoflight.org/",
     ]
)

# insert 
# rows = size(df)[1]
#insert!(df,1,[1,2,3,4,5],:Number)

# display dataframe
sort!(df)
println(df)

# do group by
unique_types = unique(df.Type)
gdf = groupby(df, :Type)

# gdf_temp = addindex(gdf,"space")
# dff = gdf_temp
# for unique_type in unique_types[2:end]
x = Vector()
for unique_type in unique_types
    gdf_temp7 = addindex(gdf, unique_type)
    println(gdf_temp7)
    # addindex(gdf,"space")
    # addindex(gdf,"culture")
    # addindex(gdf,"aviation")
    # dff = combine(vcat(dff,gdf_temp),:)
    push!(x, gdf_temp7)
end

println("SHOW ME WHAT x has now!!!!")
println(x)
# recombine
new_dataframe = x[1]
for dataframe in x[2:end]
    global new_dataframe = vcat(new_dataframe, dataframe)
end
println(new_dataframe)
# new_dataframe = combine(vcat(gdfspace, gdfculture), :)

# write DataFrame to CSV file
CSV.write("outputs/bookmarks.csv",new_dataframe)