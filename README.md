# eyeStrainReminder
A simple Python app that help you reduce eye strain (tired eyes) by reminding you to look away for 20 seconds every 20 minutes

Notification that help you reduce eye strain (tired eyes).

**Requirement:**
- Windows 10
- Python 3.X installed

**Install:**
- Download and run Win10Notif_Install.exe only

or:
- Download the repository
- Run Install.bat
- Or you can run the code in console

**Usage:**
- By Default reminder notification are sent every 20 minutes, but feel free to modify it how you want by changing the value of IntervalNotifSec in "Win10Notif_Configuration.ini" (value is in seconds).
  
- By installing it, the script auto start with windows.

- You can add a sound too, just name it "sound.mp3" and place it in this folder: "C:\Users\%USERNAME%\Documents\win10NotifLookAway"

- The file "run" is what keep the script alive, if you want to stop the script delete it and creat it again or use install.bat (it's an empty file with no extension named "run")
  
- You can uninstall it simply by running "Uninstall.bat"
