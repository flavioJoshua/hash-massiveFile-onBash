#!/bin/bash
## estraggo il nome file  da path 
## estaggo il path solo da fullpath
export VAR=/home/me/mydir/file.c
export DIR=${VAR%/*}
echo "${DIR}"
#/home/me/mydir

echo "${VAR##*/}"
#file.c



filepath=$(zenity --file-selection   --directory --save --title=" segli il tuo fileName esiste o nuovo")
echo $filepath