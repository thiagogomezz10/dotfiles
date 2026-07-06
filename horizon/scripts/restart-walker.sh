#!/bin/bash

if systemctl --user is-enabled walker.service >/dev/null 2>&1; then
  systemctl --user restart walker.service
else
  echo "walker.service is not enabled; start it with: systemctl --user enable --now walker.service" >&2
  exit 1
fi
