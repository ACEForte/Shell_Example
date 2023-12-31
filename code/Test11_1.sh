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