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

    echo -e "${EMB} ${BGY}  "






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
    nodata1=$3
    echo -e  "\n\tvalore di nodata1:  $nodata1  \n"
    echo "begin hashing path: " $pathhash " - Filehash: "  $filehash
    if test  $nodata1 = "1"
    then
        echo -e "\t Hashing senza data - base mode"
        for ff in $(find $pathhash -type f);do  md5sum $ff >> $filehash ; done

    else
        for ff in $(find $pathhash -type f);do echo $( md5sum $ff)  " - "   $(date) >> $filehash ; done
    fi
    echo "end hashing"
}


function testParam
{

    #echo " ci sono due parametri"
    echo "  check fileHash per serializzare gli Hash delle directory"
    ls -l $1
    res=$?
    if test ! $res = "0"
    then 
        echo " il file hash non esiste preventivamente  \$? "   $res
        touch $1
        ls -l $1
        res=$?
        echo " result \$? "   $res
        if test ! $res = "0"
        then 
            echo " Errore nella creazione file Hashing"
            exit 2
        fi
        rm $1
        else
            echo " il file hash già  esiste   \$? "   $res
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
}


param=$#
echo $param
if test \( $param = "0" \) -o    \( $param = "1" \) -o    \( $param = "3" \) -o    \( $param = "2" \)
then
    echo  echo  "ok parametri "
    if test \( $param = "1" \) -o    \( $param = "3" \) 
    then
            if  test $1 = "base" 
            then
            echo  "ok base " 
            else  
                echo "errore: con un solo parametro o 3 parametri, l  unico parametro accettato è base "
                exit 5
            fi
            filepath=$2
            hashpath=$3
            nodata="1"  #  creo  hash md5  compatibile con md5sum in check -c  file 
            if test  \( $param = "3" \) 
            then
                testParam  $filepath  $hashpath
                jumpto testa
            fi    
        elif test  $param = "2"  
        then
            filepath=$1
            hashpath=$2
            testParam  $filepath  $hashpath
            jumpto testa
        
    fi

else
    echo " numero parametri  sbagliati  $#"
fi

# if test ! $1  = ""
# then 
#     echo "ce un parametro"
#     filepath=$1
#     jumpto testa
# fi


test=qualcosa 
#echo $test

hashpath=$(zenity --file-selection   --directory --save --title=" scegli il Path  di cui vuoi avere l Hashing")
res=$?
echo   $hashpath  " - "  res

if test $res = "1"
then 
    echo " exit per mancanza di Path di Hashing "
    exit 2    
fi 

filepath=$(zenity --file-selection   --save --title=" scegli il tuo fileName esiste o nuovo")
res=$?
echo   $hashpath  " - "  res

if test $res = "1"
then 
    echo " exit per mancanza del File di Output  Hashing "
    exit 3    
fi 


#test -a $filepath  && echo  "ok  proseguo"  ||   echo  "KO non   proseguo"      
testa:
[ -a $filepath ] &&  zenity  --question --text="stai cancellando  i dati presenti nel file :   $filepath";result=$?  ||  echo  "ok  proseguo"

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
hashfun $filepath   $hashpath $nodata
echo  -e "${EMB} Fine hashing"
echo -e "${BGK} ${NONE}"
exit 0

