-- c2lua4.lua
t = {1, ["a"] = 3, "2", ["b"] = {["c"] = 'd'}}

for key, value in pairs(t) do
    print(key, value)
end