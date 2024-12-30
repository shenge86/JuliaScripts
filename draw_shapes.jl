using Luxor

#=BASIC TESTS
Luxor drawings in svg and png can be typed from the REPL as such
@svg juliacircles()
@png juliacircles()

=#

#= DRAWING PATHS
https://juliagraphics.github.io/Luxor.jl/stable/tutorial/basicpath/
In Luxor, there's always a current path. 
At the start, just after we set the color to white, the current path is empty. 
The move() function call starts the path by moving to (200, 0), ie 200 units in x (right). 
This sets the current point to Point(200, 0).

The line(Point(250, 100)) function call adds a straight line from the current point down to the point (250, 100).
The current point is now set to (250, 100), and the current path now has two entries. 
We've reached the bottom right corner of this particular path.

The curve() function takes three point arguments, and adds a cubic Bézier curve to the current path. 
The curve runs from the current point to the third point argument, with the first and second point arguments 
defining the Bézier curve's control points. 
These influence the shape of the curve. 
Finally, the current point is updated to the point defined by the third argument.

The closepath() function adds a straight line to the path, joining the current point to the beginning of 
the path (more specifically, to the most recent point moved to). 
The current point is then updated to this point.
=#

@drawsvg begin
background("black")
sethue("white")
move(Point(200, 0))
line(Point(250, 100))
curve(Point(150, 150), Point(0, 100), Point(-200, -200))
closepath()

#=
The final job is to decide what to do with it. 
strokepath() to draw the path using a line with the current settings (width, color, etc).
fillpath() to fill the shape with the current color. 
fillstroke() does both.
=#

#strokepath()
fillstroke()
end


#=DRAWING PATHS
https://juliagraphics.github.io/Luxor.jl/stable/tutorial/basicpath/#Translate,-scale,-rotate
The following code generates a grid of points in a nested loop. At each iteration:

1. gsave() saves the current position, scale, and orientation on an internal stack.
2. The graphics state is translated, scaled, and rotated.
3. The t() function is called, and draws the triangle with the new settings.
4. grestore() throws away any changes to position, scale, and rotation, then restores the 
previous state that was saved with gsave().
=#

function t()
    move(Point(100, 0))
    line(Point(0, -100))
    line(Point(-100, 0))
    closepath()
    strokepath()
end

@drawsvg begin
    background("black")
    sethue("white")
    for x in -250:20:250, y in -250:20:250
            gsave()
             translate(Point(x, y))
             scale(0.1)
             rotate(rand() * 2π)
             t()
            grestore()
    end
end


#=
sethue("black")
p1 = Point(0, -50)
p2 = Point(100, 0)
p3 = Point(0, 65)
map(p -> circle(p, 4, action = :fill), [p1, p2, p3])
sethue("orange")
circle(center3pts(p1, p2, p3)..., action = :stroke)

sethue("red")
p1 = Point(0, 30)
p2 = Point(20, -40)
p3 = Point(50, 5)
circle.((p1, p2, p3), 3, action = :stroke)
circle(p1, p2, p3, action = :stroke)
=#