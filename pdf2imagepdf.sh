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
    convert -density 300 "$pdf" temp-%03d.png

    # merge temp pngs to pdf
    # pay attention to the order: use %3d instead
    convert temp-*.png "${pdf%.*}"" [image]"".pdf"

    # remove temp pngs
    rm temp-*.png

    echo "=====" "[""$turn""]""DONE!" "=====\n\n"
    let turn=$turn+1
done

echo "ALL DONE!\n"
