#!/bin/bash 
grep 000000 bash.txt > /tmp/zeroes
grep -v 000000 bash.txt > /tmp/nozeroes 
echo "Первые 10 строк из /tmp/zeroes:"
cat /tmp/zeroes | head -10
echo "Последние 10 строк из /tmp/zeroes:"
cat /tmp/zeroes | tail -10
echo "Первые 10 строк из /tmp/nozeroes:"
cat /tmp/nozeroes | head -10
echo "Последние 10 строк из /tmp/nozeroes:"
cat /tmp/nozeroes | tail -10
