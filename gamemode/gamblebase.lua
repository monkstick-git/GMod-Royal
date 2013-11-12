gmodRoyal = {}
local GmVer = "[GMod Royal Version 1.0]"
House = {}

		House.Chips = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = 'house'")
        House.Exp = sql.QueryValue("SELECT player_xp FROM gmodRoyal_player_info WHERE player_id = 'house'")
        House.Level = sql.QueryValue("SELECT player_lvl FROM gmodRoyal_player_info WHERE player_id = 'house'")
		House.OldChips = House.Chips
		House.OldExp = House.Exp

function gmodRoyal.CreateTable() 
        if(not sql.TableExists("gmodRoyal_player_info")) then
                MsgAll("Creating the player info table...")
                sql.Query("CREATE TABLE gmodRoyal_player_info (player_id varchar(255),player_money int,player_xp int,player_lvl varchar(255),player_xp_needed int,player_wins int,player_losses int,player_overallwon int,player_overalllost int,player_lasthere int,player_takenfunds int,player_login int,player_hadreward int,player_loginstreak int)")
                sql.Query("INSERT INTO gmodRoyal_player_info (`player_id`, `player_money`, `player_xp`, `player_lvl`, `player_xp_needed`, `player_wins`, `player_losses`, `player_overallwon`, `player_overalllost`, `player_lasthere`, `player_takenfunds`,`player_login`,`player_hadreward`,`player_loginstreak`)VALUES ('house', '10000','0','1','100','0','0','0','0','0','"..tostring(math.floor(os.time() / 86400)).."',0,0,0,0)" )
                        if(sql.TableExists("gmodRoyal_player_info")) then
                                MsgAll("Successfully made the player info table")
                        else
                                MsgAll("Something went horribly, horribly wrong!")
                        end
        else
                MsgAll("The player info table already exists!")
        end
        
       
        MunModBetTable = {}
		House.Chips = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = 'house'")
        House.Exp = sql.QueryValue("SELECT player_xp FROM gmodRoyal_player_info WHERE player_id = 'house'")
        House.Level = sql.QueryValue("SELECT player_lvl FROM gmodRoyal_player_info WHERE player_id = 'house'")
		House.OldChips = House.Chips
		House.OldExp = House.Exp
		gmodRoyal.CheckDate()
        
end

function gmodRoyal.RemoveTable()
        if(sql.TableExists("munmod_raffle")) then
                MsgAll("The raffle table exists, dropping...")
                sql.Query("DROP TABLE munmod_raffle")
                        if(!sql.TableExists("munmod_raffle")) then
                                MsgAll("Successfully dropped the raffle table!")
                        end
        end
        
                        if(!sql.TableExists("munmod_raffle")) then
                MsgAll("Creating the raffle table...")
                sql.Query("CREATE TABLE munmod_raffle (p_key varchar(255),player_id varchar(255),player_string varchar(255))")
                        if(sql.TableExists("munmod_raffle")) then
                                MsgAll("Successfully made the munmod_raffle table")
                        else
                                MsgAll("Something went horribly, horribly wrong!")
                        end
        else
                MsgAll("The munmod_raffle table already exists!")
        end
end

function gmodRoyal.RemoveMainTable()
        if(sql.TableExists("gmodRoyal_player_info")) then
                MsgAll("The gmodRoyal_player_info table exists, dropping...")
                sql.Query("DROP TABLE gmodRoyal_player_info")
                        if(!sql.TableExists("gmodRoyal_player_info")) then
                                MsgAll("Successfully dropped the gmodRoyal_player_info table!")
                        end
        end
        
                        
                
        
                        if(!sql.TableExists("gmodRoyal_player_info")) then
                MsgAll("Creating the gmodRoyal_player_info table...")
                sql.Query("CREATE TABLE gmodRoyal_player_info (player_id varchar(255),player_money int,player_xp int,player_lvl varchar(255),player_xp_needed int,player_wins int,player_losses int,player_overallwon int,player_overalllost int,player_lasthere int,player_takenfunds int)")
                MsgAll("Created table, now trying to insert information into it")
                sql.Query("INSERT INTO gmodRoyal_player_info (`player_id`, `player_money`, `player_xp`, `player_lvl`, `player_xp_needed`, `player_wins`, `player_losses`, `player_overallwon`, `player_overalllost`, `player_lasthere`, `player_takenfunds`)VALUES ('house', '10000','0','1','100','0','0','0','0','0','1')" )
                
                        if(sql.TableExists("gmodRoyal_player_info")) then
                                MsgAll("Successfully made the gmodRoyal_player_info table")
                        else
                                MsgAll("Something went horribly, horribly wrong!")
                        end
        else
                MsgAll("The gmodRoyal_player_info table already exists!")
        end
end

function gmodRoyal.PlayerSpawn(ply)
		local TempPlayer = ply
        if(!sql.Query("SELECT player_id, player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")) then
                sql.Query("INSERT INTO gmodRoyal_player_info (`player_id`, `player_money`, `player_xp`, `player_lvl`, `player_xp_needed`, `player_wins`, `player_losses`, `player_overallwon`, `player_overalllost`, `player_lasthere`, `player_takenfunds`,`player_login`,`player_hadreward`,`player_loginstreak`)VALUES ('"..ply:SteamID().."','100','0','1','50','0','0','0','0','"..tostring(math.floor(os.time() / 86400)).."',0,0,0,0)" )
			    
				ply.Chips = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                ply.Exp = sql.QueryValue("SELECT player_xp FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                ply.Level = sql.QueryValue("SELECT player_lvl FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
				ply.OldChips = ply.Chips
				ply.OldExp = ply.Exp
                timer.Simple(2,function()
					gmodRoyal.addChat(ply,"Welcome "..ply:Nick()..". You have received ❉"..ply.Chips.." Chips as a gesture of good will!")
                end)
        else
				ply.Chips = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
				ply.OldChips = ply.Chips
                ply.Exp = sql.QueryValue("SELECT player_xp FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
				ply.OldExp = ply.Exp
                ply.Level = sql.QueryValue("SELECT player_lvl FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
				
                timer.Simple(2,function()
						gmodRoyal.addChat(ply,GmVer)
						gmodRoyal.addChat(ply,"Welcome back "..ply:Nick()..".  You currently have: ")
						gmodRoyal.addChat(ply,"Chips: "..ply.Chips)
						gmodRoyal.addChat(ply,"Experience: "..ply.Exp)
						gmodRoyal.addChat(ply,"Level: "..ply.Level)
                end)
end

end

hook.Add( "PlayerInitialSpawn", "CasinoModPlayerSpawn", gmodRoyal.PlayerSpawn )
hook.Add( "Initialize", "CasinoModCreateTable", gmodRoyal.CreateTable )

--########## Chat Commands start Here ##########

function gmodRoyal.Messages(ply,msg,team) 
        local Target = 0
        local Message = string.Explode(" ",msg)
			
		if(Message[1]=="/add") then
		gmodRoyal.AddPlayerChips(ply,tonumber(Message[2]))
		PrintMessage(HUD_PRINTTALK,"You now have "..gmodRoyal.GetPlayerMoney(ply).." chips!")
		gmodRoyal.AddExp(ply,Message[2])
		end
		
        if(Message[1]=="/balance" or Message[1]=="!balance") then
                gmodRoyal.Balance(ply)
				PrintMessage(HUD_PRINTTALK,math.floor(os.time() / 86400))
				PrintMessage(HUD_PRINTTALK,sql.QueryValue("SELECT player_lasthere FROM gmodRoyal_player_info WHERE player_id = 'house'"))
                return ""
        end        
		
		if(Message[1]=="/spin") then
		gmodRoyal.Roulette()
		return ""
		end
		
		if(Message[1]=="/bet") then
			local Amount = 0
			if(isnumber(Message[2])) then
				Amount = tonumber(Message[2])
			else
				Amount = tonumber(Message[2])
			end
		gmodRoyal.DoBet(ply,Amount,tonumber(Message[3]))
		end
		
		if(Message[1]=="/save") then
			gmodRoyal.WriteChips(ply)
		end
end

function gmodRoyal.CheckIfNumber(ply,Amount)
	local TempBet
	if(IsValid(ply)) then
		if(isnumber(Amount)) then TempBet = tonumber(Amount) else return 0 end
		if (tonumber(gmodRoyal.GetPlayerMoney(ply)) >= TempBet) then
			return TempBet
		else
			return 0
		end
	end
end

function gmodRoyal.AddExp(ply,expamount)
	local Exp = math.floor(expamount)
	ply.Exp = ply.Exp + Exp
	gmodRoyal.addChat(ply,ply.Level * 100)

	while(ply.Exp >= (ply.Level * 100)) do
		ply.Exp = (ply.Exp - (ply.Level * 100))
		ply.Level = ply.Level + 1
		gmodRoyal.addChat(nil,ply:Nick().." is now level "..ply.Level)
	end
	
	

end

function gmodRoyal.Give(ply,_,args)
        local Target = 0
                        if(!tonumber(args[3])) then PrintMessage( HUD_PRINTTALK,args[3].." is not an integer.  4 is an integer.  Four is a string.")  return "" end
                        local money2 = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                        if( tonumber(money2) < tonumber(args[3]) ) then return end
                        if(tonumber(args[3]) <= 0) then return end
                        if(tonumber(args[3]) > (money2 / 5)) then gmodRoyal.addChat(ply,"You cannot give more than 20% of your funds!") return "" end 
                        local MunPlayerName = args[2]
                        
                                local MunMoney = math.floor(args[3])
                                        for k,v in pairs(player.GetAll()) do if (string.find(string.lower(v:Name()), string.lower(MunPlayerName)))then 

                                                Target = Target + 1
                                                TargetName = v
                                                        end
                                                        end
                                                        if(Target == 0) then gmodRoyal.addChat(ply,"No player found with that name.") end 
                                                                if(Target > 1) then gmodRoyal.addChat(ply,"Too many players found. Try refining the search criteria") end
                                                                if(Target == 1) then
                                                                local CurrentMoney = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                                                                local MunModRemovePlayerMoney = sql.Query("UPDATE gmodRoyal_player_info SET player_money = "..tostring((CurrentMoney - MunMoney)).." WHERE player_id = '"..ply:SteamID().."'")
                                                                local CurrentMoney2 = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..TargetName:SteamID().."'")
                                                                local MunModGivePlayerMoney = sql.Query("UPDATE gmodRoyal_player_info SET player_money = "..tostring((CurrentMoney2 + MunMoney)).." WHERE player_id = '"..TargetName:SteamID().."'")
																gmodRoyal.addChat(TargetName,ply:Nick().." gave you "..MunMoney.." Chips!")
                                                                
                                                                local CurrentMoney = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                                                                local CurrentMoney2 = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..TargetName:SteamID().."'")
                                                                end
                        
end

function gmodRoyal.Balance(ply)
	gmodRoyal.addChat(ply,"Chips: "..ply.Chips)  
end

function gmodRoyal.ShowExp(ply)
        local CurrentExp = sql.QueryValue("SELECT player_xp FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
        local CurrentLevel = sql.QueryValue("SELECT player_lvl FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
        local NeededExp = sql.QueryValue("SELECT player_xp_needed FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
        ply:PrintMessage( HUD_PRINTTALK,"Level: "..CurrentLevel.." | Curent Exp: "..CurrentExp.." / "..NeededExp)
end

function gmodRoyal.OverallWinsAndLosses(ply,result)
        if(result == "win") then
                local CurrentWins = sql.QueryValue("SELECT player_wins FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                sql.Query("UPDATE gmodRoyal_player_info SET player_wins = "..tostring((CurrentWins + 1)).." WHERE player_id = '"..ply:SteamID().."'")
                
                local CurrentLossesServer = sql.QueryValue("SELECT player_losses FROM gmodRoyal_player_info WHERE player_id = 'house'")
                sql.Query("UPDATE gmodRoyal_player_info SET player_losses = "..tostring((CurrentLossesServer + 1)).." WHERE player_id = 'house'")
        else
                local CurrentLosses = sql.QueryValue("SELECT player_losses FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
                sql.Query("UPDATE gmodRoyal_player_info SET player_losses = "..tostring((CurrentLosses + 1)).." WHERE player_id = '"..ply:SteamID().."'")
                
                local CurrentWinsServer = sql.QueryValue("SELECT player_wins FROM gmodRoyal_player_info WHERE player_id = 'house'")
                sql.Query("UPDATE gmodRoyal_player_info SET player_wins = "..tostring((CurrentWinsServer + 1)).." WHERE player_id = 'house'")
        end
end

function gmodRoyal.OverallLosses(ply,amount)
        MsgAll("Recieved a command to fuck with losses.  amount was "..amount)
        local CurrentLoss = sql.QueryValue("SELECT player_overalllost FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
        sql.Query("UPDATE gmodRoyal_player_info SET player_overalllost = "..tostring((CurrentLoss + amount)).." WHERE player_id = '"..ply:SteamID().."'")

        local Currentwinnings = sql.QueryValue("SELECT player_overallwon FROM gmodRoyal_player_info WHERE player_id = 'house'")
        sql.Query("UPDATE gmodRoyal_player_info SET player_overallwon = "..tostring((Currentwinnings + amount)).." WHERE player_id = 'house'")
        
end

function gmodRoyal.OverallWinnings(ply,amount)
        local Currentwinnings = sql.QueryValue("SELECT player_overallwon FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
        sql.Query("UPDATE gmodRoyal_player_info SET player_overallwon = "..tostring((Currentwinnings + amount)).." WHERE player_id = '"..ply:SteamID().."'")

        local CurrentLoss = sql.QueryValue("SELECT player_overalllost FROM gmodRoyal_player_info WHERE player_id = 'house'")
        sql.Query("UPDATE gmodRoyal_player_info SET player_overalllost = "..tostring((CurrentLoss + amount)).." WHERE player_id = 'house'")
        
end

function gmodRoyal.AddPlayerChips(ply,amount)
        ply.Chips = ply.Chips + amount
        House.Chips = House.Chips - amount
end

function gmodRoyal.TakePlayerChips(ply,amount)
        ply.Chips = ply.Chips - amount
        House.Chips = House.Chips + amount
end

function gmodRoyal.GetPlayerMoney(ply)
local TempMoney = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = '"..ply:SteamID().."'")
return TempMoney
end

function gmodRoyal.GetHouseMoney()
HouseMoney = sql.QueryValue("SELECT player_money FROM gmodRoyal_player_info WHERE player_id = 'house'")
return HouseMoney
end

function gmodRoyal.WriteChips(ply)
	if((ply.OldChips == ply.Chips) and (ply.OldExp == ply.Exp)) then return else
		sql.Query("UPDATE gmodRoyal_player_info SET player_money = "..tostring(ply.Chips).." WHERE player_id = '"..ply:SteamID().."'")
		sql.Query("UPDATE gmodRoyal_player_info SET player_exp = "..tostring(ply.Exp).." WHERE player_id = '"..ply:SteamID().."'")
		sql.Query("UPDATE gmodRoyal_player_info SET player_exp = "..tostring(ply.Level).." WHERE player_id = '"..ply:SteamID().."'")
		ply.OldChips = ply.Chips
		ply.OldExp = ply.Exp
		print("Saved "..ply:Nick().."'s chips to database")
		ply:PrintMessage(HUD_PRINTCENTER,"Saved your stats")
	end
end

function gmodRoyal.CheckDate()
sql.Query("UPDATE gmodRoyal_player_info SET player_lasthere = "..tostring(math.floor(os.time() / 86400)).." WHERE player_id = 'house'")
end

timer.Create("CheckDate",60,0,function() gmodRoyal.CheckDate() end)

timer.Create("Write Chips",1,0,function() for k,v in pairs(player.GetAll()) do gmodRoyal.WriteChips(v) sql.Query("UPDATE gmodRoyal_player_info SET player_money = "..tostring(HouseMoney).." WHERE player_id = 'house'") end end)
--gmodRoyal.GetHouseMoney()
hook.Add("PlayerSay", "casinomodmessages", gmodRoyal.Messages )
concommand.Add("gmodRoyal.UpdateBalance ",gmodRoyal.UpdateBalance )