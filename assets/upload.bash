#!/bin/bash


if [ "$(ls -A ./upload)" ]; then
    printf '\n'
    echo *******WELCOME RAD DOM to FILE UPLOAD*******
    printf '\n'
    echo "( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)"
    printf '\n'
else
    echo "UPLOAD DIRECTORY is Empty!!!!!!!"
    exit
fi
ans=-1
for filename in ./upload/*; do

    if [ ${filename:9:4} == "min-" ]
      then
        continue
    fi
    
    while (( "${ans}" > 5 )) || (( "${ans}" < 0 )); do
      printf '\n'
      printf '\n'
      echo "What category does ${filename:9} go to?"
      echo "0 - People"
      echo "1 - Compositions"
      echo "2 - Food"
      echo "3 - Landscapes"
      echo "4 - Other"
      echo "5 - SKIP THIS FILE"
      read ans
    done

    if [ "${ans}" == 5 ]; then
      ans=-1;
      continue
    fi

    categories=(people compositions food landscapes other)

    echo "Moving $filename to pics/${categories[ans]}..."
    mv "$filename" pics/${categories[ans]}
    #mv "${filename:0:9}min-${filename:9}" pics/${categories[ans]}
    echo "Adding filename (${filename:9}) to order.csv (pics/${categories[ans]}/order.csv)..."
    echo "${filename:9}" >> pics/${categories[ans]}/order.csv
    echo "Done! ( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)"
    printf '\n'
    ans=-1;

done

echo "BYE NOW"
echo "( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)"


