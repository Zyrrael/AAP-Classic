AAPClassic.QLF = {}
if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
local LineNumber = 0
AAPClassic.CurZoneQListed = 0
AAPClassic.XpLine = 0
AAPClassic.CurZoneQListedList = {}
function AAPClassic.QLF.ResetList()
	LineNumber = 0
	local CLi
	for CLi = 1, 20 do
		AAPClassic.QL.QuestFrames[CLi]:Hide()
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetText("")
	end

end
function AAPClassic.SetWidthFrames()
	local CLi
	for CLi = 1, 20 do
		if (AAPClassic.QL.QuestFrames[CLi]:IsShown()) then
			local aapwidth = AAPClassic.QL.QuestFrames["FS"..CLi]:GetStringWidth()
			if (aapwidth and aapwidth > 250) then
				AAPClassic.QL.QuestFrames[CLi]:SetWidth(aapwidth+10)
			else
				AAPClassic.QL.QuestFrames[CLi]:SetWidth(250)
			end
		end
	end
end
function AAPClassic.QLF.PrintText(ExtralineText)
	if (LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText(ExtralineText)
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
end
function AAPClassic.QLF.SetButton(ItemIdz, stuck)
	if (stuck and stuck == "HS") then
		local CL_Items, itemLink, clt3, clt4, clt5, clt6, clt7, clt8, clt9, CL_ItemTex = GetItemInfo(6948)
		if (CL_Items and string.sub(CL_Items, 1, 1) and CL_ItemTex) then
			AAPClassic.QL.QButtonFrame["Buttonptex"]:SetTexture(CL_ItemTex)
			AAPClassic.QL.QButtonFrame["Buttonntex"]:SetTexture(CL_ItemTex)
			AAPClassic.QL.QButtonFrame["Button"]:SetNormalTexture(CL_ItemTex)
			AAPClassic.QL.QButtonFrame["Button"]:SetText("")
			AAPClassic.QL.QButtonFrame["Button"]:SetAttribute("type", "item");
			AAPClassic.QL.QButtonFrame["Button"]:SetAttribute("item", "item:"..6948);
			AAPClassic.QL.QButtonFrame["Button"]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR"); GameTooltip:SetItemByID(6948); GameTooltip:Show() end)
			AAPClassic.QL.QButtonFrame["Button"]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			AAPClassic.QL.QButtonFrame:Show()
		end
	elseif (stuck) then
			AAPClassic.QL.QButtonFrame["Buttonptex"]:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1.blp")
			AAPClassic.QL.QButtonFrame["Buttonntex"]:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1.blp")
			AAPClassic.QL.QButtonFrame["Button"]:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1.blp")
			AAPClassic.QL.QButtonFrame["Button"]:SetText("")
			AAPClassic.QL.QButtonFrame["Button"]:SetAttribute("type", "macro")
			AAPClassic.QL.QButtonFrame["Button"]:SetAttribute("macrotext", "/target "..stuck)
			AAPClassic.QL.QButtonFrame["Button"]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR"); GameTooltip:SetText("Target "..stuck.."!", 1, 1, 1,  1, true); GameTooltip:Show() end)
			AAPClassic.QL.QButtonFrame["Button"]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			AAPClassic.QL.QButtonFrame:Show()
	else
		local CL_Items, itemLink, clt3, clt4, clt5, clt6, clt7, clt8, clt9, CL_ItemTex = GetItemInfo(ItemIdz)
		if (CL_Items and string.sub(CL_Items, 1, 1) and CL_ItemTex) then
			AAPClassic.QL.QButtonFrame["Buttonptex"]:SetTexture(CL_ItemTex)
			AAPClassic.QL.QButtonFrame["Buttonntex"]:SetTexture(CL_ItemTex)
			AAPClassic.QL.QButtonFrame["Button"]:SetNormalTexture(CL_ItemTex)
			AAPClassic.QL.QButtonFrame["Button"]:SetText("")
			AAPClassic.QL.QButtonFrame["Button"]:SetAttribute("type", "item");
			AAPClassic.QL.QButtonFrame["Button"]:SetAttribute("item", "item:"..ItemIdz);
			AAPClassic.QL.QButtonFrame["Button"]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR"); GameTooltip:SetItemByID(ItemIdz); GameTooltip:Show() end)
			AAPClassic.QL.QButtonFrame["Button"]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			AAPClassic.QL.QButtonFrame:Show()
		end
	end
	

end
function AAPClassic.QLF.QuestText(Step)
	AAPClassic.RemoveQuestIcons()
	if (AAPClassic.QuestHelperEnable ~= "on") then
		--AAPClassic.RemoveIcons()
		AAPClassic.CheckShowedDBz()
	--AAPClassic.RemoveMapIcons()
	end
	if (Step["LeaveQuests"]) then
		for AAP_index,AAP_value in pairs(Step["LeaveQuests"]) do
			AAPClassic.QH.LeaveQuest(AAP_value)
		end
	end
	if (Step["PickUp"]) then
		AAPClassic.AddQuestPickUpIconFunc()
		local IdList = Step["PickUp"]
		for AAP_index,AAP_value in pairs(IdList) do
			if (IsQuestFlaggedCompleted(AAP_value) == false and LineNumber ~= 20) then
				LineNumber = LineNumber + 1
				if (AAPClassic["questsNames"][AAP_value] and AAPClassic["questsNames"][AAP_value]["T"]) then
					AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Pick up: "..AAPClassic["questsNames"][AAP_value]["T"])
				else
					AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Pick up: "..AAP_value)
				end
					AAPClassic.QL.QuestFrames[LineNumber]:Show()
			end
		end
		if (Step["ShowMobsOnMap"]) then
			AAPClassic.QuestDBShowMob(Step["ShowMobsOnMap"],Step["ShowMobsOnMap2"],Step["ShowMobsOnMap3"])
		end
	end
	if (Step["Explore"]) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText(Step["Explore"])
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
	if (Step["Qpart"]) then
		local IdList = Step["Qpart"]
		local Missing
		local AAP_index, AAP_value, AAP_index2, AAP_value2
		for AAP_index,AAP_value in pairs(IdList) do
			local qidnbs = AAP_index
			if (Step["Qpart2"] and AAPClassic.QuestList[Step["Qpart2"]]) then
				qidnbs = Step["Qpart2"]
			end
			if (not AAPClassic.QuestList[qidnbs]) then
				if (Step["Qpart2"] and AAPClassic.QuestList[Step["Qpart2"]]) then
				else
					if (not Missing) then
						Missing = qidnbs
					else
						Missing = qidnbs..", "..Missing
					end
				end
			end
			for AAP_index2,AAP_value2 in pairs(AAP_value) do
				local Indnumb = AAP_index2
				if (IsQuestFlaggedCompleted(qidnbs)) then
				elseif (AAPClassic.QuestList[qidnbs] and AAPClassic.QuestList[qidnbs]["Objectives"] and AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)] and AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)]["isComplete"] == 1) then
				elseif (LineNumber ~= 20 and AAPClassic.QuestList[qidnbs] and AAPClassic.QuestList[qidnbs]["Objectives"] and AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)] and AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)] and AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)]["text"]) then
					LineNumber = LineNumber + 1
					AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText(AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)]["text"])
					AAPClassic.QL.QuestFrames[LineNumber]:Show()
					if (AAPClassic.QuestHelperEnable ~= "on") then
						--if (not AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(nmb)]["Listed"]) then
						AAPClassic.QuestDBcheck(qidnbs, tonumber(Indnumb), AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(Indnumb)]["text"])
						--	AAPClassic.QuestList[qidnbs]["Objectives"][tonumber(nmb)]["Listed"] = 1
						--end
					end
				end
			end
		end
		if (Step["ShowMobsOnMap"]) then
			AAPClassic.QuestDBShowMob(Step["ShowMobsOnMap"],Step["ShowMobsOnMap2"],Step["ShowMobsOnMap3"])
		end
		if (Step["ShowObjectOnMap"]) then
			AAPClassic.QuestDBShowObj(Step["ShowObjectOnMap"], Step["ExtraQpart"],Step["ShowObjectOnMap2"],Step["ShowObjectOnMap3"])
		end
		if (Missing and LineNumber ~= 20) then
			LineNumber = LineNumber + 1
			AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Quests Missing: "..Missing)
			AAPClassic.QL.QuestFrames[LineNumber]:Show()
		end
	end
	if (Step["DoneClass"]) then
		local IdList = Step["DoneClass"]
		local Class = AAPClassic.Class[3]
		if (Step["DoneClass"][Class] and LineNumber ~= 20 and Step["DoneClass"][Class][AAPClassic.Race] and Step["DoneClass"][Class][AAPClassic.Race]["Qid"]) then
			local qidz = Step["DoneClass"][Class][AAPClassic.Race]["Qid"]
			LineNumber = LineNumber + 1
			if (AAPClassic.QuestList[qidz]) then
				AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Hand in: "..AAPClassic.QuestList[qidz]["title"])
				AAPClassic.QL.QuestFrames[LineNumber]:Show()
			end
		end
	end
	if (Step["Done"]) then
		AAPClassic.AddQuestHandinIconFunc()
		local IdList = Step["Done"]
		local Missing
		for AAP_index,AAP_value in pairs(IdList) do
			local Derpster = AAP_value
			if (Step["Done2"] and AAPClassic.QuestList[Step["Done2"]]) then
				Derpster = Step["Done2"]
			end
			if (AAPClassic.QuestList[Derpster] and LineNumber ~= 20) then
				LineNumber = LineNumber + 1
				--print(LineNumber)
				AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Hand in: "..AAPClassic.QuestList[Derpster]["title"])
				AAPClassic.QL.QuestFrames[LineNumber]:Show()
			end
			if (not AAPClassic.QuestList[Derpster] and not IsQuestFlaggedCompleted(Derpster)) then
				Missing = Derpster
			end
		end
		if (Missing and LineNumber ~= 20) then
			LineNumber = LineNumber + 1
			if (AAPClassic["questsNames"][Missing] and AAPClassic["questsNames"][Missing]["T"]) then
				AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Quests Missing: "..AAPClassic["questsNames"][Missing]["T"].." ("..Missing..")")
				AAPClassic.QL.QuestFrames[LineNumber]:Show()
			else
				AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Quests Missing: "..Missing)
				AAPClassic.QL.QuestFrames[LineNumber]:Show()
			end
		end
	end
	if (Step["CRange"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Run to Waypoint ("..AAPClassic.CheckCRangeText()..")")
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
	if (Step["SetHS"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Set Hearthstone")
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
	if (Step["UseFlightPath"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Use Flightpath: "..Step["Name"])
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
	if (Step["GetFP"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Get Flightpath")
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
	if (Step["UseHS"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Use Hearthstone")
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
	end
	if (Step["ExtraQpart"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText(Step["ExtraQpart"].." "..GetItemCount(Step["ItemID"]).."/"..Step["Ammount"])
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
		if (Step["ItemID"] and Step["ExtraLine"] and Step["ItemID2"] and Step["ItemID3"]) then
			AAPClassic.ItemDBcheck(Step["ItemID"], Step["ExtraLine"],Step["ItemID2"],Step["ItemID3"])
		elseif (Step["ItemID"] and Step["ExtraLine"] and Step["Qid"]) then
			AAPClassic.ItemDBcheck(Step["ItemID"], Step["ExtraLine"],Step["Qid"],1)
		end
		if (Step["ShowObjectOnMap"]) then
			AAPClassic.QuestDBShowObj(Step["ShowObjectOnMap"], Step["ExtraQpart"],Step["ShowObjectOnMap2"],Step["ShowObjectOnMap3"])
		end
	end
	if (Step["Grind"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Grind Mobs to "..Step["xp"].."xp into lvl"..Step["level"])
		AAPClassic.QL.QuestFrames[LineNumber]:Show()
		
		AAPClassic.Level = UnitLevel("player")
		AAPClassic.experience = UnitXP("player")
		if (AAPClassic.Level == Step["level"] or AAPClassic.Level == Step["level"]-1) then
			local xps = Step["xp"] - AAPClassic.experience
			if (AAPClassic.Level == Step["level"]-1) then
				xps = (UnitXPMax("player")-AAPClassic.experience)+Step["xp"]
			end
			LineNumber = LineNumber + 1
			AAPClassic.XpLine = LineNumber
			AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText(xps.." exp to go!")
			AAPClassic.QL.QuestFrames[LineNumber]:Show()
		end
		if (Step["ShowMobsOnMap"]) then
			AAPClassic.QuestDBShowMob(Step["ShowMobsOnMap"],Step["ShowMobsOnMap2"],Step["ShowMobsOnMap3"])
		end
	end
	if (Step["LearnCooking"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		if (Step["Skinning"]) then
			AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Learn Skinning (for cash)!")
			AAPClassic.QL.QuestFrames[LineNumber]:Show()
		else
			AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Learn Cooking!")
			AAPClassic.QL.QuestFrames[LineNumber]:Show()
		end
	end
	if (Step["TrainAbilitys"] and LineNumber ~= 20) then
		LineNumber = LineNumber + 1
		AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText("Train abilitys at Class Trainer!")
		AAPClassic.QL.QuestFrames[LineNumber]:Show()

	end
end
function AAPClassic.QLF.FillerText(TheFillers)
	for AAP_index,AAP_value in pairs(TheFillers) do
		for AAP_index2,AAP_value2 in pairs(AAP_value) do
				if (IsQuestFlaggedCompleted(AAP_index)) then
				elseif (AAPClassic.QuestList[AAP_index] and AAPClassic.QuestList[AAP_index]["Objectives"] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)]["isComplete"] == 1) then
				elseif (AAPClassic.QuestList[AAP_index] and AAPClassic.QuestList[AAP_index]["Objectives"] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)]["text"] and LineNumber ~= 20) then
					LineNumber = LineNumber + 1
					AAPClassic.QL.QuestFrames["FS"..LineNumber]:SetText(AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)]["text"])
					AAPClassic.QL.QuestFrames[LineNumber]:Show()
					AAPClassic.QuestDBcheck(AAP_index, tonumber(AAP_index2), AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)]["text"], "Filler")
				end
		end
	end
end




function AAPClassic.QLF.ReprintList()
	--print("AAPClassic.QLF.ReprintList()")
	if (AAPClassic.QH.ZoneNr and AAPC1 and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]) then
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		if (CurStep and AAPClassic.Path and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
			local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
			AAPClassic.QLF.ResetList()
			if (Step["ExtraLine"]) then
				AAPClassic.QLF.PrintText(Step["ExtraLine"])
			end
			if (Step["ExtraLine2"]) then
				AAPClassic.QLF.PrintText(Step["ExtraLine2"])
			end
			if (Step["ExtraLine3"]) then
				AAPClassic.QLF.PrintText(Step["ExtraLine3"])
			end
			AAPClassic.QLF.QuestText(Step)
			if (Step["Fillers"]) then
				AAPClassic.QLF.FillerText(Step["Fillers"])
			end
			AAPClassic.SetWidthFrames()
		end
	end
end