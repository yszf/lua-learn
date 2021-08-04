-- 线程
local function producer()
    return coroutine.create(function(salt)
        local t = {1, 2, 3}
        for i = 1, #t do
            salt = coroutine.yield(t[i] + salt)
        end
    end)
end

function consumer(prod)
    local salt = 10
    while true do
        local running, product = coroutine.resume(prod, salt)
        salt = salt * salt
        if running then
            print(product or "END!")
        else
            break
        end
    end
end

consumer(producer())

--[[
    
创建协作线程
通过coroutine.create可以创建一个协作线程,该函数接收一个函数类型的参数作为线程的执行体,返回一个线程对象。

启动线程
通过coroutine.resume可以启动一个线程或者继续一个挂起的线程。该函数接收一个线程对象以及其他需要传递给该线程的参数。线程可以通过线程函数的参数或者coroutine.yield调用的返回值来获取这些参数。当线程初次执行时,resume传递的参数通过线程函数的参数传递给线程,线程从线程函数开始执行;当线程由挂起转为执行时,resume传递的参数以yield调用返回值的形式传递给线程,线程从yield调用后继续执行

线程放弃调度

线程调用coroutine.yield暂停自己的执行,并把执行权返回给启动/继续它的线程;线程还可利用yield返回一些值给后者,这些值以resume调用的返回值的形式返回。 

--]]