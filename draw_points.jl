using Luxor

m = 600
n = 600
dd = Drawing(m, n, "outputs/randompoints.png")
# Drawing()
background("black")
# b = blend(
#         boxtopleft(BoundingBox()),
#         boxbottomright(BoundingBox()),
#         "red",
#         "green")

# addstop(b, 0.3, "orange")
# addstop(b, 0.4, "magenta")
# addstop(b, 0.5, "cyan")
# addstop(b, 0.7, "yellow")
# setblend(b)

# # DO NOT SET THE MULTIPLICATOR TO BOUNDING BOX TO BE LARGER THAN 14
# for pt in randompointarray(BoundingBox(), 15)
#     d = rescale(distance(pt, O), 0, sqrt(800 * 500), 1, 0)
#     circle(pt, 1 + 7d, action = :fill)
# end

# randompointarray(point1, point2, n) method generates n random points in the area bounded by two points, 
# using Julia's random number generator.

pt1 = Point(-m, -n)
pt2 = Point(m, n)

sethue("purple")
map(pt -> circle(pt, 6, action = :fill), (pt1, pt2))
box(pt1, pt2, action = :stroke)

sethue("blue")
map(pt -> circle(pt, 4, action = :fill), randompointarray(pt1, pt2, 200))

sethue("red")
map(pt -> circle(pt, 4, action = :fill), randompointarray(pt1, pt2, 200))

sethue("green")
map(pt -> circle(pt, 4, action = :fill), randompointarray(pt1, pt2, 200))

finish()
preview()