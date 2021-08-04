-- 点号定义和点号调用:
girl = {
    money = 200
}

function girl.goToMarket(girl, someMoney)
    girl.money = girl.money - someMoney
end

girl.goToMarket(girl, 100)
print(girl.money)
