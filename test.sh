#!/bin/bash
#test -a /etc/systemd/
test=qualcosa 
#echo $test
filepath=$(zenity --file-selection   --save --title=" segli il tuo fileName esiste o nuovo")
#test -a $filepath  && echo  "ok  proseguo"  ||   echo  "KO non   proseguo"      
[ -a $filepath ] &&  zenity  --question --text="stai cancellando  i dati presenti nel file :   $filepath";result=$(echo $?)  ||  echo  "ok  proseguo"
# if test -a $filepath 
# then
#          zenity  --question --text="stai cancellando  i dati presenti nel file :"
#          res=echo $?
#     else
#         echo
# fi



echo $result
if  test $result = "1" 
    then 
        echo "OK "
        
    else
        echo  " KO "
        exit 
fi

#sleep 1
echo  "test"
