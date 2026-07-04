#!/bin/bash

# summary=Launch a TUI command in the default terminal
# args=<command> [args...]

exec setsid uwsm-app -- xdg-terminal-exec --app-id=org.horizon.$(basename $1) -e "$1" "${@:2}"
