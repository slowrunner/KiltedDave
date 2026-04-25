#!/bin/bash 
# Set the path to your virtual environment directory
# (may need to be complete path)
VENV_PATH="./moondream_006_venv" 


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "!!! Must use:  . activate_venv.sh"


elif [ "$VIRTUAL_ENV" == "$VENV_PATH" ]; then
    echo "venv already active"

elif [ -f "$VENV_PATH/bin/activate" ] ; then
    echo "Activating virtual environment...source $VENV_PATH/bin/activate" 
    source "$VENV_PATH/bin/activate"
    echo "type deactivate to exit venv"
else
    echo "Error: Virtual environment not found at $VENV_PATH"
fi
