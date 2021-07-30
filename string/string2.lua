print(string.gsub("aaaa", "a", "z", 3)) -- zzza    3

print(string.find("Hello Lua user", "Lua", 1)) -- 7       9

print(string.reverse("Lua")) -- auL

print(string.format("the value is:%d", 4)) -- the value is:4

print(string.char(97, 98, 99, 100)) -- abcd

print(string.byte("abcd")) -- 97

print(string.len("abc")) -- 3

print(string.rep("abcd", 2)) -- abcdabcd

string1 = "Lua";
print(string.upper(string1)) -- LUA
print(string.lower(string1)) -- lua

string = "Lua Tutorial"
-- 查找字符串
print(string.find(string, "Tutorial")) -- 5       12
reversedString = string.reverse(string)
print("新字符串为", reversedString) -- 新字符串为      lairotuT auL

string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
-- 基本字符串格式化
print(string.format("基本格式化 %s %s", string1, string2)) -- 基本格式化 Lua Tutorial
-- 日期格式化
date = 2;
month = 1;
year = 2014
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year)) -- 日期格式化 02/01/2014
-- 十进制格式化
print(string.format("%.4f", 1 / 3)) -- 0.3333

-- 字符转换
-- 转换第一个字符
print(string.byte("Lua")) -- 76
-- 转换第三个字符
print(string.byte("Lua", 3)) -- 97
-- 转换末尾第一个字符
print(string.byte("Lua", -1)) -- 97
-- 第二个字符
print(string.byte("Lua", 2)) -- 117
-- 转换末尾第二个字符
print(string.byte("Lua", -2)) -- 117

-- 整数 ASCII 码转换为字符
print(string.char(97)) -- a

string1 = "www."
string2 = "w3cschool"
string3 = ".cn"
-- 使用 .. 进行字符串连接
print("连接字符串", string1 .. string2 .. string3) -- 连接字符串      www.w3cschool.cn

-- 字符串长度
print("字符串长度 ", string.len(string2)) -- 字符串长度      9

-- 字符串复制 2 次
repeatedString = string.rep(string2, 2)
print(repeatedString) -- w3cschoolw3cschool
