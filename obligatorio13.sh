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

a=`last "$USER" | head -1`
if  [ "$a" == "" ]
then
     echo "No se han encontrado conexiones para listar en el sistema.">&2
     exit 0
fi



        while getopts ":ru:" option
        do
         case "$option" in
         r) 
		 a=`last "$USER" | head -1`
                 if  [ "$a" == "" ]
                 then
                         echo "No se han encontrado conexiones para listar en el sistema.">&2
                 exit 0
                 fi
		 
		 if [ "$1" = "-r" ] && [ "$2" = "-r"  ]
		 then
			 echo "Cantidad de parámetros errónea, solo se aceptan los modificadores -r y -u '(seguido de un nombre de usuario)'">&2
			 exit 3
		 fi


	    if  [ "$1" = "-r" ] && [ "$2"  = "-u" ]
            then
                 continue
            else

            	MINUTOS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f2 | awk '{total = total + $1}END{print total}'`

            	HORAS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f1 | awk '{total = total + $1}END{print total}'`

                rango=$(last | egrep ".*[:][0-9][0-9][)]$" | wc -l)

   	 	echo  Usuario "$(printf "\t")" Terminal "$(printf "\t")" Host "$(printf "\t\t")" Fecha "$(printf "\t\t")" H.con "$(printf "\t\t")" H.Dest "$(printf "\t\t")" T.Con
    		for i in $( seq 1 $rango )
    		do
            		echo "$(last | egrep ".*[:][0-9][0-9][)]$" | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$"|head -"$i"|tail -1|cut -d" " -f1)""$(printf "\t\t ")""$(last | egrep ".*[:][0-9][0-9][)]$" | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d" " -f5)""$(printf "\t\t ")""$(last | egrep ".*[:][0-9][0-9][)]$" | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d":" -f3|grep -o "^[0-9]")""$(printf "\t\t")""$(last | egrep ".*[:][0-9][0-9][)]$" | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$"| head -"$i"|tail -1 | egrep -o "[A-Z][a-z][a-z][ ]+[A-Z][a-z][a-z][ ]+[0-9]?[0-9]")""$(printf "\t")""$(last | egrep ".*[:][0-9][0-9][)]$" | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d"-" -f1 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t")""$(last | egrep ".*[:][0-9][0-9][)]$" | egrep ".*[(][0-9][0-9][:][0-9][0-9][)]$" | head -"$i"|tail -1 | cut -d"-" -f2 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t\t ")""$(last | egrep -o "[(][0-9]+[+]+[0-9][0-9][:][0-9][0-9][)]$"| head -"$i"|tail -1)"
    		done

	        echo
		bucle=$(last | egrep -o "[(][0-9]+[+]+[0-9][0-9][:][0-9][0-9][)]$" | egrep -o "^[(][0-9][0-9]?[+]"|grep -o "[0-9]")
		dias=0
		for i in  $bucle
		do
    			dias=$(($dias + $i))
		done


		if [ "$MINUTOS" -ge "60"  ]
		then
			resto_minutos=$( echo "$MINUTOS"%60 | bc)
			entero_minutos=$(( $MINUTOS / 60 ))
			MINUTOS=$resto_minutos
			HORAS="$(($HORAS + $entero_minutos))"
		fi



		if [ "$HORAS" -ge "24"  ]
		then
			parte_resto=$(echo "$HORAS"%24 | bc )
			parte_entera=$(( $HORAS / 24 ))
			HORAS=$parte_resto
			dias="$(($dias + $parte_resto))"
		fi
		

		DIAS_I=""$dias" dias, "
		if ! [ "$dias" = "0" ]
		then
	    	echo El tiempo total de conexion es : "$DIAS_I" ,  "$HORAS"  horas y "$MINUTOS"  minutos.
		else
			echo El tiempo total de conexion es "$HORAS" horas y "$MINUTOS" minutos.
		fi
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
                         exit 2
                 fi
		a=`last "$USER" | head -1`
		if  [ "$a" == "" ] 
		then
    			echo "No se han encontrado conexiones para listar en el sistema para el usuario "$USER".">&2
    		exit 0
		fi

		 
		 if  [ "$1" = "-r" ] || [ "$2"  = "-u" ]
                 then
			 if [ "$#" -gt "3"  ]
			 then
				 echo "Cantidad de parámetros errónea, solo se aceptan los modificadores -r y -u '(seguido de un nombre de usuario)'">&2
				 exit 3
			 fi

			 echo
             		 echo  Usuario"  "Term"         "Host"                "Fecha"   "H.con"  "H.Dest"   "T.Con
              		 echo
              		 echo "`last "$USER" | egrep  -v "wtmp.*"`"

			 MINUTOS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f2 | awk '{total = total + $1}END{print total}'`
 
              		 HORAS=`last "$USER" | awk '{print $10}' | grep -o  "[0-9][0-9][:][0-9][0-9]" | cut -d":" -f1 | awk '{total = total + $1}END{print total}'`
			echo
                 	
			bucle=$(last "$USER" | egrep -o "[(][0-9]+[+]+[0-9][0-9][:][0-9][0-9][)]$" | egrep -o "^[(][0-9][0-9]?[+]"|grep -o "[0-9]")
                	dias=0
                	for i in  $bucle
                	do
                        	dias=$(($dias + $i))
                	done
                        
			if [ "$MINUTOS" -ge "60"  ]
	                then
        	                resto_minutos=$( echo "$MINUTOS"%60 | bc)
                	        entero_minutos=$(( $MINUTOS / 60 ))
                        	MINUTOS=$resto_minutos
                        	HORAS="$(($HORAS + $entero_minutos))"
                	fi



                	if [ "$HORAS" -ge "24"  ]
                	then
                        	parte_resto=$(echo "$HORAS"%24 | bc )
                        	parte_entera=$(( $HORAS / 24 ))
                        	HORAS=$parte_resto
                        	dias="$(($dias + $parte_resto))"
                	fi

		
		
		
			DIAS_I=""$dias" dias, "
                	if ! [ "$dias" -eq "0" ]
                	then
                		echo El tiempo total de conexion es : "$DIAS_I" ,  "$HORAS"  horas y "$MINUTOS"  minutos.
                	else
                        	echo El tiempo total de conexion es "$HORAS" horas y "$MINUTOS" minutos.
                	fi


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
	*) if [ "$#" -gt "3" ]
	 then
		 echo "Cantidad de parámetros errónea, solo se aceptan los modificadores -r y -u (seguido de un nombre de usuario">&2
		 exit 3
	 fi
		 echo "Modificador "$*" incorrecto. Solo se aceptan -r y -u usuario, y en ese orden en caso de estar ambos presentes.">&2 
		 exit 4
         ;;

         esac
        done



