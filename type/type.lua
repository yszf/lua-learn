print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string

print(type(a)) -- nil

t1 = { key1 = "val1", key2 = "val2", "val3"}
for k, v in pairs(t1) do
    print(k .. "-" .. v)
end

t1.key1 = nil
for k, v in pairs(t1) do
    print(k .. "+" .. v)
end