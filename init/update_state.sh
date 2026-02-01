


local current=jq '.' /poddy_state.json
local downloaded=jq '.' /going_poddy/poddy_state.json

function is_installed() {
    P1=${1}
    local installed=$(jq -r --arg P1 "$P1" '.programs.$P1.installed' file.json)
    return installed
}
function update_programs() {
    local programs=jq '.programs | keys[]' /going_poddy/poddy_state.json
    
}

if [[ jq '.version' ${current} == js '.version' ${downloaded} ]] then;
    echo "state is up to date"
    return 0
else
    echo "updating state"
    update_models()
    /going_poddy/command/delete.sh /poddy_state.json
    mv /going_poddy/poddy_state.json /poddy_state.json
fi

# Source - https://stackoverflow.com/a/40027637
# Posted by peak, modified by community. See post 'Timeline' for change history
# Retrieved 2026-02-01, License - CC BY-SA 4.0

   projectID=$(jq -r --arg EMAILID "$EMAILID" '.resource[] | select(.username==$EMAILID) | .id' file.json)
