#!/bin/bash

str="abcde"
echo ${#str}
# Output: 5

# 当变量为字符串时，${#str} 等价于 ${#str[0]}:
str="abcde"
echo ${#str[0]}
# Output: 5