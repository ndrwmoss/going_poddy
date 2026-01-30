echo "Updating Going Poddy"
cd /

git clone https://github.com/ndrwmoss/going_poddy

if [ -d "/install" ]; then
    rm -r /install
fi
mv /going_poddy/install /
chmod -R +x install

if [ -d "/uninstall" ]; then
    rm -r /uninstall
fi
mv /going_poddy/unistall /
chmod -R +x unistall

if [ -d "/util" ]; then
    rm -r /util
fi
mv /going_poddy/util /
chmod -R +x util

if [ -d "/workflows" ]; then
    rm -r /workflows
fi
mv /going_poddy/workflows /