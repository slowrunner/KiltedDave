#!/bin/bash

repo=KiltedDave

# sudo useradd -m -g ubuntu pi
# sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,netdev,render,input,gpio,spi,i2c pi
# sudo chmod 777 /home/pi
sudo apt install -y python3-spidev
sudo apt install -y python3-pip
sudo apt install -y python3-libgpiod
sudo apt install -y espeak-ng

echo -e "Get Dexter/GoPiGo3/"
git clone http://www.github.com/DexterInd/GoPiGo3.git /home/pi/Dexter/GoPiGo3
echo -e "Get Dexter/DI_Sensors/"
git clone https://github.com/DexterInd/DI_Sensors.git /home/pi/Dexter/DI_Sensors
echo -e "Get Dexter/RFR_Tools/"
git clone https://github.com/DexterInd/RFR_Tools.git /home/pi/Dexter/lib/Dexter/RFR_Tools
echo -e "Get list of serial numbers"
cp /home/pi/Dexter/GoPiGo3/Install/list_of_serial_numbers.pkl /home/pi/Dexter/.list_of_serial_numbers.pkl
echo -e "setup non-root access rules"
sudo cp ~/$repo/config/99-com.rules /etc/udev/rules.d
echo -e "install requirements libffi-dev and python3-curtsies"
sudo apt install -y libffi-dev    
sudo apt install -y --no-install-recommends python3-curtsies

echo -e "setup RFR_TOOLS"
cd /home/pi/Dexter/lib/Dexter//RFR_Tools/miscellaneous/
sudo mv di_i2c.py di_i2c.py.orig
sudo mv setup.py setup.py.orig
sudo cp ~/$repo/config/gpg_sw_changes/i2c/di_i2c.py.bookworm di_i2c.py
sudo cp ~/$repo/config/gpg_sw_changes/RFR_Tools/setup.py .
sudo python3 setup.py install

echo -e "install smbus-cffi python package"
sudo pip install smbus-cffi --break-system-packages

echo -e "setup GoPiGo3 Python API"
cd /home/pi/Dexter/GoPiGo3/Software/Python
sudo mv setup.py setup.py.orig
sudo cp ~/$repo/config/gpg_sw_changes/GPG_Soft_Python/setup.py .
sudo mv gopigo3.py gopigo3.py.orig
cp ~/$repo/config/gpg_sw_changes/GPG_Soft_Python/gopigo3.py.bookwormPi5 gopigo3.py
sudo python3 setup.py install

echo -e "setup di_sensors API"
cd /home/pi/Dexter/DI_Sensors/Python/di_sensors
mv easy_distance_sensor.py easy_distance_sensor.py.orig
mv distance_sensor.py distance_sensor.py.orig
cp ~/$repo/config/gpg_sw_changes/di_sensors/distance_sensor.py.bookworm distance_sensor.py
cp ~/$repo/config/gpg_sw_changes/di_sensors/easy_distance_sensor.py.bookworm easy_distance_sensor.py
cd /home/pi/Dexter/DI_Sensors/Python
sudo python3 setup.py install

echo -e "eliminate software I2C from distance sensor"
cd /home/pi/Dexter/GoPiGo3/Software/Python/Examples
sudo mv easy_Distance_Sensor.py easy_Distance_Sensor.py.orig
sudo cp ~/$repo/config/gpg_sw_changes/Examples/easy_Distance_Sensor.py.bookworm easy_Distance_Sensor.py

echo -e "ALL DONE - Now tests"
python3 Read_Info.py
echo -e "easy_Blinkers.py"
python3 easy_Blinkers.py
echo -e "easy_DexEyes.py"
python3 easy_DexEyes.py
echo -e "./easy_Distance_Sensor.py"
python3 easy_Distance_Sensor.py
echo -e "./Servo.py"
python3 Servo.py
echo -e "./Grove_US.py"
python3 Grove_US.py
echo -e "Do ./Motor.py when ready"
# python3 Motor.py
