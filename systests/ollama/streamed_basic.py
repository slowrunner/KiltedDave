#!/usr/bin/env python3

import ollama
import os
import textwrap
import datetime as dt

def print_wrapped(long_string):
  try:
    console_width = os.get_terminal_size().columns
  except OSError:
    console_width = 80

  wrapped_lines = textwrap.wrap(long_string, width=console_width)
  print('\n'.join(wrapped_lines))


# Use the generate function for a one-off prompt
# result = ollama.generate(model='llama2', prompt='Why is the sky blue?')
current_prompt='Why is the sky blue?'
model='tinyllama'
print(f"Starting Ollama with model: {model}")
print("\nPrompt:")
print_wrapped(current_prompt)
dt_start=dt.datetime.now()

stream = ollama.generate(model=model, prompt=current_prompt, stream=True)
dt_chunk = None;
result = ""

for chunk in stream:
  if (dt_chunk == None): 
    dt_chunk=dt.datetime.now()
    first_response = (dt_chunk - dt_start).total_seconds()
    # print(f"{Start {first_response:.1f}:")
    print("First response word at ",first_response," seconds")
  words = chunk['response']
  result = result + words
  # print(words, end="", flush=True)
dt_end=dt.datetime.now()
print("\n--- End of Stream ---")
took=(dt_end - dt_start).total_seconds()

print(f"\nFirst response at {first_response:.1f} seconds, total response took {took:.1f} seconds:")
print_wrapped(result)
