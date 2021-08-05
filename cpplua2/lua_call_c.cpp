//mylib.c

#include "stdio.h"

extern "C"
{
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}
#define TYPE_BOOLEAN 1
#define TYPE_NUMBER 2
#define TYPE_STRING 3

static int ladd(lua_State *L)
{
    int index = lua_gettop(L);
    printf("index = %d\n", index);
    double op1 = luaL_checknumber(L, -2);
    double op2 = luaL_checknumber(L, -1);
    lua_pushnumber(L, op1 + op2);
    index = lua_gettop(L);
    printf("index = %d\n", index);
    return 1;
}

static int lsub(lua_State *L)
{
    int index = lua_gettop(L);
    printf("index = %d\n", index);
    double op1 = luaL_checknumber(L, -2);
    double op2 = luaL_checknumber(L, -1);
    lua_pushnumber(L, op1 - op2);
    index = lua_gettop(L);
    printf("index = %d\n", index);
    return 1;
}

static int lavg(lua_State *L)
{
    int index = lua_gettop(L);
    printf("index = %d\n", index);
    double avg = 0.0;
    int n = lua_gettop(L);
    if (n == 0)
    {
        lua_pushnumber(L, 0);
        return 1;
    }
    int i;
    for (i = 1; i <= n; i++)
    {
        avg += luaL_checknumber(L, i);
    }
    avg = avg / n;
    lua_pushnumber(L, avg);
    return 1;
}

static int fn(lua_State *L)
{
    int index = lua_gettop(L);
    printf("index = %d\n", index);
    int type = lua_type(L, -1);
    printf("type = %d\n", type);
    if (type == LUA_TBOOLEAN)
    {
        lua_pushvalue(L, lua_upvalueindex(TYPE_BOOLEAN));
    }
    else if (type == LUA_TNUMBER)
    {
        lua_pushvalue(L, lua_upvalueindex(TYPE_NUMBER));
    }
    else if (type == LUA_TSTRING)
    {
        lua_pushvalue(L, lua_upvalueindex(TYPE_STRING));
    }
    return 1;
}

extern "C" int luaopen_mylib(lua_State *L)
{
    luaL_Reg l[] = {
        {"add", ladd},
        {"sub", lsub},
        {"avg", lavg},
        {NULL, NULL},
    };
    luaL_newlib(L, l);

    lua_pushliteral(L, "BOOLEAN");
    lua_pushliteral(L, "NUMBER");
    lua_pushliteral(L, "STRING");
    lua_pushcclosure(L, fn, 3);

    lua_setfield(L, -2, "fn");
    return 1;
}

// gcc lua_call_c.cpp -fPIC -shared -o mylib.so -I/usr/local/include/