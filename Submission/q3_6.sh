#!/bin/bash

# NOTE- This works very slow
inp="words.txt"
while read -r line; do
  word=$(echo "$line" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
  uni=true
  for (( i=0; i<${#word}; i++ )); do
    for (( j=i+1; j<${#word}; j++ )); do
      if [[ ${word:i:1} == ${word:j:1} ]]; then
        uni=false
        break 2
      fi
    done
  done

  if $uni; then
    echo "$line" >> output_3.txt
  fi
done < "$inp"
