#!/bin/bash

str1="Neusoft"
# 使用双引号拼接
str2="hello, "$str1" !"
str3="hello, ${str1} !"
echo $str2  $str3
# Output: hello, Neusoft ! hello, Neusoft !

# 使用单引号拼接
str4='hello, '$str1' !'
str5='hello, ${str1} !'
echo $str4  $str5
# Output: hello, Neusoft ! hello, ${str1} !