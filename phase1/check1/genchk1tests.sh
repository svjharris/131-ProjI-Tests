#!/bin/bash

echo "Generating all combinations of (int OR float OR bool )
 (+ OR - OR * OR \ OR % OR < OR <= OR > OR >= OR == OR != OR || OR && OR & OR ^ OR | )
(int OR float OR bool)"

ints="int"
float="float"
const1="err"
const2="err"

for type1 in "int" "float" "bool";
do
  if [ $type1 == $ints ]
  then
    const1="1"
  elif [ $type1 == $float ]
  then
    const1="1.0"
  else 
    constl="false"
  fi
  for type2 in "int" "float" "bool";
  do
        NAMES=("plus" "minus" "star" "slash" "mod" "LT" "LEQ" "GT" "GEQ" "EQ" "or" "and" "amp" "caret" "bar")
        counter=0
  	for op in "+" "-" "*" "\\" "%" "<" "<=" ">" ">=" "==" "!=" "||" "&&" "&" "^" "|";
 	do
	  if [ $type2 == $ints ] 
          then 
	    const2="1"
	  elif [ $type2 == $float ] 
	  then
	    const2="1.0"
	  else 
	    const2="false"
          fi
	  echo "$type1 i = $const1; 
                $type2 j = $const2;
                $type1 k = i $op j;" > "$type1${NAMES[$counter]}$type2".rc  
          let counter=counter+1
 	done
  done
done


echo "Finished generating tests"
