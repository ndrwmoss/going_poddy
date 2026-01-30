#!/bin/bash
# $1 = true (add), false (remove), $2 = node / model / workflow, $3 = name
exists() {
    local $val = jq 'has("'$3'")' $2.json
    return $val
}
subtraction() {
    my_string="123"
    # Use arithmetic expansion to treat it as a number
    result=$((my_string + 0))
    
}
addition() {
    
}
get_value() {
    local $val = jq "'."$3"'" $2.json
    return $val
}
add() {
    tmp=$(mktemp)
    jq '.addy = "1"' $2.json > "$tmp" && mv "$tmp" $2.json
}

remove() {
    if [ $1 == "node" ]; then
        
    elif [ $1 == "model" ]; then

    else

    fi
}

    if [ $1 == true ]; then
        add()
    else
        remove()
    fi

