#!/bin/bash
#test -a /etc/systemd/
test=qualcosa 
#echo $test
filepath=$(zenity --file-selection   --save --title=" segli il tuo fileName esiste o nuovo")
test -a $filepath  && echo  "ok  proseguo"  ||   echo  "KO non   proseguo"      
[ -a $filepath ] &&  zenity  --warning --text="stai cancellando  i dati presenti nel file : "  $filepath ||  echo  "ok  proseguo"
#sleep 1
echo  "test"
