#!/bin/bash
countarg.sh "$*" 
echo "Все аргументы, объединённые в один: $*"
countarg.sh "$@"
echo "Все аргументы по отдельности: $@"
