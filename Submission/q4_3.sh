#!/bin/bash

inp="$1"
out="$2"
cat "$inp" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '\n' | shuf >> "$out"
