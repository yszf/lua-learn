local a = {}
local b = {
    x = 1,
    ["hello,"] = "world!"
}

-- 通过“.”或者“[]”运算符来访问表的成员。
-- 注意:表达式a.b等价于a[“b”],但不等价于a[b]
a["astring"] = "ni,hao!"
a[1] = 100
a["a table"] = b

for k, v in pairs(a) do
    print(k, "=>", v);
end

-- 1       =>      100
-- astring =>      ni,hao!
-- a table =>      table: 0x19bbc80
