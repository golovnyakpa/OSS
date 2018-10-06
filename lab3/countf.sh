#!/bin/bash
var=$(ls -lR ~ | grep "^-" | wc -l) 
echo "Домашний каталог пользователя"
whoami
echo "содержит обычных файлов:"
ls -lR | grep "^-" | wc -l
echo "скрытых файлов"
var1=$(ls -lRa ~ | grep "^-" | wc -l)
let var2=($var1 - $var)
echo $var2
