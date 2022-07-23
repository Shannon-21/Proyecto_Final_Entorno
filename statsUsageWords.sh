#!/bin/bash

################################################
#
# Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro) letras. (mostrar un Top
# Ten de estas palabras ordenadas desde la que tiene más apariciones a la que tiene menos). Es decir,
# filtrar las palabras que tengan al menos 4 letras y de éstas, elegir las 10 más usadas.
#
################################################

FILE=$1

# iterate by each word in file text
for word in $(cat $FILE); do

	cleaned=$( echo "$word" | sed -e 's/[^a-z^A-Z|^'']//g'  )

        if [[ "${#cleaned}" -ge 4 ]]; then
        	echo $cleaned >> mas_4_letras.txt	
        fi
done

# asthetic
echo "apar.  | palabra"
echo "------ | -------"

# ordena las palabras, elimina las repetidas per contando sus ocurrencias
cat mas_4_letras.txt | sort | uniq -c | sort -nr | head

rm mas_4_letras.txt
