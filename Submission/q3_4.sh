#!/bin/bash
while read word; do
  if [[ $word =~ [^aeiouAEIOU]{3} ]]; then
    echo "$word" >> output_3.txt
  fi
done < words.txt