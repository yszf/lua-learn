function foo(a, b, c, ...)
    -- 用关键字local定义。如果没有用local定义,即使在函数内部定义的变量也是全局变量!
    local sum = a + b
    return sum, c -- 函数可以返回多个值
end

r1, r2 = foo(1, "123", "hello") -- 平行赋值
print(r1, r2); -- 124     hello
