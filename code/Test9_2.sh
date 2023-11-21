#!/bin/bash

a=0
until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done

# Output:
# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9