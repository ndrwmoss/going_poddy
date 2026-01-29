echo "Updating Going Poddy"
cd /
git clone https://github.com/ndrwmoss/going_poddy
if [ -d "/install" ]; then
    rm -r /install
fi
if [ -d "/uninstall" ]; then
    rm -r /uninstall
fi
if [ -d "/workflows" ]; then
    rm -r /workflows
fi
mv /going_poddy/install /
mv /going_poddy/unistall /
mv /going_poddy/workflows /
chmod -R +x install
rm -r /going_poddy