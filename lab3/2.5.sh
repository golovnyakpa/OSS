#!/bin/bash
find /home/pavel -type f -name "*.txt" 
find /home/pavel -type f -name "*.txt" -exec cat {}  >> /tmp/2.5.txt \;
echo "Всего строк в текстовых файлах в домашнем каталоге пользователя:"
cat /tmp/2.5.txt | wc -l
echo "Размер всех текстовых файлов в домашнем каталоге пользователя:"
du -b /tmp/2.5.txt
