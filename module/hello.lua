local pack = require "mypack" -- 导入包［注：包的名字与定义包的文件的名字相同(除去文件名后缀,在前面的代码中,就是“mypack”)］

print(ver or "No ver defined!") -- No ver defined!
print(pack.ver)  -- 0.1 alpha
print(pack.aFunInMyPack) -- function: 00C7C030

print(aFunInMyPack or "No aFunInMyPack defined!") -- No aFunInMyPack defined!
aFuncFromMyPack() -- Hello!

