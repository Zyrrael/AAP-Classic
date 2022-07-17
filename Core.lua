AAPClassic = {}
AAPClassic.Explored = {}
AAPClassic.Build = GetBuildInfo()
if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	print("AAP-Classic - Error - This is not Classic! Not Loading")
	--return
end
AAPClassic.Name = UnitName("player")
AAPClassic.Realm = string.gsub(GetRealmName(), " ", "")
AAPClassic.Faction = UnitFactionGroup("player")
AAPClassic.Level = UnitLevel("player")
AAPClassic.experience = UnitXP("player")
AAPClassic.Version = tonumber(GetAddOnMetadata("AAP-Classic", "Version"))
AAPClassic.Class = {}
AAPClassic.RaceLocale, AAPClassic.Race = UnitRace("player")
AAPClassic.Class[1],AAPClassic.Class[2],AAPClassic.Class[3] = UnitClass("player")
AAPClassic.QuestHelperEnable = "off"
AAPClassic.HBDP = LibStub("HereBeDragons-Pins-2.0")
AAPClassic.HBD = LibStub("HereBeDragons-2.0")
AAPClassic.Locale = GetLocale()
AAPClassic.NotRepeatList = {
	[813] = 813,
}
AAPClassic.ClassDBConv = {
	[1] = 1,
	[2] = 2,
	[3] = 4,
	[4] = 8,
	[5] = 16,
	[6] = 6,
	[7] = 64,
	[8] = 128,
	[9] = 256,
	[10] = 10,
	[11] = 1024,
	[12] = 12,
}
AAPClassic.QStarterList = {
	1972,
	1307,
	1971,
	5352,
	4881,
	4891,
	16305,
	16304,
	16303,
}
function AAPClassic.getContinent()
    local mapID = C_Map.GetBestMapForUnit("player")
    if(mapID) then
        local info = C_Map.GetMapInfo(mapID)
        if(info) then
            while(info['mapType'] and info['mapType'] > 2) do
                info = C_Map.GetMapInfo(info['parentMapID'])
            end
            if(info['mapType'] == 2) then
                return info['mapID']
            end
        end
    end
end
local function AAP_SlashCmd(AAP_index)
	if (AAP_index == "reset") then
		print("AAP: Resetting Zone.")
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		if (AAPClassic.Path[AAPClassic.QH.ZoneNr] == nil or AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep] == nil) then
			print("AAP: Unhandled state of quests and zones.");
			return
		end
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAP_index == "skip") then
		print("AAP: Skipping QuestStep.")
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		if (AAPClassic.Path[AAPClassic.QH.ZoneNr] == nil or AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep] == nil) then
			print("AAP: Cannot skip QuestStep.")
			return
		end
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAP_index == "helper") then
		if (AAPClassic.QuestHelperEnable == "off") then
			print("AAP: Route OFF, Helper ON!")
			AAPClassic.QuestHelperEnable = "on"
			AAPClassic.RemoveIcons()
			AAPClassic.QuestList = nil
			AAPClassic.QuestList = {}
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
			AAPClassic.QH.BookingList.UpdateQuestList = 1
			AAPClassic.QH.REprintzQuestList()
		else
			print("AAP: Route ON, Helper OFF!")
			AAPClassic.QuestHelperEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	elseif (AAP_index == "explore") then
		if (AAPClassic.ExploreEnable and AAPClassic.ExploreEnable == "on" and AAPClassic.Race == "Human") then
			print("AAP: Human Exploration OFF!")
			AAPClassic.ExploreEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		elseif (AAPClassic.Race == "Human") then
			print("AAP: Human Exploration ON!")
			AAPClassic.ExploreEnable = "on"
			AAPClassic.QuestHelperEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
		if (AAPClassic.ExploreEnable and AAPClassic.ExploreEnable == "on" and  (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome")) then
			print("AAP: Dwarf&Gnome Exploration OFF!")
			AAPClassic.ExploreEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		elseif (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") then
			print("AAP: Dwarf&Gnome Exploration ON!")
			AAPClassic.ExploreEnable = "on"
			AAPClassic.QuestHelperEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	else

	end
end
AAPClassic.EventFrame = CreateFrame("Frame")
AAPClassic.EventFrame:RegisterEvent ("ADDON_LOADED")

AAPClassic.EventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "AAP-Classic") then
			if (not AAPC1) then
				AAPC1 = {}
			end
			if (not AAPC1[AAPClassic.Realm]) then
				AAPC1[AAPClassic.Realm] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] = {}
			end
			SlashCmdList["AAP_Cmd"] = AAP_SlashCmd
			SLASH_AAP_Cmd1 = "/aap"
			AAPClassic.ReupdateQlistTimer = AAPClassic.EventFrame:CreateAnimationGroup()
			AAPClassic.ReupdateQlistTimer.anim = AAPClassic.ReupdateQlistTimer:CreateAnimation()
			AAPClassic.ReupdateQlistTimer.anim:SetDuration(5)
			AAPClassic.ReupdateQlistTimer:SetLooping("REPEAT")
			AAPClassic.ReupdateQlistTimer:SetScript("OnLoop", function(self, event, ...)
				AAPClassic.QH.BookingList.UpdateQuestList = 1
				AAPClassic.ReupdateQlistTimer:Stop()
			end)
			AAPClassic.CheckQcountTimer = AAPClassic.EventFrame:CreateAnimationGroup()
			AAPClassic.CheckQcountTimer.anim = AAPClassic.CheckQcountTimer:CreateAnimation()
			AAPClassic.CheckQcountTimer.anim:SetDuration(2)
			AAPClassic.CheckQcountTimer:SetLooping("REPEAT")
			AAPClassic.CheckQcountTimer:SetScript("OnLoop", function(self, event, ...)
				AAPClassic.QH.BookingList.ExtraQ = 1
				AAPClassic.CheckQcountTimer:Stop()
			end)
		end
	end
end)
