@echo off

del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\win10NotifLookAwayAutoStart.lnk"

echo x=msgbox("The script has been Uninstalled" ,0, "Uninstall") >> msgbox.vbs
start /wait msgbox.vbs

del msgbox.vbs

rmdir /S /Q "C:\Users\%USERNAME%\Documents\win10NotifLookAway"

exit