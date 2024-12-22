#!/bin/bash
inp="$1"
out="$2"
sed 's/\b\w\{1,2\}\b//g' "$inp" | tr -s ' ' '\n' >> "$out"
