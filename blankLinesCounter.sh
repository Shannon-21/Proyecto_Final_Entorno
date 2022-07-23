#!/bin/bash

#############################
#
# Contador de líneas en blanco.
#
#############################

FILE=$1

# Filtering by empty lines
BL=`grep -c "^$" $FILE`

echo '------'
echo "Hay $BL lineas en blanco en el archivo"
echo '------'

exit 1

