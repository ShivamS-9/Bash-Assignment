#!/bin/bash
# NOTE- This works very slow
inp=$1
out=$2
count() {
  echo $1 | tr -cd 'aeiouAEIOU' | wc -m
}

declare -A words_grp
while read word; do
  num_vowels=$(count $word)
  words_grp[$num_vowels]+=$word$'\n'
done < $inp

for num_vowels in "${!words_grp[@]}"; do
  sorted_words=$(echo "${words_grp[$num_vowels]}" | tr ' ' '\n' | sort)
  echo -e "$sorted_words" >> $out
done
