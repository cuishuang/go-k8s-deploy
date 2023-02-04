#!/bin/bash

for i in $(seq 1 10)     
do
  curl http://127.0.0.1:60258
  echo " "
echo $i
done