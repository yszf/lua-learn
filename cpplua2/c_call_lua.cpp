#include <stdio.h>

extern "C" {
    #include <lua.h>
    #include <lualib.h>
    #include <lauxlib.h>
}

// gcc -o c_call_lua c_call_lua.cpp -llua -lm -ldl
int main(int argc, char *argv[])
{
    lua_State *L = luaL_newstate(); //创建一个状态机
    luaL_openlibs(L);               //打开所有lua标准库

    int ret = luaL_loadfile(L, "c2lua.lua"); //加载但不运行lua脚本
    if (ret != LUA_OK)
    {
        const char *err = lua_tostring(L, -1); //加载失败，会把错误信息压入栈顶
        printf("-------loadfile error = %s\n", err);
        lua_close(L);
        return 0;
    }

    ret = lua_pcall(L, 0, 0, 0); //保护模式调用栈顶函数
    if (ret != LUA_OK)
    {
        const char *err = lua_tostring(L, -1); //发生错误，会把唯一值(错误信息)压入栈顶
        printf("-------pcall error = %s\n", err);
        lua_close(L);
        return 0;
    }

    lua_close(L);
    return 0;
}