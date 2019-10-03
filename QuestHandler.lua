AAPClassic.QuestList = {}
AAPClassic.QH = {}
if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
AAPClassic.QH.BookingList = {}
AAPClassic.CheckNamePlates = {}
AAPClassic.ActiveMobIds = {}
AAPClassic.QH.FuncLoopLastNumber = 0
AAPClassic.QH.ZoneNr = 0
function test()
AAPHSteps = {}
AAPHSteps[12345676] = {}
local nr = 0
	for AAP_index,AAP_value in pairs(AAPClassic.Path[12345676]) do
	nr = nr + 1
		tinsert(AAPHSteps[12345676],AAPClassic.Path[12345676][nr])
	end
end
function AAPClassic.QH.UpdateMapId()
	if (AAPClassic.Faction == "Horde") then
		AAPClassic.QH.UpdateMapIdHorde()
	else
		AAPClassic.QH.UpdateMapIdAlly()
	end
end
function AAPClassic.QH.UpdateMapIdHorde()
	AAPClassic.Level = UnitLevel("player")
	local OldMapID = AAPClassic.OldZoneId
	AAPClassic.QH.ZoneNr = C_Map.GetBestMapForUnit("player")
	local currentMapId, TOP_MOST = C_Map.GetBestMapForUnit('player'), true
	if (Enum and Enum.UIMapType and Enum.UIMapType.Continent and currentMapId) then
		AAPClassic.QH.ZoneNr = MapUtil.GetMapParentInfo(currentMapId, Enum.UIMapType.Continent+1, TOP_MOST)
	end
	if (AAPClassic.QH.ZoneNr and AAPClassic.QH.ZoneNr["mapID"]) then
		AAPClassic.QH.ZoneNr = AAPClassic.QH.ZoneNr["mapID"]
	else
		AAPClassic.QH.ZoneNr = C_Map.GetBestMapForUnit("player")
	end
	if (not AAPClassic.QH.ZoneNr) then
		return
	end
	AAPClassic.OldZoneId = AAPClassic.QH.ZoneNr
	if (OldMapID ~= AAPClassic.QH.ZoneNr) then
		--print("new zone"..AAPClassic.QH.ZoneNr)
		AAPClassic.RemoveIcons()
		AAPClassic.QuestList = nil
		AAPClassic.QuestList = {}
		if (AAPClassic.QuestHelperEnable == "on") then
			AAPClassic.QH.ZoneNr = "QuestHelper"
		end
		AAPClassic.QH.UpdateQuestList()
	end

	---- test
	if (AAPClassic.QuestHelperEnable == "on") then
		AAPClassic.QH.ZoneNr = "QuestHelper"
	end

---------------------------------- Undead Starts ---------------------
	if (not AAPClassic.QuestList[365] and not IsQuestFlaggedCompleted(365) and AAPClassic.Race == "Scourge") then
		AAPClassic.QH.ZoneNr = "1-5Undead"
	elseif ((AAPClassic.QuestList[365] or IsQuestFlaggedCompleted(365)) and not IsQuestFlaggedCompleted(371) and not AAPClassic.QuestList[371] and AAPClassic.Race == "Scourge") then
		AAPClassic.QH.ZoneNr = "5-10Undead"
	elseif (not IsQuestFlaggedCompleted(372) and (AAPClassic.QuestList[371] or IsQuestFlaggedCompleted(371)) and AAPClassic.Race == "Scourge" and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "10-12Undead-Warrior"
	elseif (not IsQuestFlaggedCompleted(372) and (AAPClassic.QuestList[371] or IsQuestFlaggedCompleted(371)) and AAPClassic.Race == "Scourge" and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "10-12Undead-Rogue"
	elseif (not IsQuestFlaggedCompleted(372) and (AAPClassic.QuestList[371] or IsQuestFlaggedCompleted(371)) and AAPClassic.Race == "Scourge" and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "10-12Undead-Priest"
	elseif (not IsQuestFlaggedCompleted(372) and (AAPClassic.QuestList[371] or IsQuestFlaggedCompleted(371)) and AAPClassic.Race == "Scourge" and AAPClassic.Class[3] == 8) then
		AAPClassic.QH.ZoneNr = "10-12Undead-Mage"
	elseif (not IsQuestFlaggedCompleted(372) and (AAPClassic.QuestList[371] or IsQuestFlaggedCompleted(371)) and AAPClassic.Race == "Scourge" and AAPClassic.Class[3] == 9) then
		AAPClassic.QH.ZoneNr = "10-12Undead-Warlock"
	elseif (not IsQuestFlaggedCompleted(871) and IsQuestFlaggedCompleted(372) and AAPClassic.Race == "Scourge") then
		AAPClassic.QH.ZoneNr = "12-15Undead-UC-Orgri-XR"
	end
---------------------------------- Undead Ends ---------------------

---------------------------------- Tauren Starts ---------------------
	if (not IsQuestFlaggedCompleted(871) and AAPClassic.Race == "Tauren" and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "1-12Tauren-Warrior"
	elseif (not IsQuestFlaggedCompleted(871) and AAPClassic.Race == "Tauren" and AAPClassic.Class[3] == 3) then
		AAPClassic.QH.ZoneNr = "1-12Tauren-Hunter"
	elseif (not IsQuestFlaggedCompleted(871) and AAPClassic.Race == "Tauren" and AAPClassic.Class[3] == 7) then
		AAPClassic.QH.ZoneNr = "1-12Tauren-Shaman"
	elseif (not IsQuestFlaggedCompleted(871) and AAPClassic.Race == "Tauren" and AAPClassic.Class[3] == 11) then
		AAPClassic.QH.ZoneNr = "1-12Tauren-Druid"
	end
---------------------------------- Tauren Ends ---------------------

---------------------------------- Orc & Troll Starts ---------------------
	if (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Warrior"
	elseif (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 3) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Hunter"
	elseif (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Rogue"
	elseif (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Priest"
	elseif (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 7) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Shaman"
	elseif (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 8) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Mage"
	elseif (not IsQuestFlaggedCompleted(871) and (AAPClassic.Race == "Troll" or AAPClassic.Race == "Orc") and AAPClassic.Class[3] == 9) then
		AAPClassic.QH.ZoneNr = "1-12OrcTroll-Warlock"
	end
---------------------------------- Orc & Troll Ends ---------------------




	--- 12-15 The Barrens ---
	if (IsQuestFlaggedCompleted(871) and not IsQuestFlaggedCompleted(6548) and not AAPClassic.QuestList[6548]) then
		AAPClassic.QH.ZoneNr = "12-15TheBarrens"
	end
	--- 15-16 Stonetalon Mountains ---
	if ((IsQuestFlaggedCompleted(6548) or AAPClassic.QuestList[6548]) and not IsQuestFlaggedCompleted(6629)) then
		AAPClassic.QH.ZoneNr = "15-16StonetalonMountains"
	end
	--- 16 The Barrens ---
	if (IsQuestFlaggedCompleted(6629) and not IsQuestFlaggedCompleted(878) and not AAPClassic.QuestList[878]) then
		AAPClassic.QH.ZoneNr = "16TheBarrens"
	end
	--- 16 GoTo Thunder Bluff ---
	if ((IsQuestFlaggedCompleted(878) or AAPClassic.QuestList[878]) and not IsQuestFlaggedCompleted(4921) and AAPClassic.Race == "Tauren") then
		AAPClassic.QH.ZoneNr = "16GotoTB-Tauren"
	elseif ((IsQuestFlaggedCompleted(878) or AAPClassic.QuestList[878]) and not IsQuestFlaggedCompleted(4921)) then
		AAPClassic.QH.ZoneNr = "16GotoTB-Rest"
	end
	--- 16-20 The Barrens ---
	if (IsQuestFlaggedCompleted(4921) and not IsQuestFlaggedCompleted(880)) then
		AAPClassic.QH.ZoneNr = "16-20TheBarrens"
	end
	--- 20 Thunder Bluff Prep ---
	if (IsQuestFlaggedCompleted(880) and not IsQuestFlaggedCompleted(1060)) then
		AAPClassic.QH.ZoneNr = "20-TB-Prep"
	end
	--- 20-23 Ashenvale & South Barrens ---
	if (IsQuestFlaggedCompleted(1060) and not IsQuestFlaggedCompleted(868)) then
		AAPClassic.QH.ZoneNr = "20-23Ashenvale-SouthBarrens"
	end
	--- 23-25 StonetalonMountains ---
	if (IsQuestFlaggedCompleted(868) and not IsQuestFlaggedCompleted(6381)) then
		AAPClassic.QH.ZoneNr = "23-25StonetalonMountains"
	end
	--- 25 Southern Barrens ---
	if (IsQuestFlaggedCompleted(6381) and not IsQuestFlaggedCompleted(5881)) then
		AAPClassic.QH.ZoneNr = "23-25StonetalonMountains"
	end
	--- 25-26 Thousand Needles ---
	if (IsQuestFlaggedCompleted(5881) and not IsQuestFlaggedCompleted(913)) then
		AAPClassic.QH.ZoneNr = "25-26ThousandNeedles"
	end
	--- 26-28 Ashenvale ---
	if (IsQuestFlaggedCompleted(913) and not IsQuestFlaggedCompleted(1196)) then
		AAPClassic.QH.ZoneNr = "26-28Ashenvale"
	end
	--- 28-30 Thousand Needles & Hillsbrad Foothills ---
	if (IsQuestFlaggedCompleted(1196) and not IsQuestFlaggedCompleted(655)) then
		AAPClassic.QH.ZoneNr = "28-30TN-Hillsbrad"
	end
	--- 30 Arathi Highlands to Stranglethorn Vale ---
	if (IsQuestFlaggedCompleted(655) and not IsQuestFlaggedCompleted(583)) then
		AAPClassic.QH.ZoneNr = "30-Arathi-STV"
	end
	--- 30-32 Stranglethorn Vale & Thousand Needles ---
	if (IsQuestFlaggedCompleted(583) and not IsQuestFlaggedCompleted(1145)) then
		AAPClassic.QH.ZoneNr = "30-32STV-TN"
	end
	--- 32-34 Desolace ---
	if (IsQuestFlaggedCompleted(1145) and not IsQuestFlaggedCompleted(1180)) then
		AAPClassic.QH.ZoneNr = "32-34Desolace"
	end
	--- 34-37 ---
	if (IsQuestFlaggedCompleted(1180) and not IsQuestFlaggedCompleted(545)) then
		AAPClassic.QH.ZoneNr = "34-37"
	end
	--- 37-40 ---
	if (IsQuestFlaggedCompleted(545) and not IsQuestFlaggedCompleted(1106)) then
		AAPClassic.QH.ZoneNr = "37-40"
	end

	if (AAPClassic.QuestHelperEnable == "on") then
		AAPClassic.QH.ZoneNr = "QuestHelper"
	end
	if (OldMapID ~= AAPClassic.QH.ZoneNr) then
		--print("New Zone: "..AAPClassic.QH.ZoneNr)
		if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] = {}
		end
		if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		end
		if (AAPClassic.QuestHelperEnable == "on") then
			AAPClassic.QH.ZoneNr = "QuestHelper"
		end
	end
end

function AAPClassic.QH.UpdateMapIdAlly()
	AAPClassic.Level = UnitLevel("player")
	local OldMapID = AAPClassic.QH.ZoneNr
	AAPClassic.QH.ZoneNr = C_Map.GetBestMapForUnit("player")
	local currentMapId, TOP_MOST = C_Map.GetBestMapForUnit('player'), true
	if (Enum and Enum.UIMapType and Enum.UIMapType.Continent and currentMapId) then
		AAPClassic.QH.ZoneNr = MapUtil.GetMapParentInfo(currentMapId, Enum.UIMapType.Continent+1, TOP_MOST)
	end
	if (AAPClassic.QH.ZoneNr and AAPClassic.QH.ZoneNr["mapID"]) then
		AAPClassic.QH.ZoneNr = AAPClassic.QH.ZoneNr["mapID"]
	else
		AAPClassic.QH.ZoneNr = C_Map.GetBestMapForUnit("player")
	end
	if (not AAPClassic.QH.ZoneNr) then
		return
	end
	AAPClassic.OldZoneId = AAPClassic.QH.ZoneNr
	AAPClassic.QH.ZoneNr = AAPClassic.QH.ZoneNr


	---- test
	if (AAPClassic.QuestHelperEnable == "on") then
		AAPClassic.QH.ZoneNr = "QuestHelper"
	end

---------------------------------- NightElf Starts ---------------------
	if (not IsQuestFlaggedCompleted(3524) and AAPClassic.Race == "NightElf" and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "1-12NightElf-Warrior"
	elseif (not IsQuestFlaggedCompleted(3524) and AAPClassic.Race == "NightElf" and AAPClassic.Class[3] == 3) then
		AAPClassic.QH.ZoneNr = "1-12NightElf-Hunter"
	elseif (not IsQuestFlaggedCompleted(3524) and AAPClassic.Race == "NightElf" and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "1-12NightElf-Rogue"
	elseif (not IsQuestFlaggedCompleted(3524) and AAPClassic.Race == "NightElf" and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "1-12NightElf-Priest"
	elseif (not IsQuestFlaggedCompleted(3524) and AAPClassic.Race == "NightElf" and AAPClassic.Class[3] == 11) then
		AAPClassic.QH.ZoneNr = "1-12NightElf-Druid"
	end
---------------------------------- NightElf Ends ---------------------


---------------------------------- Dwarf and Gnome Starts ---------------------
	if (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Warrior"
	elseif (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 2) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Paladin"
	elseif (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 3) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Hunter"
	elseif (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Rogue"
	elseif (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Priest"
	elseif (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 8) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Mage"
	elseif (not IsQuestFlaggedCompleted(2160) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 9) then
		AAPClassic.QH.ZoneNr = "1-6DwarfGnome-Warlock"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Warrior"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 2) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Paladin"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 3) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Hunter"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Rogue"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Priest"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 8) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Mage"
	elseif (not IsQuestFlaggedCompleted(3524) and (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") and AAPClassic.Class[3] == 9) then
		AAPClassic.QH.ZoneNr = "6-12DwarfGnome-Warlock"
	end
---------------------------------- Dwarf and Gnome Ends ---------------------

---------------------------------- Human Starts ---------------------
	--- Elwynn Forest (Human) Start Area
	if (not IsQuestFlaggedCompleted(2158) and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "1-5Human-Warrior"
	elseif (not IsQuestFlaggedCompleted(2158) and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 2) then
		AAPClassic.QH.ZoneNr = "1-5Human-Paladin"
	elseif (not IsQuestFlaggedCompleted(2158) and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "1-5Human-Rogue"
	elseif (not IsQuestFlaggedCompleted(2158) and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "1-5Human-Priest"
	elseif (not IsQuestFlaggedCompleted(2158) and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 8) then
		AAPClassic.QH.ZoneNr = "1-5Human-Mage"
	elseif (not IsQuestFlaggedCompleted(2158) and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 9) then
		AAPClassic.QH.ZoneNr = "1-5Human-Warlock"
	elseif (not IsQuestFlaggedCompleted(224) and not AAPClassic.QuestList[224] and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 1) then
		AAPClassic.QH.ZoneNr = "5-12Human-Warrior"
	elseif (not IsQuestFlaggedCompleted(224) and not AAPClassic.QuestList[224] and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 2) then
		AAPClassic.QH.ZoneNr = "5-12Human-Paladin"
	elseif (not IsQuestFlaggedCompleted(224) and not AAPClassic.QuestList[224] and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 4) then
		AAPClassic.QH.ZoneNr = "5-12Human-Rogue"
	elseif (not IsQuestFlaggedCompleted(224) and not AAPClassic.QuestList[224] and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 5) then
		AAPClassic.QH.ZoneNr = "5-12Human-Priest"
	elseif (not IsQuestFlaggedCompleted(224) and not AAPClassic.QuestList[224] and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 8) then
		AAPClassic.QH.ZoneNr = "5-12Human-Mage"
	elseif (not IsQuestFlaggedCompleted(224) and not AAPClassic.QuestList[224] and (AAPClassic.Race == "Human") and AAPClassic.Class[3] == 9) then
		AAPClassic.QH.ZoneNr = "5-12Human-Warlock"
	elseif (not IsQuestFlaggedCompleted(3524) and (IsQuestFlaggedCompleted(224) or AAPClassic.QuestList[224]) and (AAPClassic.Race == "Human")) then
		AAPClassic.QH.ZoneNr = "12-13Human-LochModan-Darkshore"
	end
---------------------------------- Human Ends ---------------------

	--- 12-17 Darkshore ---
	if (IsQuestFlaggedCompleted(3524) and (not IsQuestFlaggedCompleted(1138) or not IsQuestFlaggedCompleted(4727) or not IsQuestFlaggedCompleted(2139) or not IsQuestFlaggedCompleted(4763))) then
		AAPClassic.QH.ZoneNr = "12-17Darkshore"
	end
	--- 17 NightElf - Darkshore to Loch Modan Run ---
	if (not IsQuestFlaggedCompleted(307) and not AAPClassic.QuestList[307] and IsQuestFlaggedCompleted(1138) and IsQuestFlaggedCompleted(4727) and IsQuestFlaggedCompleted(2139) and IsQuestFlaggedCompleted(4763) and AAPClassic.Race == "NightElf") then
		AAPClassic.QH.ZoneNr = "17-NightElf-WetlandsRun"
	end
	--- 17-18 NightElf - Loch Modan ---
	if (not IsQuestFlaggedCompleted(301) and (IsQuestFlaggedCompleted(307) or AAPClassic.QuestList[307]) and AAPClassic.Race == "NightElf") then
		AAPClassic.QH.ZoneNr = "17-18NightElf-LochModan"
	end
	--- 17-18 Human - Darkshore to Loch Modan and Loch Modan ---
	if (not IsQuestFlaggedCompleted(301) and IsQuestFlaggedCompleted(1138) and IsQuestFlaggedCompleted(4727) and IsQuestFlaggedCompleted(2139) and IsQuestFlaggedCompleted(4763) and (AAPClassic.Race == "Human" or AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome")) then
		AAPClassic.QH.ZoneNr = "17-18HumanDwarfGnome-LochModan"
	end
	--- 18 Ironforge to Redridge Mountains Human ---
	if (IsQuestFlaggedCompleted(301) and not IsQuestFlaggedCompleted(127) and not AAPClassic.QuestList[127] and AAPClassic.Race == "Human") then
		AAPClassic.QH.ZoneNr = "18-Human-IronforgeRedridge"
	end
	--- 18 Ironforge to Redridge Mountains NightElf Dwarf Gnome ---
	if (IsQuestFlaggedCompleted(301) and not IsQuestFlaggedCompleted(127) and not AAPClassic.QuestList[127] and (AAPClassic.Race == "NightElf" or AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome")) then
		AAPClassic.QH.ZoneNr = "18-NightElfDwarfGnome-IronforgeRedridge"
	end
	--- 18-20 Redridge Mountains ---
	if ((AAPClassic.QuestList[127] or IsQuestFlaggedCompleted(127)) and (not IsQuestFlaggedCompleted(89) or not IsQuestFlaggedCompleted(150))) then
		AAPClassic.QH.ZoneNr = "18-20RedridgeMountains"
	end
	--- 20 Redridge Mountains to Darkshore ---
	if (IsQuestFlaggedCompleted(89) and IsQuestFlaggedCompleted(150) and not IsQuestFlaggedCompleted(729)) then
		AAPClassic.QH.ZoneNr = "20-RedridgeDarkshore"
	end
	--- 20-21 Darkshore ---
	if (IsQuestFlaggedCompleted(729) and not IsQuestFlaggedCompleted(967)) then
		AAPClassic.QH.ZoneNr = "20-21Darkshore"
	end
	--- 21-22 Ashenvale and Stonetalon ---
	if (IsQuestFlaggedCompleted(967) and (not IsQuestFlaggedCompleted(1056) and not IsQuestFlaggedCompleted(1071))) then
		AAPClassic.QH.ZoneNr = "21-22AshenvaleStonetalon"
	end
	--- 22-24 Darkshore ---
	if (IsQuestFlaggedCompleted(1056) and not IsQuestFlaggedCompleted(993)) then
		AAPClassic.QH.ZoneNr = "22-24Darkshore"
	end
	--- 24 Ashenvale ---
	if (IsQuestFlaggedCompleted(993) and not IsQuestFlaggedCompleted(279) and not AAPClassic.QuestList[279]) then
		AAPClassic.QH.ZoneNr = "24-Ashenvale"
	end
	--- 24-27 Wetlands ---
	if ((IsQuestFlaggedCompleted(279) or AAPClassic.QuestList[279]) and not IsQuestFlaggedCompleted(1072)) then
		AAPClassic.QH.ZoneNr = "24-27Wetlands"
	end
	--- 27-28 Redridge Mountains ---
	if (IsQuestFlaggedCompleted(1072) and not IsQuestFlaggedCompleted(128)) then
		AAPClassic.QH.ZoneNr = "27-28RedridgeMountains"
	end
	--- 28-30 Duskwood ---
	if (IsQuestFlaggedCompleted(128) and not IsQuestFlaggedCompleted(1241)) then
		AAPClassic.QH.ZoneNr = "28-30Duskwood"
	end
	--- 30 Ashenvale ---
	if (IsQuestFlaggedCompleted(1241) and not IsQuestFlaggedCompleted(1140)) then
		AAPClassic.QH.ZoneNr = "30-Ashenvale"
	end
	--- 30-31 Wetlands ---
	if (IsQuestFlaggedCompleted(1140) and not IsQuestFlaggedCompleted(634)) then
		AAPClassic.QH.ZoneNr = "30-31Wetlands"
	end
	--- 31-32 Hillsbrad Foothills ---
	if (IsQuestFlaggedCompleted(634) and not IsQuestFlaggedCompleted(564)) then
		AAPClassic.QH.ZoneNr = "31-32HillsbradFoothills"
	end
	--- 32 Run About ---
	if (IsQuestFlaggedCompleted(564) and not IsQuestFlaggedCompleted(98)) then
		AAPClassic.QH.ZoneNr = "32-RunAbout"
	end
	--- 32-33 Stranglethorn Vale ---
	if (IsQuestFlaggedCompleted(98) and not IsQuestFlaggedCompleted(1179)) then
		AAPClassic.QH.ZoneNr = "32-33StranglethornVale"
	end
	--- 33-34 Thousand Needles ---
	if (IsQuestFlaggedCompleted(1179) and not IsQuestFlaggedCompleted(1454) and not AAPClassic.QuestList[1454]) then
		AAPClassic.QH.ZoneNr = "33-34Thousand Needles"
	end
	--- 34-36 Desolace ---
	if ((IsQuestFlaggedCompleted(1454) or AAPClassic.QuestList[1454]) and not IsQuestFlaggedCompleted(1178)) then
		AAPClassic.QH.ZoneNr = "34-36Desolace"
	end
	--- 36-37 Stranglethorn Vale ---
	if (IsQuestFlaggedCompleted(1178) and not IsQuestFlaggedCompleted(1457)) then
		AAPClassic.QH.ZoneNr = "36-37StranglethornVale"
	end
	--- 37 AlteracMountains ---
	if (IsQuestFlaggedCompleted(1457) and not IsQuestFlaggedCompleted(690)) then
		AAPClassic.QH.ZoneNr = "37-AlteracMountains"
	end
	--- 37-38 ArathiHighlands ---
	if (IsQuestFlaggedCompleted(690) and not IsQuestFlaggedCompleted(1260)) then
		AAPClassic.QH.ZoneNr = "37-38ArathiHighlands"
	end
	--- 38-39 DustwallowMarsh ---
	if (IsQuestFlaggedCompleted(1260) and not IsQuestFlaggedCompleted(1115)) then
		AAPClassic.QH.ZoneNr = "38-39DustwallowMarsh"
	end
	--- 39-40 StranglethornVale ---
	if (IsQuestFlaggedCompleted(1115)) then
		AAPClassic.QH.ZoneNr = "39-40StranglethornVale"
	end




	if (AAPClassic.ExploreEnable == "on") then
		if (AAPClassic.Race == "Human") then
			AAPClassic.QH.ZoneNr = "1-5Explorer"
		end
		if (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") then
			AAPClassic.QH.ZoneNr = "1-5Explorer2"
		end
	end
	if (AAPClassic.QuestHelperEnable == "on") then
		AAPClassic.QH.ZoneNr = "QuestHelper"
	end
	if (OldMapID ~= AAPClassic.QH.ZoneNr) then
		--print("New Zone: "..AAPClassic.QH.ZoneNr)
		if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] = {}
		end
		if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		end
		if (AAPClassic.QuestHelperEnable == "on") then
			AAPClassic.QH.ZoneNr = "QuestHelper"
		end
	end

end
function AAPClassic.QH.REprintzQuestList()
	AAPClassic.Path["QuestHelper"][1]["Done"]=nil
	AAPClassic.Path["QuestHelper"][1]["Qpart"]=nil
	local i = 1
	while GetQuestLogTitle(i) do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, TQid = GetQuestLogTitle(i)
		if (not isHeader and TQid > 0) then
			if (isComplete == true or isComplete == 1) then
				isComplete = 1
			else
				isComplete = 0
			end
			if (isComplete == 0) then
				local numObjectives = GetNumQuestLeaderBoards(SelectQuestLogEntry(i))
				if (numObjectives and numObjectives > 0) then
					if (not AAPClassic.Path["QuestHelper"][1]["Qpart"]) then
						AAPClassic.Path["QuestHelper"][1]["Qpart"] = {}
					end
					for h=1, numObjectives do
						if (not AAPClassic.Path["QuestHelper"][1]["Qpart"][TQid]) then
							AAPClassic.Path["QuestHelper"][1]["Qpart"][TQid] = {}
						end
						AAPClassic.Path["QuestHelper"][1]["Qpart"][TQid][tostring(h)] = tostring(h)
					end
				end
			else
				if (not AAPClassic.Path["QuestHelper"][1]["Done"]) then
					AAPClassic.Path["QuestHelper"][1]["Done"] = {}
				end
				tinsert(AAPClassic.Path["QuestHelper"][1]["Done"], TQid)
				if (AAPClassic["quests"][TQid] and AAPClassic["quests"][TQid]["end"] and AAPClassic["quests"][TQid]["end"]["U"] and AAPClassic["quests"][TQid]["end"]["U"][1]) then
					local unitz = AAPClassic["quests"][TQid]["end"]["U"][1]
					if (AAPClassic["units"][unitz] and AAPClassic["units"][unitz]["coords"] and AAPClassic["units"][unitz]["coords"][1]) then
						local px = AAPClassic["units"][unitz]["coords"][1][1] / 100
						local py = AAPClassic["units"][unitz]["coords"][1][2] / 100
						local pz = AAPClassic["TranslateZones"][AAPClassic["units"][unitz]["coords"][1][3]]
						if (pz and pz == C_Map.GetBestMapForUnit("player")) then
							AAPClassic.AddQuestHandinIcon(tonumber(pz), tonumber(px), tonumber(py))
						end
					end
				end

			end
		end
		i = i + 1
	end
end
function AAPClassic.QH.ExploreDone()
	print("AAP: Exploration Finnished!")
	AAPClassic.ExploreEnable = "off"
	AAPClassic.QH.BookingList.UpdateMapId = 1
	AAPClassic.QH.FuncLoopNumber = 1
end
function AAPClassic.QH.LeaveQuest(QuestIDs)
	local tempa = 0
	for j=1, GetNumQuestLogEntries() do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(j)
		if (QuestIDs == questID and not isHeader) then
			SelectQuestLogEntry(j)
			SetAbandonQuest()
			tempa = 1
		end
	end
	if (tempa == 1) then
		AbandonQuest()
	end
end
function AAPClassic.QH.FunctionLoop()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	if (AAPClassic.QH.ZoneNr == "QuestHelper" and AAPClassic.QuestHelperEnable == "on") then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		CurStep = 1
	end
	--print("AAPClassic.QH.FunctionLoop()")
	AAPClassic.QH.BookingList.HideButton = 1
	local letthru = 0
	if (AAPClassic and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["ClassSpecific"] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["ClassSpecific"] ~= AAPClassic.Class[3]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
		letthru = 1
	end
	if (letthru == 0 and AAPClassic and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
		if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["PickUp"]) then
			--print("PickUp Step:"..CurStep)
			AAPClassic.QH.BookingList.PickUp = 1
			AAPClassic.ReupdateQlistTimer:Play()
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["ExploreDone"]) then
			AAPClassic.QH.ExploreDone()
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["QaskPopup"]) then
			AAPClassic.QH.BookingList.QaskPop = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Qpart"]) then
			--print("Qpart Step:"..CurStep)
			AAPClassic.QH.BookingList.Qpart = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Explore"]) then
			AAPClassic.QH.BookingList.Explore = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Done"]) then
			--print("Done Step:"..CurStep)
			AAPClassic.QH.BookingList.Done = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["SetHS"]) then
			--print("SetHS Step:"..CurStep)
			AAPClassic.QH.BookingList.SetHS = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["UseHS"]) then
			--print("UseHS Step:"..CurStep)
			AAPClassic.QH.BookingList.UseHS = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Treasure"]) then
			--print("Treasure Step:"..CurStep)
			AAPClassic.QH.BookingList.Treasure = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["CRange"]) then
			--print("CRange Step:"..CurStep)
			AAPClassic.QH.BookingList.CRange = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["GetFP"]) then
			AAPClassic.QH.BookingList.GetFP = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["UseFlightPath"]) then
			--print("UseFP Step:"..CurStep)
			AAPClassic.QH.BookingList.UseFP = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["DropQuest"]) then
			--print("DropQuest Step:"..CurStep)
			AAPClassic.QH.BookingList.DropQ = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["ExtraQpart"]) then
			AAPClassic.QH.BookingList.ExtraQ = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["LearnCooking"]) then
			AAPClassic.QH.BookingList.LearnCooking = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["TrainAbilitys"]) then
			AAPClassic.QH.BookingList.TrainAbilitys = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Cookingupdate"]) then
			AAPClassic.QH.BookingList.Cookingupdate = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Grind"]) then
			AAPClassic.QH.BookingList.Grind = 1
		elseif (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["UpdMapID"]) then
			AAPClassic.QH.BookingList.UpdateMapId = 1
		end

	end
end
function AAPClassic.QH.QHQueFunction()
	if (AAPClassic.QH.BookingList.OpenedSettings) then
	elseif (AAPClassic.QH.BookingList.CompleteQuest) then
		CompleteQuest()
		AAPClassic.QH.BookingList.CompleteQuest = nil
	elseif (AAPClassic.QH.BookingList.GetQuestReward) then
		GetQuestReward(AAPClassic.QH.BookingList.GetQuestReward)
		AAPClassic.QH.BookingList.GetQuestReward = nil
	elseif (AAPClassic.QH.BookingList.AcceptQuest) then
		AcceptQuest()
		AAPClassic.QH.BookingList.AcceptQuest = nil
	elseif (AAPClassic.QH.BookingList.UpdateMapId) then
		AAPClassic.QH.UpdateMapId()
		AAPClassic.QH.FuncLoopNumber = 1
		AAPClassic.QH.BookingList.UpdateMapId = nil
	elseif (AAPClassic.QH.BookingList.AddQuest) then
		for AAPC_index,AAPC_value in pairs(AAPClassic.QH.BookingList.AddQuest) do
			AAPClassic.QH.QuestAccepted(AAPC_value, AAPC_index)
			--print("Added: "..AAPC_index)
		end
		AAPClassic.QH.BookingList.AddQuest = nil
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAPClassic.QH.BookingList.RemoveQuest) then
		for AAPC_index,AAPC_value in pairs(AAPClassic.QH.BookingList.RemoveQuest) do
			AAPClassic.QH.QuestRemoved(AAPC_index)
			--print("Removed: "..AAPC_index)
		end
		AAPClassic.QH.BookingList.RemoveQuest = nil
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAPClassic.QH.BookingList.UpdateQuestList) then
		AAPClassic.QH.UpdateQuestList()

		AAPClassic.QH.BookingList.UpdateQuestList = nil
	elseif (AAPClassic.QH.BookingList.PickUp) then
		AAPClassic.QF.PickUp()
		AAPClassic.QH.BookingList.PickUp = nil
	elseif (AAPClassic.QH.BookingList.QaskPop) then
		AAPClassic.QF.GroupQuestFrame()
		AAPClassic.QH.BookingList.QaskPop = nil
	elseif (AAPClassic.QH.BookingList.Qpart) then
		AAPClassic.QF.Qpart()
		AAPClassic.QH.BookingList.Qpart = nil
	elseif (AAPClassic.QH.BookingList.Explore) then
		AAPClassic.QF.Explore()
		AAPClassic.QH.BookingList.Explore = nil
	elseif (AAPClassic.QH.BookingList.Done) then
		AAPClassic.QF.Done()
		AAPClassic.QH.BookingList.Done = nil
	elseif (AAPClassic.QH.BookingList.SetHS) then
		AAPClassic.QF.SetHS()
		AAPClassic.QH.BookingList.SetHS = nil
	elseif (AAPClassic.QH.BookingList.UseHS) then
		AAPClassic.QF.UseHS()
		AAPClassic.QH.BookingList.UseHS = nil
	elseif (AAPClassic.QH.BookingList.Treasure) then
		AAPClassic.QF.Treasure()
		AAPClassic.QH.BookingList.Treasure = nil
	elseif (AAPClassic.QH.BookingList.CRange) then
		AAPClassic.QF.CRange()
		AAPClassic.QH.BookingList.CRange = nil
	elseif (AAPClassic.QH.BookingList.GetFP) then
		AAPClassic.QF.GetFP()
		AAPClassic.QH.BookingList.GetFP = nil
	elseif (AAPClassic.QH.BookingList.UseFP) then
		AAPClassic.QF.UseFP()
		AAPClassic.QH.BookingList.UseFP = nil
	elseif (AAPClassic.QH.BookingList.DropQ) then
		AAPClassic.QF.DropQ()
		AAPClassic.QH.BookingList.DropQ = nil
	elseif (AAPClassic.QH.BookingList.ExtraQ) then
		AAPClassic.QF.ExtraQ()
		AAPClassic.QH.BookingList.ExtraQ = nil
	elseif (AAPClassic.QH.BookingList.Grind) then
		AAPClassic.QF.Grind()
		AAPClassic.QH.BookingList.Grind = nil
	elseif (AAPClassic.QH.BookingList.LearnCooking) then
		AAPClassic.QF.LearnCooking()
		AAPClassic.QH.BookingList.LearnCooking = nil
	elseif (AAPClassic.QH.BookingList.UseTaxiFunc) then
		AAPClassic.UseTaxiFunc()
		AAPClassic.QH.BookingList.UseTaxiFunc = nil
	elseif (AAPClassic.QH.BookingList.TrainAbilitys) then
		AAPClassic.QF.TrainAbilitys()
		AAPClassic.QH.BookingList.TrainAbilitys = nil
	elseif (AAPClassic.QH.BookingList.Cookingupdate) then
		AAPClassic.QF.Cookingupdate()
		AAPClassic.QH.BookingList.Cookingupdate = nil
	elseif (AAPClassic.QH.BookingList.SetQPTT) then
		AAPClassic.SetQPTT()
		AAPClassic.QH.BookingList.SetQPTT = nil
	elseif (AAPClassic.QH.BookingList.ReprintList) then
		AAPClassic.QLF.ReprintList()
		AAPClassic.QH.BookingList.ReprintList = nil
	elseif (AAPClassic.QH.BookingList.TestTaxiFlying) then
		if (UnitOnTaxi("player")) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				local Step
				if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
					Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
				end
				if (Step and Step["UseFlightPath"]) then
					AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
					AAPClassic.QH.FuncLoopNumber = 1
				end
			end
			AAPClassic.QH.BookingList.TestTaxiFlying = nil
		end
	elseif (AAPClassic.QH.BookingList.HideButton) then
		if (not InCombatLockdown()) then
			AAPClassic.QL.QButtonFrame:Hide()
			AAPClassic.QH.BookingList.HideButton = nil
		end
	elseif (AAPClassic.QH.BookingList.ShowButton) then
		if (not InCombatLockdown()) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				local Step
				if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
					Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
				end
				if (AAPClassic.QH.BookingList.ShowButton == "HS") then
					AAPClassic.QLF.SetButton(AAPClassic.QH.BookingList.ShowButton,"HS")
				elseif (Step and Step["SpecialButton"]) then
					AAPClassic.QLF.SetButton(AAPClassic.QH.BookingList.ShowButton,Step["SpecialButton"])
				else
					AAPClassic.QLF.SetButton(AAPClassic.QH.BookingList.ShowButton)
				end
			end
			AAPClassic.QH.BookingList.ShowButton = nil
		end
	elseif (AAPClassic.QH.FuncLoopNumber) then
		AAPClassic.QH.FuncLoopNumber = nil
		AAPClassic.QH.FunctionLoop()
		AAPClassic.QH.BookingList.ReprintList = 1
	elseif (AAPClassic.QH.ListDBOnMap) then
		AAPClassic.ListDBOnMap()
		AAPClassic.QH.ListDBOnMap = nil
	elseif (AAPClassic.QH.REprintzQuestListz) then
		AAPClassic.QH.REprintzQuestList()
		AAPClassic.QH.REprintzQuestListz = nil
	elseif (AAPClassic.QH.Qitemdropped) then
		if (not InCombatLockdown()) then
			UseItemByName(AAPClassic.QH.Qitemdropped)
			AAPClassic.QH.Qitemdropped = nil
		end
	end
end
function AAPClassic.QH.QuestAccepted(TLogIndex, TQid)
	AAPClassic.QH.BookingList.UpdateQuestList = 1
	AAPClassic.QH.FuncLoopNumber = 1
end
function AAPClassic.QH.QuestRemoved(TQid)
		if (AAPClassic.ShowedDB[TQid]) then
			for AAP_index2,AAP_value2 in pairs(AAPClassic.ShowedDB[TQid]) do
				if (AAPClassic.ShowedDB[TQid] and AAPClassic.ShowedDB[TQid][AAP_index2]) then
					for AAP_index,AAP_value in pairs(AAPClassic.ShowedDB[TQid][AAP_index2]) do
						if (AAPClassic.Icons[AAP_index].A == 1) then
							AAPClassic.Icons[AAP_index].A = 0
							AAPClassic.Icons[AAP_index].P = 0
							AAPClassic.Icons[AAP_index].D = 0
							AAPClassic.Tooltips[AAP_index] = "NoTooltip"
							AAPClassic.Tooltips2[AAP_index] = "NoTooltip"
							AAPClassic.HBDP:RemoveMinimapIcon("AAPClassic", AAPClassic.Icons[AAP_index])
						end
						if (AAPClassic.MapIcons[AAP_index].A == 1) then
							AAPClassic.MapIcons[AAP_index].A = 0
							AAPClassic.MapIcons[AAP_index].P = 0
							AAPClassic.MapIcons[AAP_index].D = 0
							AAPClassic.TooltipsMap[AAP_index] = "NoTooltip"
							AAPClassic.TooltipsMap2[AAP_index] = "NoTooltip"
							AAPClassic.HBDP:RemoveWorldMapIcon("AAPClassicMap", AAPClassic.MapIcons[AAP_index])
						end
					end
				end
			end
			AAPClassic.ShowedDB[TQid] = nil
		end
	AAPClassic.QuestList[TQid] = nil
end
function AAPClassic.CheckCRangeText()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step
	if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
		Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	else
		return
	end
	local i = 1
	while i  <= 15 do
		CurStep = CurStep + 1
		Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		if (Step and Step["GetFP"]) then
			local Derp2 = "Get Flightpath"
			return Derp2
		elseif (Step and Step["Explore"]) then
			local Derp2 = "Explore Trigger"
			return Derp2
		elseif (Step and Step["UseFlightPath"]) then
			local Derp2 = "Use Flightpath"
			return Derp2
		elseif (Step and Step["PickUp"]) then
			local Derp2 = "Accept Quest"
			local mz = C_Map.GetBestMapForUnit("player")
			local px, py = AAPClassic.GetPlayerMapPos(mz, Step["TT"]["y"], Step["TT"]["x"])
			AAPClassic.AddQuestPickUpIcon(mz, px, py)
			return Derp2
		elseif (Step and Step["Done"]) then
			local Derp2 = "Turn in Quest"
			local mz = C_Map.GetBestMapForUnit("player")
			local px, py = AAPClassic.GetPlayerMapPos(mz, Step["TT"]["y"], Step["TT"]["x"])
			AAPClassic.AddQuestHandinIcon(mz, px, py)
			return Derp2
		elseif (Step and Step["Qpart"]) then
			local Derp2 = "Complete Quest"
			return Derp2
		elseif (Step and Step["SetHS"]) then
			local Derp2 = "Set Hearthstone"
			return Derp2
		elseif (Step and Step["QpartPart"]) then
			local Derp2 = "Complete Quest"
			return Derp2
		elseif (Step and Step["Grind"]) then
			local Derp2 = "Grind xp"
			return Derp2
		elseif (Step and Step["LearnCooking"]) then
			local Derp2 = "Learn Cooking"
			return Derp2
		elseif (Step and Step["TrainAbilitys"]) then
			local Derp2 = "Train Abilitys"
			return Derp2
		elseif (Step and Step["ExtraQpart"]) then
			local Derp2 = "Complete Quest"
			return Derp2
		end

		i = i + 1
	end
	local Derp2 = "Travel to"
	return Derp2
end
function AAPClassic.QH.UpdateQuestList()
	--print("AAPClassic.QH.UpdateQuestList")
	if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] = {}
	end
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step
	if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
		Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	end
	if (AAPClassic.QH.ZoneNr == "QuestHelper" and AAPClassic.QuestHelperEnable == "on") then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		CurStep = 1
		AAPClassic.QH.REprintzQuestListz = 1
	end
	local i = 1
	while GetQuestLogTitle(i) do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, TQid = GetQuestLogTitle(i)
		if (not isHeader and TQid > 0) then
			if (isComplete == true or isComplete == 1) then
				isComplete = 1
			else
				isComplete = 0
			end
			if (not AAPClassic.QuestList[TQid]) then
				AAPClassic.QuestList[TQid] = {}
			end
			local numObjectives = GetNumQuestLeaderBoards(SelectQuestLogEntry(i))
			AAPClassic.QuestList[TQid]["title"] = title
			AAPClassic.QuestList[TQid]["level"] = level
			if (numObjectives == 0) then
				isComplete = 1
			end
			AAPClassic.QuestList[TQid]["isComplete"] = isComplete
			AAPClassic.QuestList[TQid]["numObjectives"] = numObjectives
			if (numObjectives and numObjectives > 0) then
				if (not AAPClassic.QuestList[TQid]["Objectives"]) then
					AAPClassic.QuestList[TQid]["Objectives"] = {}
				end
				for h=1, numObjectives do
					local text, type, finished = GetQuestLogLeaderBoard(h, SelectQuestLogEntry(i))
					if (finished == true) then
						finished = 1
					else
						finished = 0
					end
					local cont = 0
					if (not AAPClassic.QuestList[TQid]["Objectives"][h]) then
						AAPClassic.QuestList[TQid]["Objectives"][h] = {}
						cont = 1
					end
					if (cont == 1 and finished == 0) then
						if (Step and Step["Qpart"] and Step["Qpart"][TQid] and Step["Qpart"][TQid][tostring(h)]) then
							AAPClassic.QuestDBcheck(TQid, tonumber(h), text)
						end
					end
					if (not AAPClassic.QuestList[TQid]["Objectives"][h]["text"] and finished == 0) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["text"] = text
					elseif (AAPClassic.QuestList[TQid]["Objectives"][h]["text"] ~= text and finished == 0) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["text"] = text
						AAPClassic.QH.FuncLoopNumber = 1
					end
					if (AAPClassic.QuestList[TQid]["Objectives"][h]["text"] and finished == 1) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["text"] = nil
					end
					if (not AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"]) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"] = finished
					elseif (AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"] ~= finished) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"] = finished
						if (AAPClassic.ShowedDB[TQid] and AAPClassic.ShowedDB[TQid][h]) then
							for AAP_index,AAP_value in pairs(AAPClassic.ActiveMobIds) do
								if (AAPClassic.ActiveMobIds[AAP_index] == TQid.."-"..h) then
									AAPClassic.ActiveMobIds[AAP_index] = nil
								end
							end
							for AAP_index,AAP_value in pairs(AAPClassic.ShowedDB[TQid][h]) do
								AAPClassic.Icons[AAP_index].A = 0
								AAPClassic.Icons[AAP_index].P = 0
								AAPClassic.Icons[AAP_index].D = 0
								AAPClassic.Tooltips[AAP_index] = "NoTooltip"
								AAPClassic.Tooltips2[AAP_index] = "NoTooltip"
								AAPClassic.HBDP:RemoveMinimapIcon("AAPClassic", AAPClassic.Icons[AAP_index])
								AAPClassic.MapIcons[AAP_index].A = 0
								AAPClassic.MapIcons[AAP_index].P = 0
								AAPClassic.MapIcons[AAP_index].D = 0
								AAPClassic.TooltipsMap[AAP_index] = "NoTooltip"
								AAPClassic.TooltipsMap2[AAP_index] = "NoTooltip"
								AAPClassic.HBDP:RemoveWorldMapIcon("AAPClassicMap", AAPClassic.MapIcons[AAP_index])
							end
							AAPClassic.ShowedDB[TQid][h] = nil
						end

						AAPClassic.QH.FuncLoopNumber = 1
					end
				end
			end
		end
		i = i + 1
	end

end
function AAPClassic.QH.UpdateQuestList2()
	--print("AAPClassic.QH.UpdateQuestList")
	local i = 1
	while GetQuestLogTitle(i) do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, TQid = GetQuestLogTitle(i)
		if (not isHeader and TQid > 0) then
			if (isComplete == true or isComplete == 1) then
				isComplete = 1
			else
				isComplete = 0
			end
			if (not AAPClassic.QuestList[TQid]) then
				AAPClassic.QuestList[TQid] = {}
			end
			local numObjectives = GetNumQuestLeaderBoards(SelectQuestLogEntry(i))
			AAPClassic.QuestList[TQid]["title"] = title
			AAPClassic.QuestList[TQid]["level"] = level
			if (numObjectives == 0) then
				isComplete = 1
			end
			AAPClassic.QuestList[TQid]["isComplete"] = isComplete
			AAPClassic.QuestList[TQid]["numObjectives"] = numObjectives
			if (numObjectives and numObjectives > 0) then
				if (not AAPClassic.QuestList[TQid]["Objectives"]) then
					AAPClassic.QuestList[TQid]["Objectives"] = {}
				end
				for h=1, numObjectives do
					local text, type, finished = GetQuestLogLeaderBoard(h, SelectQuestLogEntry(i))
					if (finished == true) then
						finished = 1
					else
						finished = 0
					end
					local cont = 0
					if (not AAPClassic.QuestList[TQid]["Objectives"][h]) then
						AAPClassic.QuestList[TQid]["Objectives"][h] = {}
						cont = 1
					end
					if (cont == 1 and finished == 0) then
						AAPClassic.QuestDBcheck(TQid, tonumber(h), text)
					end
					if (not AAPClassic.QuestList[TQid]["Objectives"][h]["text"] and finished == 0) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["text"] = text
					elseif (AAPClassic.QuestList[TQid]["Objectives"][h]["text"] ~= text and finished == 0) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["text"] = text
						AAPClassic.QH.FuncLoopNumber = 1
					end
					if (AAPClassic.QuestList[TQid]["Objectives"][h]["text"] and finished == 1) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["text"] = nil
					end
					if (not AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"]) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"] = finished
					elseif (AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"] ~= finished) then
						AAPClassic.QuestList[TQid]["Objectives"][h]["isComplete"] = finished

						--AAPClassic.ShowedDB[TQid][h]

						AAPClassic.QH.FuncLoopNumber = 1
					end
				end
			end
		end
		i = i + 1
	end
end
function AAPClassic.TaxiSearchFunc(AAPMrX, AAPMrY)
	AAPMrX = floor(AAPMrX + 0.5)
	AAPMrY = floor(AAPMrY + 0.5)
	local CLi
	for CLi = 1, NumTaxiNodes() do
		if (TaxiNodeGetType(CLi) == "REACHABLE") then
			local aapx,aapy = TaxiNodePosition(CLi)
			aapx = floor((floor(aapx * 1000)/10)+0.5)
			aapy = floor((floor(aapy * 1000)/10)+0.5)
			if (tonumber(AAPMrX) == tonumber(aapx) and tonumber(AAPMrY) == tonumber(aapy)) then
				return CLi
			end
		end
	end
end
function AAPClassic.UseTaxiFunc()
	if (not AAPClassic.QH.ZoneNr or not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
		return
	end
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step
	if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
		Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	else
		return
	end
	if (Step and Step["ETA"]) then
		AAPClassic.AFK_Timer(Step["ETA"])
	end
	if (GetLocale() == "enUS") then
		local CLi
		for CLi = 1, NumTaxiNodes() do
			local aapx,aapy = TaxiNodePosition(CLi)
			aapx = (floor(aapx * 1000)/10)
			aapy = (floor(aapy * 1000)/10)
			if (TaxiNodeGetType(CLi) == "REACHABLE") then
				if (not AAPClassic.FPs) then
					AAPClassic.FPs = {}
				end
				if (not AAPClassic.FPs[AAPClassic.Faction]) then
					AAPClassic.FPs[AAPClassic.Faction] = {}
				end
				if (not AAPClassic.FPs[AAPClassic.Faction][AAPClassic.getContinent()]) then
					AAPClassic.FPs[AAPClassic.Faction][AAPClassic.getContinent()] = {}
				end
				if (not AAPClassic.FPs[AAPClassic.Faction][AAPClassic.getContinent()][TaxiNodeName(CLi)]) then
					AAPClassic.FPs[AAPClassic.Faction][AAPClassic.getContinent()][TaxiNodeName(CLi)] = {}
				end
				AAPClassic.FPs[AAPClassic.Faction][AAPClassic.getContinent()][TaxiNodeName(CLi)]["x"] = aapx
				AAPClassic.FPs[AAPClassic.Faction][AAPClassic.getContinent()][TaxiNodeName(CLi)]["y"] = aapy
			end
		end
		local TName = Step["Name"]
		local TContonent = AAPClassic.getContinent()
		local Nodetotake, TX, TY
		if (AAPClassic and AAPClassic.FPs and AAPClassic.FPs[AAPClassic.Faction] and AAPClassic.FPs[AAPClassic.Faction][TContonent] and AAPClassic.FPs[AAPClassic.Faction][TContonent][TName] and AAPClassic.FPs[AAPClassic.Faction][TContonent][TName]["x"]) then
			TX = AAPClassic.FPs[AAPClassic.Faction][TContonent][TName]["x"]
			TY = AAPClassic.FPs[AAPClassic.Faction][TContonent][TName]["y"]
			Nodetotake = AAPClassic.TaxiSearchFunc(TX, TY)
		end
		if (Nodetotake and GetNumRoutes(Nodetotake) > 1) then
			TaxiNodeOnButtonEnter(getglobal("TaxiButton"..Nodetotake))
		end
		if (Nodetotake) then
			TakeTaxiNode(Nodetotake)
			AAPClassic.QH.BookingList.TestTaxiFlying = 1
		else
			print("AAP - Error - Flightpath not found - (didn't use the addon from start? run there)")
		end
	end
end
function testskin()

end
function AAPClassic.CheckNamePlate()
	local AAP_curKids = WorldFrame:GetNumChildren()
	local i
	AAP_numKids = AAP_curKids
	AAP_PlateList = nil
	AAP_PlateList = {}
	for i = 1, AAP_curKids do
		local AAP_frame = select(i, WorldFrame:GetChildren())
		if (AAP_frame:GetName() and AAP_frame:GetName():find("NamePlate%d") and not AAP_frame.AAP_Skinned) then
			AAP_frame.AAP_Skinned = 1
			AAP_frame.AAPIcon = CreateFrame("Frame",nil,AAP_frame)
			AAP_frame.AAPIcon:SetFrameStrata("HIGH")
			AAP_frame.AAPIcon:SetWidth(25)
			AAP_frame.AAPIcon:SetHeight(25)
			local t = 	AAP_frame.AAPIcon:CreateTexture(nil,"HIGH")
			t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\pickup.tga")
			t:SetAllPoints(AAP_frame.AAPIcon)
			AAP_frame.AAPIcon.texture = t
			AAP_frame.AAPIcon:SetPoint("BOTTOM", AAP_frame, "TOP",0,0)
		end
		if (AAP_frame["UnitFrame"] and AAP_frame["UnitFrame"]["displayedUnit"]) then
			if (AAPClassic.ActiveMobIds[AAP_frame["UnitFrame"]["name"]:GetText()]) then
				AAP_frame.AAPIcon:Show()
			else
				AAP_frame.AAPIcon:Hide()
			end
		end

	--	if (AAP_frame:GetName() and AAP_frame:GetName():find("NamePlate%d")) then
	--		local loweredd = strlower(AAP_frame:GetName())
	--		local zemobid = AAPClassic.CheckNamePlates[loweredd]
	--		if (AAPClassic.ActiveMobIds[zemobid]) then
	--			AAP_frame.AAPIcon:Show()
	--			print("show:"..loweredd)
	--		else
	--			AAP_frame.AAPIcon:Hide()
	--		end
	--	end
	end
end
AAPClassic.QH.LoopBooking = CreateFrame("frame")
AAPClassic.QH.LoopBooking:SetScript("OnUpdate", AAPClassic.QH.QHQueFunction)

AAPClassic.QH.EventFrame = CreateFrame("Frame")
AAPClassic.QH.EventFrame:RegisterEvent ("ADDON_LOADED")
AAPClassic.QH.EventFrame:RegisterEvent("QUEST_REMOVED")
AAPClassic.QH.EventFrame:RegisterEvent("QUEST_ACCEPTED")
AAPClassic.QH.EventFrame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
AAPClassic.QH.EventFrame:RegisterEvent ("ZONE_CHANGED")
AAPClassic.QH.EventFrame:RegisterEvent ("ZONE_CHANGED_NEW_AREA")
AAPClassic.QH.EventFrame:RegisterEvent ("UPDATE_MOUSEOVER_UNIT")
AAPClassic.QH.EventFrame:RegisterEvent ("GOSSIP_SHOW")
AAPClassic.QH.EventFrame:RegisterEvent ("QUEST_DETAIL")
AAPClassic.QH.EventFrame:RegisterEvent ("QUEST_PROGRESS")
AAPClassic.QH.EventFrame:RegisterEvent ("QUEST_COMPLETE")
AAPClassic.QH.EventFrame:RegisterEvent ("QUEST_GREETING")
AAPClassic.QH.EventFrame:RegisterEvent ("QUEST_PROGRESS")
AAPClassic.QH.EventFrame:RegisterEvent ("HEARTHSTONE_BOUND")
AAPClassic.QH.EventFrame:RegisterEvent ("CHAT_MSG_COMBAT_XP_GAIN")
AAPClassic.QH.EventFrame:RegisterEvent ("UNIT_SPELLCAST_SUCCEEDED")
AAPClassic.QH.EventFrame:RegisterEvent ("CHAT_MSG_SKILL")
AAPClassic.QH.EventFrame:RegisterEvent ("LEARNED_SPELL_IN_TAB")
AAPClassic.QH.EventFrame:RegisterEvent ("CHAT_MSG_LOOT")
AAPClassic.QH.EventFrame:RegisterEvent ("TAXIMAP_OPENED")
AAPClassic.QH.EventFrame:RegisterEvent ("UI_INFO_MESSAGE")
--AAPClassic.QH.EventFrame:RegisterEvent ("TRADE_SKILL_UPDATE")
AAPClassic.QH.EventFrame:RegisterEvent ("NAME_PLATE_UNIT_ADDED")
AAPClassic.QH.EventFrame:RegisterEvent ("NAME_PLATE_UNIT_REMOVED")
AAPClassic.QH.EventFrame:RegisterEvent ("PLAYER_TARGET_CHANGED")


AAPClassic.QH.EventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "AAP-Classic") then
			AAPClassic.QH.BookingList.UpdateQuestList = 1
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	elseif (event=="TAXIMAP_OPENED") then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step
		if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		else
			return
		end
		if (Step and Step["GetFP"] and not IsControlKeyDown()) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
			AAPClassic.QH.FuncLoopNumber = 1
		elseif (Step and Step["UseFlightPath"] and not IsControlKeyDown()) then
			AAPClassic.QH.BookingList.UseTaxiFunc = 1
		end
	elseif (event=="ZONE_CHANGED") then
		AAPClassic.QH.BookingList.UpdateMapId = 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (event=="ZONE_CHANGED_NEW_AREA") then
		AAPClassic.QH.BookingList.UpdateMapId = 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (event=="QUEST_REMOVED") then
		local arg1, arg2, arg3, arg4 = ...;
		--print("-------------------")
		--print("Removed - Qid: "..arg1)
		--print("-------------------")
		if (not AAPClassic.QH.BookingList.RemoveQuest) then
			AAPClassic.QH.BookingList.RemoveQuest = {}
		end
		if (AAPClassic.NotRepeatList[arg1]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"][arg1] = 1
		end
		AAPClassic.QH.BookingList.RemoveQuest[arg1] = 1
	elseif (event=="QUEST_ACCEPTED") then
		local arg1, arg2, arg3, arg4 = ...;
		--print("Accepted - QlogIndex: "..arg1)
		--print("-------------------")
		--print("Accepted - Qid: "..arg2)
		--print("-------------------")
		if (not AAPClassic.QH.BookingList.AddQuest) then
			AAPClassic.QH.BookingList.AddQuest = {}
		end
		AAPClassic.QH.BookingList.AddQuest[arg2] = arg1
	elseif (event=="UNIT_QUEST_LOG_CHANGED") then
		local arg1, arg2, arg3, arg4 = ...;
		if (arg1 == "player") then
			--print("UNIT_QUEST_LOG_CHANGED")
			--print("-------------------")
			AAPClassic.QH.BookingList.UpdateQuestList = 1
		end

	elseif (event=="PLAYER_TARGET_CHANGED") then
		if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			if (CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				local guid = UnitGUID("target")
				if (guid) then
					local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-",guid)
					local steps = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
					if (steps and steps["RaidIcon"]) then
						if (npc_id and tonumber(steps["RaidIcon"]) == tonumber(npc_id)) then
							if (not GetRaidTargetIndex("target")) then
								SetRaidTarget("target",8)
							end
						end
					end
				end
			end
		end
	elseif (event=="UPDATE_MOUSEOVER_UNIT") then
		if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] and AAPClassic.Path and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			if (CurStep and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				local guid = UnitGUID("mouseover")
				if (guid) then
					local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-",guid)
					local steps = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
					if (guid and UnitName("mouseover")) then
						if (AAPClassic.ActiveMobIds[UnitName("mouseover")]) then
							local Qid, PartNr = strsplit("-",AAPClassic.ActiveMobIds[UnitName("mouseover")])
							if (tonumber(Qid) and tonumber(PartNr) and AAPClassic.ShowedDB[tonumber(Qid)] and AAPClassic.ShowedDB[tonumber(Qid)][tonumber(PartNr)]) then
								for AAP_index,AAP_value in pairs(AAPClassic.ShowedDB[tonumber(Qid)][tonumber(PartNr)]) do
									if (AAPClassic.Tooltips[AAP_value]) then
										GameTooltip:AddLine(AAPClassic.Tooltips[AAP_value], 1, 1, 1)
										local heug = GameTooltip:GetHeight()
										GameTooltip:SetHeight(heug+8)
									end
									break
								end
							end
						end
					end
					if (steps and steps["RaidIcon"]) then
						if (npc_id and tonumber(steps["RaidIcon"]) == tonumber(npc_id)) then
							if (not GetRaidTargetIndex("mouseover")) then
								SetRaidTarget("mouseover",8)
							end
						end
					end
				end
			end
		end
	elseif (event=="UI_INFO_MESSAGE") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == 281) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			local Step
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
			end
			if (Step and Step["GetFP"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
				AAPClassic.QH.FuncLoopNumber = 1
			end
		end
		if (arg1 == 372 and AAPClassic.QH.ZoneNr and AAPClassic.Realm and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			local Step
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
			end
			if (Step and Step["Explore"] and Step["Explore"] == arg2) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
				AAPClassic.QH.FuncLoopNumber = 1
			end
			if (AAPClassic.ExploreEnable == "on") then
				AAPClassic.Explored[arg2] = 1
			end
		end
	elseif (event=="GOSSIP_SHOW") then
		if (UnitGUID("target")) then
			local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-",UnitGUID("target"))
			if (npc_id and tonumber(npc_id) == 3430) then
				return
			end
		end
		if (IsControlKeyDown()) then
			return
		end
		local ActiveQuests = {GetGossipActiveQuests()}
		local ActiveQNr = GetNumGossipActiveQuests()
		local CLi
		local NumAvailableQuests = GetNumGossipAvailableQuests()
		local AvailableQuests = {GetGossipAvailableQuests()}
		if (ActiveQuests and not IsControlKeyDown()) then
			for CLi = 1, ActiveQNr do
				if (ActiveQuests[(((CLi-1) * 6)+4)] == true) then
					SelectGossipActiveQuest(CLi)
				end
			end
		end
		if (NumAvailableQuests > 0 and not IsControlKeyDown()) then
			SelectGossipAvailableQuest(1)
		end
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step
		if (AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		end
		-- Auto Gossip:
		if (Step and Step["Gossip"] and not IsControlKeyDown()) then
			SelectGossipOption(1)
		end
	elseif (event=="QUEST_DETAIL") then
		if (IsControlKeyDown()) then
			return
		end
		AAPClassic.QH.BookingList.AcceptQuest = 1
	elseif (event=="QUEST_PROGRESS") then
		if (IsControlKeyDown()) then
			return
		end
		AAPClassic.QH.BookingList.CompleteQuest = 1
	elseif (event=="QUEST_COMPLETE") then
		if (IsControlKeyDown()) then
			return
		end
		if (GetNumQuestChoices() > 1) then
			--print("AAP - QUEST_COMPLETE - NrChoices: "..GetNumQuestChoices())
			for h=1, GetNumQuestChoices() do
				local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
				itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
				isCraftingReagent = GetItemInfo(GetQuestItemLink("choice", h))
				local ilvl = GetDetailedItemLevelInfo(GetQuestItemLink("choice", h))
				--print("AAP ("..h..") - Item: "..itemLink.." ilvl:"..ilvl)
			end
		else
			AAPClassic.QH.BookingList.GetQuestReward = 1
		end
	elseif (event=="QUEST_GREETING") then
		if (IsControlKeyDown()) then
			return
		end
		local numAvailableQuests = 0;
		local numActiveQuests = 0;
		local lastActiveQuest = 0
		local lastAvailableQuest = 0;
		numAvailableQuests = GetNumAvailableQuests();
		numActiveQuests = GetNumActiveQuests();
		if numAvailableQuests > 0 or numActiveQuests > 0 then
			local guid = UnitGUID("target");
			if lastNPC ~= guid then
				lastActiveQuest = 1;
				lastAvailableQuest = 1;
				lastNPC = guid;
			end
			if (lastAvailableQuest > numAvailableQuests) then
				lastAvailableQuest = 1;
			end
			for i = lastAvailableQuest, numAvailableQuests do
				lastAvailableQuest = i;
				if (not IsControlKeyDown()) then
					SelectAvailableQuest(i);
				end
			end
		end
		if lastActiveQuest > numActiveQuests then
			lastActiveQuest = 1;
		end
		local CLi
		for CLi = 1, numActiveQuests do
			for CL_index,CL_value in pairs(AAPClassic.QuestList) do
				if (GetActiveTitle(CLi) == AAPClassic.QuestList[CL_index]["title"] and AAPClassic.QuestList[CL_index]["isComplete"] == 1) then
					SelectActiveQuest(CLi)
				end
			end
		end
	elseif (event=="CHAT_MSG_COMBAT_XP_GAIN") then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			local Step
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
			end
			if (Step and Step["Grind"]) then
				AAPClassic.QH.BookingList.Grind = 1
			end
		end
	elseif (event=="HEARTHSTONE_BOUND") then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			local Step
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
			end
			if (Step and Step["SetHS"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
				AAPClassic.QH.FuncLoopNumber = 1
			end
		end
	elseif (event=="UNIT_SPELLCAST_SUCCEEDED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "player" and arg3 == 8690) then
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				local Step
				if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
					Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
				end
				if (Step and Step["UseHS"]) then
					AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
					AAPClassic.QH.FuncLoopNumber = 1
				end
			end
		end
	elseif (event=="CHAT_MSG_SKILL") then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step
		if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		end
		if (Step and Step["LearnCooking"]) then
			local guid = UnitGUID("target")
			if (guid) then
				local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-",guid)
				if (npc_id and Step["NpcID"] == tonumber(npc_id)) then
					AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
					AAPClassic.QH.FuncLoopNumber = 1
				end
			end
		end
	elseif (event=="TRADE_SKILL_UPDATE") then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step
		if (AAPClassic.QH.ZoneNr and CurStep and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		end
		if (Step and Step["Cookingupdate"]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	elseif (event=="CHAT_MSG_LOOT") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 and arg5 and arg5 == UnitName("player")) then
			if (string.find(arg1, "item:(%d+):")) then
				local _, _, CL_First = string.find(arg1, "item:(%d+):")
				for AAP_index,AAP_value in pairs(AAPClassic.QStarterList) do
					if (tonumber(CL_First) == AAP_value) then
						local itemName = GetItemInfo(AAP_value)
						AAPClassic.QH.Qitemdropped = itemName
						break
					end
				end
			end
			local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
			local Step
			if (AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
				Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
			end
			if (Step and Step["ExtraQpart"]) then
				AAPClassic.QH.BookingList.ExtraQ = 1
				AAPClassic.CheckQcountTimer:Play()
			end
		end
	elseif (event=="NAME_PLATE_UNIT_ADDED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		local unitGUID = UnitGUID(arg1)
		local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-",unitGUID)
		AAPClassic.CheckNamePlates[arg1] = tonumber(npc_id)
		AAPClassic.CheckNamePlate()
	elseif (event=="NAME_PLATE_UNIT_REMOVED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		AAPClassic.CheckNamePlates[arg1] = nil
	elseif (event=="LEARNED_SPELL_IN_TAB") then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step
		if (AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		end
		if (Step and Step["TrainAbilitys"]) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
		end
	end)