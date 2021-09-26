#!/bin/bash
#test -a /etc/systemd/


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

    echo -e "${EMB}   ${BGY} Begin process... Hashing"








function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

##  la funzione che  fa hashing
function hashfun 
{
    filehash=$1
    pathhash=$2
    echo "begin hashing path: " $pathhash " - Filehash: "  $filehash
    for ff in $(find $pathhash -type f);do echo $( md5sum $ff)  " - "   $(date) >> $filehash ; done
    res=$?
    
    echo " result \$? "   $res
    if test ! $res = "0"
    then 
        echo " Errore nella procedura di hashing"
        exit 4
    fi
    echo "end hashing"
}
   # non funziona la doppia condizione [( ! $1  = "" ) &&  ( ! $2  = "" )]


numparam=$(echo $#)
if test ! $numparam = "2"      
then               
    echo " non ci sono : FileHash(file repository degli Hash) - PathHash (il path  dei files che devono avere l hashing )"
    exit 1
else
    echo " ci sono due parametri"
    echo "  check fileHash per serializzare gli Hash delle directory"
    touch $1
    ls -l $1
    res=$?
    echo " result $? "   $res
    if test ! $res=0
    then 
        echo " Errore nella creazione file Hashing"
        exit 2
    fi
    echo "  check della  directory root per Hashing"
    ls -dl $2
    res=$?
    
    echo " result \$? "   $res
    if test ! $res = "0"
    then 
        echo " Errore nel check della  directory  che si vuole Hash"
        exit 3
    fi
    echo " tutto OK "
    #exit 0 
    filepath=$1
    hashpath=$2
    jumpto testa
fi


#test=qualcosa 
#echo $test

#hashpath=$(zenity --file-selection   --directory --save --title=" scegli il Path  di cui vuoi avere l Hashing")


#filepath=$(zenity --file-selection   --save --title=" scegli il tuo fileName esiste o nuovo")
#test -a $filepath  && echo  "ok  proseguo"  ||   echo  "KO non   proseguo"      
testa:
#[ -a $filepath ] &&  zenity  --question --text="stai cancellando  i dati presenti nel file :   $filepath";result=$(echo $?)  ||  echo  "ok  proseguo"
# if test -a $filepath 
# then
#          zenity  --question --text="stai cancellando  i dati presenti nel file :"
#          res=echo $?
#     else
#         echo
# fi


echo " cancello file Hash preesistente"
rm $filepath
#sleep 1
hashfun $filepath   $hashpath
echo  -e "${EMB} Fine hashing"
echo -e "${BGK} ${NONE}"
exit 0