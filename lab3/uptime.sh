#!/bin/bash
date +"%D %T"
cat /etc/passwd | cut -d: -f1
uptime
