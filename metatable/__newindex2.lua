--[[ 
newindex元方法与index类似，newindex用于更新table中的数据，而index用于查询table中的数据。
当对一个table中不存在的索引赋值时，在Lua中是按照以下步骤进行的：

Lua解释器先判断这个table是否有元表；

如果有了元表，就查找元表中是否有__newindex元方法；如果没有元表，就直接添加这个索引，然后对应的赋值；
如果有这个__newindex元方法，Lua解释器就执行它，而不是执行赋值；
如果这个__newindex对应的不是一个函数，而是一个table时，Lua解释器就在这个table中执行赋值，而不是对原来的table。

--]]

local tb1 = {}
local tb2 = {}

tb1.__newindex = tb2
tb2.__newindex = tb1

setmetatable(tb1, tb2)
setmetatable(tb2, tb1)

tb1.x = 10 -- '__newindex' chain too long; possible loop
