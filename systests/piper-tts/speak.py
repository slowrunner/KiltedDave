#!/usr/bin/python3
#
# speak.py   Speaker utilities
#            includes protection from quotes and apostrophes in phrase
#            removes asterisks
#            observes quietTime from 11PM until 10AM
#
#            includes optional vol parameter (range 10-500 useful)
#            includes optional ignore (quietTime) parameter 

#  Aug2024: Changed to use piper-tts

#  Oct2019: increased volume for MonkMakes Amplified Speaker
#           reduced speed to 150wpm (default was 175)
#           switched to espeak-ng (supported, better quality)

#  say(     phrase, vol=125,  anytime=False)
#  whisper( phrase, vol= 50,  anytime=True)
#  shout(   phrase, vol=250,  anytime=False)

# To Use in Bash Files with Parameters
# ~/GoPi5Go/plib/speak.py "Hello ${1} testing" 200
# ~/GoPi5Go/plib/speak.py "Hello ${1} testing" 100 True


import subprocess
import sys
sys.path.append('/home/ubuntu/HumbleDave2/plib')
# import runLog
import time
debug = False
import math
import logging


# create logger
logger = logging.getLogger('speakLog')
logger.setLevel(logging.INFO)

loghandler = logging.FileHandler('/home/ubuntu/HumbleDave2/logs/speak.log')
logformatter = logging.Formatter('%(asctime)s|%(message)s',"%Y-%m-%d %H:%M")
loghandler.setFormatter(logformatter)
logger.addHandler(loghandler)

# QUIET TIME is before 10AM and after 11PM
# (unless told to ignore , then never quietTime

def quietTime(startOK=10,notOK=23,ignore=False):
    timeNow = time.localtime()
    if debug:
        print("time.localtime().tm_hour():",timeNow.tm_hour)
        print("startOK: {} notOK: {}".format(startOK, notOK))
    if (ignore):
        return False
    elif (startOK <= timeNow.tm_hour < notOK):
        return False
    else:
        return True

# Speak a phrase using espeak
# Options: vol: 10 is whisper, 50 is "normal Dave", 200 is shouting, 500 is screaming
#          anytime: True means ignore quietTime check

def say_espeak(phrase,vol=100,anytime=False):

    phrase = phrase.replace("I'm","I m")
    phrase = phrase.replace("'","")
    phrase = phrase.replace('"',' quote ')
    phrase = phrase.replace('*',"")

    # subprocess.check_output(['espeak -ven+f3 -s200 "%s"' %  phrase], stderr=subprocess.STDOUT, shell=True)
    spoken = ""
    if (quietTime(ignore=anytime)):
        print("QuietTime speak request: {} at vol: {}".format(phrase,vol))
        spoken = " - quiet time"
    else:
        # subprocess.check_output(['espeak -ven-us+f5 -a'+str(vol)+' "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
        # subprocess.check_output(['espeak-ng -s150 -ven-us+f5 -a'+str(vol)+' "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
        subprocess.check_output(['espeak-ng -a'+str(vol)+' "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
    logger.info(phrase+spoken)

def say_piper(phrase,vol=100,anytime=False):

    phrase = phrase.replace("I'm","I m")
    phrase = phrase.replace("'","")
    phrase = phrase.replace('"',' quote ')
    phrase = phrase.replace('*',"")

    # subprocess.check_output(['espeak -ven+f3 -s200 "%s"' %  phrase], stderr=subprocess.STDOUT, shell=True)
    spoken = ""
    if (quietTime(ignore=anytime)):
        print("QuietTime speak request: {} at vol: {}".format(phrase,vol))
        spoken = " - quiet time"
    else:
        # subprocess.check_output(['espeak -ven-us+f5 -a'+str(vol)+' "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
        # subprocess.check_output(['espeak-ng -s150 -ven-us+f5 -a'+str(vol)+' "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
        # subprocess.check_output(['espeak-ng -a'+str(vol)+' "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
        # subprocess.check_output(['echo "%s" | piper --model /home/pi/GoPi5Go/models/piper-tts/en_US-arctic-medium.onnx    --output_raw | aplay -D plughw:2,0 -r 22050 -f S16_LE -t raw -' % phrase], stderr=subprocess.STDOUT, shell=True)
        # subprocess.check_output(['./piper.sh "%s"' % phrase], stderr=subprocess.STDOUT, shell=True)
        cmd = "amixer -D pulse sset Master {:d}%".format(int(vol/3))
        # print("cmd:",cmd)
        # subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)

        cmd = '~/HumbleDave2/plib/piper.sh "%s"' % phrase
        subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
        # reset mixer to whisper level
        cmd = "amixer -D pulse sset Master {:d}%".format(40)
        # subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)

    logger.info(phrase+spoken)

def say(phrase,vol=200,anytime=False):
    # say_espeak(phrase,vol,anytime)
    # vol = 50 for HP amplified spkr
    # vol = vol + 40  # adjust for flite
    # say_flite(phrase,vol,anytime)
    say_piper(phrase,vol,anytime)

def shout(phrase,vol=500,anytime=False):
    # say_espeak(phrase,vol,anytime)
    # vol = vol - 50  # adjust for flite
    # say_flite(phrase,vol,anytime)
    say_piper(phrase,vol,anytime)

def whisper(phrase,vol=40,anytime=False):
    # say_espeak(phrase,vol,anytime)
    # vol = vol + 30  # adjust for flite
    # say_flite(phrase,vol,anytime=False)
    say_piper(phrase,vol,anytime)

# ##### MAIN ####
# @runLog.logRun
def main():
    # global debug
    # logger.info("Starting speak.py test main")

    if (len(sys.argv) >1):
        strToSay = sys.argv[1]
        if ( len(sys.argv)>2 ):
            vol=int(sys.argv[2])
        else:
            vol=50
        if ( len(sys.argv)>3 ):
            ignore= ( sys.argv[3] == "True" )
        else:
            ignore=False
        say(strToSay,vol,ignore)
    else:
        debug = True
        say("Just saying. This phrase contained an apostrophe which isn't allowed")
        whisper('I need to whisper.  This phrase contains "a quoted word" ')
        shout("I feel like shouting.  My name is Go Pi 5 Go Dave. ")
        # whisper("Whisper at 20. I don't know Pogo.  Never met the little bot",20,True)
        whisper("Whisper at 30. I don't know Pogo.  Never met the little bot",30,True)

if __name__ == "__main__":
    main()

