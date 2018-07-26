#!/bin/bash

##### This script will be used to Install Microsoft Office 2016.


cd ~/Downloads
#curl -O https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_16.15.18070902_Installer.pkg
sudo /usr/sbin/installer -pkg '${HOME}/Downloads/Microsoft_Office_2016_16.15.18070902_Installer.pkg' -target '/Volumes/Macintosh HD/' -applyChoiceChangesXML choices.plist


#    exit 0