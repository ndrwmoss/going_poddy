#!/bin/bash
# ${1} = directory
# ${2} = name
# ${3} = url
# ${4} = 0 | 1

local civit=${CIVITAI:-0}
local civ=${4:-0}
local file=/workspace/ComfyUI/models/${1}/${2}
if [[ ! d- "/workspace/ComfyUI/models/${1}" ]]; then
    mkdir /workspace/ComfyUI/models/${1}
fi
if [[ ${civ} != 0 ]]; then
    if [[ ${civit} != 0 ]]; then
        local url="${3}&token=${civit}"
        echo "downloading ${url} to ${file}"
        wget -O ${file} ${url}
    fi
else
    echo "downloading ${3} to ${file}"
    wget -O ${file} ${3}
fi