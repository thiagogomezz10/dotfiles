#!/bin/bash

# summary=Launch a terminal in the active terminal's current directory
# args=[command...]

exec setsid uwsm-app -- xdg-terminal-exec bash -c "tmux"
