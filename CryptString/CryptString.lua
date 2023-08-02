--[[
    String XOR Encryption By Jericho
    Version: 1.0.0
    Source available at: https://github.com/Jericho1060/DualUniverse/blob/master/CryptString/CryptString.lua
]]

CryptString = {
    __index = {
        keyToDataLen = function (self, key, len)
            if #key >= len then
                return key:sub(1, len)
            end
            local result = ""
            for i = 1, math.floor(len / #key) do
                result = result .. key
            end
            local leftLen = len % #key
            if leftLen > 0 then
                result = result .. key:sub(1, leftLen)
            end
            return result
        end,
        xor = function (self, num1, num2)
            local tmp1 = num1
            local tmp2 = num2
            local str = ""
            while tmp1 > 0 or tmp2 > 0 do
                local digit1 = tmp1 % 2
                local digit2 = tmp2 % 2
                if digit1 == digit2 then
                    str = "0" .. str
                else
                    str = "1" .. str
                end
                tmp1 = math.floor(tmp1 / 2)
                tmp2 = math.floor(tmp2 / 2)
            end
            return tonumber(str, 2)
        end,
        crypt = function(self, data, key)
            key = self:keyToDataLen(key, #data)
            local result = ''
            for i = 1, #data do
                result = result .. string.char(self:xor(data:sub(i, i):byte(), key:sub(i, i):byte()))
            end
            return result
        end
    }
}