using Luxor, FFMPEG

#=TUTORIAL GUIDE
https://juliagraphics.github.io/Luxor.jl/dev/howto/text/#Animating-text

Author: Shen
Name: Text creator
Description:
    Adapted from tutorial here but changed to use a font which can have Chinese characters.
    Also uses FFMPEG to create mp4 files
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
#animate(amovie, Scene(amovie, frame, 1:250), creategif=true, pathname="outputs/textanimation_shen.gif")
tempdir = "temp"
animate(amovie, Scene(amovie, frame, 1:250), creategif=false, tempdirectory=tempdir)
FFMPEG.ffmpeg_exe(`-r 30 -f image2 -i $(tempdir)/%10d.png -c:v libx264 -r 30 -pix_fmt yuv420p -y outputs/textanimation_shen.mp4`)