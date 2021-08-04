-- 冒号定义和冒号调用:
girl = {
    money = 200
}

function girl:goToMarket(someMoney)
    self.money = self.money - someMoney
end

girl:goToMarket(100)
print(girl.money)
