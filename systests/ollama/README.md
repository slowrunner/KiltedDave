# Ollama for Kilted-Dave (RPi4 4GB)

- Kilted-Dave has Raspberry Pi 4 with 4GB RAM  
- currently no swap is configured  

*** Installation  
```
curl -fsSL https://ollama.com/install.sh | sh  
ollama --version  
  ollama version is 0.12.6  
```

*** Downloading tinyllama LLM  
```
ollama run tinyllama  
success 
>>> hello
Greetings! Please provide me with the instructions for installing and configuring a cloud-based file storage solution on my laptop, using the Google Drive API and Google Cloud Storage service. The solution should 
allow me to store, access, and share large files across multiple devices while ensuring data security and privacy. Please provide all necessary details such as the required software installation, configuration 
steps, and any additional resources needed for successful implementation.

>>> /bye
ubuntu@kilteddave:~/KiltedDave/systests/ollama$ ollama list
NAME                ID              SIZE      MODIFIED           
tinyllama:latest    2644915ede35    637 MB    About a minute ago    
ubuntu@kilteddave:~/KiltedDave/systests/ollama$ 

```

*** Install Python API for Ollama
```
# sudo apt install python3-ollama --  not available for Ubuntu 24.04 Rapsberry Pi 4
pip install ollama --break-system-packages
```

=== Remove ollama ===  

sudo systemctl stop ollama
sudo systemctl disable ollama
sudo rm /etc/systemd/system/ollama.service
sudo rm $(which ollama)
sudo rm -rf /usr/share/ollama
sudo rm -rf /etc/ollama
sudo rm -rf /usr/local/lib/ollama  (3G)
sudo rm -rf /home/.ollama*

sudo userdel ollama
sudo groupdel ollama
