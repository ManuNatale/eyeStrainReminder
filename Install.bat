@echo off

echo Installing...

if exist "C:\Users\%USERNAME%\Documents\win10NotifLookAway" rmdir /S /Q "C:\Users\%USERNAME%\Documents\win10NotifLookAway"
timeout /t 2 /nobreak
if not exist "C:\Users\%USERNAME%\Documents\win10NotifLookAway" mkdir "C:\Users\%USERNAME%\Documents\win10NotifLookAway"

break>"C:\Users\%USERNAME%\Documents\win10NotifLookAway\run"
break>"C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart.bat"
rem write autostar .bat file
@echo @echo off> C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart.bat
@echo start pythonw C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAway.py>> C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart.bat
@echo exit>> C:\Users\%USERNAME%\Documents\win10NotifLookAway\win10NotifLookAwayAutoStart.bat

copy "Uninstall.bat" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"
copy "Readme.txt" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"
copy "win10NotifLookAway.py" "C:\Users\%USERNAME%\Documents\win10NotifLookAway\"

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

start explorer C:\Users\%USERNAME%\Documents\win10NotifLookAway

echo x=msgbox("The script is now added to the autostart folder ! You can remove it in: C:\Users\manuele.natale\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" ,0, "Script at startup") >> msgbox.vbs
start msgbox.vbs

timeout /t 1 /nobreak

del msgbox.vbs

exit