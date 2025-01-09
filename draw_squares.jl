using Luxor, Colors

begin
    #d = Drawing(800, 800, :svg)
    d = Drawing(800, 800, "outputs/squares.png")
    origin()
    for (n, m) in enumerate(exp10.(range(0.0, 2, step=0.2)))
        setmesh(mesh(convert(Vector{Point}, BoundingBox()/m),
            ["darkviolet","gold2", "firebrick2", "slateblue4"]))
        rotate(π/7)
        paint()
    end
    finish()
    d
end