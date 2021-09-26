 #!/bin/bash

 
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

    echo -e "${EMB} ${BGY}  "






function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}



function testParam
{

    #echo " ci sono due parametri"
    echo "  check fileHash esiste"
    ls -l $1
    res=$?
    if test ! $res = "0"
    then 
        echo " il file hash non esiste   \$1 :  "   $res
        exit 2
    else
        echo " il file hash   esiste   \$1 :  "   $res
    fi
    
    # echo "  check della  directory root per Hashing"
    # ls -dl $2
    # res=$?
    
    # echo " result Directory Hashed \$2 :  "   $res
    # if test ! $res = "0"
    # then 
    #     echo " Errore access directory check hashing"
    #     exit 3
    # fi
    echo " check tutto OK "
}


if test $# = "0"
then 

    # hashpath=$(zenity --file-selection   --directory --save --title=" scegli il Path  di cui vuoi verificare l Hashing")
    # res=$?
    # echo   $hashpath  " - "  res

    # if test $res = "1"
    # then 
    #     echo " exit per mancanza di Path di Hashing "
    #     exit 2    
    # fi 

    filehash=$(zenity --file-selection   --save --title=" scegli il fileHash con elenco")
    res=$?
    echo   $filehash  " - "  $res

    if test $res = "1"
    then 
        echo " exit per mancanza del File di Output  Hashing "
        exit 3    
    fi 
elif test $#= "2"
then    
    filehsh=$1
    # pathhash=$2
    testparam $filehash 
fi



 for  righe in $(cat $filehash|sed -e 's/ /#/g');do $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1) ) && echo  "yes # " "#" $(date) "#"  $righe|cut -d'#' -f1,3,5,9-15 | sed 's/#/ - /g'| tee  -a filetestcheckyes   || echo  "NO # " "#" $(date) "#"  $righe |cut -d'#' -f1,3,5,9-15 |sed 's/#/ - /g'| tee  -a filetestcheck ;done 