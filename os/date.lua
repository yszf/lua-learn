t = os.date("*t", os.time());
for i, v in pairs(t) do
    print(i, "->", v);
end

print(os.date("today is %A, in %B"))

print(os.date("%X", os.time())) -- 时分秒

print(os.date("%m/%d/%Y", os.time())) -- 年月日
