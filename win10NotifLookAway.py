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
    toastText = 'Regarder ailleur pendant 20 secondes'
else:
    toastTitle = 'Eye strain'
    toastText = 'Look away for 20 seconds'

StartPath = (r'C:\Users\\'+os.getlogin()+'\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup')
progPath = (r'C:\Users\manuele.natale\Documents')

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

def waiting(waitTime):
    j = waitTime - 1
    i = 0
    while(i < waitTime):
        print(f'Remaining time : {j}/{waitTime} sec...       ', end='\r')
        time.sleep(1)
        checkRunFile()
        i += 1
        j -= 1

while True:

    waiting(1200) # Change this value for notification interval (in sec)
    
    try:
        playsound('sound.mp3')
    except:
        pass

    toaster = ToastNotifier()
    toaster.show_toast(toastTitle, toastText, duration=7)
