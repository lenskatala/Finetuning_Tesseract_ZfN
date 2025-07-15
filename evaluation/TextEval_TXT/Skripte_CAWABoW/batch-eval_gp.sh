#!/bin/bash

counter=0

# Loop through all files in the specified folder
for file in GT_gp/*.txt; do
  if [ $counter -eq 0 ]; then
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/${file##*/}" -res-enc UTF-8 -method BagOfWords,CharacterAccuracy,WordAccuracy -csv-headers -csv-addinp > gp_CAWABoW.csv
  else
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/${file##*/}" -res-enc UTF-8 -method BagOfWords,CharacterAccuracy,WordAccuracy -csv-addinp >> gp_CAWABoW.csv
  fi
  ((counter++))
  echo $counter
done