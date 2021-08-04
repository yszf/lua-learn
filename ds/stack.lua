local stackMng = {}
stackMng.__index = stackMng

function stackMng:new()
    local temp = {}
    setmetatable(temp, stackMng)
    return temp
end

function stackMng:init()
    self.stackList = {}
end

function stackMng:reset()
    self:init()
end

function stackMng:clear()
    self.stackList = {}
end

function stackMng:pop()
    if #self.stackList == 0 then
        return
    end
    if self.stackList[1] then
        print(self.stackList[1])
    end

    return table.remove(self.stackList, 1)
end

function stackMng:push(t)
    table.insert(self.stackList, t)
end

function stackMng:Count()
    return #self.stackList
end

-- 测试代码
object = stackMng:new()
object:init()
object:push(1)
object:push(2)
object:push(3)
object:pop()
print("-----------")
print(object:Count())
