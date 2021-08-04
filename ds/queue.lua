List = {}

-- 双向队列
-- 使用两个索引下标，一个表示第一个元素，另一个表示最后一个元素。

-- 创建
function List.new()
    return {
        first = 0,
        last = -1
    }
end

-- 队列头插入
function List.pushFront(list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end

-- 队列尾插入
function List.pushBack(list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

-- 队列头删除
function List.popFront(list)
    local first = list.first
    if first > list.last then
        error("List is empty")
    end

    local value = list[first]
    list[first] = nil
    list.first = first + 1
    return value
end

function List.popBack(list)
    local last = list.last
    if list.first > last then
        error("List is empty")
    end
    local value = list[last]
    list[last] = nil
    list.last = last - 1
    return value
end

-- 测试代码
local testList = List.new()

List.pushFront(testList, 12)
List.pushFront(testList, 100)
List.pushBack(testList, 15)
print(List.popFront(testList))
print(List.popBack(testList))
print(List.popBack(testList))

print(testList)