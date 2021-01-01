
--[[
    Jericho's time script -- https://github.com/Jericho1060
    Display IRL date and time in game
    https://github.com/Jericho1060/DualUniverse/edit/master/TimeScript/TimeScript.lua
]]--

summer_time = false --export

function DUCurrentDateTime()
    local time = system.getTime()
    local additionnal_hour = 0
    local seconds_to_2018 = 7948800 --from 01-10-2017 (arkship time)
    local secondsInMinute = 60
    local secondsInHour = secondsInMinute * 60
    local secondsInDay = secondsInHour * 24
    local secondsInYear = secondsInDay * 365
    local monthsWith30 = {4, 6, 9, 11}
    local monthsWith31 = {1, 3, 5, 7, 8, 10, 12}
    if summer_time then time = time + 1 end
    time = time - seconds_to_2018
    local year = 2018
    local month = 1
    local day = 1
    local daysInFebuary = 28
    while time >= secondsInYear do
        if (year % 4) == 0 then --leap year
            if time >= (secondsInYear - secondsInDay) then
                year = year + 1
                time = time - secondsInYear - secondsInDay
            else
                local daysInFebuary = 29
                break
            end
        else
            year = year + 1
            time = time - secondsInYear
        end
    end
    local daysFromYearStart = math.floor(time/secondsInDay)
    --febuary
    if daysFromYearStart >= 31 then
        month = 2
        daysFromYearStart = daysFromYearStart - 31
    end
    --march
    if daysFromYearStart >= daysInFebuary then
        month = 3
        daysFromYearStart = daysFromYearStart - daysInFebuary
    end
    --april
    if daysFromYearStart >= 31 then
        month = 4
        daysFromYearStart = daysFromYearStart - 31
    end
    --may
    if daysFromYearStart >= 30 then
        month = 5
        daysFromYearStart = daysFromYearStart - 30
    end
    --juin
    if daysFromYearStart >= 31 then
        month = 6
        daysFromYearStart = daysFromYearStart - 31
    end
    --july
    if daysFromYearStart >= 30 then
        month = 7
        daysFromYearStart = daysFromYearStart - 30
    end
    --august
    if daysFromYearStart >= 31 then
        month = 8
        daysFromYearStart = daysFromYearStart - 31
    end
    --september
    if daysFromYearStart >= 31 then
        month = 9
        daysFromYearStart = daysFromYearStart - 31
    end
    --october
    if daysFromYearStart >= 30 then
        month = 10
        daysFromYearStart = daysFromYearStart - 30
    end
    --november
    if daysFromYearStart >= 31 then
        month = 11
        daysFromYearStart = daysFromYearStart - 31
    end
    --december
    if daysFromYearStart >= 30 then
        month = 12
        daysFromYearStart = daysFromYearStart - 30
    end
    day = daysFromYearStart
    time = time % secondsInDay
    local h = math.floor(time/secondsInHour)%24
    local m = math.floor(time%secondsInHour/60)
    local s = math.floor(time%60)
    return year, month, day, h, m, s
end
