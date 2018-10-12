#!/bin/bash
grep -i -- "$1" "$2" | sort |cat -n | head -"$3"
