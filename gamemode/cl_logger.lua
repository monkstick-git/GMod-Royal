local colorPrefix = Color(255,210,0)
local colorMsg = Color(230,230,230)
local white = Color(255,255,255)
local prefix = "[GmodRoyal]"
local separator = " - "

local function addText()

        local arg = net.ReadTable()
        if(!arg or #arg <= 0) then return end

        local args = {}
        for _, v in ipairs( arg ) do
                local varType = type(v)
                if(varType == "string" or varType == "table") then 

                        table.insert(args, v) 

                else

                        table.insert(args, tostring(v))

                end
        end

        chat.AddText(colorPrefix, prefix, white, separator, colorMsg, unpack(args))

end

net.Receive("gmod_Royal_AddChat", addText)