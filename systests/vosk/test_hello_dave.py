#!/usr/bin/env python3

# FILE: test_hello_dave.py

# PREREQ: pip3 install vosk --break-system-packages
#         wget https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip to ./models
#         unzip the model

# Listens for "Hello Dave", prints "What is wanted?" and quits

import argparse
import queue
import sys
import sounddevice as sd
sys.path.append('/home/ubuntu/KiltedDave/plib')
import speak
import logging


from vosk import Model, KaldiRecognizer


# create logger
logger = logging.getLogger('heardLog')
logger.setLevel(logging.INFO)

loghandler = logging.FileHandler('heard.log')
logformatter = logging.Formatter('%(asctime)s|%(message)s',"%Y-%m-%d %H:%M:%S")
loghandler.setFormatter(logformatter)
logger.addHandler(loghandler)

q = queue.Queue()

def int_or_str(text):
    """Helper function for argument parsing."""
    try:
        return int(text)
    except ValueError:
        return text

def callback(indata, frames, time, status):
    """This is called (from a separate thread) for each audio block."""
    if status:
        print(status, file=sys.stderr)
    q.put(bytes(indata))

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument(
    "-l", "--list-devices", action="store_true",
    help="show list of audio devices and exit")
args, remaining = parser.parse_known_args()
if args.list_devices:
    print(sd.query_devices())
    parser.exit(0)
parser = argparse.ArgumentParser(
    description=__doc__,
    formatter_class=argparse.RawDescriptionHelpFormatter,
    parents=[parser])
parser.add_argument(
    "-f", "--filename", type=str, metavar="FILENAME",
    help="audio file to store recording to")
parser.add_argument(
    "-d", "--device", type=int_or_str,
    help="input device (numeric ID or substring)")
parser.add_argument(
    "-r", "--samplerate", type=int, help="sampling rate")
parser.add_argument(
    "-m", "--model", type=str, help="language model; e.g. en-us, fr, nl; default is en-us")
args = parser.parse_args(remaining)

try:
    if args.samplerate is None:
        device_info = sd.query_devices(args.device, "input")
        # soundfile expects an int, sounddevice provides a float:
        args.samplerate = int(device_info["default_samplerate"])
        
    if args.model is None:
        # model = Model(lang="en-us")
        model = Model("models/vosk-model-small-en-us-0.15")
    else:
        model = Model(lang=args.model)

    if args.filename:
        dump_fn = open(args.filename, "wb")
    else:
        dump_fn = None

    with sd.RawInputStream(samplerate=args.samplerate, blocksize = 8000, device=args.device,
            dtype="int16", channels=1, callback=callback):
        print("#" * 80)
        print("Press Ctrl+C to stop the recording")
        print("#" * 80)

        rec = KaldiRecognizer(model, args.samplerate)
        rec.SetGrammar('["hey dave", "hello dave", "good morning dave", "[unk]"]')
        while True:
            data = q.get()
            if rec.AcceptWaveform(data):
                result=rec.Result()
                # print(rec.Result())
                if "hello dave" in result:
                  print("Hi")
                  logger.info("hello dave")
                elif "hey dave" in result:
                  logger.info("hey dave")
                  print("What's up?")
                elif "good morning dave" in result:
                  logger.info("good morning dave")
                  print("good morning")
                  speak.say("good morning.")
            else:
                partial=rec.PartialResult()
                # print(rec.PartialResult())
                # if "hello wally" in partial:
                #   logger.info("hello wally")
                #   print("Hi")
                # elif "hey wally" in partial:
                #   logger.info("hey wally")
                #   print("What's up?")
                # elif "good morning wally" in partial:
                #   logger.info("good morning wally")
                #   print("good morning")
                #   speak.say("good morning to you")

            if dump_fn is not None:
                dump_fn.write(data)

except KeyboardInterrupt:
    print("\nDone")
    parser.exit(0)
except Exception as e:
    parser.exit(type(e).__name__ + ": " + str(e))
