#!/bin/bash

# NOTE- This works very slow
while read word; do
    if [[ $(echo "$word" | rev) == "$word" ]]; then
        echo "$word" >> output_3.txt
    fi
done < words.txt
