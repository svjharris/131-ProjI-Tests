 #!/bin/bash
  2
  3 echo "Generating all combinations of (int OR float OR bool )
  4  (+ OR - OR * OR \ OR % OR < OR <= OR > OR >= OR == OR != OR || OR && OR & OR ^ OR | )
  5 (int OR float OR bool)"
  6
  7 ints="int"
  8 float="float"
  9 const1="err"
 10 const2="err"
 11
 12 for type1 in "int" "float" "bool";
 13 do
 14   if [ $type1 == $ints ]
 15   then
 16     const1="1"
 17   elif [ $type1 == $float ]
 18   then
 19     const1="1.0"
 20   else
 21     constl="false"
 22   fi
 23   for type2 in "int" "float" "bool";
 24   do
 25         NAMES=("plus" "minus" "star" "slash" "mod" "LT" "LEQ" "GT" "GEQ" "EQ" "or" "and" "amp" "caret" "bar")
 26         counter=0
 27         for op in "+" "-" "*" "\\" "%" "<" "<=" ">" ">=" "==" "!=" "||" "&&" "&" "^" "|";
 28         do
 29           if [ $type2 == $ints ]
 30           then
 31             const2="1"
 32           elif [ $type2 == $float ]
 33           then
 34             const2="1.0"
 35           else
 36             const2="false"
 37           fi
 38           echo "$type1 i = $const1;
 39                 $type2 j = $const2;
 40                 $type1 k = i $op j;" > "$type1${NAMES[$counter]}$type2".rc
 41           let counter=counter+1
 42         done
 43   done
 44 done
 45
 46
 47 echo "Finished generating tests"
