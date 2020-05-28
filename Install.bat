@echo off

if not exist "C:\Users\%USERNAME%\Documents\win10NotifLookAway" mkdir "C:\Users\%USERNAME%\Documents\win10NotifLookAway"

break>"C:\Users\%USERNAME%\Documents\win10NotifLookAway\run"

@echo off
copy "Uninstall.bat" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"
copy "Readme.txt" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"
copy "win10NotifLookAway.py" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"
if not exist "C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart.bat" copy "win10NotifLookAwayAutoStart" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"
if exist "C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart" REN "C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart" "win10NotifLookAwayAutoStart.bat"

rem create shortcut in autostart folder

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\win10NotifLookAwayAutoStart.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%



start pythonw C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAway.py

echo x=msgbox("The script is now added to the autostart folder ! You can remove it in: C:\Users\manuele.natale\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" ,0, "Script at startup") >> msgbox.vbs
start /wait msgbox.vbs

del msgbox.vbs

exit