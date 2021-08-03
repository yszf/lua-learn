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
print(mytable.key1, mymetatable.newkey1) -- 新值1  nil

mytable = setmetatable({
    key1 = "value1"
}, {
    __newindex = function(mytable, key, value)
        rawset(mytable, key, "\"" .. value .. "\"")
    end
})

mytable.key1 = "new value"
mytable.key2 = 4
print(mytable.key1, mytable.key2) -- new value       "4"
