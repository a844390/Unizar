#!/bin/bash

FRANCES=10
ALLEN=9

# $RANDOM is an internal Bash function (not a constant) that returns a
# pseudorandom [1] integer in the range 0 - 32767. It should not be used
# to generate an encryption key.

i=$(($RANDOM % $FRANCES)) # Generate a random number between 0 and $FRANCES - 1.
if [ "$i" -lt "$ALLEN" ]
then
    echo "i = $i"
    ./$0
fi
exit 0

#Este script va a ejecutarse a si mismo hasta que se genere un numero mayor o igual a Allen