using Luxor

#=TUTORIAL GUIDE
https://juliagraphics.github.io/Luxor.jl/dev/howto/text/#Animating-text

Adapted from tutorial here but changed to use a font which can have Chinese characters.
=#

function frame(scene, framenumber)
    background("black")
    sethue("gold")
    #fontface("BigMummy")
    fontface("DengXian")
    fontsize(40)
    textpath("My name is 我叫", boxtopcenter() + (0, 80) , halign=:center)
    tp1 = storepath()
    fontsize(130)
    textpath("Shen 屾", O + (0, 80), halign=:center)
    tp2 = storepath()

    eased_n = scene.easingfunction(framenumber - scene.framerange.start,
        0, 1, scene.framerange.stop - scene.framerange.start)

    for tp in (tp1, tp2)
        drawpath(tp, eased_n, action = :stroke)
    end
end

amovie = Movie(600, 250, "a movie")
animate(amovie, Scene(amovie, frame, 1:250), creategif=true, pathname="outputs/textanimation_shen.gif")