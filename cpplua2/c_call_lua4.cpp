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

void dump_table(lua_State *L, int index)
{
    if (lua_type(L, index) != LUA_TTABLE)
        return;
    // 典型的遍历方法
    lua_pushnil(L); //nil入栈，相当于从表的第一个位置遍历
    while (lua_next(L, index) != 0)
    { //没有更多元素，lua_next返回0
        //key-value入栈， key位于栈上-2处，value位于-1处
        printf("%s-%s\n", lua_typename(L, lua_type(L, -2)), lua_typename(L, lua_type(L, -1)));
        lua_pop(L, 1); //弹出一个元素，即把value出栈，此时栈顶为key，供下一次遍历
    }
    printf("---------------------------------\n");
}

void test_table(lua_State *L)
{
    // 读取table
    lua_getglobal(L, "t");
    lua_getfield(L, 1, "a"); //从索引为1的位置(table)获取t.a，并压栈
    lua_getfield(L, 1, "b");
    lua_getfield(L, -1, "c"); //从索引为-1的位置(栈顶)获取t.c，并压栈
    dump_table(L, 1);
    printLuaStack(L);

    // 修改table
    lua_settop(L, 1); //设置栈的位置为1，此时栈上只剩一个元素t
    lua_pushnumber(L, 10);
    int index = lua_gettop(L);
    printf("index = %d\n", index);
    lua_setfield(L, 1, "a"); //t.a=10
    index = lua_gettop(L);
    printf("index = %d\n", index);
    lua_pushstring(L, "hello c");
    index = lua_gettop(L);
    printf("index = %d\n", index);
    lua_setfield(L, 1, "e"); //t.e="hello c"
    index = lua_gettop(L);
    printf("index = %d\n", index);

    dump_table(L, 1); //遍历table number-number 1-1
                      //          number-number 2-2
                      //          string-number a-3
                      //          string-string e-hello c
                      //          string-table b-table
    printLuaStack(L);
    //新建一个table
    lua_settop(L, 0); //清空栈
    lua_newtable(L);  //创建一个table
    lua_pushboolean(L, 0);
    lua_setfield(L, 1, "new_a");
    lua_pushboolean(L, 1);
    lua_setfield(L, 1, "new_b");

    dump_table(L, 1); //遍历table string-boolean new_a-false
                      //          string-boolean new_b-true
    printLuaStack(L);
}

// gcc -o c_call_lua2 c_call_lua2.cpp -llua -lm -ldl
int main(int argc, char *argv[])
{
    lua_State *L = luaL_newstate(); //创建一个状态机
    luaL_openlibs(L);               //打开所有lua标准库

    int ret = luaL_dofile(L, "c2lua4.lua"); //加载运行lua脚本
    if (ret != LUA_OK)
    {
        const char *err = lua_tostring(L, -1); //加载失败，会把错误信息压入栈顶
        printf("-------loadfile error = %s\n", err);
        lua_close(L);
        return 0;
    }

    test_table(L);

    lua_close(L);
    return 0;
}