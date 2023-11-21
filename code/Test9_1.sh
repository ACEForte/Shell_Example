#!/bin/bash

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

# Output:
# The value is: 1
# The value is: 2
# The value is: 3
# The value is: 4
# The value is: 5

# 字符串处理方式(This is a String)
for str in This is a string
do
    echo $str
done

# Output:
# This
# is
# a
# string