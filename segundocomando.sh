#!/bin/bash



echo  Usuario "     " Terminal "    " Host "    " Fecha"       " H.con "    " H.Dest "    " T.Con"    "
echo `last | head -1|tail -1 | cut -d" " -f1`"        " `last | head -1|tail -1 | cut -d" " -f5` "           " `last | head -1|tail -1 | cut -d" " -f16` "      "`last | head -1|tail -1 | cut -d" " -f31,32,33` " " `last | head -1|tail -1 | cut -d" " -f34`

echo `last | head -2|tail -1 | cut -d" " -f1`"        " `last | head -2|tail -1 | cut -d" " -f5` "           " `last | head -2|tail -1 | cut -d" " -f16` "      "`last | head -2|tail -1 | cut -d" " -f31,32,33` " " `last | head -2|tail -1 | cut -d" " -f34`


echo `last | head -3|tail -1 | cut -d" " -f1`"        " `last | head -3|tail -1 | cut -d" " -f5` "           " `last | head -3|tail -1 | cut -d" " -f16` "      "`last | head -3|tail -1 | cut -d" " -f31,32,33` " " `last | head -3|tail -1 | cut -d" " -f34`

echo `last | head -4|tail -1 | cut -d" " -f1`"        " `last | head -4|tail -1 | cut -d" " -f5` "           " `last | head -4|tail -1 | cut -d" " -f16` "      "`last | head -4|tail -1 | cut -d" " -f31,32,33` " " `last | head -4|tail -1 | cut -d" " -f34`



 

