#!/bin/bash
#test -a /etc/systemd/

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

function funtest
{
    echo "funzione spettacolare"
}
if test ! $1  = ""
then 
    echo "ce un parametro"
    filepath=$1
    jumpto testa
fi


test=qualcosa 
#echo $test
filepath=$(zenity --file-selection   --save --title=" segli il tuo fileName esiste o nuovo")
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
funtest 
echo  "test"
