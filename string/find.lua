local s = "hello world"
i, j = string.find(s, "hello")
print(i, j) -- >1      5

print(string.find(s, "kity")) -- >nil

-- 在string库中功能最强大的函数是：string.find（字符串查找），
-- string.gsub（全局字符串替换），and string.gfind（全局字符串查找）。
-- 这些函数都是基于模式匹配的。

local s = "\nare you ok!\n OK\n"
local t = {}
local i = 0
while true do
    i = string.find(s, "\n", i + 1)
    if i == nil then
        break
    end
    table.insert(t, i)
end

for k, v in pairs(t) do
    print(k, "->", v)
end
