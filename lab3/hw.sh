#!/bin/bash
date "+%T %D" >> /tmp/run.log
echo "Hello World!"
cat /tmp/run.log | wc -l >&2
