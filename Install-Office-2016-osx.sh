#!/bin/bash -x

###### This is a simple script which will do a silent install of Office 2016.

read -p "Do you want to install Microsoft Office 2016? y/n " choice

	if [[ $choice = "Y" || $choice = "y" ]] ; then 		
		sudo -S mkdir /MS\ Office
		sudo -S cp choices.plist /MS\ Office/
		cd /MS\ Office/
		sudo -S curl -O https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_16.15.18070902_Installer.pkg
		echo "Downloading Office Installer" 
		sudo -S /usr/sbin/installer -pkg '/MS Office/Microsoft_Office_2016_16.15.18070902_Installer.pkg' -target '/Volumes/Macintosh HD/' -applyChoiceChangesXML /MS\ Office/choices.plist
		echo "Done!"
	else
		echo "Office will not be installed right now."
		exit 0
	fi
