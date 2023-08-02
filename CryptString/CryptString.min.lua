--[[
    String XOR Encryption By Jericho
    Version: 1.0.0
    Source available at: https://github.com/Jericho1060/DualUniverse/blob/master/CryptString/CryptString.lua
]]
CryptString={__index={keyToDataLen=function(self,a,b)if#a>=b then return a:sub(1,b)end;local c=""for d=1,math.floor(b/#a)do c=c..a end;local e=b%#a;if e>0 then c=c..a:sub(1,e)end;return c end,xor=function(self,f,g)local h=f;local i=g;local j=""while h>0 or i>0 do local k=h%2;local l=i%2;if k==l then j="0"..j else j="1"..j end;h=math.floor(h/2)i=math.floor(i/2)end;return tonumber(j,2)end,crypt=function(self,m,a)a=self:keyToDataLen(a,#m)local c=''for d=1,#m do c=c..string.char(self:xor(m:sub(d,d):byte(),a:sub(d,d):byte()))end;return c end}}