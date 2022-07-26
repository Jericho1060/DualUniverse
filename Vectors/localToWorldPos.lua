--[[
    Convert a table in local coordinates to a table in world coordinates by Jericho inspired by Koruzarius
    Source : https://github.com/Jericho1060/DualUniverse/blob/master/Vectors/localToWorldPos.lua
]]--
function ConvertLocalToWorld(localCoord, constructPos, constructRight, constructForward, constructUp)
    local xOffset = {localCoord[1] * constructRight[1], localCoord[1] * constructRight[2], localCoord[1] * constructRight[3]}
    local yOffset = {localCoord[2] * constructForward[1], localCoord[2] * constructForward[2], localCoord[2] * constructForward[3]}
    local zOffset = {localCoord[3] * constructUp[1], localCoord[3] * constructUp[2], localCoord[3] * constructUp[3]}
    return {xOffset[1] + yOffset[1] + zOffset[1] + constructPos[1], xOffset[2] + yOffset[2] + zOffset[2] + constructPos[2], xOffset[3] + yOffset[3] + zOffset[3] + constructPos[3]}
end
