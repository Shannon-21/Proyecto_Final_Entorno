#!/bin/bash

###################################
#
# Indicador estadístico de longitud de oraciones (la más corta, la más
# larga y el promedio de longitud).
#
###################################

FILE=$1

# split the file text in differents sentences according to signs of puntuation,
# and calculate length of every line
LENGHTS=`awk 'BEGIN{RS="[?.!] "}1' < $FILE | sed '/^$/d' | awk '{print length}'`


# Create a file with the lenght of every line
for LENGHT in $LENGHTS; do
	echo $LENGHT >> lenghts.txt
done


# Find the largest sentence in the file
LARGER=$(sort -n lenghts.txt | tail -n 1)
echo "la oracion mas larga del archivo tiene $LARGER letras"
echo '           ---------'


# Find the shortest sentence (line) in the file
SHORTER=$(sort -n lenghts.txt | head -n 1)
echo "la oracion mas corta del archivo tiene $SHORTER letras"
echo '           ---------'


# Find the avarage of lenghts of sentences in the file
SUM_LEN=$(awk '{ sum += $1 } END { print sum }' lenghts.txt)
CAN_LEN=$(sed -n '$=' lenghts.txt)
AVG=`awk "BEGIN {print $SUM_LEN/$CAN_LEN}"`

echo "La longuitud promedio de las oraciones es de $AVG letras"
echo '   ------------------'


rm lenghts.txt
