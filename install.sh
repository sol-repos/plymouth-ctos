#!/bin/bash

if [ ! -d /usr/share/plymouth/themes/ ]; then
    echo "Error: /usr/share/plymouth/themes/ does not exist"
    exit 1
fi

sudo mkdir /usr/share/plymouth/themes/ctos || exit 1
sudo cp -t /usr/share/plymouth/themes/ctos/ ./ctos.plymouth ./ctos.script ./images/*.png || exit 1
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/ctos/ctos.plymouth 100 || exit 1
echo "Please select the number of the ctos directory to enable the theme"
sudo update-alternatives --config default.plymouth || exit 1
sudo update-initramfs -u || exit 1

echo "Successfully installed ctOS plymouth theme!"