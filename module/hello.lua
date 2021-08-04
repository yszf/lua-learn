local pack = require "mypack" -- 导入包［注：包的名字与定义包的文件的名字相同(除去文件名后缀,在前面的代码中,就是“mypack”)］

print(ver or "No ver defined!")
print(pack.ver) -- nil
print(pack.aFunInMyPack) -- nil

assert(aFunInMyPack)
aFunInMyPack()
print(aFunInMyPack or "No aFunInMyPack defined!")
aFuncFromMyPack()
