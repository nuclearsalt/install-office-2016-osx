#!/bin/bash

###### This is a simple script which will do a silent install of Office 2016.

read -p "Do you want to install Microsoft Office 2016? y/n " choice

	if [[ $choice = "Y" || $choice = "y" ]] ; then 		
		
		# create MS Office directory and move into it

		sudo -S mkdir /MS\ Office
		sudo -S cp choices.plist /MS\ Office/ #move plist file to same folder
		cd /MS\ Office/

		# download Office installer
		
		echo "Downloading Office Installer"
		sudo -S curl -O https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_16.15.18070902_Installer.pkg

		# Install office using plist as answer file

		# the volume specified after "-target" will fail if the root volume is not called 'Macintosh HD'.
		# Also, cannot specify the root volume as / - the shell won't find it, not sure why
		
		sudo -S /usr/sbin/installer -pkg '/MS Office/Microsoft_Office_2016_16.15.18070902_Installer.pkg' -target '/Volumes/Macintosh HD/' -applyChoiceChangesXML /MS\ Office/choices.plist
		echo "Done!"
		
		#add Office apps to dock

		defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Word.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
		defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Excel.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
		defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Powerpoint.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; 
		defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Outlook.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
		
	else	
		echo "Office will not be installed right now."
		exit 0
	fi
