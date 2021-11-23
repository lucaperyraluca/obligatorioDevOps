#!/bin/bash

var=""

if [ "$*" == "$var" ]
then
    rango=$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | wc -l)

    echo  Usuario "$(printf "\t")" Terminal "$(printf "\t")" Host "$(printf "\t\t")" Fecha "$(printf "\t\t")" H.con "$(printf "\t\t")" H.Dest "$(printf "\t\t")" T.Con
    for i in $( seq 1 $rango )
    do
        echo "$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$"|head -"$i"|tail -1|cut -d" " -f1)""$(printf "\t\t ")""$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d" " -f5)""$(printf "\t\t ")""$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d":" -f3|grep -o "^[0-9]")""$(printf "\t\t")""$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$"| head -"$i"|tail -1 | egrep -o "[A-Z][a-z][a-z][ ]+[A-Z][a-z][a-z][ ]+[0-9]?[0-9]")""$(printf "\t")""$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d"-" -f1 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t")""$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d"-" -f2 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t\t ")""$(last | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d"-" -f2 | grep -o "[(][0-9][0-9][:][0-9][0-9][)]"| grep -o "[0-9][0-9][:][0-9][0-9]")"
    done
fi



        while getopts ":ru:" option
        do
         case "$option" in
         r) if  [ "$1" = "-r" ] && [ "$2"  = "-u" ]
            then
                 continue
            else

            MINUTOS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f2 | awk '{total = total + $1}END{print total}'`

            HORAS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f1 | awk '{total = total + $1}END{print total}'`

            echo
            echo  Usuario"  "Term"         "Host"                "Fecha"   "H.con"  "H.Dest"   "T.Con 
            echo
            echo "`last | egrep "[^(][0-9][0-9][:][0-9][0-9][ ][-][ ][0-9][0-9][:][0-9][0-9][ ][\(][1,2,3,4,5,6,7,8,9][+][0-9][0-9][:][0-9][0-9][\)]"`"
            echo
            echo
            echo
            echo El tiempo total de conexion es : $HORAS  horas y $MINUTOS  minutos.
            echo
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
		 
		 if  [ "$1" = "-r" ] || [ "$2"  = "-u" ]
                 then
			 echo
             		 echo  Usuario"  "Term"         "Host"                "Fecha"   "H.con"  "H.Dest"   "T.Con
              		 echo
              		 echo "`last "$USER" | egrep  -v "wtmp.*"`"

			 MINUTOS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f2 | awk '{total = total + $1}END{print total}'`
 
              		 HORAS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f1 | awk '{total = total + $1}END{print total}'`
			echo
			echo El tiempo total de conexion es : "$HORAS"  horas y "$MINUTOS"  minutos.
                 
		else


            		echo
            		echo  Usuario"  "Term"         "Host"                "Fecha"   "H.con"  "H.Dest"   "T.Con 
            		echo
            		echo "`last "$USER" |egrep  -v "wtmp.*"`"
		 fi
                 ;;
         :)
                echo “No se ha especificado el usuario para el modificador -u.”>&2
                exit 1 ;;
         *) echo "Modificador "$*" incorrecto. Solo se aceptan -r y -u usuario, y en ese orden en caso de estar ambos presentes.">&2 ; exit 4
         ;;

         esac
        done



