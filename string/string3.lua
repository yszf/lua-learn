-- 返回字符串s的长度
local s = "HelloWorld"
print(string.len(s)) -- >10

-- 重复n次字符串s的串
print(string.rep(s, 2)) -- >HelloWorldHelloWorld

-- 大写字母转换成小写
print(string.lower(s)) -- >helloworld

-- 小写转换成大写
print(string.upper(s)) -- >HELLOWORLD

-- 截取字符串
local s = "[in brackets]"
print(string.sub(s, 2, -1)) -- >in brackets]

-- 将每一个数字转换成字符
print(string.char(97)) -- >a

-- 将每一个字符转换成数字
print(string.byte("abc")) -- 97
print(string.byte("abc", 2)) -- > 98
print(string.byte("abc", -1)) -- > 99

-- 注：使用负数索引访问字符串的最后一个字符

-- 对字符串进行格式化输出
PI = 3.14165120
print(string.format("pi = %.4f", PI)) -- >pi = 3.1417
-- 注释：使用和C语言的printf函数几乎一模一样，你完全可以照C语言的printf来使用这个函数.
