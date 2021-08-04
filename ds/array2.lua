local N = 3
local M = 3
mt = {}
for i = 1, N do
    mt[i] = {}
    for j = 1, M do
        mt[i][j] = i * j
    end
end

for i = 1, N do
    for j = 1, M do
        print(mt[i][j])
    end
end

print("-----------------------------------")

mt = {}
for i = 1, N do
    for j = 1, M do
        mt[(i - 1) * M + j] = i * j
    end
end

for i = 1, N do
    for j = 1, M do
        print(mt[(i-1) * M + j])        
    end
end
