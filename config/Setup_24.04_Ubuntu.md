SETUP Ubuntu 24.04 Noble Numbat 64-bit Server for KiltedDave


1) Write with Raspberry Pi Imager  
   Other OS->Ubuntu 24.04 64-bit Server  

Connect HDMI_2, keyboard  

2) First boot  
user ubuntu, US etc, hostname kilteddave, wireless xxxxxx  

3) Setup SSH:
```  
  sudo apt install openssh-server -y  
  sudo systemctl status ssh  
  sudo ufw allow ssh  
  sudo apt install net-tools  (to get ifconfig)  
  ifconfig  (wlan0 = 10.0.0.xxx)  
```

5) Network: Disable IPv6  



Check memory:  
```
free -h  
               total        used        free      shared  buff/cache   available  
Mem:           3.7Gi       444Mi       1.3Gi       3.3Mi       2.1Gi       3.3Gi  
Swap:          0.0Gi          0B       0.0Gi  
```


htop:  263MB memory used of 3.7GB  



=== CONFIGURE PASSWORD-LESS SUDO  

sudo nano /etc/sudoers  

make sudo group look like:  
# Allow members of group sudo to execute any command  
%sudo	ALL=(ALL:ALL) NOPASSWD: ALL  


sudo apt install hwinfo  
hwinfo  

sudo apt install procinfo  
lsdev  



===== GoPiGo3 Software  


ubuntu@kilteddave:~$ groups  
ubuntu adm dialout cdrom sudo audio video plugdev games users netdev render input gpio spi i2c  

Create pi user  

```
sudo useradd -m -g ubuntu pi  
sudo passwd pi  
  Newpassword: ...  
su - pi  
$ whoami  
pi  
$ groups  
ubuntu  
$ exit  


sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,netdev,render,input,gpio,spi,i2c pi  
ubuntu@kilteddave:~$ groups pi  
pi : ubuntu adm dialout cdrom sudo audio video plugdev games users input render netdev gpio spi i2c  
ubuntu@kilteddave:~$ groups ubuntu  
ubuntu : ubuntu adm dialout cdrom sudo audio video plugdev games users input render netdev gpio spi i2c  



sudo chmod 777 /home/pi  
./get_dexter_software.sh  
```

needs redo to remove setup.py easy_install   
REF: https://packaging.python.org/en/latest/guides/modernize-setup-py-project/  


had to manually install  
sudo apt install ros-kilted-teleop-twist-joy  
sudo apt install ros-kilted-joint-state-publisher  
sudo apt install ros-kilted-image-transport  
sudo apt install imagemagick  


created ~/.asoundrc:  
```
pcm.!default {  
  type plug  
  slave {  
    pcm "hw:1,0"  
  }  
}  

ctl.!default {  
  type hw  
  card 1  
}  
```
sudo apt install alsa-utils  
alsamixer  (F6 - select USB card)  
sudo alsactl store  


* ========  "Installation Instructions"  https://github.com/ros2/kilted_tutorial_party/issues/281  

https://docs.ros.org/en/kilted/Installation/Ubuntu-Install-Debs.html  

sudo apt install ros-kilted-demo-nodes-*  


tmux  
ctrl-b "  (split window)  
ctrl-b up/down arrow (switch window)  
ctrl-b x or exit (close pane)  

. /opt/ros/kilted/setup.bash  


T1: ros2 run demo_nodes_cpp talker  

T2: ros2 run demo_nodes_cpp listener  





# SETUP Ubuntu Noble 24.04 VM on MacOS for rViz2   
- Downloaded iso 
- Set to 8 cores, 8GB memory  
- chose basic desktop install, format/erase disk ok  
- ROS 2 Noble:  
   Follow https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debians.html  


# binary install: https://docs.ros.org/en/kilted/Installation/Ubuntu-Install-Debs.html  


