#!/bin/bash

# Root Check
if [ $EUID -ne 0 ]
        then
                echo "This program must run as root to function." 
                exit 1
fi

# Installs Fish

pacman -S fish --noconfirm
git clone https://github.com/jraffstar/linux-setup.git

cd ~

if [ -d ".config" ]
then
	echo "Replacing .config directory"
	sleep 3s
	rm -rf .config
	cp -r ~/linux-setup/config ~/.config
else
	echo "Creating .config"
	cp -r ~/linux-setup/config/ ~/.config
fi

echo "Making Fish default shell"
chsh -s /bin/fish

sleep 2s
echo "done"
clear