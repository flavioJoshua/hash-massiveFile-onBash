test  $(cat testfile|cut -d' ' -f1)   = $(md5sum $(cat testfile|cut -d' ' -f2)|cut -d' ' -f1)  && echo yes ||  echo no

for  righe in $(cat testfile);do  echo $righe;done
for  righe in $(cat testfile);do $( test  $(echo $righe|cut -d' ' -f1)   = $(md5sum $(echo $righe|cut -d' ' -f2)|cut -d' ' -f1)  && echo yes ||  echo no);done
problema  che sia gli hash che i nomefile generano righe per cui non funziona la comparazione 
 
 cat testfile|sed -e 's/  /-/g'
5ded2c89ba31b69bc8c12eff1eff520d-test1/filelslong
------------------
for  righe in $(cat testfile|sed -e 's/  /#/g');do echo  $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1)  && echo yes ||  echo no);done
ok funziona ma con il delimitatore a # ... chissà se è safe 

V 1.1
for  righe in $(cat testfilehome|sed -e 's/  /#/g');do echo  $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1)  && echo $(echo $righe|cut -d'#' -f2) + " " +  yes ||  echo no);done
# fa vedere a che cosa  dice  yes 

V 1.2
for  righe in $(cat testfile|sed -e 's/ /#/g');do echo  $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1)  && echo $(date)  | tee  -a filetestcheckyes ||  echo $(echo $righe|cut -d'#' -f2)  " " no | tee -a filetestcheck  );done

V 1.3 
 for  righe in $(cat testfilehome|sed -e 's/ /#/g');do echo  $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1)  && echo   $righe " --"  $(date)|cut -d'#' -f1-14 | tee  -a filetestcheckyes  ||  echo $(echo $righe|cut -d'#' -f2)  " " no | tee -a filetestcheck  );done

# yes =  -##Sat#25#Sep#2021#04:56:24#PM#CEST -- Sat 25 Sep 2021 05:12:27 PM CEST

----------------
V 1.4 con la data della operazione in scrittura  cambiano i delimitatori 
 for  righe in $(cat testfilehome|sed -e 's/ /#/g');do $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f3)|cut -d' ' -f1) ) && echo  yes    ||  echo no;done

ok
 for  righe in $(cat testfilehome|sed -e 's/ /#/g');do $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f3)|cut -d' ' -f1) ) && echo  yes     $(date)|cut -d'#' -f4-14  ||  echo no;done

OK questo è completo per la data  sia in YES che in NO
 for  righe in $(cat testfilehome|sed -e 's/ /#/g');do $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1) ) && echo  "yes # " "#" $(date) "#"  $righe      $(date)|cut -d'#' -f1,3,6 | tee  -a filetestcheckyes   || echo  "NO # " "#" $(date) "#"  $righe      $(date)|cut -d'#' -f1,3,6 | tee  -a filetestcheck ;done

V1.5  con tutte le corrrezioni
 for  righe in $(cat testfilehome|sed -e 's/ /#/g');do $(test  $(echo $righe|cut -d'#' -f1)   = $(md5sum $(echo $righe|cut -d'#' -f2)|cut -d' ' -f1) ) && echo  "yes # " "#" $(date) "#"  $righe|cut -d'#' -f1,3,5,9-15 | sed 's/#/ - /g'| tee  -a filetestcheckyes   || echo  "NO # " "#" $(date) "#"  $righe |cut -d'#' -f1,3,5,9-15 |sed 's/#/ - /g'| tee  -a filetestcheck ;done 

#fix delle  output 
echo  "yes # " "#" $(date) "#"  $righe      $(date)|cut -d'#' -f1,3,5,9-15



for ff in test1/*;do $(md5sum $ff >> testfile);echo $ff;done
valori=cut  -d' ' -f1 testfile 
for val in $valori;do echo $val;done

-----
for ff in $(find test1 -type f);do md5sum $ff >> ~/testfile  ;done

V 1.1 abbinata  alla  V 1.5
variante con data 
for ff in $(find ~/ -type f);do echo $( md5sum $ff)  " - "   $(date) >> ~/testfile ; done

--------------
 for ff in $(find test1 -type f);do md5sum $ff >> ~/testfile  ;done
5ded2c89ba31b69bc8c12eff1eff520d  test1/filelslong
5ded2c89ba31b69bc8c12eff1eff520d  test1/filelslong
13be1aef29b6e5e1a665da51d68dd46d  test1/filels
26bca570da1a88982e232f2ca524a8ac  test1/script.sh
d41d8cd98f00b204e9800998ecf8427e  test1/filetest


echo $valori
5ded2c89ba31b69bc8c12eff1eff520d 13be1aef29b6e5e1a665da51d68dd46d 26bca570da1a88982e232f2ca524a8ac d41d8cd98f00b204e9800998ecf8427e d215a5d1e877b503b157d62fd4e8b952 50519f57841099d68a834fa392637297 d41d8cd98f00b204e9800998ecf8427e d9553d1b2d866932eba633ec20288183 5ded2c89ba31b69bc8c12eff1eff520d
--------------

Zenity 



if 

filepath=$(zenity --file-selection   --save --title=" segli il tuo fileName esiste o nuovo")

[ -a $filepath ] && echo esiste || echo " non esiste" 


zenity --warning \
--text="Disconnect the power cable to avoid electrical shock."


#!/bin/bash

zenity --warning \
--text="Disconnect the power cable to avoid electrical
