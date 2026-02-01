#!/bin/bash
$restore = $PWD
service nginx start
filebrowser --address=0.0.0.0 --port=8080 --root=/workspace/ --noauth &
cd "$restore"
