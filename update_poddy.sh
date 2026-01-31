cd /
if [ -d "/going_poddy" ]; then
    rm -r /going_poddy
fi
git clone https://github.com/ndrwmoss/going_poddy
mv /going_poddy/install /install
chmode -R +x /install
mv /going_poddy/scripts /scripts
chmod -R +x /scripts
cd /
rm -r /going_poddy