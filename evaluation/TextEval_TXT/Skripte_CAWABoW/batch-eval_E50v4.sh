#!/bin/bash

counter=0

# Loop through all files in the specified folder
for file in GT_v4/*.txt; do
  if [ $counter -eq 0 ]; then
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/EPOCH50/${file##*/}" -res-enc UTF-8 -method BagOfWords,CharacterAccuracy,WordAccuracy -csv-headers -csv-addinp > E50_v4_CAWABoW.csv
  else
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/EPOCH50/${file##*/}" -res-enc UTF-8 -method BagOfWords,CharacterAccuracy,WordAccuracy -csv-addinp >> E50_v4_CAWABoW.csv
  fi
  ((counter++))
  echo $counter
done