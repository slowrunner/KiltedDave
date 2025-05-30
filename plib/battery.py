#!/usr/bin/python3

# FILE: battery.py

# PURPOSE:  Central facts and methods for the ModRobotics/TalentCell YB1203000 Li-Ion Battery Pack
#           12.6v to 9v 3A "3000mAh" Battery Pack
#

import sys
sys.path.insert(1,"/home/ubuntu/KiltedDave/plib/")
from noinit_easygopigo3 import EasyGoPiGo3

CHARGING_ADJUST_V = 0.37    # When charging the GoPiGo3 reading is closer to the actual battery voltage
REV_PROTECT_DIODE = 0.9    # The GoPiGo3 has a reverse polarity protection diode drop of 0.6v to 0.8v (n=2)
                            # This value results in average readings vs battery voltage error of +/- 0.03
SAFETY_SHUTDOWN_vBatt = 9.75   # Battery Discharge Protection Circuit allows down to 8.15v (9.75 leaves ~15m reserve)
SAFETY_SHUTDOWN_vReading = SAFETY_SHUTDOWN_vBatt - REV_PROTECT_DIODE   # 8.5v EasyGoPiGo3.volt() reading
WARNING_LOW_vBatt = 10.0       # Give (~20 minutes) Advance Warning before safety shutdown

def vBatt_vReading(egpg):
	vReading = egpg.volt()
	if (vReading > 11.7):
	  # charging
	  vBatt = vReading + REV_PROTECT_DIODE - CHARGING_ADJUST_V
	  # print("charging")
	else:
	  vBatt = vReading + REV_PROTECT_DIODE
	return vBatt,vReading

def voltages_string(egpg):
        vBatt, vReading = vBatt_vReading(egpg)
        return "Current Battery {:.1f}v EasyGoPiGo3 Reading {:.2f}v".format(vBatt,vReading)

def too_low(egpg):
	vBatt, _ = vBatt_vReading(egpg)
	return vBatt < SAFETY_SHUTDOWN_vBatt

def on_last_leg(egpg):
	vBatt, _ = vBatt_vReading(egpg)
	return vBatt < WARNING_LOW_vBatt



def testMain():
	egpg = EasyGoPiGo3(use_mutex=True, noinit=True)
	print(voltages_string(egpg))

if __name__ == '__main__': testMain()
