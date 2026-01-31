if [ $2 == "file" ]; then
    if [ -f "$1" ]; then
        rm "$1"
    fi
else
    if [ -d "$1" ]; then
        rm -r "$1"
    fi
fi