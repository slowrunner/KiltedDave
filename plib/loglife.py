#!/usr/bin/env python3
#
# loglife.py   digital entity to log each three minutes of life
#              to /home/ubuntu/KiltedDave/life.log
#
# with sudo crontab -e
#      @reboot /home/ubuntu/KiltedDave/nohup_loglife.py
# touch /home/ubuntu/KiltedDave/life.log
# chmod 777 /home/ubuntu/KiltedDave/life.log
#

import time
import sys
sys.path.insert(1,"/home/ubuntu/KiltedDave/plib/")
import multiprocessing
import logging
import traceback
import signal
from noinit_easygopigo3 import EasyGoPiGo3
import battery

# create logger
logger = logging.getLogger('lifelog')
logger.setLevel(logging.INFO)
loghandler = logging.FileHandler('/home/ubuntu/KiltedDave/logs/life.log')
logformatter = logging.Formatter('%(asctime)s|%(message)s',"%Y-%m-%d %H:%M")
loghandler.setFormatter(logformatter)
logger.addHandler(loghandler)

debugLevel = 0

# ######### CNTL-C #####
# Callback and setup to catch control-C and quit program

_funcToRun=None

def signal_handler(signal, frame):
  if debugLevel: print('\n** Control-C Detected')
  if (_funcToRun != None):
     _funcToRun()
  sys.exit(0)     # raise SystemExit exception

# Setup the callback to catch control-C
def set_cntl_c_handler(toRun=None):
  global _funcToRun
  _funcToRun = toRun
  signal.signal(signal.SIGINT, signal_handler)


class digitalEntity():

  # CLASS VARS (Avail to all instances)
  # Access as X.class_var_name

  pHandle=None   # the SINGLE execution thread for the X class
  defaultSleep=180.0  # sleep for 3 minutes by default

  # end of class vars definition

  def __init__(self,dEname,tSleep=defaultSleep):     #run about once a minute 
    # SINGLETON TEST 
    if (digitalEntity.pHandle!=None): 
        if debugLevel: print("Second digitalEntity, not starting")
        return None

    # INITIALIZE CLASS INSTANCE

    # START A Process
    # process target must be an instance
    digitalEntity.pHandle = multiprocessing.Process(name=dEname, target=self.dEmain, 
                                               args=(tSleep,))
    digitalEntity.pHandle.start()
    if debugLevel: print("%s.digitalEntity told to start" % dEname)
  #end init()

  # digitalEntity main process
  def dEmain(self,tSleep=defaultSleep):
    myname = multiprocessing.current_process().name
    time.sleep(60)  # wait for network date time sync
    logger.info("------------ boot ------------")
    if debugLevel: print("%s.dEmain started with tSleep=%f" % (myname,tSleep))
    # logger.info('%s.dEmain started',myname)
    egpg = EasyGoPiGo3(use_mutex=True,noinit=True)
    logger.info(battery.voltages_string(egpg))
    del egpg
    i=0
    while True:
        time.sleep(tSleep)
        i+=0.05  # every three minutes is .05 hours
        if debugLevel: print("%s.dEmain execution %.2f" % (myname,i))
        logger.info('%s.dEmain execution: %.2f',myname, i )


    if debugLevel: print("dEmain end reached")

  def cancel(self):
     myname = multiprocessing.current_process().name
     if debugLevel: print("%s.cancel() called" % myname)
     logger.info('%s.cancel() called',myname)
     if debugLevel: print("\nWaiting for %s dE.workerThread to quit\n" % self.pHandle.name)
     self.pHandle.join()
     if debugLevel: print("%s.cancel() complete" % myname)


# ##### digitalEntity tt ######
#

def main():

  tt=digitalEntity(dEname="lifelogger",tSleep=180)  #create
  set_cntl_c_handler(tt.cancel)

  try:
    while True:
      if debugLevel: print("\n loglife.py: main()")
      time.sleep(180)
    #end while
  except SystemExit:
    if debugLevel: print("loglife.py: Bye Bye")
  except:
    if debugLevel: print("Exception Raised")
    traceback.print_exc()

if __name__ == "__main__":
    main()




