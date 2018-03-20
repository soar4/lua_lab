-- ref: http://bikong0411.github.io/2016/05/31/lua-ffi-summary.html
local ffi = require('ffi')
local t = ffi.load("./libt.so", false)

ffi.cdef[[
      typedef struct {
            int x;
            int y;
        } innerstr ;
    struct constr_t {
        int a;
        int b;
        innerstr c;
    };
    void print_pconstr_t(struct constr_t *t);
    int print_i(int x);
    int print_pi(int *px);
    void print(const char *s);
]]

ti = ffi.new("int", 10)
tpi = ffi.new("int[1]", {20})

-- ts = ffi.new("struct constr_t", {1, 2, {3, 4}})
ts = ffi.new("struct constr_t", {})

tcstr = ffi.new("const char*", "Hello World")
tstr = ffi.new("char[11]", "Hello World")

t.print_i(ti)
--t.print_pi(ti) --luajit: ffit.lua:29: bad argument #1 to 'print_pi' (cannot convert 'int' to 'int *')

--t.print_i(tpi) --luajit: ffit.lua:31: bad argument #1 to 'print_i' (cannot convert 'int [1]' to 'int')
t.print_pi(tpi)

t.print_pconstr_t(ts)

t.print(tcstr)
t.print(tstr)

ti = 100 --change tpi to number
tpi[0] = 21
--tpi=22 --change tpi to number
--tpi[1] = 2000 --luajit: ffit.lua:44: attempt to index global 'tpi' (a number value)
print(type(ti), type(tpi))
t.print_i(ti)
t.print_pi(tpi)

ts.b = 100
ts.c.y = 1000
print(type(ts))
t.print_pconstr_t(ts)

--tcstr[2] = 32 --luajit: ffit.lua:54: attempt to write to constant location
tstr[2] = 32
t.print(tstr)

t.print("Hello Lua")
