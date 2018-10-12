#!/bin/bash 
VAR=$(echo "$USER" "$HOME")
NUM=$(echo "$VAR" | wc -m )
echo "$VAR" $(($NUM - 2))
