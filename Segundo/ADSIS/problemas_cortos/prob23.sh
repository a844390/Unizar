#!/bin/bash
var0=0
export var1=1
function f_var0 {
    echo -e "\tfunction f_var0, begin f_var0, var0: $var0"
    var0="zero"
    echo -e "\tfunction f_var0, end f_var0, var0: $var0"
}
function f_var1 {
    echo -e "\tfunction f_var1, begin f_var1, var1: $var1"
    var1="one"
    echo -e "\tfunction f_var1, end f_var1, var1: $var1"
}

echo "Program begins, var0: $var0, var1: $var1"

f_var0 #Llama a la función f_var0
f_var1 #Llama a la función f_var1

echo "Before updating, var0: $var0, var1: $var1"

var0=5
var1=1
( f_var0; f_var1 )
echo "After sub-shell, var0: $var0, var1: $var1"
exit 0

#Program begins, var0: 0, var1: 1
#    function f_var0, begin f_var0, var0: 0
#    function f_var0, end f_var0, var0: zero
#    function f_var1, begin f_var1, var1: 1
#    function f_var1, end f_var1, var1: one
#Before updating, var0: zero, var1: one
#    function f_var0, begin f_var0, var0: zero
#    function f_var0, end f_var0, var0: zero
#    function f_var1, begin f_var1, var1: one
#    function f_var1, end f_var1, var1: one
#After sub-shell, var0: zero, var1: one