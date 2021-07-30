print(type(X)) -- nil

print(type(X) == nil) -- false

print(type(X) == "nil") -- true

print(type(true)) -- boolean
print(type(false)) -- boolean
print(type(nil)) -- nil

if false or nil then
    print("至少有一个是true")
else
    print("false 和 nil 都是false") --
end

if 0 then
    print("数字0是true") -- 
else
    print("数字0是false")
end

print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))