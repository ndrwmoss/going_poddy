#!/bin/bash
$restore=${PWD}
echo "FLUSHING PODDY"
if [[ -d "/going_poddy" ]]; then
    rm -r /going_poddy
fi

echo "HYDRATING PODDY"
git clone https://github.com/ndrwmoss/going_poddy /going_poddy
chmod -R +x /going_poddy/init
chmod -R +x /going_poddy/install
chmod -R +x /going_poddy/command

mv /going_poddy/poddy /poddy
chmod +x /poddy
cd "${restore}"