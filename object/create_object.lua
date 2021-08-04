function create(name, id)
    local obj = {
        name = name,
        id = id
    }

    function obj:SetName(name)
        self.name = name
    end

    function obj:GetName()
        return self.name
    end

    function obj:SetId(id)
        self.id = id
    end

    function obj:GetId()
        return self.id
    end
    return obj
end

local myCreate = create("sam", 001)

for k, v in pairs(myCreate) do
    print(k, "=>", v)
end

print("myCreate's name:", myCreate:GetName(), "myCreate's id:", myCreate.GetId(myCreate))

myCreate:SetId(100)
myCreate:SetName("Hello Kity")

print("myCreate's name:", myCreate:GetName(), "myCreate's id:", myCreate:GetId())


-- 成员方法的定义
-- function obj:method(a1, a2, ...) ... end 等价于function obj.method(self, a1, a2, ...) ... end 等价于obj.method = function (self, a1, a2, ...) ... end

-- 成员方法的调用
-- obj:method(a1, a2, ...) 等价于obj.method(obj, a1, a2, ...) 