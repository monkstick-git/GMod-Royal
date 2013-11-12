util.AddNetworkString("gmod_Royal_AddChat")

function gmodRoyal.addChat(ply, ...)

        local args = {...}

        if(!args or #args<1) then return end
        
        local log = ""
        for k,v in pairs(args) do
                if(type(v) != "table") then
                        log = log .. tostring(v)
                end
        end
        ServerLog(log.."\n")

        net.Start("gmod_Royal_AddChat")
                net.WriteTable(args)

        if(ply and IsValid(ply) and ply:IsPlayer()) then
                net.Send(ply)
        else
                net.Broadcast()
        end

end