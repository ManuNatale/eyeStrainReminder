from os import path
import time
import os
import sys
import shutil
import ctypes
import locale

# Package check
try:
    from win10toast import ToastNotifier
except:
    os.system('pip install win10toast')
    from win10toast import ToastNotifier

try:
    from playsound import playsound
except:
    os.system('pip install playsound')
    from playsound import playsound

# get language
windll = ctypes.windll.kernel32
windll.GetUserDefaultUILanguage()
userLang = locale.windows_locale[windll.GetUserDefaultUILanguage()]

if userLang.find('fr') != -1:
    toastTitle = 'Fatigue des yeux'
    toastText = 'Regardez ailleur pendant 20 secondes'
else:
    toastTitle = 'Eye strain'
    toastText = 'Look away for 20 seconds'

StartPath = (r'C:\Users\\'+os.getlogin()+'\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup')
progPath = (r'C:\Users\manuele.natale\Documents')

# The program need to check if the file "run"(empty file) is there not continue.
def checkRunFile():
    try:
        runFile = path.exists('C:/Users/'+os.getlogin()+'/Documents/win10NotifLookAway/run')
        if (runFile == True):
            pass
        else:
            print('program exit')
            sys.exit()
    except Exception as e:
        print(e)

# Sleep fonction. Not useful in backgroud use
def waiting(waitTime):
    j = waitTime - 1
    i = 0
    while(i < waitTime):
        print(f'Remaining time : {j}/{waitTime} sec...       ', end='\r')
        time.sleep(1)
        checkRunFile()
        i += 1
        j -= 1

# Main loop
while True:

    waiting(1200) # Change this value for notification interval (in sec)
    
    # Start notification
    toaster = ToastNotifier()
    toaster.show_toast(toastTitle, toastText, duration=7, threaded=True)
    
    # Play sound
    try:
        playsound('C:/Users/'+os.getlogin()+'/Documents/win10NotifLookAway/sound.mp3')
    except:
        pass

    # Wait for threaded notification to finish
    while toaster.notification_active(): time.sleep(0.1)
