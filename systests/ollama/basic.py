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

result = ollama.generate(model=model, prompt=current_prompt)

dt_end=dt.datetime.now()
took=(dt_end - dt_start).total_seconds()

print(f"\nResponse took {took:.1f} seconds:")
print_wrapped(result['response'])
