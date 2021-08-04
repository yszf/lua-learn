mymetatable = {}
mytable = setmetatable({
    key1 = "value1"
}, {
    __newindex = mymetatable
})

print(mytable.key1) -- value1

mytable.newkey = "新值2"
print(mytable.newkey, mymetatable.newkey) -- nil  新值2

mytable.key1 = "新值1"
print(mytable.key1, mymetatable.key1) -- 新值1  nil

mytable = setmetatable({
    key1 = "value1"
}, {
    __newindex = function(mytable, key, value)
        rawset(mytable, key, "\"" .. value .. "\"") -- 设置表中指定索引的值，此函数不会调用任何元表的方法，此函数将返回table
    end
})

mytable.key1 = "new value"
mytable.key2 = 4
print(mytable.key1, mytable.key2) -- new value       "4"
