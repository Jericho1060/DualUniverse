--[[
    Fuel Tanks Metatable By Jericho
    Version: 1.0.0
    Source available at: https://github.com/Jericho1060/DualUniverse/blob/master/ElementsMetatable/FuelTank.lua
]]
FuelTank = {
    __index = {
        name = '',
        percentage = 0,
        timeLeft = 0,
        lastRefresh = 0,
        fuelType = 'rocket',
        refresh = function(self)
            local time = system.getUtcTime()
            if lastRefresh ~= time then --refresh only once by seconds
                local class = self.getClass():lower()
                if class:find('atmo') then
                    self.fuelType = "atmo"
                elseif class:find('space') then
                    self.fuelType = "space"
                end
                local jsondata = self.getWidgetData()
                local data = json.decode(jsondata)
                self.name = data.name
                self.percentage = data.percentage
                self.timeLeft = tonumber(data.timeLeft)
                self.lastRefresh = time
            end
        end,
        getName = function(self)
            self:refresh()
            return self.name
        end,
        getPercentFilled = function(self)
            self:refresh()
            return self.percentage
        end,
        getSecondsLeft = function(self)
            self:refresh()
            return self.timeLeft
        end,
        getFuelType = function(self)
            self:refresh()
            return self.fuelType
        end,
        getTimeLeftString = function (self)
            local seconds = self:getSecondsLeft()
            if seconds == nil or seconds <= 0 then
                return "-";
            end
            days = string.format("%2.f", math.floor(seconds/(3600*24)));
            hours = string.format("%2.f", math.floor(seconds/3600 - (days*24)));
            mins = string.format("%2.f", math.floor(seconds/60 - (hours*60) - (days*24*60)));
            secs = string.format("%2.f", math.floor(seconds - hours*3600  - (days*24*60*60) - mins *60));
            str = ""
            if tonumber(days) > 0 then str = str .. days.."d " end
            if tonumber(hours) > 0 then str = str .. hours.."h " end
            if tonumber(mins) > 0 then str = str .. mins.."m " end
            if tonumber(secs) > 0 then str = str .. secs .."s" end
            return str
        end,
        dump = function(self)
            self:refresh()
            system.print('{name="' .. self.name .. '",percentage=' .. self.percentage ..',timeLeft=' .. self.timeLeft .. ',fuelType="'.. self.fuelType ..'"}')
        end
    }
}