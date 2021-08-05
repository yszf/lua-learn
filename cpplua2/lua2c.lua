package.cpath = '/home/robin/Projects/lua/lua-learn/cpplua2/?.so'
-- package.cpath = "./?.so"

local mylib = require 'mylib'

local a, b = 3.14, 1.57

print(mylib.add(a, b), mylib.sub(a, b)) -- 4.71. 1.57

print(mylib.avg()) -- 0.0

print(mylib.avg(1, 2, 3, 4, 5)) -- 3.0

print(mylib.fn(true), mylib.fn(10), mylib.fn('abc')) -- BOOLEAN NUMBER STRING
