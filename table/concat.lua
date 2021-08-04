test = {"Tom", "Mary", "Jam","Hey"}

print(table.concat(test, ":"))
print("*************")
print(table.concat(test, nil, 1, 2))
print("*************")
print(table.concat(test, "\n", 2, 3))

-- print(table.maxn(test)) -- field 'maxn' is not callable (a nil value)