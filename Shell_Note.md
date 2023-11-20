# Shell 笔记
#### 这是一篇关于Bash Shell脚本的笔记
---

## 1 简介
- Shell 是一个用 C 语言编写的程序，它是用户使用 Linux 的桥梁。
- Shell 既是一种命令语言，又是一种程序设计语言。
- Shell 是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务。

## 2 一个最简单的Shell脚本
```
#!/bin/bash
echo "Hello World!"
```

其中 
- `#!` 是一个约定的标记，它告诉系统这个脚本使用哪一种 Shell解释器来执行。
- `echo` 命令用于向窗口输出文本。

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

<table>
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
	



- 1、[ ]表示条件测试。注意这里的空格很重要。要注意在'['后面和']'前面都必须要有空格
- 2、在shell中，then和fi是分开的语句。如果要在同一行里面输入，则需要用分号将他们隔开。
- 3、注意if判断中对于变量的处理，需要加引号，以免一些不必要的错误。没有加双引号会在一些含空格等的字符串变量判断的时候产生错误。比如[ -n "$var" ]如果var为空会出错
- 4、判断是不支持浮点值的
- 5、如果只单独使用>或者<号，系统会认为是输出或者输入重定向，虽然结果显示正确，但是其实是错误的，因此要对这些符号进行转意
- 6、在默认中，运行if语句中的命令所产生的错误信息仍然出现在脚本的输出结果中
- 7、使用-z或者-n来检查长度的时候，没有定义的变量也为0
- 8、空变量和没有初始化的变量可能会对shell脚本测试产生灾难性的影响，因此在不确定变量的内容的时候，在测试号前使用-n或者-z测试一下
- 9、? 变量包含了之前执行命令的退出状态（最近完成的前台进程）（可以用于检测退出状态）