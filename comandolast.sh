#!/bin/bash

a="Usuario "`last | cut -d" " -f1`

touch prueba.txt

for i in $a
do      
        echo $i>>prueba.txt
done 
echo "---">>prueba.txt

b="Term "`last | cut -d" " -f4 `

for i in $b
do      
        echo $i>>prueba.txt
done          
echo "---">>prueba.txt



for $i in `cat prueba.txt`
do
	sed -i "s/---/\t/" $i
done

cat prueba.txt
