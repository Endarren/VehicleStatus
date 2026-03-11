VehicleStatus = LibStub("AceAddon-3.0"):NewAddon("VehicleStatus", "AceConsole-3.0", "AceEvent-3.0" );
local vehicleIDs = {}

--Ulduar
vehicleIDs[33060] = {name = "Salvaged Siege Engine", type = "Engine",side="Every"}
vehicleIDs[33067] = {name = "Salvaged Siege Turret", type = "Turret",side="Every"}
vehicleIDs[33167] = {name = "Salvaged Demolisher Mechanic Seat", type = "Turret",side="Every"}
vehicleIDs[33109] = {name = "Salvaged Demolisher", type = "Demo",side="Every"}
vehicleIDs[33062] = {name = "Salvaged Chopper", type = "Bike",side="Every"}

--Wintergrasp
vehicleIDs[28319] = {name = "Wintergrasp Siege Turret", type = "Turret", side="Alliance"}
vehicleIDs[32629] = {name = "Wintergrasp Siege Turret", type = "Turret", side="Horde"}
vehicleIDs[32627] = {name = "Wintergrasp Siege Engine", type = "Engine", side="Horde"}
vehicleIDs[28312] = {name = "Wintergrasp Siege Engine", type = "Engine", side="Alliance"}
vehicleIDs[28094] = {name = "Wintergrasp Demolisher", type = "Demo",side="Every"}
vehicleIDs[27881] = {name = "Wintergrasp Catapult", type = "Cata",side="Every"}
vehicleIDs[28366] = {name = "Wintergrasp Tower Cannon", type = "Cannon",side="Every"}

--Strand of the Ancients
vehicleIDs[28781] = {name = "Battleground Demolisher", type = "Demo",side="Every"}
vehicleIDs[27894] = {name = "Antipersonnel Cannon", type = "Cannon", side="Alliance"}

--Isle of Conquest
vehicleIDs[34775] = {name = "Demolisher", type = "Demo",side="Every"}
vehicleIDs[34793] = {name = "Catapult", type = "Cata",side="Every"}
vehicleIDs[34802] = {name = "Glaive Thrower", type = "Cata", side="Alliance"}
vehicleIDs[35273] = {name = "Glaive Thrower", type = "Cata", side="Horde"}
vehicleIDs[36356] = {name = "Flame Turret", type = "Turret", side="Horde"}
vehicleIDs[34778] = {name = "Flame Turret", type = "Turret", side="Alliance"}
vehicleIDs[36355] = {name = "Siege Turret", type = "Turret", side="Horde"}
vehicleIDs[34777] = {name = "Siege Turret", type = "Turret", side="Alliance"}
vehicleIDs[34929] = {name = "Alliance Gunship Cannon", type = "Cannon", side="Alliance"}
vehicleIDs[34935] = {name = "Horde Gunship Cannon", type = "Cannon", side="Horde"}
vehicleIDs[34944] = {name = "Keep Cannon", type = "Cannon",side="Every"}

--Tol Barad
vehicleIDs[45344] = {name = "Abandoned Siege Engine", type = "Engine",side="Every"}
vehicleIDs[48283] = {name = "Wellson Cannon", type = "Cannon",side="Every"}
--Icecrown
vehicleIDs[32227] = {name = "Skybreaker Suppression Turret", type = "Turret", side="Alliance"}
vehicleIDs[31884] = {name = "Kor'kron Suppression Turret", type = "Turret", side="Horde"}
vehicleIDs[31736] = {name = "Geargrinder's Jumpbot", type = "Cata", side="Alliance"}
vehicleIDs[31770] = {name = "Thunderbomb's Jumpbot", type = "Cata", side="Horde"}


--ICC
vehicleIDs[36839] = {name = "Horde Gunship Cannon", type = "Cannon", side="Horde"}
vehicleIDs[36838] = {name = "Alliance Gunship Cannon", type = "Cannon", side="Alliance"}



--Possible teleporter
vehicleIDs[51391] = {name = "Throne of Tides Teleporter", type = "Cannon",side="Every"}
vehicleIDs[51395] = {name = "Throne of Tides Teleporter", type = "Cannon",side="Every"}
--function VehicleStatus:Find

local roleList ={}
roleList["Root"] = "Driver"
roleList["Child"] = "Gunner"
roleList["None"] = "None"

NeooptionTable = {
		name = "VehicleStatus",
		handler = VehicleStatus,
		type = 'group',
		args = {

				list =   {
									name="List vehicle",
									desc = "Lists all vehicles in the zone.",
									type = "execute",
									func ="ListAllVehicles"
				},
			crew =   {
									name="Vehicle crew check",
									desc = "Prints out the known crew of all vehicles in your group.",
									type = "execute",
									func ="Printout"
			},
			raid =   {
									name="Vehicle crew check Raid",
									desc = "Sends out the known crew of all vehicles in your group to raid.",
									type = "execute",
									func ="AllVehiclesCrewRaid"
			},
			group =   {
									name="Check all in vehicles",
									desc = "Checks who in your group is in a vehicle",
									type = "execute",
									func ="CheckAllInVehicle"
			},drivers =   {
									name="Check all in vehicles",
									desc = "Checks who in your group is a driver",
									type = "execute",
									func ="IsUnitDriver"
			},clear =   {
									name="Clear vehicle list",
									desc = "Clears the vehicle list",
									type = "execute",
									func ="ClearList"
			}

				
				
				}
			}
LibStub("AceConfig-3.0"):RegisterOptionsTable("VehicleStatus", NeooptionTable, {"vs"})
local vehicleRoster = {}
local groupList = {}
function VehicleStatus:OnInitialize()
    -- Called when the addon is loaded

    -- Print a message to the chat frame
    self:Print("OnInitialize Event Fired: Hello")
	self:RegisterEvent("UNIT_ENTERED_VEHICLE")
	self:RegisterEvent("UNIT_EXITED_VEHICLE")
	self:RegisterEvent("UPDATE_WORLD_STATES")
end

function VehicleStatus:SeatCount(targeti)

	if UnitInVehicle(targeti) ~= nil then
		local seats = UnitVehicleSeatCount(targeti)
		for s = 1, seats do
			controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo("raid"..i, s)
			if occupantName~= nil then
				print(UnitName("raid"..i).." vehicle seats "..occupantName)
			else
				print(UnitName("raid"..i).." vehicle seats nil")
			end
			if controlType == "Root" then
					
			end
		end
	end
end


function VehicleStatus:ClearList()
	vehicleRoster = {}
	groupList = {}
end
function VehicleStatus:OnEnable()
    -- Called when the addon is enabled

    -- Print a message to the chat frame

end

function VehicleStatus:OnDisable()
    -- Called when the addon is disabled
end

function VehicleStatus:Skin()
	print(UnitVehicleSkin("target"))
end
function VehicleStatus:ListAllVehicles()

	local numVeh = GetNumBattlefieldVehicles()
		print("All Vehicles")
	
	for i = 1, numVeh do
		vehicleX, vehicleY, unitNam, isPossessed, vehicleType, orientation, isPlayer, isAlive = GetBattlefieldVehicleInfo(i)
		if unitNam ~= nil then
			print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring("Vehicle "..tostring(i)..": "), tostring(unitNam)))
		end
	end
end

function VehicleStatus:Printout()
	print("Vehicles in this group")
	i = 1
	for id, veh in pairs  (vehicleRoster) do
		VehicleStatus:PrintVehicleObject(veh,i)
		i = i+1
	end
end

function VehicleStatus:AllVehiclesCrewRaid()

	SendChatMessage("Vehicles in this group", "RAID")
	i = 1
	for id, veh in pairs  (vehicleRoster) do
		VehicleStatus:RaidVehicleObject(obj,counter)(veh,i)
		i = i+1
	end
end
function VehicleStatus:RemovePersonFromVehicle(leaver)
	local name = UnitName(leaver)
	
	if groupList[UnitName(leaver)] ~= nil then
		
		
		leaveIDVeh = groupList[UnitName(leaver)].id
		--print(name.." has exited a vehicle "..leaveIDVeh)
		if vehicleRoster[leaveIDVeh]~= nil then
			--print("REMOVing")
			pass = 0
			for id, veh in pairs  (vehicleRoster[leaveIDVeh].seats) do
				--{occ = occupantName, role = controlType}
				if veh.occ ~= ".." then
					if UnitIsPlayer(veh.occ) then
						pass = pass+1
					end
				end
				if veh.occ == name then
					veh.occ=".."
					vehicleRoster[leaveIDVeh].seats[id].occ = ".."
					--print("REMOVED")
					pass = pass -1
				end
			end
			if pass == 0 then
				vehicleRoster[leaveIDVeh] = nil
			end
		end
		groupList[UnitName(leaver)] = nil
	end
end
function VehicleStatus:UNIT_EXITED_VEHICLE(event, leaver)
	VehicleStatus:RemovePersonFromVehicle(leaver)
end
function VehicleStatus:UPDATE_WORLD_STATES(...)
	--print("UPDATE")
end
function VehicleStatus:UNIT_ENTERED_VEHICLE(event, ...)
	
	local unit, showVehicleFrame, skinName, enterSoundName, isControlSeat, seatIndicator, vehicleGUID = ...;
	
	
	vehicleType, number, npcid = VehicleStatus:GetVehicleType(vehicleGUID)
	if vehicleType== nil then
		vehicleType = "Unknown"
		local testRaid = (string.gsub(unit,"raid",""))
		if testRaid ~= nil then
			--vehicleType, number, npcid = VehicleStatus:GetVehicleType(UnitGUID("raidpet"..testRaid))
			--print("PET "..UnitName("raidpet"..testRaid))
		end
	end
	if number== nil then
		number = 0
	end
	if vehicleIDs[ncpid]~= nil then
		if vehicleIDs[ncpid].type == "Turret" then
			number = number-1
		end
	end
	if vehicleType == "Salvaged Siege Turret" or vehicleType == "Salvaged Demolisher Mechanic Seat" or vehicleType == "Wintergrasp Siege Turret"  or vehicleType == "Flame Turret" or vehicleType == "Siege Turret" then
		number = number-1
	end
	if groupList[UnitName(unit)]~=nil then
		if vehicleRoster[groupList[UnitName(unit)].id].seats[groupList[UnitName(unit)].pos].occ == UnitName(unit) then
			vehicleRoster[groupList[UnitName(unit)].id].seats[groupList[UnitName(unit)].pos].occ = ".."
		end
	end
	groupList[UnitName(unit)] = {id=number, pos = 0};
	if vehicleRoster[number] == nil then
		VehicleStatus:RemovePersonFromVehicle(unit)
		vehicleStruct = {name = vehicleType , num = number, seats = {}, numseats = UnitVehicleSeatCount(unit) }
		seatnum = VehicleStatus:UnitSeatNumber(unit)
		if seatnum ~= nil then
			for i = 1,UnitVehicleSeatCount(unit) do
				controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo(unit, i)
				if occupantName~= nil then
					vehicleStruct.seats[i] = {occ = occupantName, role = roleList[controlType]}
				else
					vehicleStruct.seats[i] = {occ = "..", role = roleList[controlType]}
				end
			end
			vehicleStruct.seats[seatnum].occ = UnitName(unit)
		end
	--vehicleRoster
		vehicleRoster[number] = vehicleStruct
	else
		seatnum = VehicleStatus:UnitSeatNumber(unit)
		if vehicleRoster[number].seats[seatnum] ~= nil then
			vehicleRoster[number].seats[seatnum].occ = UnitName(unit)
		else
			controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo(unit, seatnum)
			vehicleRoster[number].seats[seatnum] = {occ =  UnitName(unit), role = roleList[controlType]}
		end
	end
end


function VehicleStatus:CreateVehicleObject(n, s, id)
	seatings = {}
	for i = 1, s do
		job = "Driver" 
		if i < s and i ~= 1 then
			job = "Passenger"
		end
		if i == s then
			job = "Gunner"
		end
		seatings[i] = {occupent = nil, role = job}
	end
	vehicleObject = {name = n,seats = seatings, vehid = id, numseats = s}
	return vehicleObject
end
function VehicleStatus:RaidVehicleObject(obj,counter)
	SendChatMessage("Vehicle #"..counter..": "..obj.name, "RAID")
	--print("Vehicle #"..counter..": "..obj.name)
	for i = 1, obj.numseats do
		if obj.seats[i].occ == nil then
			--print(obj.seats[i].role.." is empty")
			--print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.seats[i].role)," is empty"))
			SendChatMessage(obj.seats[i].role.." is empty", "RAID")
		else
			if obj.seats[i].occ == ".." then
				--print(obj.seats[i].role.." is empty")
				SendChatMessage(obj.seats[i].role.." is empty", "RAID")
				--print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.seats[i].role)," is empty"))
			else
			--	print(obj.seats[i].role.." "..obj.seats[i].occ)
				SendChatMessage(obj.seats[i].role.." "..obj.seats[i].occ, "RAID")
				--print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.seats[i].role)," "..obj.seats[i].occ))
				
			
			end
		end
	end
	--SendChatMessage(string.format(L["DIALING_START"], string.sub(spell, last+2)), self:GateGroup())
end
function VehicleStatus:PrintVehicleObject(obj, counter)
	--vehicleStruct = {name = vehicleType , number = GUID, seats = {}
--, numseats = UnitVehicleSeatCount(unit) }
	print("Vehicle #"..counter..": "..obj.name)
	for i = 1, obj.numseats do
		if obj.seats[i].occ == nil then
			--print(obj.seats[i].role.." is empty")
			print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.seats[i].role)," is empty"))
			
		else
			if obj.seats[i].occ == ".." then
				--print(obj.seats[i].role.." is empty")
				print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.seats[i].role)," is empty"))
			else
			--	print(obj.seats[i].role.." "..obj.seats[i].occ)
				print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.seats[i].role)," "..obj.seats[i].occ))
				
			
			end
		end
	end
	
end

function VehicleStatus:UnitSeatNumber(unit)
	local seats = UnitVehicleSeatCount(unit)
	for s = 1, seats do
		local controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo(unit, s)
		if UnitName(unit) == occupantName then
			return s;
		end
	end
end
function VehicleStatus:TargetVehicleStat()
	if UnitInVehicle("target") ~= nil then
		local seats = UnitVehicleSeatCount("target")
				for s = 1, seats do
					
					controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo("target", s)
						if occupantName~= nil then
							print(UnitName("target").." vehicle seats "..occupantName)
						else
							print(UnitName("target").." vehicle seats nil")
						end
					if controlType == "Root" then
					
					end
				end
	end
end	
function VehicleStatus:IsUnitDriver()

	local vehicleList = {}
	local raidRoster = {}
	local raidnum = GetNumRaidMembers() 
	for i = 1, raidnum do
		raidRoster[UnitName("raid"..i)] =1
	end

	for i = 1, raidnum do
		if raidRoster[UnitName("raid"..i)] ~= nil then
			if UnitInVehicle("raid"..i) ~= nil then

				local seats = UnitVehicleSeatCount("raid"..i)
				for s = 1, seats do
					
					controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo("raid"..i, s)
						if occupantName~= nil then
							print(UnitName("raid"..i).." vehicle seats "..occupantName)
						else
							print(UnitName("raid"..i).." vehicle seats nil")
						end
					if controlType == "Root" then
					
					end
				end
			end
		end
	end
end

function VehicleStatus:IdentifyVehicle(ty)
	if vehicleIDs[ty]~= nil then
		return vehicleIDs[ty].name;
	end
	return nil
end
function VehicleStatus:GetVehicleType(guid)
	local first3 = tonumber("0x"..strsub(guid, 3,5))
   local unitType = bit.band(first3,0x00f)

  if (unitType == 0x005) then
      local creatureID = tonumber("0x"..strsub(guid,7,10))
      local spawnCounter = tonumber("0x"..strsub(guid,11))
      --print("Vehicle, ID #",creatureID,"spawn #",spawnCounter)
		--print(VehicleStatus:IdentifyVehicle(creatureID))
		return VehicleStatus:IdentifyVehicle(creatureID),spawnCounter, creatureID
  end
	return nil
end
function VehicleStatus:ParseGUID(guid)
   local first3 = tonumber("0x"..strsub(guid, 3,5))
   local unitType = bit.band(first3,0x00f)

   if (unitType == 0x000) then
   --   print("Player, ID #", strsub(guid,6))
   elseif (unitType == 0x003) then
      local creatureID = tonumber("0x"..strsub(guid,7,10))
      local spawnCounter = tonumber("0x"..strsub(guid,11))
    --  print("NPC, ID #",creatureID,"spawn #",spawnCounter)
   elseif (unitType == 0x004) then
      local petID = tonumber("0x"..strsub(guid,7,10))
      local spawnCounter = tonumber("0x"..strsub(guid,11))
     -- print("Pet, ID #",petID,"spawn #",spawnCounter)
   elseif (unitType == 0x005) then
      local creatureID = tonumber("0x"..strsub(guid,7,10))
      local spawnCounter = tonumber("0x"..strsub(guid,11))
      print("Vehicle, ID #",creatureID,"spawn #",spawnCounter)
		print(VehicleStatus:IdentifyVehicle(creatureID))
   end
end

function VehicleStatus:CheckAllInVehicle()

	local numVeh = GetNumBattlefieldVehicles()
		local raidnum = GetNumRaidMembers() 
	for i = 1, raidnum do
		--vehicleX, vehicleY, unitNam, isPossessed, vehicleType, orientation, isPlayer, isAlive = GetBattlefieldVehicleInfo(i)
		--numSeats = UnitVehicleSeatCount("unit")
		if UnitInVehicle("raid"..i) ~= nil then
			print(UnitName("raid"..i).. " is in vehicle.")
		else
			print(UnitName("raid"..i).. " is NOT in vehicle.")
		end
		--print("Vehicle "..tostring(i)..": "..unitNam.. "  ")


	end
end

--MOD_TextFrame = CreateFrame("Frame");
--MOD_TextFrame:ClearAllPoints();
--MOD_TextFrame:SetHeight(300);
--MOD_TextFrame:SetWidth(300);
--MOD_TextFrame:SetScript("OnUpdate", MOD_TextFrame_OnUpdate);
--MOD_TextFrame:Hide();
--MOD_TextFrame.text = MOD_TextFrame:CreateFontString(nil, "BACKGROUND", "PVPInfoTextFont");
--MOD_TextFrame.text:SetAllPoints();
--MOD_TextFrame:SetPoint("CENTER", 0, 200);
--MOD_TextFrameTime = 0;
 
--function MOD_TextFrame_OnUpdate()
--  if (MOD_TextFrameTime < GetTime() - 3) then
--    local alpha = MOD_TextFrame:GetAlpha();
--    if (alpha ~= 0) then MOD_TextFrame:SetAlpha(alpha - .05); end
 --   if (aplha == 0) then MOD_TextFrame:Hide(); end
 -- end
--end
 
--function MOD_TextMessage(message)
--  MOD_TextFrame.text:SetText(message);
--  MOD_TextFrame:SetAlpha(1);
--  MOD_TextFrame:Show();
--  MOD_TextFrameTime = GetTime();
--end