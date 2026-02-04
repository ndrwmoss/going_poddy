
if [ $2 == "file" ]; then

    if [ -f "$1" ]; then
        rm "$1"
        echo "Deleted file: $1"
    else
        echo "File doesn't exist: $1"
    fi
else
    if [ -d "$1" ]; then
        rm -r "$1"
        echo "Deleted directory: $1"
    else
        echo "Directory doesn't exist: $1"
    fi
fi