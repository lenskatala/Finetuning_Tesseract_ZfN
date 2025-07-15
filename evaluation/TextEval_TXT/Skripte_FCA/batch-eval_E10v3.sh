#!/bin/bash

counter=0

# Loop through all files in the specified folder
for file in GT_v3/*.txt; do
  if [ $counter -eq 0 ]; then
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/EPOCH10/${file##*/}" -res-enc UTF-8 -method FlexCharAccuracy -csv-headers -csv-addinp > E10_v3_FCA.csv
  else
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/EPOCH10/${file##*/}" -res-enc UTF-8 -method FlexCharAccuracy -csv-addinp >> E10_v3_FCA.csv
  fi
  ((counter++))
  echo $counter
done