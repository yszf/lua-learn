function createCountdownTimer(second)
    local ms = second * 1000 -- ms为countDown的Upvalue
    local function countDown()
        ms = ms - 1
        return ms
    end

    return countDown
end

local timer1 = createCountdownTimer(1)

for i = 1, 3 do
    print(timer1())
end

-- 关于函数闭包描述

-- Upvalue
-- 一个函数所使用的定义在它的函数体之外的局部变量(external local variable)称为这个函数的upvalue。

-- 函数闭包
-- 一个函数和它所使用的所有upvalue构成了一个函数闭包。

-- Lua函数闭包与C函数的比较
-- Lua函数闭包使函数具有保持它自己的状态的能力,从这个意义上说,可以 与带静态局部变量的C函数相类比。
-- 但二者有显著的不同:对Lua来说,函数 是一种基本数据类型——代表一种(可执行)对象,
-- 可以有自己的状态;但是对带静态局部变量的C函数来说,它并不是C的一种数据类型,
-- 更不会产生 什么对象实例,它只是一个静态地址的符号名称。