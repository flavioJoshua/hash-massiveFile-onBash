#!/bin/bash
## estraggo il nome file  da path 
## estaggo il path solo da fullpath
export VAR=/home/me/mydir/file.c
export DIR=${VAR%/*}
echo "${DIR}"
#/home/me/mydir

echo "${VAR##*/}"
#file.c

# OUTPUT-COLORING
    red='\e[0;31m'
    green='\e[0;32m'
    NC='\e[0m' # No Color
    NONE="\[\033[0m\]"    # unsets color to term's fg color
  # regular colors
     K="\[\033[0;30m\]"    # black
     R="\[\033[0;31m\]"    # red
     G="\[\033[0;32m\]"    # green
     Y="\[\033[0;33m\]"    # yellow
     B="\[\033[0;34m\]"    # blue
     M="\[\033[0;35m\]"    # magenta
     C="\[\033[0;36m\]"    # cyan
     W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
     EMK="\[\033[1;30m\]"
     EMR="\[\033[1;31m\]"
     EMG="\[\033[1;32m\]"
     EMY="\[\033[1;33m\]"
     EMB="\[\033[1;34m\]"
     EMM="\[\033[1;35m\]"
     EMC="\[\033[1;36m\]"
     EMW="\[\033[1;37m\]"
    
    # background colors
     BGK="\[\033[40m\]"
     BGR="\[\033[41m\]"
     BGG="\[\033[42m\]"
     BGY="\[\033[43m\]"
     BGB="\[\033[44m\]"
     BGM="\[\033[45m\]"
     BGC="\[\033[46m\]"
     BGW="\[\033[47m\]"

    echo -e "${EMB} qualcosa  ${BGY} bg color"



##https://help.gnome.org/users/zenity/stable/index.html.en#dialogs

filepath=$(zenity --file-selection   --directory --save --title=" segli il tuo fileName esiste o nuovo")
echo $filepath