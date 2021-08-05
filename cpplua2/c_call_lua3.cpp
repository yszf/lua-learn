#include <stdio.h>

extern "C"
{
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
}

void printLuaStack(lua_State *L)
{
    int nIndex;
    int nType;
    fprintf(stderr, "================栈顶================\n");
    fprintf(stderr, "   索引  类型          值\n");
    for (nIndex = lua_gettop(L); nIndex > 0; --nIndex)
    {
        nType = lua_type(L, nIndex);
        fprintf(stderr, "   (%d)  %s         %s\n", nIndex,
                lua_typename(L, nType), lua_tostring(L, nIndex));
    }
    fprintf(stderr, "================栈底================\n");
}

void test_function(lua_State *L)
{ //调用lua函数
    lua_getglobal(L, "f1");
    lua_pcall(L, 0, 0, 0); //调用f1
    lua_getglobal(L, "f2");
    lua_pushnumber(L, 100);
    lua_pushnumber(L, 10);
    lua_pcall(L, 2, 2, 0); //调用f2
    // double a = lua_tonumber(L, -1);
    // double b = lua_tonumber(L, -2);
    // printf("a = %f, b = %f\n", a, b);
    lua_getglobal(L, "f3");
    const char *str = "c";
    lua_pushstring(L, str);
    lua_pcall(L, 1, 1, 0); //调用f3
    // const char *res = lua_tostring(L, -1);
    // printf("res = %s\n", res);
}
// gcc -o c_call_lua2 c_call_lua2.cpp -llua -lm -ldl
int main(int argc, char *argv[])
{
    lua_State *L = luaL_newstate(); //创建一个状态机
    luaL_openlibs(L);               //打开所有lua标准库

    int ret = luaL_dofile(L, "c2lua3.lua"); //加载运行lua脚本
    if (ret != LUA_OK)
    {
        const char *err = lua_tostring(L, -1); //加载失败，会把错误信息压入栈顶
        printf("-------loadfile error = %s\n", err);
        lua_close(L);
        return 0;
    }

    test_function(L);

    printLuaStack(L);

    lua_close(L);
    return 0;
}