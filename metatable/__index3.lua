--[[

是否还记得当我们访问一个table中不存在的字段时，会返回什么值？默认情况下，
当我们访问一个table中不存在的字段时，得到的结果是nil。
但是这种状况很容易被改变；Lua是按照以下的步骤决定是返回nil还是其它值得：

当访问一个table的字段时，如果table有这个字段，则直接返回对应的值；
当table没有这个字段，则会促使解释器去查找一个叫__index的元方法，接下来就就会调用对应的元方法，返回元方法返回的值；
如果没有这个元方法，那么就返回nil结果。

Windows = {} -- 创建一个命名空间
--]]

-- 创建默认值表
Windows.default = {
    x = 0,
    y = 0,
    width = 100,
    height = 100,
    color = {
        r = 255,
        g = 255,
        b = 255
    }
}

Windows.mt = {} -- 创建元表

-- 声明构造函数
function Windows.new(o)
    setmetatable(o, Windows.mt)
    return o
end

-- 定义__index元方法
-- Windows.mt.__index = function(table, key)
--     return Windows.default[key]
-- end

Windows.mt.__index = Windows.default

local win = Windows.new({
    x = 10,
    y = 10
})
print(win.x) -- >10 访问自身已经拥有的值
print(win.width) -- >100 访问default表中的值
print(win.color.r) -- >255 访问default表中的值

-- 在实际编程中，__index元方法不必一定是一个函数，它还可以是一个table。
-- 当它是一个函数时，Lua以table和不存在key作为参数来调用该函数，这就和上面的代码一样；
-- 当它是一个table时，Lua就以相同的方式来重新访问这个table，所以上面的代码也可以是这样的
