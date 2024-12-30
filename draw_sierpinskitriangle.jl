using Luxor, Colors

dim = 500
Drawing(dim,dim,"outputs/sierpinskitriangle.png")
background("black")
origin()

function triangle(points, degree)
    sethue(cols[degree])
    poly(points, action = :fill)
end

function sierpinski(points, degree)
    triangle(points, degree)
    if degree > 1
        p1, p2, p3 = points
        sierpinski([p1, midpoint(p1, p2),
                        midpoint(p1, p3)], degree-1)
        sierpinski([p2, midpoint(p1, p2),
                        midpoint(p2, p3)], degree-1)
        sierpinski([p3, midpoint(p3, p2),
                        midpoint(p1, p3)], degree-1)
    end
end

function draw(n)
    # circle(Point(0, 0), dim/2, :clip)
    points = ngon(Point(0, 50), dim-220, 3, -π/2, vertices=true)
    sierpinski(points, n)
end

depth = 12 # 12 is ok, 20 is right out (on my computer, at least)
cols = distinguishable_colors(depth) # from Colors.jl
draw(depth)

finish()
preview()
