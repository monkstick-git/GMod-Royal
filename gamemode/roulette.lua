gmodRoyal.BetTable = {}
util.AddNetworkString("gmodRoyal.RouletteUI")
util.AddNetworkString("gmodRoyal.RecieveBet")

-- http://gamesofroulette.com/img/pictures/roulette-rules/american-roulette-table.gif for Image reference
local RedNumbers = {1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36}

function gmodRoyal.MakeBetTable() 
	gmodRoyal.RouletteOdds = {}
end

gmodRoyal.MakeBetTable()

function gmodRoyal.Roulette()
	local RandomNumber = math.random(0,36)
	local Colour
	
	if(table.HasValue(RedNumbers,RandomNumber)) then
		Colour = "Red"
	else if(RandomNumber == 0) then
		Colour = "Green" 
	else 
		Colour = "Black"
	end 

	end
	
	gmodRoyal.addChat(nil,"Roulette Winning Number: "..RandomNumber.." - "..Colour)

	for key,value in pairs(gmodRoyal.RouletteOdds) do
		for k,v in pairs(value[4]) do
			if(v == RandomNumber) then
				gmodRoyal.addChat(ply,"You win "..(value[2] * value[3])) gmodRoyal.AddPlayerChips(value[1],(value[2] * value[3])) break
				
			end
		end
	end

gmodRoyal.MakeBetTable()
timer.Create("DoRoulette",30,1,function() gmodRoyal.RouletteTimer() end) 
end

function gmodRoyal.RouletteTimer()
for k,v in pairs(gmodRoyal.RouletteOdds) do
v[1]:PrintMessage(HUD_PRINTCENTER,"The roulette table is about to spin")
end

timer.Create("TempRoulette",10,1,function() gmodRoyal.Roulette() end)
end

timer.Create("DoRoulette",30,1,function() gmodRoyal.RouletteTimer() end) 

function gmodRoyal.DoBet(ply,Amount,B) -- B Means Bet

	if B == 1 then gmodRoyal.PlaceBet(ply,Amount,36,{1}) -- Single bets from 1 to 36
	elseif B == 2 then gmodRoyal.PlaceBet(ply,Amount,36,{2})
	elseif B == 3 then gmodRoyal.PlaceBet(ply,Amount,36,{3})
	elseif B == 4 then gmodRoyal.PlaceBet(ply,Amount,36,{4})
	elseif B == 5 then gmodRoyal.PlaceBet(ply,Amount,36,{5})
	elseif B == 6 then gmodRoyal.PlaceBet(ply,Amount,36,{6})
	elseif B == 7 then gmodRoyal.PlaceBet(ply,Amount,36,{7})
	elseif B == 8 then gmodRoyal.PlaceBet(ply,Amount,36,{8})
	elseif B == 9 then gmodRoyal.PlaceBet(ply,Amount,36,{9})
	elseif B == 10 then gmodRoyal.PlaceBet(ply,Amount,36,{10})
	elseif B == 11 then gmodRoyal.PlaceBet(ply,Amount,36,{11})
	elseif B == 12 then gmodRoyal.PlaceBet(ply,Amount,36,{12})
	elseif B == 13 then gmodRoyal.PlaceBet(ply,Amount,36,{13})
	elseif B == 14 then gmodRoyal.PlaceBet(ply,Amount,36,{14})
	elseif B == 15 then gmodRoyal.PlaceBet(ply,Amount,36,{15})
	elseif B == 16 then gmodRoyal.PlaceBet(ply,Amount,36,{16})
	elseif B == 17 then gmodRoyal.PlaceBet(ply,Amount,36,{17})
	elseif B == 18 then gmodRoyal.PlaceBet(ply,Amount,36,{18})
	elseif B == 19 then gmodRoyal.PlaceBet(ply,Amount,36,{19})
	elseif B == 20 then gmodRoyal.PlaceBet(ply,Amount,36,{20})
	elseif B == 21 then gmodRoyal.PlaceBet(ply,Amount,36,{21})
	elseif B == 22 then gmodRoyal.PlaceBet(ply,Amount,36,{22})
	elseif B == 23 then gmodRoyal.PlaceBet(ply,Amount,36,{23})
	elseif B == 24 then gmodRoyal.PlaceBet(ply,Amount,36,{24})
	elseif B == 25 then gmodRoyal.PlaceBet(ply,Amount,36,{25})
	elseif B == 26 then gmodRoyal.PlaceBet(ply,Amount,36,{26})
	elseif B == 27 then gmodRoyal.PlaceBet(ply,Amount,36,{27})
	elseif B == 28 then gmodRoyal.PlaceBet(ply,Amount,36,{28})
	elseif B == 29 then gmodRoyal.PlaceBet(ply,Amount,36,{29})
	elseif B == 30 then gmodRoyal.PlaceBet(ply,Amount,36,{30})
	elseif B == 31 then gmodRoyal.PlaceBet(ply,Amount,36,{31})
	elseif B == 32 then gmodRoyal.PlaceBet(ply,Amount,36,{32})
	elseif B == 33 then gmodRoyal.PlaceBet(ply,Amount,36,{33})
	elseif B == 34 then gmodRoyal.PlaceBet(ply,Amount,36,{34})
	elseif B == 35 then gmodRoyal.PlaceBet(ply,Amount,36,{35})
	elseif B == 36 then gmodRoyal.PlaceBet(ply,Amount,36,{36}) -- Single 1 36 stops here
	elseif B == 37 then gmodRoyal.PlaceBet(ply,Amount,36,{0}) -- Zero
	elseif B == 38 then gmodRoyal.PlaceBet(ply,Amount,3,{1,2,3,4,5,6,7,8,9,10,11,12}) -- 1 to 12
	elseif B == 39 then gmodRoyal.PlaceBet(ply,Amount,3,{13,14,15,16,17,18,19,20,21,22,23,24}) -- 13 to 24
	elseif B == 40 then gmodRoyal.PlaceBet(ply,Amount,3,{25,26,27,28,29,30,31,32,33,34,35,36}) -- 25 to 36
	elseif B == 41 then gmodRoyal.PlaceBet(ply,Amount,2,{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18}) -- 1 to 18
	elseif B == 42 then gmodRoyal.PlaceBet(ply,Amount,2,{19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36}) -- 19 to 36
	elseif B == 43 then gmodRoyal.PlaceBet(ply,Amount,2,{2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36}) -- even
	elseif B == 44 then gmodRoyal.PlaceBet(ply,Amount,2,{1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35}) -- odd
	elseif B == 45 then gmodRoyal.PlaceBet(ply,Amount,2,{2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35}) -- black numbers
	elseif B == 46 then gmodRoyal.PlaceBet(ply,Amount,2,{1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36}) -- red numbers
	elseif B == 47 then gmodRoyal.PlaceBet(ply,Amount,3,{1,4,7,10,13,16,19,22,25,28,31,34}) -- Line from 1 to 34 - Left to right
	elseif B == 48 then gmodRoyal.PlaceBet(ply,Amount,3,{2,5,8,11,14,17,20,23,26,29,32,35}) -- Line from 2 to 35 - Left to right
	elseif B == 49 then gmodRoyal.PlaceBet(ply,Amount,3,{3,6,9,12,15,18,21,24,27,30,33,36}) -- Line from 3 to 36 - Left to right
	
	else
	gmodRoyal.addChat(nil,"GMod-Royal Debug: Severe Error: 0001-"..B)
	
	end	
	
end

function gmodRoyal.PlaceBet(ply,amount,payout,winners)

	if(tonumber(ply.Chips) >= tonumber(amount)) then
		table.insert(gmodRoyal.RouletteOdds,{ply,amount,payout,winners})
		gmodRoyal.TakePlayerChips(ply,amount)
	else
		gmodRoyal.addChat(ply,"You do not have the sufficient funds to do that!")
	end
end

function gmodRoyal.ShowUI(ply)
net.Start("gmodRoyal.RouletteUI")
net.Send(ply)
end

function gmodRoyal.RecieveBet()
	local TempTable = net.ReadTable( )
	local Player = TempTable["Ent"]
	local Amount = TempTable["Amount"]
	local Bet = TempTable["Bet"]
	
	gmodRoyal.DoBet(Player,Amount,Bet)
	
end

net.Receive( "gmodRoyal.RecieveBet",function() gmodRoyal.RecieveBet() end)