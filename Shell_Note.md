# Shell 笔记
#### 🤣👉 这是一篇关于Bash Shell脚本的笔记

- [Shell 笔记](#shell-笔记)
      - [🤣👉 这是一篇关于Bash Shell脚本的笔记](#-这是一篇关于bash-shell脚本的笔记)
  - [1 简介](#1-简介)
  - [2 一个最简单的Shell脚本](#2-一个最简单的shell脚本)
  - [3 变量操作](#3-变量操作)
    - [I 定义变量](#i-定义变量)
    - [II 只读变量](#ii-只读变量)
    - [III 变量调用](#iii-变量调用)
    - [IV 删除变量](#iv-删除变量)
  - [4 字符串操作](#4-字符串操作)
    - [I 字符串定义](#i-字符串定义)
    - [II 字符串拼接](#ii-字符串拼接)
    - [III 字符串长度获取](#iii-字符串长度获取)
    - [IV 提取子字符串](#iv-提取子字符串)
    - [V 查找子字符串](#v-查找子字符串)
  - [5 数组](#5-数组)
    - [I 数组定义](#i-数组定义)
    - [II 数组读取](#ii-数组读取)
    - [III 数组长度获取](#iii-数组长度获取)
    - [IV 关联数组](#iv-关联数组)
  - [6 Shell 传递参数](#6-shell-传递参数)
  - [7 基本运算符](#7-基本运算符)
    - [I 算数运算符](#i-算数运算符)
    - [II 关系运算符](#ii-关系运算符)
    - [III 布尔运算符](#iii-布尔运算符)
    - [IV 字符串运算符](#iv-字符串运算符)
    - [V 文件测试运算符](#v-文件测试运算符)
  - [8 条件测试](#8-条件测试)
  - [9 流程控制](#9-流程控制)
    - [I If-Else-Fi](#i-if-else-fi)
    - [II For](#ii-for)
    - [III While](#iii-while)
    - [IV Until](#iv-until)
    - [V Case ... Esac](#v-case--esac)
    - [VI 循环控制](#vi-循环控制)
  - [10 输出控制](#10-输出控制)
    - [I Echo语句](#i-echo语句)
    - [II Printf](#ii-printf)
  - [11 函数](#11-函数)


---
## 1 简介
- Shell 是一个用 C 语言编写的程序，它是用户使用 Linux 的桥梁。
- Shell 既是一种命令语言，又是一种程序设计语言。
- Shell 是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务。
---
## 2 一个最简单的Shell脚本
```
#!/bin/bash
echo "Hello World!"
```
其中 
- `#!` 是一个约定的标记，它告诉系统这个脚本使用哪一种 Shell解释器来执行。
- `echo` 命令用于向窗口输出文本。

---
## 3 变量操作

### I 定义变量
Shell的变量定义要注意以下方面
- 命名只能使用**英文字母，数字和下划线**，首个字符不能以数字开头
- 中间**不能有空格**，但可以使用下划线
- **不能使用特殊符号**
- **不能使用bash里的关键字**

### II 只读变量
使用 `readonly` 关键字可以将变量定义为只读变量
**只读变量的值不能被改变**

### III 变量调用
使用一个定义过的变量，在变量名前面加`$`以使用变量内存储的值
```
var1="Neusoft"
echo ${var1}
```
其中 
- `var1="Neusoft"` 为变量定义
- `echo ${var1}` 为输出语句
- 也可以将 `echo ${var1}` 写作 `echo $var1`，执行结果相同；`{}` 是帮助解释器识别变量的边界
- 建议使用 `{}` 的写法，可以避免不必要的错误，增强代码的可读性

### IV 删除变量
使用 unset 命令可以删除变量
```
unset var1
```
**unset 命令不能删除只读变量**

---
## 4 字符串操作

### I 字符串定义
定义字符串可以用单引号，也可以用双引号，也可以不用引号
```
# 单引号
str1='this is a string'
# 双引号
str2="this is a string, too"
```

单引号字符串的特点：
- 单引号里的任何字符都会原样输出
- 单引号字符串中的变量是无效的
- 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用

双引号字符串的特点：
- 双引号里可以有变量
- 双引号里可以出现转义字符

### II 字符串拼接
```
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
```


### III 字符串长度获取
```
str="abcde"
echo ${#str}
# Output: 5

# 当变量为字符串时，${#str} 等价于 ${#str[0]}:
str="abcde"
echo ${#str[0]}
# Output: 5
```

### IV 提取子字符串
```
str="it is a Linux Program"
echo ${str:1:4}
Output: 't is'
```

### V 查找子字符串
查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
```
str="it is a Linux Program"
echo `expr index "$str" io`
Output: 0
```
---
## 5 数组
bash只支持一维数组，并且没有限定数组的大小。
```
arr=(val0 val1 val2 val3)

# Or

arr=( 
val0
val1
val2
val3
)

# Or

arr[0]=val0
arr[1]=val1
arr[n]=valn
```

### I 数组定义
在 Shell 中，一般用括号来表示数组，数组元素用"空格"符号分割开

### II 数组读取
读取数组元素值的一般格式是 `${数组名[下标]}`
```
val=${arr[n]}
```

使用 @ 符号可以获取数组中的所有元素
```
echo ${arr[@]}
```
### III 数组长度获取
```
# 取得数组元素的个数
length=${#arr[@]}

# 或者
length=${#arr[*]}

# 取得数组单个元素的长度
length=${#arr[n]}
```

### IV 关联数组
Bash 支持关联数组，可以使用任意的字符串、或者整数作为下标来访问数组元素(类似于Python的Dictionary)

关联数组使用 `declare` 命令来声明
```
declare -A site=(["google"]="www.google.com" ["baidu"]="www.baidu.com" ["taobao"]="www.taobao.com")

# Or

declare -A site
site["google"]="www.google.com"
site["baidu"]="www.baidu.com"
site["taobao"]="www.taobao.com"
```
访问关联数组元素可以使用指定的键
```
echo ${site["baidu"]}
```
---
## 6 Shell 传递参数
代码如下
```
# filename="Args.sh"
echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";
```
调用该文件
```
$ chmod +x Args.sh 
$ ./Args.sh 1 2 3
```
输出：
```
Output: 
Shell 传递参数实例！
执行的文件名：./Args.sh
第一个参数为：1
第二个参数为：2
第三个参数为：3
```

<table style='text-align: center'>
    <thead>
        <tr>
            <td>特殊字符</td>
            <td>说明</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>$#</td>
            <td>传递到脚本的参数个数</td>
        </tr>
        <tr>
            <td>$*</td>
            <td>以一个单字符串显示所有向脚本传递的参数。如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。</td>
        </tr>
        <tr>
            <td>$$</td>
            <td>后台运行的最后一个进程的ID号</td>
        </tr>
        <tr>
            <td>$@</td>
            <td>与$*相同，但是使用时加引号，并在引号中返回每个参数。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。</td>
        </tr>
        <tr>
            <td>$-</td>
            <td>显示Shell使用的当前选项，与set命令功能相同。</td>
        </tr>
        <tr>
            <td>$?</td>
            <td>显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。</td>
        </tr>
    </tbody>
</table>

---
## 7 基本运算符
原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
### I 算数运算符
- \+	加法
- \-	减法
- \*	乘法
- \/	除法
- \%	取余
- \=	赋值
- \==	相等

### II 关系运算符
- -eq	检测两个数是否相等，相等返回 true
- -ne	检测两个数是否不相等，不相等返回 true
- -gt	检测左边的数是否大于右边的，如果是，则返回 true
- -lt	检测左边的数是否小于右边的，如果是，则返回 true
- -ge	检测左边的数是否大于等于右边的，如果是，则返回 true
- -le	检测左边的数是否小于等于右边的，如果是，则返回 true

### III 布尔运算符
- !	非运算，表达式为 true 则返回 false，否则返回 true
- -o	或运算，有一个表达式为 true 则返回 true
- -a	与运算，两个表达式都为 true 才返回 true
- <b style='color: Red; Bold: True'>Shell中，0为True，1为False</b>

### IV 字符串运算符
- =	    检测两个字符串是否相等，相等返回 true
- !=	检测两个字符串是否不相等，不相等返回 true
- -z	检测字符串长度是否为0，为0返回 true
- -n	检测字符串长度是否不为 0，不为 0 返回 true
- $	    检测字符串是否不为空，不为空返回 true

### V 文件测试运算符

- -b [file]	检测文件是否是块设备文件，如果是，则返回 true
- -c [file]	检测文件是否是字符设备文件，如果是，则返回 true
- -d [file]	检测文件是否是目录，如果是，则返回 true
- -f [file]	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true
- -g [file]	检测文件是否设置了 SGID 位，如果是，则返回 true
- -k [file]	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true
- -p [file]	检测文件是否是有名管道，如果是，则返回 true
- -u [file]	检测文件是否设置了 SUID 位，如果是，则返回 true
- -r [file]	检测文件是否可读，如果是，则返回 true
- -w [file]	检测文件是否可写，如果是，则返回 true
- -x [file]	检测文件是否可执行，如果是，则返回 true
- -s [file]	检测文件是否为空（文件大小是否大于0），不为空返回 true	
- -e [file]	检测文件（包括目录）是否存在，如果是，则返回 true

检查符:
- -S: 判断某文件是否 socket。
- -L: 检测文件是否存在并且是一个符号链接。

---
## 8 条件测试
在Shell脚本中各种条件结构和流程控制结构中会存在各种判断比较，然后根据不同的判断结果执行不同的操作或命令，返回的结果通常为真或假
```
# 利用test命令进行条件测试表达式，test命令和表达式中间至少有一个空格
test <Expression>

# Or 
# 利用[]进行条件测试的方法，表达式与[]前后均需要有至少一个空格
[ <Expression> ]

# Or 
# 利用[ [ ] ]进行条件测试的方法，表达式与[ [ ] ]前后均需要有至少一个空格
[[ <Expression> ]]

# Or
# 利用(())进行条件测试的方法,表达式与(())前后不需要有空格，一般用于if语句
((<测试表达式>))
```


- [ ]表示条件测试。注意这里的空格很重要。要注意在'['后面和']'前面都必须要有空格
- 在shell中，then和fi是分开的语句。如果要在同一行里面输入，则需要用分号将他们隔开。
- 注意if判断中对于变量的处理，需要加引号，以免一些不必要的错误。没有加双引号会在一些含空格等的字符串变量判断的时候产生错误。比如[ -n "$var" ]如果var为空会出错
- 判断是不支持浮点值的
- 如果只单独使用>或者<号，系统会认为是输出或者输入重定向，虽然结果显示正确，但是其实是错误的，因此要对这些符号进行转意
- 在默认中，运行if语句中的命令所产生的错误信息仍然出现在脚本的输出结果中
- 使用-z或者-n来检查长度的时候，没有定义的变量也为0
- 空变量和没有初始化的变量可能会对shell脚本测试产生灾难性的影响，因此在不确定变量的内容的时候，在测试号前使用-n或者-z测试一下
- ? 变量包含了之前执行命令的退出状态（最近完成的前台进程）（可以用于检测退出状态）

---
## 9 流程控制
Shell 的流程控制不可为<b><span style="color: Red">空</span></b>

### I If-Else-Fi
与常规的IF-ELSE语句基本相同，IF后接**条件测试**语句
```
a=10
b=20
if [ $a == $b ]; then
   echo "a 等于 b"
elif [ $a -gt $b ]; then
   echo "a 大于 b"
elif [ $a -lt $b ]; then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi
```

### II For
与常规的FOR-EACH语句类似，细节上有些许不同
```
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
```

### III While
```
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

# Let用于执行一个或多个表达式，变量计算中不需要加 $ 来表示变量

# Output: 
# 1
# 2
# 3
# 4
# 5
```

### IV Until
```
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
```

### V Case ... Esac
与 Switch ... Case 语句类似，整体结构为
```
case val in
pattern1)
    command1
    command2
    ...
    commandN
    ;;
pattern2)
    command1
    command2
    ...
    commandN
    ;;
esac
```
```
echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac

# Output:
# 输入 1 到 4 之间的数字:
# 你输入的数字为:
# 2
# 你选择了 2
```

### VI 循环控制
- Break 跳出所有循环
- Continue 跳出当前循环

---
## 10 输出控制
### I Echo语句
类似PHP 的 `echo` ，用于输出语句
`Echo` 后可加入
- -n 不换行输出
- -e 启用反斜线转义解释
- -E 禁用反斜线转义解释（默认）

### II Printf
类似C的printf()
```
printf  format-string  [arguments...]
```
<table>
    <thead>
        <tr>
            <td>序列</td>
            <td>说明</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>\a</td>
            <td>警告字符，通常为ASCII的BEL字符</td>
        </tr>
        <tr>
            <td>\b</td>
            <td>后退</td>
        </tr>
        <tr>
            <td>\c</td>
            <td>抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略</td>
        </tr>
        <tr>
            <td>\f</td>
            <td>换页（formfeed）</td>
        </tr>
        <tr>
            <td>\n</td>
            <td>换行</td>
        </tr>
        <tr>
            <td>\r</td>
            <td>回车（Carriage return）</td>
        </tr>
        <tr>
            <td>\t</td>
            <td>水平制表符</td>
        </tr>
        <tr>
            <td>\v</td>
            <td>垂直制表符</td>
        </tr>
        <tr>
            <td>\\</td>
            <td>一个字面上的反斜杠字符</td>
        </tr>
        <tr>
            <td>\ddd</td>
            <td>表示1到3位数八进制值的字符。仅在格式字符串中有效</td>
        </tr>
        <tr>
            <td>\0ddd</td>
            <td>表示1到3位的八进制值字符</td>
        </tr>
    </tbody>
</table>

---
## 11 函数
与其他编程语言类似，基本写法为
```
[ function ] funname [()]
{
    action;
    [return int;]
}
```

- 可以带function fun() 定义，也可以直接fun() 定义,不带任何参数。
- 参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n

```
demoFun(){
    echo "这是我的第一个 Shell 函数!"
}
echo "-----函数开始执行-----"
demoFun
echo "-----函数执行完毕-----"

# Output:
# -----函数开始执行-----
# 这是我的第一个 Shell 函数!
# -----函数执行完毕-----

funWithReturn(){
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: "
    read aNum
    echo "输入第二个数字: "
    read anotherNum
    echo "两个数字分别为 $aNum 和 $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn
echo "输入的两个数字之和为 $? !"

# Output:
# 这个函数会对输入的两个数字进行相加运算...
# 输入第一个数字: 
# 1
# 输入第二个数字: 
# 2
# 两个数字分别为 1 和 2 !
# 输入的两个数字之和为 3 !
```

**`$?` 仅对其上一条指令负责，一旦函数返回后其返回值没有立即保存入参数，那么其返回值将不再能通过 `\$?` 获得。**