#!/bin/bash

rango=$(($(last|wc -l)-2))


echo  Usuario "$(printf "\t")" Terminal "$(printf "\t")" Host "$(printf "\t\t")" Fecha "$(printf "\t\t")" H.con "$(printf "\t\t")" H.Dest "$(printf "\t\t")" T.Con
for i in $( seq 1 $rango )
do
echo "$(last|head -"$i"|tail -1|cut -d" " -f1)""$(printf "\t\t ")""$(last | head -"$i"|tail -1 | cut -d" " -f5)""$(printf "\t\t ")""$(last | head -"$i"|tail -1 | cut -d":" -f3|grep -o "^[0-9]")""$(printf "\t\t")""$(last | head -"$i"|tail -1 | egrep -o "[A-Z][a-z][a-z][ ]+[A-Z][a-z][a-z][ ]+[0-9]?[0-9]")""$(printf "\t")""$(last | head -"$i"|tail -1 | cut -d"-" -f1 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t")""$(last | head -"$i"|tail -1 | cut -d"-" -f2 | egrep -o "[^(][0-9][0-9][:][0-9][0-9]")""$(printf "\t\t\t ")""$(last | head -"$i"|tail -1 | cut -d"-" -f2 | grep -o "[(][0-9][0-9][:][0-9][0-9][)]"| grep -o "[0-9][0-9][:][0-9][0-9]")"
done
