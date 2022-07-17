AAPClassic.QF = {}
if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
function AAPClassic.QF.GroupQuestFrame()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["QaskPopup"]
	local gnr = Step["Group"]
	if (IdList and AAPClassic["questsNames"][IdList]) then
		if (AAPClassic["quests"][IdList] and AAPClassic["quests"][IdList]["lvl"]) then
			AAPClassic.GroupQuestFrameFS1:SetText("["..AAPClassic["quests"][IdList]["lvl"].."] "..AAPClassic["questsNames"][IdList]["T"])
		else
			AAPClassic.GroupQuestFrameFS1:SetText(AAPClassic["questsNames"][IdList])
		end
		AAPClassic.GroupQuestFrameFS2:SetText("Suggested Players: "..gnr)
	end
	AAPClassic.GroupQuestFrame:Show()
end
function AAPClassic.QF.PickUp()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["PickUp"]
	--print("PickUp!")
	local NrLeft = 0
	local Flagged = 0
	local Total = 0
	for h=1, getn(IdList) do
		local theqid = IdList[h]
		Total = Total + 1
		if (not AAPClassic.QuestList[theqid] and C_QuestLog.IsQuestFlaggedCompleted(theqid) == false) then
			NrLeft = NrLeft + 1
		end
		if (C_QuestLog.IsQuestFlaggedCompleted(theqid) or AAPClassic.QuestList[theqid] or (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"][theqid])) then
			Flagged = Flagged + 1
		end
	end
	if (Step["PickUp2"] and (AAPClassic.QuestList[Step["PickUp2"]] or C_QuestLog.IsQuestFlaggedCompleted(Step["PickUp2"]))) then
		Total = Flagged
	end
	if (Total == Flagged) then
		--print("PickUp Done!")
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (Step["GroupTask"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	else
		AAPClassic.QH.BookingList.SetQPTT = 1
		--print("PickUp: "..Flagged.."/"..Total)
	end
	if (Step and Step["Button"]) then
		AAPClassic.QH.BookingList.ShowButton = Step["Button"]
	end
	if (Step["PickUpClass"]) then
		local Class = AAPClassic.Class[3]
		if (Step["PickUpClass"][Class] and Step["PickUpClass"][Class][AAPClassic.Race]) then
			local Questids = Step["PickUpClass"][Class][AAPClassic.Race]["Qid"]
			if (C_QuestLog.IsQuestFlaggedCompleted(Questids) or AAPClassic.QuestList[Questids]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
				AAPClassic.QH.FuncLoopNumber = 1
			end
		end
	end
end
function AAPClassic.QF.Qpart()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["Qpart"]
	local Flagged = 0
	local Total = 0
	local Missing = 0
	if (Step and Step["Button"]) then
		AAPClassic.QH.BookingList.ShowButton = Step["Button"]
	end
	local AAP_index, AAP_value, AAP_index2, AAP_value2
	for AAP_index,AAP_value in pairs(IdList) do
		for AAP_index2,AAP_value2 in pairs(AAP_value) do
			Total = Total + 1
			if (C_QuestLog.IsQuestFlaggedCompleted(AAP_index) or (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"][AAP_index])) then
				Flagged = Flagged + 1
			elseif (AAPClassic.QuestList[AAP_index] and AAPClassic.QuestList[AAP_index]["Objectives"] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)]["isComplete"] == 1) then
				Flagged = Flagged + 1
			elseif (AAPClassic.QuestList[AAP_index] and AAPClassic.QuestList[AAP_index]["Objectives"] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)] and AAPClassic.QuestList[AAP_index]["Objectives"][tonumber(AAP_index2)]) then
			elseif (not AAPClassic.QuestList[AAP_index]) then
				Missing = 1
			end
		end
	end
	AAPClassic.Level = UnitLevel("player")
	if (Step["Qpart2"] and (AAPClassic.QuestList[Step["Qpart2"]] or C_QuestLog.IsQuestFlaggedCompleted(Step["Qpart2"]))) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (Step["AutoSkipLevel"] and AAPClassic.Level >= Step["AutoSkipLevel"]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (Missing == 1) then
--		print("Qpart: Quest Missing!")
	elseif (Total == Flagged) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (Step["GroupTask"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	else
		--print("Qpart "..Flagged.."/"..Total)
		AAPClassic.QH.BookingList.SetQPTT = 1
	end
end
function AAPClassic.QF.Done()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["Done"]
	--print("Done!")
	local Flagged = 0
	local Total = 0
	local Missing = 0
	if (Step and Step["Button"]) then
		AAPClassic.QH.BookingList.ShowButton = Step["Button"]
	end
	for h=1, getn(IdList) do
		local theqid = IdList[h]
		Total = Total + 1
		if (not AAPClassic.QuestList[theqid] and C_QuestLog.IsQuestFlaggedCompleted(theqid) == false) then
			Missing = 1
		end
		if (C_QuestLog.IsQuestFlaggedCompleted(theqid)) then
			Flagged = Flagged + 1
		elseif (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"][theqid]) then
			Flagged = Flagged + 1
		end
	end
	if (Step["Done2"] and (AAPClassic.QuestList[Step["Done2"]] or C_QuestLog.IsQuestFlaggedCompleted(Step["Done2"]))) then
		Total = Flagged
		Missing = 0
	end
	if (Missing == 1) then
		--print("Done: Quest Missing")
	elseif (Total == Flagged) then
		--print("Done Done!")
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (Step["GroupTask"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	if (Step["DoneClass"]) then
		local Class = AAPClassic.Class[3]
		if (Step["DoneClass"][Class] and Step["DoneClass"][Class][AAPClassic.Race]) then
			local Questids = Step["DoneClass"][Class][AAPClassic.Race]["Qid"]
			if (C_QuestLog.IsQuestFlaggedCompleted(Questids)) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
				AAPClassic.QH.FuncLoopNumber = 1
			end
		end
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.SetHS()
	--print("SetHS!")
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["SetHS"]
	if (C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.TrainAbilitys()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["TrainAbilitys"]
	if (C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.LearnCooking()
	--print("Cooking!")
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["LearnCooking"]
	if (C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.Explore()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["Explore"]
	if (AAPClassic.Explored[IdList]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.UseHS()
	--print("UseHS!")
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["UseHS"]
	if (C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	else
		AAPClassic.QH.BookingList.ShowButton = "HS"
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QAskPopWantedAsk(Answer)
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	if (Step["QaskPopup"]) then
		if (Answer == "no") then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]] = 1
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
			AAPClassic.QH.FuncLoopNumber = 1
		else
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]] = nil
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]] = 1
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	end
	AAPClassic.GroupQuestFrame:Hide()
end
function AAPClassic.QF.Treasure()
	--print("Treasure!")
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.Grind()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	AAPClassic.Level = UnitLevel("player")
	AAPClassic.experience = UnitXP("player")
	local IdList = Step["Grind"]
	if ((AAPClassic.Level > Step["level"]) or (AAPClassic.Level == Step["level"] and AAPClassic.experience > Step["xp"])) then
		AAPClassic.XpLine = 0
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAPClassic.XpLine ~= 0) then
		AAPClassic.Level = UnitLevel("player")
		AAPClassic.experience = UnitXP("player")
		local xps = Step["xp"] - AAPClassic.experience
		if (AAPClassic.Level == Step["level"]-1) then
			xps = (UnitXPMax("player")-AAPClassic.experience)+Step["xp"]
		end
		AAPClassic.QL.QuestFrames["FS"..AAPClassic.XpLine]:SetText(xps.." exp to go!")
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.Cookingupdate()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["Cookingupdate"]
	if (IdList and C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.CRange()
	--print("CRange!")
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList
	if (Step) then
		IdList = Step["CRange"]
	end
	if (Step and Step["Button"]) then
		AAPClassic.QH.BookingList.ShowButton = Step["Button"]
	end
	if (IdList and C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (Step and Step["GroupTask"] and AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"][Step["GroupTask"]]) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.GetFP()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["GetFP"]
	if (C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.UseFP()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local IdList = Step["UseFlightPath"]
	if (C_QuestLog.IsQuestFlaggedCompleted(IdList)) then
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	end
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.DropQ()
	--print("DropQ!")
	AAPClassic.QH.BookingList.SetQPTT = 1
end
function AAPClassic.QF.ExtraQ()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	if (Step and Step["Button"]) then
		AAPClassic.QH.BookingList.ShowButton = Step["Button"]
	end
	if (Step) then
		local ammountz = GetItemCount(Step["ItemID"])
		--print(C_QuestLog.IsQuestFlaggedCompleted(Step["Qid"]))
		if ((Step and Step["Qid"] and C_QuestLog.IsQuestFlaggedCompleted(Step["Qid"])) or (Step and ammountz and Step["Ammount"] and ammountz >= Step["Ammount"])) then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
		AAPClassic.QH.BookingList.SetQPTT = 1
	end
end
