#!/bin/bash

usage() {
  echo "Usage: $0"
  exit 1
}

sort_order=0
fname="x"
lname="x"
mobile="x"
office="x"

while getopts ":C:f:l:n:o:k:c:v:ad" opt; do
  case $opt in
    C)
      command=$OPTARG
      ;;
    f)
      fname=$OPTARG
      ;;
    l)
      lname=$OPTARG
      ;;
    n)
      mobile=$OPTARG
      ;;
    o)
      office=$OPTARG
      ;;
    k)
      key=$OPTARG
      ;;
    c)
      col=$OPTARG
    ;;
    v)
      val=$OPTARG
    ;;
    a) 
        sort_order=1
      ;;
      d)
       sort_order=2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

case $command in
  insert)
    if [[ -n $fname && -n $lname && -n $mobile && -n $office ]]; then
      echo "$fname,$lname,$mobile,$office" >> contacts.csv
    else
      echo "Error" >&2
      usage
    fi
    ;;
      edit)
      while IFS="," read -r column1 column2 column3 column4
        do
                if test "$key" = "$column1"
                then
                        if test "$fname" != "x"
                        then
                                sed -i "s/$column1/$fname/" contacts.csv
                        fi

                        if test "$lname" != "x"
                        then
                                sed -i "s/$column2/$lname/" contacts.csv
                        fi

                        if test "$mobile" != "x"
                        then
                                sed -i "s/$column3/$mobile/" contacts.csv
                        fi

                        if test "$office" != "x"
                        then
                                sed -i "s/$colum4/$office/" contacts.csv
                        fi

                break
                fi
        done < contacts.csv
    ;;

  display)
    head -1 contacts.csv
    [[ $sort_order == 0 ]] && (cat contacts.csv | tail -n +2)
    [[ $sort_order == 1 ]] && (cat contacts.csv | tail -n +2 | sort)
    [[ $sort_order == 2 ]] && (cat contacts.csv | tail -n +2 | sort -r) 
    ;;
  search)
    if [[ -n $fname ]]; then
      grep "^$fname," contacts.csv
    elif [[ -n $lname ]]; then
      grep "^[^,]*[,]$lname," contacts.csv
    elif [[ -n $mobile ]]; then
      grep "^[^,]*[,][^,]*[,]$mobile," contacts.csv
    elif [[ -n $office ]]; then
      grep "^[^,]*[,][^,]*[,][^,]*[,]$office" contacts.csv
    else
      echo "Error." >&2
      usage
    fi
    ;;
  delete)
    while IFS="," read -r column1 column2 column3 column4
        do
                if test "$key" = "$column1"
                then 
                        sed -i "/$column1,/d" contacts.csv
                        break
                fi
        done < contacts.csv
    ;;
  *)
    echo "Error" >&2
    usage
    ;;
esac
