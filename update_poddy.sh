$restore=${PWD}
cd /
echo "FLUSING THE OLD PODDY"
if [[ -d "/going_poddy" ]]; then
    rm -r /going_poddy
fi
echo "HYDRATING A NEW PODDY"
git clone https://github.com/ndrwmoss/going_poddy
# This command works by:
# find .: Starts the search from the current directory (.) and proceeds recursively into all subdirectories.
# -type f: Ensures that only regular files (not directories or links) are selected.
# -name "*.sh": Filters the results to include only files whose names end with the .sh extension. You can also use -iname "*.sh" for a case-insensitive search.
# -exec chmod +x {} \;: Executes the chmod +x command on each file ({}) found by the find command. The escaped semicolon (\;) indicates the end of the -exec command. 
chmod -R +x /going_poddy/init
chmod -R +x /going_poddy/install
chmod -R +x /going_poddy/command
/going_poddy/init/update_state.sh
/going_poddy/command/delete.sh /going_poddy/Dockerfile
/going_poddy/command/delete.sh /going_poddy/update_poddy.sh
/going_poddy/command/delete.sh /going_poddy/Dockerfile
cd "$restore"