using Luxor, FFMPEG


font_size = 22
font_hue = "rebeccapurple"
backdrop(scene, framenumber) =  background("grey10")

function frame(scene, framenumber)
    #background("gray")
    sethue(font_hue)
    #fontface("BigMummy")
    fontface("CourierNew")

    # title
    fontsize(30)
    textpath("Athena Meeting Artemis", boxtopcenter() + (0, 30) , halign=:center)
    tp1 = storepath()

    # line1
    fontsize(font_size)
    textpath("The steely gray winter sky rings a metallic tone", O + (0, -40) , halign=:center)
    tp2 = storepath()
    
    eased_n = scene.easingfunction(framenumber - scene.framerange.start,
        0, 1, scene.framerange.stop - scene.framerange.start)

    for tp in (tp1, tp2)
        drawpath(tp, eased_n, action = :stroke)
    end
end

function frame2(scene, framenumber)
    # line2
    sethue("white")
    fontface("CourierNew")

    fontsize(30)
    textpath("Athena Meeting Artemis", boxtopcenter() + (0, 30) , halign=:center)
    tp1 = storepath()    

    fontsize(font_size)
    textpath("The steely gray winter sky rings a metallic tone", O + (0, -40) , halign=:center)
    tp2 = storepath()    

    # draw static words (do not animate now)
    for tp in (tp1, tp2)
        drawpath(tp, action=:stroke)
    end

    sethue(font_hue)
    fontsize(font_size)
    textpath("Uniform clouds are but temporary occlusions of space beyond", O + (0, -10), halign=:center)
    tp = storepath()

    eased_n = scene.easingfunction(framenumber - scene.framerange.start,
        0, 1, scene.framerange.stop - scene.framerange.start)
    
    drawpath(tp, eased_n, action = :stroke)
end

function frame3(scene, framenumber)
    # line2
    sethue("white")
    fontface("CourierNew")

    fontsize(30)
    textpath("Athena Meeting Artemis", boxtopcenter() + (0, 40) , halign=:center)
    tp1 = storepath()    

    fontsize(font_size)
    textpath("The steely gray winter sky rings a metallic tone", O + (0, -40) , halign=:center)
    tp2 = storepath()    
    
    textpath("Uniform clouds are but temporary occlusions of space beyond", O + (0, -10), halign=:center)
    tp3 = storepath()

    # draw static words (do not animate now)
    for tp in (tp1, tp2, tp3)
        drawpath(tp, action=:stroke)
    end

    sethue(font_hue)
    textpath("The heavens above used to be the realm of primal gods", O + (0, 20), halign=:center)
    tp = storepath()

    eased_n = scene.easingfunction(framenumber - scene.framerange.start,
        0, 1, scene.framerange.stop - scene.framerange.start)
    
    drawpath(tp, eased_n, action = :stroke)
end

function frame4(scene, framenumber)
    # line2
    sethue("white")
    fontface("CourierNew")

    fontsize(30)
    textpath("Athena Meeting Artemis", boxtopcenter() + (0, 40) , halign=:center)
    tp1 = storepath()    

    fontsize(font_size)
    textpath("The steely gray winter sky rings a metallic tone", O + (0, -40) , halign=:center)
    tp2 = storepath()    
    
    textpath("Uniform clouds are but temporary occlusions of space beyond", O + (0, -10), halign=:center)
    tp3 = storepath()

    textpath("The heavens above used to be the realm of primal gods", O + (0, 20), halign=:center)
    tp4 = storepath()

    # draw static words (do not animate now)
    for tp in (tp1, tp2, tp3, tp4)
        drawpath(tp, action=:stroke)
    end

    sethue(font_hue)
    textpath("Our closest neighbor -- Greeks called her Artemis.", O + (0, 50), halign=:center)
    tp = storepath()

    eased_n = scene.easingfunction(framenumber - scene.framerange.start,
        0, 1, scene.framerange.stop - scene.framerange.start)
    
    drawpath(tp, eased_n, action = :stroke)
end

function frame5(scene, framenumber)    
    sethue("white")
    fontface("CourierNew")

    fontsize(30)
    textpath("Athena Meeting Artemis", boxtopcenter() + (0, 40) , halign=:center)
    tp1 = storepath()    

    fontsize(font_size)
    textpath("The steely gray winter sky rings a metallic tone", O + (0, -40) , halign=:center)
    tp2 = storepath()    
    
    textpath("Uniform clouds are but temporary occlusions of space beyond", O + (0, -10), halign=:center)
    tp3 = storepath()

    textpath("The heavens above used to be the realm of primal gods", O + (0, 20), halign=:center)
    tp4 = storepath()

    textpath("Our closest neighbor -- Greeks called her Artemis.", O + (0, 50), halign=:center)
    tp5 = storepath()

    # draw static words (do not animate now)
    for tp in (tp1, tp2, tp3, tp4, tp5)
        drawpath(tp, action=:stroke)
    end

    sethue(font_hue)
    textpath("The huntress, the moon, the ever-dancing light.", O + (0, 90), halign=:center)
    tp = storepath()

    eased_n = scene.easingfunction(framenumber - scene.framerange.start,
        0, 1, scene.framerange.stop - scene.framerange.start)
    
    drawpath(tp, eased_n, action = :stroke)
end


function frame7(scene, framenumber)
    sethue("white")
    fontface("CourierNew")

    fontsize(30)
    textpath("Athena Meeting Artemis", boxtopcenter() + (0, 40) , halign=:center)
    tp1 = storepath()    

    fontsize(font_size)
    textpath("The steely gray winter sky rings a metallic tone", O + (0, -40) , halign=:center)
    tp2 = storepath()    
    
    textpath("Uniform clouds are but temporary occlusions of space beyond", O + (0, -10), halign=:center)
    tp3 = storepath()

    textpath("The heavens above used to be the realm of primal gods", O + (0, 20), halign=:center)
    tp4 = storepath()

    textpath("Our closest neighbor -- Greeks called her Artemis.", O + (0, 50), halign=:center)
    tp5 = storepath()

    textpath("The huntress, the moon, the ever-dancing light.", O + (0, 90), halign=:center)
    tp6 = storepath()

    # draw static words (do not animate now)
    for tp in (tp1, tp2, tp3, tp4, tp5, tp6)
        drawpath(tp, action=:stroke)
    end

    # sethue("red")
    # eased_n = scene.easingfunction(framenumber - scene.framerange.start, 
    #     0, 1, scene.framerange.stop - scene.framerange.start)

    # circle(Point(-180 + (360 * eased_n), 0), 50, :fill)

    #background("grey10")
    sethue("rebeccapurple")
    setline(3)
    circle(Point(0, 0), 100, :stroke)
    cs, ic = circlering(Point(0, 0), 100, 10)
    for c in cs
        circle(first(c), last(c), :stroke)
    end
    circle(first(ic), last(ic), :stroke)
end

framerange = 300
amovie = Movie(600, framerange, "a movie")
# animate(amovie, [
#     Scene(amovie, backdrop, 1:framerange),
#     Scene(amovie, frame, 1:50), 
#     Scene(amovie, frame2, 51:100), 
#     Scene(amovie, frame3, 101:150), 
#     Scene(amovie, frame4, 151:200), 
#     Scene(amovie, frame5, 201:250), 
#     Scene(amovie, frame7, 251:300), 
#     ],
#     creategif=true, 
#     pathname="outputs/textanimation_poem1.gif")

tempdir = "temp"
animate(amovie, [
    Scene(amovie, backdrop, 1:framerange),
    Scene(amovie, frame, 1:50), 
    Scene(amovie, frame2, 51:100), 
    Scene(amovie, frame3, 101:150), 
    Scene(amovie, frame4, 151:200), 
    Scene(amovie, frame5, 201:250), 
    Scene(amovie, frame7, 251:300), 
    ],
    creategif=false, 
    tempdirectory=tempdir)
FFMPEG.ffmpeg_exe(`-r 30 -f image2 -i $(tempdir)/%10d.png -c:v libx264 -r 30 -pix_fmt yuv420p -y outputs/textanimation_poem1.mp4`)