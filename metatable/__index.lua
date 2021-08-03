mytable = {} -- 普通表 
mymetatable = {} -- 元表
setmetatable(mytable, mymetatable) -- 把 mymetatable 设为 mytable 的元表 

mytable = setmetatable({}, {})

getmetatable(mytable) -- 这回返回mymetatable

other = {
    foo = 3
}

t = setmetatable({}, {
    __index = other
})

print(t.foo) -- 3
print(t.bar) -- nil

mytable = setmetatable({
    key1 = "value1"
}, {
    __index = function(mytable, key)
        if key == "key2" then
            return "metatablevalue"
        else
            return nil
        end
    end
})

print(mytable.key1, mytable.key2, mytable.key3) -- value1 metatablevalue nil

mytable = setmetatable({
    key1 = "value1"
}, {
    __index = {
        key2 = "metatablevalue"
    }
})
print(mytable.key1, mytable.key2) -- value1  metatablevalue
