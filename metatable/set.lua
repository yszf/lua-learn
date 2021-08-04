Set = {}
local mt = {} -- 集合的元表

-- 根据参数列表中的值创建一个新的集合
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in pairs(l) do
        set[v] = true
    end
    mt.__metatable = "You cannot get the metatable" -- 设置完我的元表以后，不让其他人再设置
    return set
end

-- 并集操作
function Set.union(a, b)
    -- if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
    --      error("metatable error.")
    -- end

   local retSet = Set.new{} -- 此处相当于Set.new({})
   for v in pairs(a) do retSet[v] = true end
   for v in pairs(b) do retSet[v] = true end
   return retSet
end

-- 交集操作
function Set.intersection(a, b)
    local retSet = Set.new {}
    for v in pairs(a) do
        retSet[v] = b[v]
    end
    return retSet
end

-- 打印集合的操作
function Set.toString(set)
    local tb = {}
    for e in pairs(set) do
        tb[#tb + 1] = e
    end
    return "{" .. table.concat(tb, ", ") .. "}"
end

function Set.print(s)
    print(Set.toString(s))
end

local set1 = Set.new({10, 20, 30})
Set.print(set1) -- {20, 10, 30}
local set2 = Set.new({1, 2})
Set.print(set2) -- {1, 2}
print(getmetatable(set1)) -- table: 0x1ec36f0
print(getmetatable(set2)) -- table: 0x1ec36f0
-- assert(getmetatable(set1) == getmetatable(set2))
mt.__add = Set.union
local set3 = set1 + set2
print(getmetatable(set3))
Set.print(set3) -- {1, 2, 20, 10, 30}

-- local set4 = set1 + 8
-- Set.print(set4)

mt.__tostring = Set.toString
print(set3)
-- setmetatable(set3, {})


