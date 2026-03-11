--@author Endar_Ren
VehicleStatus = LibStub("AceAddon-3.0"):NewAddon("VehicleStatus", "AceConsole-3.0", "AceEvent-3.0" ,"LibSink-2.0");

local L						= LibStub("AceLocale-3.0"):GetLocale("VehicleStatus")

-----------------------------------------------------------------------------------------------------------------------
--											Tables
-----------------------------------------------------------------------------------------------------------------------
local rideList		= {}
local vehicleRoster = {}
local groupList		= {}
local vehicleIDs	= {}
--@field Vehicle IDs are sorted by instance/zone.
-- Each element is a table containing the indices: name, type, and side.  For turret types there is a fourth; basenum.
--name
--type
--side:  Some vehicles have different npc IDs for the different factions, even though they look the same.
--DespawnTimer:  The amount of time it takes for the vehicle to despawn if abandoned.  So far only applies to Wintergrasp vehicles.
-- =================================================================================================================================================================================================================
-- ================================================================================================Ulduar ==========================================================================================================
-- =================================================================================================================================================================================================================
vehicleIDs[33060] = {name = L["Salvaged Siege Engine"],					type = "Engine",	side = "Every",			seats = {{role="Driver"},{role="Gunner"}} }
vehicleIDs[33067] = {name = L["Salvaged Siege Turret"],					type = "Turret",	side = "Every",			seats = {{role="Gunner"}}, basenum = 	33060}
vehicleIDs[33167] = {name = L["Salvaged Demolisher Mechanic Seat"],		type = "Turret",	side = "Every",			seats = {{role="Gunner"}},basenum = 	33109}
vehicleIDs[33109] = {name = L["Salvaged Demolisher"],					type = "Demo",		side = "Every",			seats = {{role="Driver"},{role="None"},{role="None"},{role="None"},{role="Gunner"}}  }
vehicleIDs[33062] = {name = L["Salvaged Chopper"],						type = "Bike",		side = "Every",			seats = {{role="Driver"},{role="None"}} }
-- =================================================================================================================================================================================================================
-- =====================================================================================================Wintergrasp=================================================================================================
-- =================================================================================================================================================================================================================
vehicleIDs[28319] = {name = L["Wintergrasp Siege Turret"],				type = "Turret",	side = "Alliance",		basenum = 28312, seats = {{role = "Gunner"}}}
vehicleIDs[32629] = {name = L["Wintergrasp Siege Turret"],				type = "Turret",	side = "Horde",			basenum = 32627, seats = {{role = "Gunner"}} }
vehicleIDs[32627] = {name = L["Wintergrasp Siege Engine"],				type = "Engine",	side = "Horde",			seats = {{role="Driver"},{role="None"}, {role="None"},{role="Gunner"}},	despawnTimer = 60}
vehicleIDs[28312] = {name = L["Wintergrasp Siege Engine"],				type = "Engine",	side = "Alliance",		seats = {{role="Driver"},{role="None"}, {role="None"},{role="Gunner"}},	despawnTimer = 60}
vehicleIDs[28094] = {name = L["Wintergrasp Demolisher"],				type = "Demo",		side = "Every",			seats = {{role="Driver"},{role="None"}, {role = "None"}},				despawnTimer = 60}
vehicleIDs[27881] = {name = L["Wintergrasp Catapult"],					type = "Cata",		side = "Every",			seats = {{role="Driver"}},												despawnTimer = 60}
vehicleIDs[28366] = {name = L["Wintergrasp Tower Cannon"],				type = "Cannon",	side = "Every",			seats = {{role="Gunner"}}}
-- =================================================================================================================================================================================================================
-- ============================================================================================================Strand of the Ancients ==============================================================================
-- =================================================================================================================================================================================================================
vehicleIDs[28781] = {name = L["Battleground Demolisher"],				type = "Demo",		side = "Every",			seats = {{role="Driver"}}}
vehicleIDs[27894] = {name = L["Antipersonnel Cannon"],					type = "Cannon",	side = "Alliance",		seats = {{role="Gunner"}}}
-- =================================================================================================================================================================================================================
-- ===============================================================================================================Isle of Conquest =================================================================================	
-- =================================================================================================================================================================================================================
vehicleIDs[34775] = {name = L["Demolisher"],							type = "Demo",		side = "Every",				seats = {{role="Driver"},{role = "None"}}}
vehicleIDs[34793] = {name = L["Catapult"],								type = "Cata",		side = "Every",				seats = {{role="Driver"},{role = "None"}} }
vehicleIDs[34802] = {name = L["Glaive Thrower"],						type = "Cata",		side = "Alliance",			seats = {{role="Driver"}} }
vehicleIDs[35273] = {name = L["Glaive Thrower"],						type = "Cata",		side = "Horde",				seats = {{role="Driver"}}}
vehicleIDs[36356] = {name = L["Flame Turret"],							type = "Turret",	side = "Horde",				seats = {{role="Gunner"}},			basenum = 35069}
vehicleIDs[34778] = {name = L["Flame Turret"],							type = "Turret",	side = "Alliance",			seats = {{role="Gunner"}},			basenum = 34776}
vehicleIDs[36355] = {name = L["Siege Turret"],							type = "Turret",	side = "Horde",				seats = {{role="Gunner"}},			basenum = 35069}
vehicleIDs[34777] = {name = L["Siege Turret"],							type = "Turret",	side = "Alliance",			seats = {{role="Gunner"}},			basenum = 34776}
vehicleIDs[34929] = {name = L["Alliance Gunship Cannon"],				type = "Cannon",	side = "Alliance",			seats = {{role="Gunner"}}}
vehicleIDs[34935] = {name = L["Horde Gunship Cannon"],					type = "Cannon",	side = "Horde",				seats = {{role="Gunner"}}}
vehicleIDs[34944] = {name = L["Keep Cannon"],							type = "Cannon",	side = "Every",				seats = {{role="Gunner"}}}
vehicleIDs[35069] = {name = L["Siege Engine"],							type = "Engine",	side = "Horde",				seats = {{role="Driver"},{role="Gunner"},{role="Gunner"},{role="Gunner"} }  }
vehicleIDs[34776] = {name = L["Siege Engine"],							type = "Engine",	side = "Alliance",			seats = {{role="Driver"},{role="Gunner"},{role="Gunner"},{role="Gunner"} }}
-- =================================================================================================================================================================================================================
-- =======================================================================================================================Tol Barad=================================================================================
-- =================================================================================================================================================================================================================
vehicleIDs[45344] = {name = L["Abandoned Siege Engine"],				type = "Engine",	side = "Every",		seats = {{role="Driver"}}}
vehicleIDs[48283] = {name = L["Wellson Cannon"],						type = "Cannon",	side = "Every",		seats = {{role="Gunner"}}}
-- =================================================================================================================================================================================================================
-- =========================================================================================================================Icecrown ===============================================================================
-- =================================================================================================================================================================================================================
vehicleIDs[32227] = {name = L["Skybreaker Suppression Turret"],			type = "Turret",	side = "Alliance",	seats = {{role="Gunner"}}}
vehicleIDs[31884] = {name = L["Kor'kron Suppression Turret"],			type = "Turret",	side = "Horde",		seats = {{role="Gunner"}}}
vehicleIDs[31736] = {name = L["Geargrinder's Jumpbot"],					type = "Cata",		side = "Alliance",	seats = {{role="Pilot"}}}
vehicleIDs[31770] = {name = L["Thunderbomb's Jumpbot"],					type = "Cata",		side = "Horde",		seats = {{role="Pilot"}}}
-- =================================================================================================================================================================================================================
-- ===========================================================================================================================ICC =================================================================================
-- =================================================================================================================================================================================================================
vehicleIDs[36839] = {name = L["Horde Gunship Cannon"],					type = "Cannon",	side = "Horde",			seats = {{role="Gunner"}}}
vehicleIDs[36838] = {name = L["Alliance Gunship Cannon"],				type = "Cannon",	side = "Alliance",		seats = {{role="Gunner"}}}
-- =================================================================================================================================================================================================================
-- =============================================================================================================Roles ==============================================================================================
-- =================================================================================================================================================================================================================
--@field This is a 2 dimensional table pairing vehicle types with their three roles.
local roleList =		{}
roleList["Demo"] =		{}
roleList["Cata"] =		{}
roleList["Cannon"] =	{}
roleList["Engine"] =	{}


roleList["Demo"]["Root"]	= L["Driver"]
roleList["Demo"]["Child"]	= L["Gunner"]
roleList["Demo"]["None"]	= L["None"]

roleList["Cata"]["Root"]	= L["Driver"]
roleList["Cata"]["Child"]	= L["Gunner"]
roleList["Cata"]["None"]	= L["None"]

roleList["Engine"]["Root"]	= L["Driver"]
roleList["Engine"]["Child"]	= L["Gunner"]
roleList["Engine"]["None"]	= L["None"]

roleList["Cannon"]["Root"]	= L["Gunner"]
roleList["Cannon"]["Child"]	= L["Gunner"]
roleList["Cannon"]["None"]	= L["None"]

roleList["Bike"] =	{}
roleList["Bike"]["Root"]	= L["Driver"]
roleList["Bike"]["Child"]	= L["Gunner"]
roleList["Bike"]["None"]	= L["None"]
-----------------------------------------------------------------------------------------------------------------------
--													Options Tables
-----------------------------------------------------------------------------------------------------------------------
NeooptionTable = {
		name	= "VehicleStatus",
		handler = VehicleStatus,
		type	= 'group',
		args = {

			list =		{
									name =	"List vehicle",
									desc =	"Lists all vehicles in the zone.",
									type =	"execute",
									func =	"ListAllVehicles"
						},
			crew =		{
									name =	"Vehicle crew check",
									desc =	"Prints out the known crew of all vehicles in your group.",
									type =	"execute",
									func =	"Printout"
			}, --AnnounceVehiclesInGroup
			group = {
									name =	"Announce vehicles to group",
									desc =	"Sends out a message on your groups channel with the vehicle information of the group",
									type =	"execute",
									func =	"AnnounceVehiclesInGroup"
			
			},
			clear =		{
									name =	"Clear vehicle list",
									desc =	"Clears the vehicle list",
									type =	"execute",
									func =	"ClearList"
			},
			scan =		{
									name =	"Clear vehicle list",
									desc =	"Clears the vehicle list",
									type =	"execute",
									func =	"ScanGroup"
			},
			ReportBug		= {
									name =	"Report your vehicle's status",
									desc =	"Reports your vehicles status and any crew needs it has.",
									type =	"execute",
									func =	"ReportYour"
			
			}
				}
			}
LibStub("AceConfig-3.0"):RegisterOptionsTable("VehicleStatus", NeooptionTable, {"vs"})

function VehicleStatus:ReportYour()
	numSeats = UnitVehicleSeatCount("player")
	for i = 1, numSeats do 
		controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo("player", i)
		if occupantName == nil then
			if controlType == "Root" then
				print("Need driver")
			end
			if controlType == "Child" then
				print("Need gunner")
			end

			--    Child - Unit in this seat controls part of the vehicle but not its movement (e.g. a gun turret)
   -- None - Unit in this seat has no control over the vehicle
   -- Root - Unit in this seat controls the movement of the vehicle
		end
	end

end

-----------------------------------------------------------------------------------------------------------------------
--											Ace3 Functions
-----------------------------------------------------------------------------------------------------------------------
function VehicleStatus:OnInitialize()

	self:RegisterEvent("UNIT_ENTERED_VEHICLE")
	self:RegisterEvent("UNIT_EXITED_VEHICLE")
	self:RegisterEvent("UNIT_PET")
	self:RegisterEvent("GROUP_ROSTER_UPDATE")
end
function VehicleStatus:OnEnable()
	self:RegisterEvent("UNIT_ENTERED_VEHICLE")
	self:RegisterEvent("UNIT_EXITED_VEHICLE")
end

function VehicleStatus:OnDisable()
	self:UnregisterEvent("UNIT_ENTERED_VEHICLE")
	self:UnregisterEvent("UNIT_EXITED_VEHICLE")
end
-- ==================================================================================================================================== --
--												Command Functions
-- ==================================================================================================================================== --




--- Clear List Function
---Clears all of the data tables populated while the addon is running.
-- @param None.
-- @return None.

function VehicleStatus:ClearList() 
	wipe(vehicleRoster)
	wipe(groupList)
	wipe(rideList)

end

--- List All Vehicle Function
--This function will list ALL known vehicles on your map.  This includes Gunships and 
-- unoccupied vehicles.  It will not detect enemy vehicles unless they are near a teammate.  
-- The list of vehicles is printed out.
-- @param None
-- @return None

function VehicleStatus:ListAllVehicles()

	local numVeh = GetNumBattlefieldVehicles()
	print("All Vehicles")
	
	for i = 1, numVeh do
		vehicleX, vehicleY, unitNam, isPossessed, vehicleType, orientation, isPlayer, isAlive = GetBattlefieldVehicleInfo(i)
		if unitNam ~= nil then
			print(("|cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring("Vehicle "..tostring(i)), ": "..tostring(unitNam)))
		end
	end
end

---Print Out Function
--Goes through all of the vehicle data objects and prints out their VehicleObjectString.													--
-- @param None
-- @return None

function VehicleStatus:Printout()
	count = 0
	for id, veh in pairs  (vehicleRoster) do

		count = count+1
	end
	print("Vehicles in this group:  "..count.." vehicles.")

	i = 1
	for id, veh in pairs  (vehicleRoster) do
		print(VehicleStatus:VehicleObjectString(veh,i))
		i = i+1
	end
end

--- Announce Vehicles In Group Function
--Similar to Printout(), except it will broadcast it publicly to your group.																--
-- @param None
-- @return None

function VehicleStatus:AnnounceVehiclesInGroup()
	chan = select(2, IsInInstance()) == "pvp" and "BATTLEGROUND" or (UnitInRaid("player") and "RAID" or "PARTY")
		SendChatMessage("Vehicles in this group",chan)
	i = 1
	for id, veh in pairs  (vehicleRoster) do
		line = VehicleStatus:GroupVehicleString(veh,i)
		
		SendChatMessage(line,chan)
		i = i+1
	end

end

--- Check All in Vehicle Function
-- Goes through all raid members and checks to see if they are in a vehicle using 
-- UnitInVehicle(unitID) function and print out results.
-- @param none
-- @return none

function VehicleStatus:CheckAllInVehicle()

	local numVeh	= GetNumBattlefieldVehicles()
	local raidnum	= GetNumGroupMembers() 
	for i = 1, raidnum do
		if UnitInVehicle("raid"..i) ~= nil then
			print(UnitName("raid"..i).. " is in vehicle.")
		else
			print(UnitName("raid"..i).. " is NOT in vehicle.")
		end
	end
end

--- Scan group function.
-- This function will look at all of the pets in group and check if any are vehicles.
-- This scan does not work well for finding someone who is just a passanger in a vehicle, since it does not count as a pet.
--This function can detect if someone is in a control seat of a vehicle, reguardless of how far away they are on the battleground.
--ERROR:  Adding vehicles to the roster is not working properly.  
function VehicleStatus:ScanGroup()
	for i = 1, 40 do
		if UnitGUID("raidpet"..tostring(i)) ~= nil then
			vehicleName, spawnCounter , vehicleID = VehicleStatus:GetVehicleType( UnitGUID("raidpet"..tostring(i)))
			if vehicleName ~= nil then
				print("Scan results: "..UnitName("raid"..i) .." is in a ".. vehicleName)
				if vehicleRoster[spawnCounter] == nil then
					veh = VehicleStatus:CreateVehicleObject(vehicleID, "raid"..i)
					vehicleRoster[spawnCounter] = veh;
				end
				print("Scan should be adding")
				VehicleStatus:AddPerson(spawnCounter, "raid"..i,vehicleID)
			end
		end
	
	end
	
end
-- ==================================================================================================================================== --
--												Events
-- ==================================================================================================================================== --
function VehicleStatus:GROUP_ROSTER_UPDATE(...)
	if GetNumGroupMembers() == 0 then
		VehicleStatus:ClearList() 
	end
end
function VehicleStatus:UNIT_PET(event, unitid)
	if strfind(unitid,"raid") ~= nil then
					beg, en = strfind(unitid,"raid");
					if beg ~= nil then
						num = strsub(unitid,en+1,en+1)
						vehGUID = UnitGUID("raidpet"..num)
						vehicleName, spawnCounter , vehicleID = VehicleStatus:GetVehicleType(vehGUID)
						if vehicleName ~= nil then
							print(UnitName(unitid).." is in a "..vehicleName.. " in seat "..UnitVehicleSeatCount ("raidpet"..num))

							
							if vehicleRoster[spawnCounter] == nil then
								print("creating "..vehicleName)
								veh = VehicleStatus:CreateVehicleObject(vehicleID, unitid)
								vehicleRoster[spawnCounter] = veh;
							end
							VehicleStatus:AddPerson(spawnCounter, unitid,vehicleID)
						end
					end
						
	end
end


--- UNIT_EXITED_VEHICLE Event Handler
--This handles the UNIT_EXITED_VEHICLE event.  It will find the vehicle 
-- the person exiting was in and remove him/her from its data object.
-- If afterwards the vehicle is empty, it should be removed from
-- vehicleRoster.														
-- @param event The name of the event.  
-- @param leaver  The UnitID of the person exiting.

function VehicleStatus:UNIT_EXITED_VEHICLE(event, leaver)
	if groupList [UnitName(leaver)] ~= nil then
		--print(UnitName(leaver).. " has left the vehicle he/she was in")
		rideList[UnitName(leaver)] = nil

		VehicleStatus:RemovePerson(groupList [UnitName(leaver)].VehID,leaver)
		if VehicleStatus:IsVehicleEmpty(vehicleRoster[groupList [UnitName(leaver)].VehID]) then
			vehicleRoster[groupList [UnitName(leaver)].VehID] = nil
		end
		groupList [UnitName(leaver)] = nil
	end
end

--- UNIT_ENTERED_VEHICLE event handler.
-- A very long handler.  It will updata vehicle data objects based on	
-- who entered what.  If the vehicle is unknown, it will try to identify
--	it using a check on that person's pet.  If that does not work, it will
--	ignore it for now.  The reason being that the person is too far away.
--	Once you get closer, the event will refire with the needed
--	vehicle data.
-- @param  event the name of the event.  
-- @param  unit the UnitID of the person entering.
-- @param showVehicleFrame  boolean on if a vehicle frame is shown in this case 
-- @param skinName  Probably the skin of the frame or vehicle.					
-- @param enterSoundName  Sound file played on entering.						
-- @param isControlSeat Boolean on whether the seat is the driver seat or not.	
-- @param seatIndicator  No idea what this is used for,   
--			Probably for the small vehicle graphic object shown when you are in a vehicle.				--
-- @param vehicleGUID  The GUID of the vehicle,  Very important for this addon,
--			since this is one of two ways to get it for a vehicle.	
-- @return none																		

function VehicleStatus:UNIT_ENTERED_VEHICLE(event, ...)
	
	
	local unit, showVehicleFrame, skinName, enterSoundName, isControlSeat, seatIndicator, vehicleGUID = ...;
	if UnitName(unit) == "Unknown" then
		return nil;
	end
	--print("Enter Event:  Unit = "..unit..", showVehicleFrame = "..showVehicleFrame..", skinName = "..skinName..", isControlSeat = "..", seatIndicator = "..seatIndicator)
	
		vehicleName, spawnCounter , vehicleID = VehicleStatus:GetVehicleType(vehicleGUID)
		if UnitHasVehicleUI(unit) then
			if vehicleName ~= nil then
				--print(UnitName(unit) .." is in some vehicle at the controls of a "..vehicleName)
				rideList[UnitName(unit)] = UnitName(unit) .." is in some vehicle at the controls of a "..vehicleName
				----------------------------------------------------------------------
				-- Add/Update entry in Vehicle Roster
				----------------------------------------------------------------------
				if vehicleIDs[vehicleID].type ~= "Turret" then
					if vehicleRoster[spawnCounter] == nil then
						veh = VehicleStatus:CreateVehicleObject(vehicleID, unit)
						vehicleRoster[spawnCounter] = veh;
					end
					groupList[UnitName(unit)] = {VehID = spawnCounter, seat = 0}
					VehicleStatus:AddPerson(spawnCounter, unit,vehicleID)
				else
					spawnCounter = spawnCounter-1
					if vehicleRoster[spawnCounter] == nil then
						veh = VehicleStatus:CreateVehicleObject(vehicleID, unit)
						vehicleRoster[spawnCounter] = veh;
					end
					groupList[UnitName(unit)] = {VehID = spawnCounter, seat = 0}
					VehicleStatus:AddPerson(spawnCounter, unit,vehicleID)
				end
				-------------------------------------------------------------------
			else
				if strfind(unit,"raid") ~= nil then
					beg, en = strfind(unit,"raid");
					if beg ~= nil then
						num = strsub(unit,en+1,en+1)
						vehGUID = UnitGUID("raidpet"..num)
						vehicleName, spawnCounter , vehicleID = VehicleStatus:GetVehicleType(vehGUID)
						if vehicleName ~= nil then
							--print(UnitName(unit).." is in a "..vehicleName.." according to pet scan")
							rideList[UnitName(unit)] =UnitName(unit).." is in a "..vehicleName.." according to pet scan"
							----------------------------------------------------------------------
							-- Add/Update entry in Vehicle Roster
							----------------------------------------------------------------------
							if vehicleIDs[vehicleID].type ~= "Turret" then
								if vehicleRoster[spawnCounter] == nil then
									veh = VehicleStatus:CreateVehicleObject(vehicleID, unit)
									vehicleRoster[spawnCounter] = veh;
								end
								groupList[UnitName(unit)] = {VehID = spawnCounter, seat = 0}
								VehicleStatus:AddPerson(spawnCounter, unit,vehicleID)
							else
								spawnCounter = spawnCounter-1
								if vehicleRoster[spawnCounter] == nil then
									veh = VehicleStatus:CreateVehicleObject(vehicleID, unit)
									vehicleRoster[spawnCounter] = veh;
								end
								groupList[UnitName(unit)] = {VehID = spawnCounter, seat = 0}
								VehicleStatus:AddPerson(spawnCounter, unit,vehicleID)
							end
							---------------------------------------------------------------------
						else
							--print(UnitName(unit).." is in some vehicle Unknown.  Pet failed")
							rideList[UnitName(unit)] = UnitName(unit).." is in some vehicle Unknown.  Pet failed"
						end
					end
				else
				--	print(UnitName(unit).." is in some vehicle Unknown.  Pet")
					rideList[UnitName(unit)] = UnitName(unit).." is in some vehicle Unknown.  Pet"
				end
			end

		else
			if UnitInVehicle(unit) then
				if vehicleName ~= nil then
					--print(UnitName(unit) .." is a passanger in a "..vehicleName)
					rideList[UnitName(unit)] = UnitName(unit) .." is a passanger in a "..vehicleName
					----------------------------------------------------------------------
					-- Add/Update entry in Vehicle Roster
					----------------------------------------------------------------------
					if vehicleIDs[vehicleID].type ~= "Turret" then
						if vehicleRoster[spawnCounter] == nil then
							veh = VehicleStatus:CreateVehicleObject(vehicleID, unit)
							vehicleRoster[spawnCounter] = veh;
						end
						groupList[UnitName(unit)] = {VehID = spawnCounter, seat = 0}
						VehicleStatus:AddPerson(spawnCounter, unit,vehicleID)
					else
						spawnCounter = spawnCounter-1
						if vehicleRoster[spawnCounter] == nil then
							veh = VehicleStatus:CreateVehicleObject(vehicleID, unit)
							vehicleRoster[spawnCounter] = veh;
						end
						groupList[UnitName(unit)] = {VehID = spawnCounter, seat = 0}
						VehicleStatus:AddPerson(spawnCounter, unit,vehicleID)
					end
					---------------------------------------------------------------------
				else
					--print(UnitName(unit) .." is a passanger in an unknown vehicle")
					rideList[UnitName(unit)] = UnitName(unit) .." is a passanger in an unknown vehicle"
				end
			else
	
			end
		end
	
end

-- ==================================================================================================================================== --
--											Vehicle Table Functions
-- ==================================================================================================================================== --

--- Create Vehicle Object Function.
-- A function used to create a new vehicle data object.				
-- @param  vehicleTy  a key for the vehicleIDs table for information on the	vehicle.
-- @param unit  The UnitID of the person entering the vehicle.			
-- @return a vehicle data object.														

function VehicleStatus:CreateVehicleObject(vehicleTy, unit)
	SeatsTemp = {}
	placedInSeat = false
iu =1
	for key,values in pairs(vehicleIDs[vehicleTy].seats) do
		--table.insert(SeatsTemp, {Role = values.role, 
		--					Occupant = "is empty"})

		SeatsTemp[iu] = {Role = values.role, 
							Occupant = "is empty"}
		iu= iu+1
	end
	for i = 1,#vehicleIDs[vehicleTy].seats  do 
		controlType, occupantName, occupantRealm, ce, css = UnitVehicleSeatInfo(unit, i)
		if occupantName ~= nil then
			--tinsert(SeatsTemp, {Role = roleList[vehicleIDs[vehicleTy].type][controlType], 
			--					Occupant = occupantName})
				SeatsTemp[i].Occupant = occupantName
			if occupantName == UnitName(unit) then
				placedInSeat = true
			end
		else
			--tinsert(SeatsTemp, {Role = roleList[vehicleIDs[vehicleTy].type][controlType], 
			--					Occupant = "is empty"})
		end
	end
	veh = {	Name = vehicleIDs[vehicleTy].name, 
			Seats = SeatsTemp, 
			numseats = UnitVehicleSeatCount(unit),
			UnknownSeats = {}
	}
	if placedInSeat == false then
		--table.insert(veh.UnknownSeats, UnitName(unit))
		veh.UnknownSeats[#veh.UnknownSeats] = UnitName(unit)
	end

	return veh
end

---Find Seat Function.
-- Looks through the seats in UnitVehicleSeatInfo to see if a person is in a seat.															--
-- @param  vehID  The spawn counter used to identify the vehicle.				
-- @param  unit  The unitID of the person who is being looked for.				
-- @return  Either the seat number of the person (ranging from 1 to the number of		
--			 seats) or 0 if that person is not found.									

function VehicleStatus:FindSeat(vehID, unit)
	for i = 1, UnitVehicleSeatCount(unit) do
		controlType, occupantName, occupantRealm, ec, scc = UnitVehicleSeatInfo(unit, i)
		if UnitName(unit) == occupantName then
			return i
		end
	end
	return 0
end

--- Add Person Function.
-- Finds out which seat a person is in and adds that person to that seat 
-- in the vehicle data object.											
-- @param  vehID  The spawn counter used to identify the vehicle.
-- @param  unit  The unitID of the person who is being added to the vehicle.		

function VehicleStatus:AddPerson(vehID, unit,vehicleID)
--Find their seat.
	se = VehicleStatus:FindSeat(vehID, unit)
	
	if vehicleRoster[vehID] ~= nil then
		if se ==0 then
			veh.UnknownSeats[#veh.UnknownSeats] = UnitName(unit)
			--table.insert(vehicleRoster[vehID].UnknownSeats, UnitName(unit))
		end
			if vehicleRoster[vehID].Seats ~= nil then
				if vehicleRoster[vehID].Seats[se] ~= nil then
					vehicleRoster[vehID].Seats[se].Occupant = UnitName(unit)
				else
					 VehicleStatus:CreateVehicleObject(vehicleID, unit)
					


				end
			else
				print("NO SEATS")
			end
	
	else
		print("NO VEHICLE")
	end
end

--- Remove Person Function.
-- This function will go through the stored data on a vehicle, look for a particular 
-- person in one of the seats and remove that person.	
-- @param  vehID  The spawn counter used to identify the vehicle.				
-- @param unit  The unitID of the person who is being removed from the vehicle. 

function VehicleStatus:RemovePerson(vehID,unit)
	for i=1,#vehicleRoster[vehID].Seats do
		if vehicleRoster[vehID].Seats[i].Occupant == UnitName(unit) then
			vehicleRoster[vehID].Seats[i].Occupant = "is empty";
			print("removed "..UnitName(unit))
		end
	end
	for i=1,#vehicleRoster[vehID].UnknownSeats do
		if vehicleRoster[vehID].UnknownSeats[i] == UnitName(unit) then
			tremove(vehicleRoster[vehID].Unknown,i)
			print("removed "..UnitName(unit))
		end
	end
end

---Is Vehicle Empty Function.
--Checks all of the seats of a vehicle to see if all of them are empty. 
-- @param  veh  The vehicle object to check.										
-- @returns:  true is no one is found.  false is there is at least one person in it.	
-- STILL TESTING

function VehicleStatus:IsVehicleEmpty(veh)
	for key,val in pairs (veh.Seats) do
		if val.Occupant ~= "is empty" then
			return false;
		end
	end
	if #veh.UnknownSeats ~= 0 then
		return false
	end
--	print("Vehicle was found to be empty")
	return true
end


---Vehicle Object String Function.
-- Creates a string for Lua printout on a vehicle object, detailing the seats of that vehicle, who is in them, and what role the seat servers	--
-- @param obj  The vehicle data object.  
-- @param Counter  An integer used to show which number vehicle it is on the list.									--
-- @return  A string.																	

function VehicleStatus:VehicleObjectString(obj, counter)
	if obj.Name ~= nil then
	strin = "Vehicle #"..counter..": "..obj.Name
	for i = 1, obj.numseats do
		if obj.Seats[i].Occupant == nil then
			strin =strin ..((" |cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.Seats[i].Role)," is empty."))
		else
			if obj.Seats[i].occ == ".." then
				strin =strin ..((" |cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.Seats[i].Role)," is empty."))
			else
				strin =strin ..((" |cffff7d0a<|r|cffffd200%s|r|cffff7d0a>|r %s"):format(tostring(obj.Seats[i].Role)," "..obj.Seats[i].Occupant)..".")
			end
		end
	end
		strin = strin .." <Unknown Seats> "
	for i = 1, #obj.UnknownSeats do
		strin =strin.." "..obj.UnknownSeats[i]
	end
	return strin;
	end
end

--- Group Vehicle Object String Function.
-- Same as VehicleObjectString, except it does not do the text coloring.
-- @param obj The vehicle data object.
-- @param  Counter  An integer used to show which number vehicle it is on the list.									--
-- @return:  A string.																	

function VehicleStatus:GroupVehicleString(obj, counter)
	strin = "Vehicle #"..counter..": "..obj.Name
	for i = 1, obj.numseats do
		if obj.Seats[i].Occupant == nil then
			strin =strin .." <"..obj.Seats[i].Role.."> is empty."
		else
			if obj.Seats[i].occ == "is empty" then
				strin =strin .." <"..obj.Seats[i].Role.."> is empty."
			else
				strin =strin .." <"..obj.Seats[i].Role.."> "..obj.Seats[i].Occupant.."."
			end
		end
	end
	return strin;
end

-- ==================================================================================================================================== --
--											Vehicle Identification Functions
-- ==================================================================================================================================== --

--- Identify Vehicle Function.
-- Finds the name of the vehicle based on the npc ID.					
-- @param  ty the npc ID to check.												
-- @return  The name of the vehicle if it is found.  Otherwise nil.				

function VehicleStatus:IdentifyVehicle(ty)
	if vehicleIDs[ty]~= nil then
		return vehicleIDs[ty].name;
	end
	return nil
end
------------------------------------------------------------------------------------------
--- Get Vehicle Type Function.
-- Finds out information about a possible vehicle using its GUID.		
-- @param guid the GUID to check.														
-- @return  The name of the vehicle
-- @return   the spawn counter of that vehicle
-- @return  the npc ID, otherwise nil if not found.												
------------------------------------------------------------------------------------------
function VehicleStatus:GetVehicleType(guid)
	if guid ~= nil then
	local first3	= tonumber("0x"..strsub(guid, 3,5))
	local unitType	= bit.band(first3,0x00f)

	  if (unitType == 0x005) then
		  local creatureID		= tonumber("0x"..strsub(guid,7,10))
		  local spawnCounter	= tonumber("0x"..strsub(guid,11))
		  --print("Vehicle, ID #",creatureID,"spawn #",spawnCounter)
			--print(VehicleStatus:IdentifyVehicle(creatureID))
			return VehicleStatus:IdentifyVehicle(creatureID),spawnCounter, creatureID
	  end
  end
	return nil
end