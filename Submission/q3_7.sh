#!/bin/bash

while read word; do
    if [[ $word == *"a"* && $word == *"e"* && $word != *"i"* ]]; then
        echo "$word" >> output_3.txt
    fi
done < words.txt
