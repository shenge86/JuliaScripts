using Luxor, Colors
function strange(dotsize, w=800.0)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    Drawing(w, w, "outputs/strange-vector.png")
    origin()
    background("grey5")
    xinc = w / (xmax - xmin)
    yinc = w / (ymax - ymin)
    # control parameters
    a = 2.24
    b = 0.43
    c = -0.65
    d = -2.43
    e1 = 1.0
    x = y = z = 0.0
    wover2 = w / 2 - 50 # margin
    for j = 1:w
        for i = 1:w
            xx = sin(a * y) - z * cos(b * x)
            yy = z * sin(c * x) - cos(d * y)
            zz = e1 * sin(x)
            x = xx
            y = yy
            z = zz
            if xx < xmax && xx > xmin
                if yy < ymax && yy > ymin
                    xpos = rescale(
                        xx,
                        xmin,
                        xmax,
                        -wover2,
                        wover2,
                    ) # scale to range
                    ypos = rescale(
                        yy,
                        ymin,
                        ymax,
                        -wover2,
                        wover2,
                    ) # scale to range
                    rcolor = rescale(xx, -1, 1, 0.0, 0.6)
                    gcolor = rescale(yy, -1, 1, 0.2, 0.5)
                    bcolor = rescale(zz, -1, 1, 0.6, 0.9)
                    setcolor(rcolor, gcolor, bcolor)
                    move(Point(xpos, ypos))
                    line(Point(xpos + dotsize, ypos))
                    line(Point(
                        xpos + dotsize,
                        ypos + dotsize,
                    ))
                    line(Point(xpos, ypos + dotsize))
                    fillpath()
                end
            end
        end
    end
    finish()
end

strange(.5, 800)

preview()