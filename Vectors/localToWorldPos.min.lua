--[[
    Convert a table in local coordinates to a table in world coordinates by Jericho inspired by Koruzarius
    Source : https://github.com/Jericho1060/DualUniverse/blob/master/Vectors/localToWorldPos.lua
]]--
function ConvertLocalToWorld(a,b,c,d,e)local f={a[1]*c[1],a[1]*c[2],a[1]*c[3]}local g={a[2]*d[1],a[2]*d[2],a[2]*d[3]}local h={a[3]*e[1],a[3]*e[2],a[3]*e[3]}return{f[1]+g[1]+h[1]+b[1],f[2]+g[2]+h[2]+b[2],f[3]+g[3]+h[3]+b[3]}end
