#!/bin/bash
#test -a /etc/systemd/

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
    echo "end hashing"
}
if test ! $1  = ""
then 
    echo "ce un parametro"
    filepath=$1
    jumpto testa
fi


test=qualcosa 
#echo $test

hashpath=$(zenity --file-selection   --directory --save --title=" scegli il Path  di cui vuoi avere l Hashing")


filepath=$(zenity --file-selection   --save --title=" scegli il tuo fileName esiste o nuovo")
#test -a $filepath  && echo  "ok  proseguo"  ||   echo  "KO non   proseguo"      
testa:
[ -a $filepath ] &&  zenity  --question --text="stai cancellando  i dati presenti nel file :   $filepath";result=$(echo $?)  ||  echo  "ok  proseguo"
# if test -a $filepath 
# then
#          zenity  --question --text="stai cancellando  i dati presenti nel file :"
#          res=echo $?
#     else
#         echo
# fi



echo $result
if  test $result = "0" 
    then 
        echo "OK "
        rm $filepath
        echo "cancellato"
    else
        echo  " non cancello il  file pre esistente  - KO "
        #exit 
fi

#sleep 1
hashfun $filepath   $hashpath
echo  "Fine hashing"
