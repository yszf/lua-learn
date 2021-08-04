local function create(name, id)
    local data = {
        name = name,
        id = id
    } -- data为obj.SetName,obj.GetName,obj.SetId,obj.GetId的Upvalue
    local obj = {} -- 把需要隐藏的成员放在一张表里,把该表作为成员函数的upvalue。

    function obj.SetName(name)
        data.name = name
    end

    function obj.GetName()
        return data.name
    end

    function obj.SetId(id)
        data.id = id
    end

    function obj.GetId()
        return data.id
    end

    return obj
end

obj1 = create("jack", 1)
obj2 = create("bob", 2)

print(obj1.GetName(), obj1.GetId())
print(obj2.GetName(), obj2.GetId())
