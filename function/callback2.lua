function unpackex(tbl, args)
    local ret = {}
    for _, v in ipairs(args) do
        table.insert(ret, tbl[v])
    end
    return unpack(ret,1, #ret) -- global 'unpack' is not callable (a nil value)
end

print(unpackex({
    one = {"one", "two", "three"},
    two = "T",
    three = "TH"
}, {"one", "two", "three"}))
