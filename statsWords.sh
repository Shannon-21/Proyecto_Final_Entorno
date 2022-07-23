#!/bin/bash

######################################
#
# Indicador estadístico de longitud de
# palabras (la más corta, la más larga
# y el promedio de longitud)
#
######################################


# Auxiliar variables
FILE=$1

LARGER_WORD=0
SHORTER_WORD=0
SUM_WORDS=0
CANT_WORDS=0

# loop to iterate for every word
for word in $(cat $FILE); do


	cleaned=$(echo "$word" | sed -e 's/[^a-z^A-Z|^'']//g'  )         # Remove characters and simbols

	[[ "${#cleaned}" > $LARGER_WORD ]] && LARGER_WORD=${#cleaned}    # stablish the largest word

	[[ $SHORTER_WORD == 0 ]] && SHORTER_WORD=${#cleaned}             # Stablish the shorter word's lenght
	[[ "${#cleaned}" < $SHORTER_WORD ]] && SHORTER_WORD=${#cleaned}

	SUM_WORDS=$((SUM_WORDS + ${#cleaned})) 			         # Define accumulates to calculate avarage		
	CANT_WORDS=$((CANT_WORDS + 1))
done 

AVG=`awk "BEGIN {print $SUM_WORDS/$CANT_WORDS}"`


echo "La palabra mas larga en el archivo tiene $LARGER_WORD letras"
echo '    ----------------'

echo "La palabra mas corta en el archivo tiene $SHORTER_WORD letra/s"
echo '    -----------------'

echo "El promedio de longitud de palabras del archivo es de $AVG"
echo '    ---------------'
