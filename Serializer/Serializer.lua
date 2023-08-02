--[[
    Lua Serializer by Jericho
    Version: 1.0.0
    Source available at: https://github.com/Jericho1060/DualUniverse/blob/master/Serializer/Serializer.lua
]]
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