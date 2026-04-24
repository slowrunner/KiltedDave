# Vosk for Kilted-Dave

Very lightweight speech to text good for wake word recognition  

DOCS: https://alphacephei.com/vosk/  
GIT: https://github.com/alphacep/vosk-api/tree/master  


=== Installation  
pip3 install vosk --break-system-packages  
sudo pip install sounddevice --break-system-packages  
sudo apt install portaudio19-dev  


mkdir ~/KiltedDave/models  
cd ~/KiltedDave/models  
wget https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip  
unzip *.zip  
rm *.zip  


=== Find Mic Device ===
```
(With tiny USB mic and no reboot)
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
Bus 001 Device 003: ID 4c4a:4155 Jieli Technology UACDemoV1.0
Bus 001 Device 004: ID 0079:0126 DragonRise Inc. Controller
Bus 001 Device 005: ID 0d8c:013c C-Media Electronics, Inc. CM108 Audio Controller  <<-- mic
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

(with kinoko mic and reboot)
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
Bus 001 Device 003: ID 0c76:160a JMTek, LLC. USB Audio Device    <<-- mic
Bus 001 Device 004: ID 4c4a:4155 Jieli Technology UACDemoV1.0
Bus 001 Device 005: ID 0079:0126 DragonRise Inc. Controller
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

(with tiny USB mic)
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ arecord --list-devices
**** List of CAPTURE Hardware Devices ****
card 4: Device [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

(with kinoko USB mic)
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ arecord --list-devices
**** List of CAPTURE Hardware Devices ****
card 1: Device [USB Audio Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


ubuntu@kilteddave:~/KiltedDave/systests/vosk$ arecord --device="hw:4,0" -d 15 -r 44100  -f S16_LE a.wav
Recording WAVE 'a.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Mono

ubuntu@kilteddave:~/KiltedDave/systests/vosk$ aplay a.wav 
Playing WAVE 'a.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Mono

```

=== Test file recognition ===
```
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ ./test_file.py a.wav 
LOG (VoskAPI:ReadDataFiles():model.cc:213) Decoding params beam=10 max-active=3000 lattice-beam=2
LOG (VoskAPI:ReadDataFiles():model.cc:216) Silence phones 1:2:3:4:5:6:7:8:9:10
LOG (VoskAPI:RemoveOrphanNodes():nnet-nnet.cc:948) Removed 0 orphan nodes.
LOG (VoskAPI:RemoveOrphanComponents():nnet-nnet.cc:847) Removing 0 orphan components.
LOG (VoskAPI:ReadDataFiles():model.cc:248) Loading i-vector extractor from models/vosk-model-small-en-us-0.15/ivector/final.ie
LOG (VoskAPI:ComputeDerivedVars():ivector-extractor.cc:183) Computing derived variables for iVector extractor
LOG (VoskAPI:ComputeDerivedVars():ivector-extractor.cc:204) Done.
LOG (VoskAPI:ReadDataFiles():model.cc:282) Loading HCL and G from models/vosk-model-small-en-us-0.15/graph/HCLr.fst models/vosk-model-small-en-us-0.15/graph/Gr.fst
LOG (VoskAPI:ReadDataFiles():model.cc:308) Loading winfo models/vosk-model-small-en-us-0.15/graph/phones/word_boundary.int
{
  "partial" : ""
}
.
.
.
{
  "result" : [{
      "conf" : 0.797161,
      "end" : 3.300000,
      "start" : 3.000000,
      "word" : "oh"
    }, {
      "conf" : 1.000000,
      "end" : 3.840000,
      "start" : 3.300000,
      "word" : "dave"
    }],
  "text" : "oh dave"
}
{
  "partial" : ""
}
.
.
.
{
  "partial" : ""
}
{
  "text" : ""
}

OR FROM KINOBO MIC:

ubuntu@kilteddave:~/KiltedDave/systests/vosk$ arecord  -D "hw:1,0" -d 3 -r 44100  -f S16_LE a.wav
Recording WAVE 'a.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Mono
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ ./test_file.py a.wav
LOG (VoskAPI:ReadDataFiles():model.cc:213) Decoding params beam=10 max-active=3000 lattice-beam=2
LOG (VoskAPI:ReadDataFiles():model.cc:216) Silence phones 1:2:3:4:5:6:7:8:9:10
LOG (VoskAPI:RemoveOrphanNodes():nnet-nnet.cc:948) Removed 0 orphan nodes.
LOG (VoskAPI:RemoveOrphanComponents():nnet-nnet.cc:847) Removing 0 orphan components.
LOG (VoskAPI:ReadDataFiles():model.cc:248) Loading i-vector extractor from models/vosk-model-small-en-us-0.15/ivector/final.ie
LOG (VoskAPI:ComputeDerivedVars():ivector-extractor.cc:183) Computing derived variables for iVector extractor
LOG (VoskAPI:ComputeDerivedVars():ivector-extractor.cc:204) Done.
LOG (VoskAPI:ReadDataFiles():model.cc:282) Loading HCL and G from models/vosk-model-small-en-us-0.15/graph/HCLr.fst models/vosk-model-small-en-us-0.15/graph/Gr.fst
LOG (VoskAPI:ReadDataFiles():model.cc:308) Loading winfo models/vosk-model-small-en-us-0.15/graph/phones/word_boundary.int
{
  "partial" : ""
}
.
.
.
{
  "result" : [{
      "conf" : 1.000000,
      "end" : 2.700000,
      "start" : 2.310000,
      "word" : "hello"
    }, {
      "conf" : 1.000000,
      "end" : 3.000000,
      "start" : 2.700000,
      "word" : "day"
    }],
  "text" : "hello day"
}


```



=== Test Microphone (Device 4) ===
```

(with tiny USB mic)
ubuntu@kilteddave:~/KiltedDave/systests/vosk$ ./test_microphone.py -d 4
LOG (VoskAPI:ReadDataFiles():model.cc:213) Decoding params beam=10 max-active=3000 lattice-beam=2
LOG (VoskAPI:ReadDataFiles():model.cc:216) Silence phones 1:2:3:4:5:6:7:8:9:10
LOG (VoskAPI:RemoveOrphanNodes():nnet-nnet.cc:948) Removed 0 orphan nodes.
LOG (VoskAPI:RemoveOrphanComponents():nnet-nnet.cc:847) Removing 0 orphan components.
LOG (VoskAPI:ReadDataFiles():model.cc:248) Loading i-vector extractor from models/vosk-model-small-en-us-0.15/ivector/final.ie
LOG (VoskAPI:ComputeDerivedVars():ivector-extractor.cc:183) Computing derived variables for iVector extractor
LOG (VoskAPI:ComputeDerivedVars():ivector-extractor.cc:204) Done.
LOG (VoskAPI:ReadDataFiles():model.cc:282) Loading HCL and G from models/vosk-model-small-en-us-0.15/graph/HCLr.fst models/vosk-model-small-en-us-0.15/graph/Gr.fst
LOG (VoskAPI:ReadDataFiles():model.cc:308) Loading winfo models/vosk-model-small-en-us-0.15/graph/phones/word_boundary.int
################################################################################
Press Ctrl+C to stop the recording
################################################################################
{
  "partial" : ""
}
.
.
.
{
  "partial" : "hello"
}
{
  "partial" : "hello again"
}
{
  "partial" : "hello again"
}
{
  "partial" : "hello david"
}
{
  "partial" : "hello dave"
}
{
  "partial" : "hello dave"
}
{
  "partial" : "hello dave"
}
{
  "text" : "hello dave"
}
{
  "partial" : ""
}
.
.
.
^C
Done



```


