#!/bin/bash
#test -a /etc/systemd/
test=qualcosa 
echo $test
zenity  --warning --text="test"
if [file exists $filepath ]
    then
        echo "  esiste "
    else
        echo  " non esiste "
        
fi
[ -a $filepath ] &&  zenity  --warning --text="stai cancellando  i dati presenti nel file : "  $filepath ||  echo  "ok  proseguo"
sleep 1
echo  "test"
