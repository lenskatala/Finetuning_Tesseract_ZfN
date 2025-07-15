#!/bin/bash

counter=0

# Loop through all files in the specified folder
for file in GT_v3/*.txt; do
  if [ $counter -eq 0 ]; then
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/EPOCH50/${file##*/}" -res-enc UTF-8 -method FlexCharAccuracy -csv-headers -csv-addinp > E50_v3_FCA.csv
  else
    java -jar PrimaText.jar -gt-text "$file" -gt-enc UTF-8 -res-text "results/EPOCH50/${file##*/}" -res-enc UTF-8 -method FlexCharAccuracy -csv-addinp >> E50_v3_FCA.csv
  fi
  ((counter++))
  echo $counter
done