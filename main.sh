#!/bin/bash
config (){
ImageViewer=/ 2> /dev/null 
AllowedTime=30 #in minutes
AllowedPlays=1
cmd=sol #for demonstration, I use sol installed by default in Ubuntu. Set to your liking
AllowedUser=root #Set to your liking.
ImageViewer=eog #I set this to the Eye of GNOME image viewer. If no GUI or if you don't want an explosion (really?) comment out.
#If you have another desktop change to yor image viewer.
Log=/dev/null #if you want to log this, set to file of your liking
#but make sure you have write permission.
date=$(date)

}
config
if [ "$USER" = $AllowedUser ]
then 
	echo "ACSESS ALLOWED for $AllowedTime minutes."
        at now + $AllowedTime minutes <<< "killall $cmd; $ImageViewer ../files/Explode.gif"
	echo "Session 1: $date" >> $Log
	$cmd
	exit
fi
echo "ACSESS DENIED!"
echo "This UNAUTHORIZED USE has ben recorded."
echo "Violation by $USER $date" >> $Log


