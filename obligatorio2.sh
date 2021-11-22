#!/bin/bash


if [ "$1" = "" ] || [ "$2" = "" ]
then
	rango=$(($(last|wc -l)-2))


echo  Usuario "$(printf "\t")" Terminal "$(printf "\t")" Host "$(printf "\t\t")" Fecha "$(printf "\t\t")" H.con "$(printf "\t\t")" H.Dest "$(printf "\t\t")" T.Con
for i in $( seq 1 $rango )
do
echo "$(last|head -"$i"|tail -1|cut -d" " -f1)""$(printf "\t\t ")""$(last | head -"$i"|tail -1 | cut -d" " -f5)""$(printf "\t\t ")""$(last | head -"$i"|tail -1 | cut -d":" -f3|grep -o "^[0-9]")""$(printf "\t\t")""$(last | head -"$i"|tail -1 | egrep -o "[A-Z][a-z][a-z][ ]+[A-Z][a-z][a-z][ ]+[0-9]?[0-9]")""$(printf "\t")""$(last | head -"$i"|tail -1 | cut -d"-" -f1 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t")""$(last | head -"$i"|tail -1 | cut -d"-" -f2 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t\t ")""$(last | head -"$i"|tail -1 | cut -d"-" -f2 | grep -o "[(][0-9][0-9][:][0-9][0-9][)]"| grep -o "[0-9][0-9][:][0-9][0-9]")"
done

else
	


	while getopts ":ru:" option
	do
	 case "$option" in
	 r) if  [ "$1" = "-r" ] && [ "$2"  = "-u" ]
	         then
	         continue
	 else
	 	 
		 echo "salida de comando -r" `last`
		 fi
		 ;;
	 
	 
	 u) USER=${OPTARG}

	         if  [ "$2" = "-r" ] || [ "$3"  = "-r" ]
	         then
	                 echo "Los modificadores deben colocarse en el orden -r y -u">&2
	                 exit 6
	         fi

	         if ! grep -q "^$USER:" /etc/passwd
	         then
	                 echo "No existe el usuario "$USER"  en el sistema.">&2
	                 exit 1
	         fi
	         echo "salida del comando -u" `last "$USER"`
	         ;;
	 :)
		echo “No se ha especificado el usuario para el modificador -u.”>&2
	        exit 1 ;;
	 *) echo "Modificador "$*" incorrecto. Solo se aceptan -r y -u usuario, y en ese orden en caso de estar ambos presentes.">&2 ; exit 4
	 esac
	done

fi
