Serializer = {
    __index = {
        stringify = function(self, data)
            if type(data) == 'number' then
                return self:stringifyNumber(data)
            elseif type(data) == 'string' then
                return self:stringifyString(data)
            elseif type(data) == 'table' then
                return self:stringifyTable(data)
            elseif type(data) == 'boolean' then
                return self:stringifyBoolean(data)
            end
            return nil
        end,
        parse = function(self, str)
            return load("return " .. str)()
        end,
        stringifyTableKey = function(self, key)
            if type(key) == 'number' then
                return '[' .. self:stringifyNumber(key) .. ']'
            end
            return key
        end,
        stringifyNumber = function(self, num)
            return tostring(num)
        end,
        stringifyString = function(self, str)
            return string.format('%q', str):gsub('\\\n', '\n'):gsub('\\\r', '\r'):gsub('\\\t', '\t')
        end,
        stringifyTable = function(self, tbl)
            local str = '{'
            local i = 1
            local l = self:tableLength(tbl)
            for k, v in pairs(tbl) do
                str = str .. self:stringifyTableKey(k) ..'=' .. self:stringify(v)
                if i < l then str = str .. ',' end
                i = i + 1
            end
            return str .. '}'
        end,
        stringifyBoolean = function(self, bool)
            return tostring(bool)
        end,
        tableLength = function(self, tbl)
            local count = 0
            for _ in pairs(tbl) do count = count + 1 end
            return count
        end
    }
}

local s = setmetatable({}, Serializer)
local test = { "aaa", a="bbb", b="cccc"}
print(s:tableLength(test))

local element = {'hello "-" world', 1234, 1234.5678, { "aaa", a="bbb"}}

local str = s:stringify(element)

print(str)

local obj = s:parse(str)


dumpTable = function (t, prefix)
    if prefix == nil then prefix = "" end
    for k, v in pairs(t) do
        if type(v) == 'table' then
            print(k .. ' is a table')
            dumpTable(v, '\t')
        else
            print(prefix .. k ..' = ' .. v)
        end
    end
end

dumpTable(obj)