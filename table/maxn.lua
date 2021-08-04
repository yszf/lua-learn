function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end
tbl = {
    [1] = "a",
    [2] = "b",
    [3] = "c",
    [26] = "z"
}
print("tbl 长度 ", #tbl) -- tbl 长度        3
print("tbl 最大值 ", table_maxn(tbl)) -- tbl 最大值      26

tbl2 = {"a", "b", "c", "z"}
print("tbl2 长度:", #tbl2) -- 4
print("tbl2 最大值:", table_maxn(tbl2)) -- 4
