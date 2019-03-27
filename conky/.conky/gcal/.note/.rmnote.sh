cd  ~/.conky_maildata/
grep -i -v "$1" ~/.conky/gcal/.note/.note >.temp
mv .temp ~/.conky/gcal/.note/.note
