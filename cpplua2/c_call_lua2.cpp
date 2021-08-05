#include <stdio.h>

extern "C" {
    #include <lua.h>
    #include <lualib.h>
    #include <lauxlib.h>
}

int test_global(lua_State *L){ //读取，重置，设置全局变量
    lua_getglobal(L, "var"); //获取全局变量var的值并压入栈顶
    int var = lua_tonumber(L, -1);
    printf("var = %d\n", var);
    lua_pushnumber(L, 10);
    lua_setglobal(L, "var"); //设置全局变量var为栈顶元素的值，即10
    lua_pushstring(L, "c str");
    lua_setglobal(L, "var2"); //设置全局变量var2为栈顶元素的值，即c str

    lua_getglobal(L, "f");
    return lua_pcall(L,0,0,0);
}

// gcc -o c_call_lua2 c_call_lua2.cpp -llua -lm -ldl
int main(int argc, char *argv[])
{
    lua_State *L = luaL_newstate(); //创建一个状态机
    luaL_openlibs(L);               //打开所有lua标准库

    int ret = luaL_dofile(L, "c2lua2.lua"); //加载并且运行lua脚本
    if (ret != LUA_OK)
    {
        const char *err = lua_tostring(L, -1); //加载失败，会把错误信息压入栈顶
        printf("-------loadfile error = %s\n", err);
        lua_close(L);
        return 0;
    }

    ret = test_global(L);
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