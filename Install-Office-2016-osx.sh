#!/bin/bash -x

##### This script will be used to Install Microsoft Office 2016.

sudo -S mkdir /MS\ Office
cd /MS\ Office/

# The link below doesn't seem to be working. 
# Using this link seems to create a master that just opens itself infinitely when double-clicked: https://github.com/nuclearsalt/install-office-2016-osx/archive/master.zip
# sudo -S curl -O https://codeload.github.com/nuclearsalt/install-office-2016-osx/zip/master
open master.zip
cd /MS\ Office/install-office-2016-osx-master/
sudo -S curl -O https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_16.15.18070902_Installer.pkg
sudo -S /usr/sbin/installer -pkg '/MS\ Office/install-office-2016-osx-master/Microsoft_Office_2016_16.15.18070902_Installer.pkg' -target '/Volumes/Macintosh HD/' -applyChoiceChangesXML /MS\ Office/install-office-2016-osx-master/choices.plist
