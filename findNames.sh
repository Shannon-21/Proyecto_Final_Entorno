#!/bin/bash

#################################################
#
# Identificación de nombres propios (se identifican sólo si están en este formato Nnnnnnnnn), aunque 
# la palabra no sea un nombre propio realmente. Ejemplos: Mateo, Estonoesunnombre, Ana.
#
#################################################

FILE=$1

# Create a new file with cleaned words (without simbols and characters)
for word in $(cat $FILE); do

	cleaned=$( echo "$word" | sed -e 's/[^a-z^A-Z|^'']//g'  )
	echo $cleaned >> words.txt
done


# filtering for words started by a supercase following by lowercases
echo "Los nombres propios en el archivo son los siguientes: "
echo '---------------------------------------' 
grep -E "^[A-Z][a-z]{3,}$" words.txt | sort | uniq


rm words.txt
