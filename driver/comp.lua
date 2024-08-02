
package.path = package.path .. ';temper.out/lua/?.lua;temper.out/lua/?/init.lua'

local interp = require('eb.interp')
local value = require('eb.value')

local function read(name)
    local f = io.open(name)
    local r = f:read('*all')
    f:close()
    return r
end

local env = interp.Env()
local ebfile = read('eb/eb.eb')
env:source(ebfile)
env:call('main-lang', {value.string('c'), value.string(arg[1])})
env:flush()
