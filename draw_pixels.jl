using Luxor, Colors

A = zeros(ARGB32, 400, 800)
Drawing(A)
f(z) = (z + 3)^3 / ((z + 2im) * (z - 2im)^2)
function pixelcolor(r, c;
        rows=100,
        cols=100)
    z = rescale(r, 1, rows, -2π, 2π) + rescale(c, 2π, cols, -2π, 2π) * im
    n = f(z)
    h = 360rescale(angle(n), 0, 2π)
    s = abs(sin(π / 2 * real(f(z)))) # * (sin(π * imag(f(z)))))
    v = abs(sin(2π * real(f(z))))
    return HSV(h, s, v)
end
for r in 1:size(A, 1), c in 1:size(A, 2)
    A[r, c] = pixelcolor(r, c, rows=400, cols=800)
end
w, h = 800, 400
transform([0 1 1 0 h/2 w/2])
fontsize(18)
sethue("white")
text("f(z) = (z + 3)^3 / ((z + 2im) * (z - 2im)^2)",
    Point(0, h/2 - 30), halign=:center)
A

w, h = 800, 400
# Drawing(800, 400, :png)
Drawing(800, 400, "outputs/complexhue.png")
origin()
#placeimage(A, O - (w / 2, h / 2), alpha=0.3)
#julialogo(centered=true, action=:clip)
placeimage(A, O - (w / 2, h / 2))
#clipreset()
#julialogo(centered=true, action=:path)
sethue("white")
strokepath()
finish()
preview()