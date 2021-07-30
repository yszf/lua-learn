array = {"Lua", "Tutorial"}

for i = 0, 2 do
    print(array[i])
end

--[[
nil
Lua
Tutorial
]] --

array = {}

for i = -2, 2 do
    array[i] = i * 2
end

for i = -2, 2 do
    print(array[i])
end

--[[
-4
-2
0
2
4
]]--
