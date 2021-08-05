-- 从lua 5.2 之后，require不再定义全局变量，需要保存其返回值。
mytestlib = require "mytestlib"  --指定包名称

--在调用时，必须是package.function
print(mytestlib.add(1.0,2.0))
print(mytestlib.sub(20.1,19))