#!/bin/bash
ps -eo euid,ruid,cmd | awk '{ if ($NR != 0 &&  ($1 != $2)) print $3 }'
