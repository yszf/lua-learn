Set = {}
local mt = {}
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in pairs(l) do
        set[v] = true
    end
    mt.__metatable = "You cannot get the metatable" -- 设置完我的元表以后，不让其他人再设置
    return set
end

local tb = Set.new({1, 2})
print(tb)

print(getmetatable(tb)) -- You cannot get the metatable
setmetatable(tb, {}) -- cannot change a protected metatable
