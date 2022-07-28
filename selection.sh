#!/bin/bash

# Defining the file text to analize
read -p "Que archivo de texto desea analizar?: " FILE

# check if the file exist and is not empty
while [ ! -s $FILE ]; do
	echo "el archivo $FILE no existe o es vacio"
	read -p "Reintente por favor: " FILE
done

# Giving context to menu
PS3='Elija: '
echo "Con que script desea analizar el archivo $FILE?"

select script in "Salir" "statsWords" "statsUsageWords" "findNames" "statsSentences" "blankLinesCounter"
do
	# It will run the scrip vinculated with number
	[ $REPLY == 0 ] && echo "Hasta luego..." && sleep 1 && break
	[ $REPLY == 1 ] && bash statsWords.sh $FILE
	[ $REPLY == 2 ] && bash statsUsageWords.sh $FILE
	[ $REPLY == 3 ] && bash findNames.sh $FILE
	[ $REPLY == 4 ] && bash statsSentences.sh $FILE
	[ $REPLY == 5 ] && bash blankLinesCounter.sh $FILE
	[ $REPLY -ge 6 ] && echo "Seleccion incorrecta" && continue  
done

exit 0
