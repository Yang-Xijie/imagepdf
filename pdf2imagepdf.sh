#!/bin/zsh

# convert pdf to pdf (merge images)

# pdf is portable while some pdfs may consume a lot of time to render.
# We can convert these pdf to images and then merge them to a new pdf.

# use `brew install imagemagick` first

turn=1 # counter

for pdf in **/*.pdf; do
    echo "=====" "[""$turn""]""START" "$pdf" "====="

    # generate temp pngs
    # 300 is a common dpi for pdf
    convert -density 300 "$pdf" temp.png

    # merge temp pngs to pdf
    convert temp-*.png "${pdf%.*}""_image"".pdf"

    # remove temp pngs
    rm temp-*.png

    echo "=====" "[""$turn""]""DONE!" "=====\n\n"
    let turn=$turn+1
done

echo "ALL DONE!\n"
