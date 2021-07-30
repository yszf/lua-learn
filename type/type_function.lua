function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end

print(factorial1(5)) -- 120
factorial2 = factorial1
print(factorial2(5)) -- 120

function anonymouse(tab, fun)
    for k, v in pairs(tab) do
        print(fun(k, v))
    end
end

t = {
    key1 = "val1",
    key2 = "val2"
}

anonymouse(t, function(key, val)
    return key .. " = " .. val
end)
