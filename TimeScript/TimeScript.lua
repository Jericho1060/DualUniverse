summer_time = true --export

function getTimeTable(time)
    local additionnal_hour = 0
    if summer_time then additionnal_hour = 1 end
    local T = math.floor(time) % (3600*24)
    return {math.floor(T/3600+additionnal_hour)%24, math.floor(T%3600/60), math.floor(T%60)}
end
    
function getTimeString(time)
    local timeTable = getTimeTable(time)
    return string.format("%02d:%02d:%02d",timeTable[1],timeTable[2],timeTable[3])
end
