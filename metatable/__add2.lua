local function add(t1, t2)
    -- ‘#’运算符取表长度
    assert(#t1 == #t2)
    local length = #t1
    for i = 1, length do
        t1[i] = t1[i] + t2[i]
    end
    return t1
end

-- setmetatable返回被设置的表
t1 = setmetatable({1, 2, 3}, {
    __add = add
})
t2 = setmetatable({10, 20, 30}, {
    __add = add
})

for k, v in pairs(t1) do
    print(k, "=>", v)
end

for k, v in pairs(t2) do
    print(k, "=>", v)
end

print("---------两元表相加--------------")
t1 = t1 + t2
for i = 1, #t1 do
    print(t1[i])
end

--[[
有关元表的描述:

定义 :
元表本身只是一个普通的表,通过特定的方法(比如setmetatable)设置到某个对象上,进而影响这个对象的行为;
一个对象有哪些行为受到元表影响以及这些行为按照何种方式受到影响是受Lua语言约束的。
比如在前面的代码里,两个表对象的加法运算,如果没有元表的干预,
就是一种错误;但是Lua规定了元表可以“重载”对象的加法运算符,
因此若把定义了加法运算的元表设置到那两个表上,它们就可以做加法了。
元表是Lua最关键的概念之一,内容也很丰富,请参考Lua文档了解详情。

元表与C++虚表的比较:
如果把表比作对象,元表就是可以改变对象行为的“元”对象。在某种程度上,元表可以与C++的虚表做一类比。
但二者还是迥然不同的:元表可以动态的改变,C++虚表是静态不变的;
元表可以影响表(以及其他类型的对象)的很多方面的行为,虚表主要是为了定位对象的虚方法(最多再带上一点点RTTI)。 

--]]