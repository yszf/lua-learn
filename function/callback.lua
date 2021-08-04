local a = {}
function b()
    print("Hello World")
end

a["sell"] = {
    callFunc = b
}

a["sell"].callFunc()
