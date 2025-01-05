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
Type = [
     "space",
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
     "humanity",
     "culture",
     "culture",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "humanity", #
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "space",
     "humanity", #
     "space",
     "space",
     "space",
     "space",
     "humanity", #
     "space",
     "humanity",
     "space",
     "space",
     "space",
     "science",
     "science",
     "space",
     "math",
     "math",
     "space",
     "space",
     "space",
     "culture",
     "space",
     "space",
     "space",
     "science",
     "space",
     "science",
     "science",
     "science",
     "space",
     "culture",
     "space",
     "space",
     "other",
     "other",
     "space",
     "other",
     ],

Growth = [
     "career",
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
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "hobby",
     "hobby",
     "hobby",
     "hobby",
     "hobby",
     "hobby",
     "writings", # 
     "hobby",
     "hobby",
     "hobby",
     "hobby",
     "career",
     "career",
     "career",
     "hobby",
     "hobby",
     "hobby",
     "hobby",
     "hobby",
     "knowledge", #
     "career",
     "career",
     "career",
     "podcast",
     "hobby",
     "hobby",
     "writings",
     "hobby",
     "writings",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "knowledge",
     "writings",
     "hobby",
     "writings",
     "writings",
     "writings",
     "writings",
     "writings",
     "writings",
     "writings",
     "writings",
     "knowledge",
     "writings",
     "writings",
     "writings",
     "writings",
     "writings",
     "hobby",
     "writings",
     "writings",
     "hobby",
     ],

URL = [
     "https://wellfound.com/company/silicon-valley-space-center", 
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
     "https://literoflight.org/", #
     "https://en.wikipedia.org/wiki/Sgt._Slaughter",
     "https://en.wikipedia.org/wiki/Yentl_(film)",
     "https://en.wikipedia.org/wiki/Apollo/Skylab_spacesuit",
     "https://eng.spaceil.com/home-page",
     "https://www.boldlygo.org/",
     "https://www.skycorpinc.com/general-8-1",
     "https://www.spacescience.org/index.php",
     "https://waypoint2space.com/",
     "https://www.activespacetech.com/en/",
     "https://www.clubofrome.org/publications/?filter=cor-reports", #
     "http://english.gyig.cas.cn/rh/rd/200909/t20090902_35232.html",
     "https://www.gozerog.com/research-flights",
     "https://spacehabs.com/",
     "https://www.b2science.org/",
     "https://www.spaceworks.aero/",
     "https://www.sierraspace.com/",
     "https://www.planet.com/",
     "https://psatellite.com/",
     "https://earthlightfoundation.org/",
     "https://spacetango.com/",
     "https://spacearchitect.org/",
     "https://www.upliftaerospace.com/",
     "https://en.wikipedia.org/wiki/Operation_Babylift", #
     "https://www.lunaroutpost.com/",
     "https://redwirespace.com/",
     "https://motivss.com/",
     "https://www.podomatic.com/podcasts/spacecowboybooks",
     "https://thebulletin.org/doomsday-clock/",
     "https://eol.jsc.nasa.gov/",
     "https://onbeing.org/poetry-home/",
     "https://spotthestation.nasa.gov/home.cfm",
     "https://www.supercluster.com/", # 
     "https://en.wikipedia.org/wiki/South_Atlantic_Anomaly",
     "https://en.wikipedia.org/wiki/Granular_convection",
     "https://en.wikipedia.org/wiki/Cheerios_effect",
     "https://en.wikipedia.org/wiki/Herman_Poto%C4%8Dnik",
     "https://en.m.wikipedia.org/wiki/Persi_Diaconis",
     "https://pmc.ncbi.nlm.nih.gov/articles/PMC5111558/",
     "https://www.centauri-dreams.org/",
     "https://earthobservatory.nasa.gov/",
     "http://space.alglobus.net/#writing",
     "https://thecurlychroniclesbyabean.blogspot.com/?m=1",
     "https://moonandback.com/articles/",
     "https://nasawatch.com/",
     "https://dailygalaxy.com/",
     "https://www.asianscientist.com/",
     "https://www.spacemart.com/",
     "https://pubs.aip.org/",
     "https://openstax.org/books/college-physics/pages/1-introduction-to-science-and-the-realm-of-physics-physical-quantities-and-units",
     "https://vixra.org/",
     "https://isulibrary.isunet.edu/?lvl=etagere_see&id=4",
     "https://www.thenewatlantis.com/issues",
     "https://www.thespacereview.com/index.html",
     "https://planetplanet.net/",
     "https://www.geocities.ws/index.php?page=4518&iframe=true&width=80%25&height=80%25",
     "https://sive.rs/about",
     "https://dreamsofspace.blogspot.com/",
     "https://rodfisher.net/bio/",
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