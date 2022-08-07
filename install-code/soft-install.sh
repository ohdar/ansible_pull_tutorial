#!/bin/bash
#Purpose: This file is demonstrating case statement
#Version: 1.0
#Created Date: Thu 4 Aug 01:27:28 IST 2022
#Modified Date:
#Author: Brajesh Ohdar
# START #
# ------------------------------- #

echo "You are Going to Install following softwares"
echo "1. Brave Browser"
echo "2. Chrome Browser"
echo "3. Microsoft Edge Browser"
echo "4. VSCode Editor"
echo "5. Vivaldi Browser"

echo -e "Do you want to perform this operation[y/n]: \c"
read -r choice

if [ $choice = y -o $choice =Y ]; then 

        echo "Installing Brave Browser....."
        #Installing Brave on Debian Based Linux
        sudo apt install apt-transport-https curl
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install brave-browser

        echo "Installing Chrome Browser....."
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
        sudo apt-get update 
        sudo apt-get install google-chrome-stable

        echo "Installing Microsoft Edge Browser....."
        ## Setup
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
        sudo rm microsoft.gpg
        ## Install
        sudo apt update
        sudo apt install microsoft-edge-beta


        echo "Installing Microsoft VSCode Editor....."
        # Visual Studio Code on Ubuntu Linux
        sudo apt-get install wget gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg
        sudo apt install apt-transport-https
        sudo apt update
        sudo apt install code # or code-insiders

        echo "Installing Vivaldi Browser....."
        sudo apt install wget
        wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg
        echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list
        sudo apt update 
        sudo apt install vivaldi-stable

        # sudo apt remove vivaldi-stable
else
        echo "Thanks for your choice";
        # sudo apt remove microsoft-edge-stable
        sudo apt purge microsoft-edge-stable
        sudo apt-get purge google-chrome-stable
        sudo apt -y remove brave-browser && sudo apt -y purge brave-browser && rm -rf ~/.config/BraveSoftware && rm -rf ~/.cache/BraveSoftware
        sudo apt purge code && rm -fr ~/.vscode
        sudo apt-get purge-vivaldi-stable

fi


# ------------------------------- #
# END #
# ---------------XXXXX---------------- #
# Execute below commands in terminal for this file and spot the difference
# sudo chmod +x filename.sh
# ./filename.sh
# ./filename.sh options if required
# sh filename.sh
