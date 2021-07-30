array = {"Lua", "Tutorial"}

for key, value in ipairs(array) do
    print(key, value)
end

-- Lua 默认提供的迭代函数 ipairs。
-- 首先，初始化，计算in后面表达式的值，表达式应该返回范性for需要的三个值：迭代函数、状态常量、控制变量；与多值赋值一样，如果表达式返回的结果个数不足三个会自动用nil补足，多出部分会被忽略。
-- 第二，将状态常量和控制变量作为参数调用迭代函数（注意：对于for结构来说，状态常量没有用处，仅仅在初始化时获取他的值并传递给迭代函数）。
-- 第三，将迭代函数返回的值赋给变量列表。
-- 第四，如果返回的第一个值为nil循环结束，否则执行循环体。
-- 第五，回到第二步再次调用迭代函数

-- 无状态的迭代器
-- 无状态的迭代器是指不保留任何状态的迭代器，因此在循环中我们可以利用无状态迭代器避免创建闭包花费额外的代价。
-- 每一次迭代，迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用，一个无状态的迭代器只利用这两个值可以获取下一个元素。
-- 这种无状态迭代器的典型的简单的例子是ipairs，他遍历数组的每一个元素。

function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount then
        currentNumber = currentNumber + 1
        return currentNumber, currentNumber * currentNumber
    end
end

for i, n in square, 3, 0 do
    print(i, n)
end

function iter(a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end

function ipairs(a)
    return iter, a, 0
end

for key, value in ipairs(array) do
    print(key, value)
end