using Luxor, Colors

function hilbert(pointslist::Array{Point, 1},
        start::Point, unitx::Point, unity::Point, depth)
    if depth <= 0
        push!(
            pointslist,
            Point(start.x + (unitx.x + unity.x)/2, start.y + (unitx.y + unity.y)/2))
    else
        hilbert(pointslist, start,
            Point(unity.x/2, unity.y/2),
            Point(unitx.x/2,  unitx.y/2),
            depth-1)
        hilbert(pointslist, Point(start.x + unitx.x/2, start.y + unitx.y/2),
            Point(unitx.x/2, unitx.y/2),
            Point(unity.x/2,  unity.y/2),
            depth-1)
        hilbert(pointslist, Point(start.x + unitx.x/2 + unity.x/2, start.y + unitx.y/2 + unity.y/2),
            Point(unitx.x/2, unitx.y/2),
            Point(unity.x/2,  unity.y/2),
            depth-1)
        hilbert(pointslist, Point(start.x + unitx.x/2 + unity.x, start.y + unitx.y/2 + unity.y),
            Point(-unity.x/2, -unity.y/2),
            Point(-unitx.x/2, -unitx.y/2),
            depth-1)
    end
    return pointslist
end

function frame(scene, framenumber)
    background("black")
    hilbertcurve, mesh1 = scene.opts
    setmesh(mesh1)
    setline(3)
    eased_n = scene.easingfunction(framenumber, 0, 1, scene.framerange.stop)
    hilbertpath = polyportion(hilbertcurve, eased_n, closed=false)
    poly(hilbertpath, :stroke)
    circle(hilbertpath[end], 8, :fill)
end

function main()
    hilbertcurve = hilbert(Point[], O - (128, 128), Point(256, 0), Point(0, 256), 5)
    hilbertmovie = Movie(400, 400, "hilbertmovie")
    backdrop(scene, framenumber) =  background("black")
    mesh1 = mesh(ngon(O, 256, 4, π/4, vertices=true), [
    RGB(Luxor.julia_red...), RGB(Luxor.julia_green...), RGB(Luxor.julia_purple...), RGB(Luxor.julia_blue...)])
    animate(hilbertmovie, [
        Scene(hilbertmovie, backdrop, 0:400),
        Scene(hilbertmovie, frame,    0:400, optarg = (hilbert=hilbertcurve, mesh=mesh1),
            easingfunction=easeinoutsine)],
        creategif=true,
        pathname="outputs/hilbertanimation.gif")
end

main()