#!/bin/bash

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
