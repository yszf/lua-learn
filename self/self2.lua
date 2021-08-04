-- 参数self指向调用者自身(类似于c++里的this 指向当前类)
girl = {
    money = 200
}

function girl.goToMarket(self, someMoney)
    self.money = self.money - someMoney
end

girl.goToMarket(girl, 100)
print(girl.money)
