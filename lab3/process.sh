#!/bin/bash
var=$(whoami)
echo "Процессов пользователя:"
whoami
ps -u $var | wc -l
echo "Процессов пользователся root:"
ps -u root | wc -l
