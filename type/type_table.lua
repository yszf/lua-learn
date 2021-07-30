local t1 = {}

local t2 = {"apple", "pear", "orange", "grape"}
for k, v in pairs(t2) do
    print(k .. " : " .. v)
end

a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end