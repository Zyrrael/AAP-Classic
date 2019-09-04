if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
AAPClassic.ShowedDB = {}
AAPClassic.DB = {}
AAPClassic.TooltipsMapDB = {}
AAPClassic.TooltipsMapDBPlace = {}
AAPClassic.TooltipsList = {}

function AAPClassic.CheckShowedDBz()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local Remoced = 0
	for AAP_index,AAP_value in pairs(AAPClassic.ShowedDB) do
		for AAP_index2,AAP_value2 in pairs(AAPClassic.ShowedDB[AAP_index]) do
			if (Step["Qpart"] and Step["Qpart"][AAP_index] and Step["Qpart"][AAP_index][tostring(AAP_index2)]) then
			elseif (Step["Fillers"] and Step["Fillers"][AAP_index] and Step["Fillers"][AAP_index][tostring(AAP_index2)]) then
			else
				Remoced = 1
			end
		end
	end
	if (Remoced == 1) then
		AAPClassic.RemoveIcons()
	end
end

function AAPClassic.ItemDBcheck(Itemid, Tooltipz,Qid,PartNr)
	if (AAPClassic["items"][Itemid]) then
		if (AAPClassic["items"][Itemid]["U"]) then
			local Mobs = AAPClassic["items"][Itemid]["U"]
			for AAP_index,AAP_value in pairs(Mobs) do
				if (AAPClassic["units"][AAP_index] and AAPClassic["units"][AAP_index]["coords"]) then
					local coords = AAPClassic["units"][AAP_index]["coords"]
					for AAP_index2,AAP_value2 in pairs(coords) do
						local x = coords[AAP_index2][1] / 100
						local y = coords[AAP_index2][2] / 100
						local z = coords[AAP_index2][3]
						local mz = C_Map.GetBestMapForUnit("player")
						if (AAPClassic["TranslateZones"][z] == mz) then
							Coloridz = AAP_index
							if (AAPClassic["unitsNames"][AAP_index] and Qid and PartNr) then
								AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][AAP_index]] = Qid.."-"..PartNr
							end
							local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz)
							AAPClassic.Tooltips[numberfortool] = Tooltipz
							if (not AAPClassic.TooltipsList[AAP_index]) then
								AAPClassic.TooltipsList[AAP_index] = {}
							end
							if (PartNr and Qid and not AAPClassic.TooltipsList[AAP_index][Qid.."-"..PartNr]) then
								AAPClassic.TooltipsList[AAP_index][Qid.."-"..PartNr] = Qid.."-"..PartNr
							end
							local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz)
							AAPClassic.TooltipsMap[numberfortool2] = Tooltipz
						end
					end
				end
			end
		end
	end
end
function AAPClassic.ListDBOnMap()
	local CurZoneID = C_Map.GetBestMapForUnit("player")
	local currentMapId, TOP_MOST = C_Map.GetBestMapForUnit('player'), true
	if (Enum and Enum.UIMapType and Enum.UIMapType.Continent and currentMapId) then
		CurZoneID = MapUtil.GetMapParentInfo(currentMapId, Enum.UIMapType.Continent+1, TOP_MOST)
	end
	if (CurZoneID and CurZoneID["mapID"]) then
		CurZoneID = CurZoneID["mapID"]
	else
		CurZoneID = C_Map.GetBestMapForUnit("player")
	end
	AAPClassic.Level = UnitLevel("player")
	local AllyZeRace = {
		[1] = "Human",
		[2] = "Orc",
		[4] = "Dwarf",
		[8] = "NightElf",
		[77] = "Ally",
		[255] = "Both",
	}
	local HordeZeRace = {
		[16] = "Scourge",
		[32] = "Tauren",
		[64] = "Gnome",
		[128] = "Troll",
		[178] = "Horde",
		[255] = "Both",
	}
	if (AAPClassic.CurZoneQListed ~= CurZoneID or not AAPClassic.CurZoneQListedList) then
		AAPClassic.PreListDBOnMap(CurZoneID)
		AAPClassic.CurZoneQListed = CurZoneID
	end
	local derpcount = 0
	for AAP_index2,AAP_value2 in pairs(AAPClassic.CurZoneQListedList) do
		local CurQuest = AAPClassic["quests"][AAP_index2]
		if (not IsQuestFlaggedCompleted(AAP_index2) and not AAPClassic.QuestList[AAP_index2] and CurQuest["min"] and CurQuest["lvl"] and ((AAPClassic.Level-7) < CurQuest["lvl"]) and AAPClassic.Level >= CurQuest["min"] and CurQuest["min"] > 1) then
			if (UnitFactionGroup("player") == "Alliance") then
				local Continue = 0
				
				if (CurQuest["race"] and AllyZeRace[CurQuest["race"]]) then
					Continue = 1
				elseif (CurQuest["race"] and HordeZeRace[CurQuest["race"]]) then
					Continue = 0
				else
					Continue = 1
				end
				if (Continue == 1) then
					if ((not CurQuest["pre"] or IsQuestFlaggedCompleted(CurQuest["pre"])) and (not CurQuest["class"] or CurQuest["class"] == AAPClassic.ClassDBConv[AAPClassic.Class[3]])) then
						if (CurQuest["start"] and CurQuest["start"]["U"]) then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["U"]) do
								local unitid = CurQuest["start"]["U"][AAP_a1]
								if (AAPClassic["units"][unitid] and AAPClassic["units"][unitid]["coords"]) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["units"][unitid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["units"][unitid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											derpcount = derpcount + 1
											Ys, Xs = AAPClassic.GetPickUpDBCords(AAP_index2)
											if (Ys and Xs) then
												if (CurQuest["lvl"]) then
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),"["..CurQuest["lvl"].."] "..AAPClassic["questsNames"][AAP_index2]["T"])
												else
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),AAPClassic["questsNames"][AAP_index2]["T"])
												end
												break
											end
										end
									end
								end
							end
						elseif (CurQuest["start"] and CurQuest["start"]["O"] and "A" == "B") then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["O"]) do
								local Objid = CurQuest["start"]["O"][AAP_a1]
								if (AAPClassic["objects"][Objid] and AAPClassic["objects"][Objid]["coords"] and (not AAPClassic["objects"][Objid]["fac"] or AAPClassic["objects"][Objid]["fac"] == "A")) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["objects"][Objid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["objects"][Objid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											derpcount = derpcount + 1
											Ys, Xs = AAPClassic.GetPickUpDBCords(AAP_index2)
											local Tools2
											if (AAPClassic["objectsNames"][Objid]) then
												Tools2 = AAPClassic["objectsNames"][Objid]
											end
											if (Ys and Xs) then
												if (CurQuest["lvl"]) then
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),"["..CurQuest["lvl"].."] "..AAPClassic["questsNames"][AAP_index2]["T"],Tools2)
												else
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),AAPClassic["questsNames"][AAP_index2]["T"],Tools2)
												end
												break
											end
										end
									end
								end
							end
						end
					end
				end
			else
				local Continue = 0
				if (CurQuest["race"] and (CurQuest["race"] == 77 or CurQuest["race"] == 255)) then
					Continue = 0
				elseif (CurQuest["race"] and (CurQuest["race"] == 178)) then
					Continue = 1
				else
					Continue = 1
				end
				if (Continue == 1) then
					if ((not CurQuest["pre"] or IsQuestFlaggedCompleted(CurQuest["pre"])) and (not CurQuest["class"] or CurQuest["class"] == AAPClassic.ClassDBConv[AAPClassic.Class[3]])) then
						if (CurQuest["start"] and CurQuest["start"]["U"]) then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["U"]) do
								local unitid = CurQuest["start"]["U"][AAP_a1]
								if (AAPClassic["units"][unitid] and AAPClassic["units"][unitid]["coords"]) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["units"][unitid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["units"][unitid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											derpcount = derpcount + 1
											Ys, Xs = AAPClassic.GetPickUpDBCords(AAP_index2)
											if (Ys and Xs) then
												if (CurQuest["lvl"]) then
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),"["..CurQuest["lvl"].."] "..AAPClassic["questsNames"][AAP_index2]["T"])
												else
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),AAPClassic["questsNames"][AAP_index2]["T"])
												end
												break
											end
										end
									end
								end
							end
						elseif (CurQuest["start"] and CurQuest["start"]["O"] and "A" == "B") then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["O"]) do
								local Objid = CurQuest["start"]["O"][AAP_a1]
								if (AAPClassic["objects"][Objid] and AAPClassic["objects"][Objid]["coords"] and (not AAPClassic["objects"][Objid]["fac"] or AAPClassic["objects"][Objid]["fac"] == "A")) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["objects"][Objid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["objects"][Objid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											derpcount = derpcount + 1
											Ys, Xs = AAPClassic.GetPickUpDBCords(AAP_index2)
											local Tools2
											if (AAPClassic["objectsNames"][Objid]) then
												Tools2 = AAPClassic["objectsNames"][Objid]
											end
											if (Ys and Xs) then
												if (CurQuest["lvl"]) then
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),"["..CurQuest["lvl"].."] "..AAPClassic["questsNames"][AAP_index2]["T"],Tools2)
												else
													AAPClassic.AddQuestPickUpIcon(CurZoneID, (Ys/100), (Xs/100),AAPClassic["questsNames"][AAP_index2]["T"],Tools2)
												end
												break
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
function AAPClassic.PreListDBOnMap(CurZoneID)
	AAPClassic.CurZoneQListedList = nil
	AAPClassic.CurZoneQListedList = {}
	local derpcount = 0
	for AAP_index2,AAP_value2 in pairs(AAPClassic["quests"]) do
		local CurQuest = AAPClassic["quests"][AAP_index2]
		if (not IsQuestFlaggedCompleted(AAP_index2) and not AAPClassic.QuestList[AAP_index2] and CurQuest["min"] and ((AAPClassic.Level-7) < CurQuest["lvl"]) and AAPClassic.Level >= CurQuest["min"] and CurQuest["min"] > 1) then
			if (UnitFactionGroup("player") == "Alliance") then
				local Continue = 0
				
				if (CurQuest["race"] and AllyZeRace[CurQuest["race"]]) then
					Continue = 1
				elseif (CurQuest["race"] and HordeZeRace[CurQuest["race"]]) then
					Continue = 0
				else
					Continue = 1
				end
				if (Continue == 1) then
					if ((not CurQuest["pre"] or IsQuestFlaggedCompleted(CurQuest["pre"])) and (not CurQuest["class"] or CurQuest["class"] == AAPClassic.ClassDBConv[AAPClassic.Class[3]])) then
						if (CurQuest["start"] and CurQuest["start"]["U"]) then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["U"]) do
								local unitid = CurQuest["start"]["U"][AAP_a1]
								if (AAPClassic["units"][unitid] and AAPClassic["units"][unitid]["coords"]) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["units"][unitid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["units"][unitid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											AAPClassic.CurZoneQListedList[AAP_index2] = AAPClassic["quests"][AAP_index2]
											break
										end
									end
								end
							end
						elseif (CurQuest["start"] and CurQuest["start"]["O"] and "A" == "B") then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["O"]) do
								local Objid = CurQuest["start"]["O"][AAP_a1]
								if (AAPClassic["objects"][Objid] and AAPClassic["objects"][Objid]["coords"] and (not AAPClassic["objects"][Objid]["fac"] or AAPClassic["objects"][Objid]["fac"] == "A")) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["objects"][Objid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["objects"][Objid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											AAPClassic.CurZoneQListedList[AAP_index2] = AAPClassic["quests"][AAP_index2]
											break
										end
									end
								end
							end
						end
					end
				end
			else
				local Continue = 0
				if (CurQuest["race"] and (CurQuest["race"] == 77 or CurQuest["race"] == 255)) then
					Continue = 0
				elseif (CurQuest["race"] and (CurQuest["race"] == 178)) then
					Continue = 1
				else
					Continue = 1
				end
				if (Continue == 1) then
					if ((not CurQuest["pre"] or IsQuestFlaggedCompleted(CurQuest["pre"])) and (not CurQuest["class"] or CurQuest["class"] == AAPClassic.ClassDBConv[AAPClassic.Class[3]])) then
						if (CurQuest["start"] and CurQuest["start"]["U"]) then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["U"]) do
								local unitid = CurQuest["start"]["U"][AAP_a1]
								if (AAPClassic["units"][unitid] and AAPClassic["units"][unitid]["coords"]) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["units"][unitid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["units"][unitid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											AAPClassic.CurZoneQListedList[AAP_index2] = AAPClassic["quests"][AAP_index2]
											break
										end
									end
								end
							end
						elseif (CurQuest["start"] and CurQuest["start"]["O"] and "A" == "B") then
							for AAP_a1,AAP_b1 in pairs(CurQuest["start"]["O"]) do
								local Objid = CurQuest["start"]["O"][AAP_a1]
								if (AAPClassic["objects"][Objid] and AAPClassic["objects"][Objid]["coords"] and (not AAPClassic["objects"][Objid]["fac"] or AAPClassic["objects"][Objid]["fac"] == "A")) then
									local amath = 0
									for AAP_a2,AAP_b2 in pairs(AAPClassic["objects"][Objid]["coords"]) do
										amath = amath + 1
										local z = AAPClassic["objects"][Objid]["coords"][amath][3]
										if (AAPClassic["TranslateZones"][z] and CurZoneID == AAPClassic["TranslateZones"][z]) then
											AAPClassic.CurZoneQListedList[AAP_index2] = AAPClassic["quests"][AAP_index2]
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
function AAPClassic.QuestDBcheck(Qid, PartNr, Tooltipz, Fillerz)
	local PartNr2 = PartNr
	if (AAPClassic["quests"][Qid]) then
		if (AAPClassic["quests"][Qid]["obj"]) then
			if (AAPClassic["quests"][Qid]["obj"]["i"]) then
				if (AAPClassic["quests"][Qid]["obj"]["i"][PartNr]) then
					if (AAPClassic.Locale == "enUS") then
						for AAP_index3,AAP_value3 in pairs(AAPClassic["quests"][Qid]["obj"]["i"]) do
							if (Tooltipz and AAPClassic["itemsNames"][AAP_value3] and string.find(Tooltipz, AAPClassic["itemsNames"][AAP_value3])) then
								PartNr = AAP_index3
							end
						end
					end
					if (not AAPClassic.ShowedDB[Qid]) then
						AAPClassic.ShowedDB[Qid] = {}
					end
					if (not AAPClassic.ShowedDB[Qid][PartNr]) then
						AAPClassic.ShowedDB[Qid][PartNr] = {}
					else
						return
					end
					local Itemid = AAPClassic["quests"][Qid]["obj"]["i"][PartNr]
					if (AAPClassic["items"][Itemid]) then
						if (AAPClassic["items"][Itemid]["O"]) then
							for AAP_index,AAP_value in pairs(AAPClassic["items"][Itemid]["O"]) do
								if (AAPClassic["objects"][AAP_index] and AAPClassic["objects"][AAP_index]["coords"]) then
									local coords = AAPClassic["objects"][AAP_index] and AAPClassic["objects"][AAP_index]["coords"]
									local amath = 0
									for AAP_index2,AAP_value2 in pairs(coords) do
										amath = amath + 1
										local x = coords[amath][1] / 100
										local y = coords[amath][2] / 100
										local z = coords[amath][3]
										if (not AAPClassic.TooltipsMapDB[x..y..z]) then
											AAPClassic.TooltipsMapDB[x..y..z] = {}
											tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
										else
											tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
											break
										end
										local mz = C_Map.GetBestMapForUnit("player")
										if (AAPClassic["TranslateZones"][z] == mz) then
											Coloridz = AAP_index
											if (AAPClassic["unitsNames"][AAP_index]) then
												AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][AAP_index]] = Qid.."-"..PartNr
											end
											local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
											AAPClassic.ShowedDB[Qid][PartNr][numberfortool] = numberfortool
											if (not AAPClassic.TooltipsList[AAP_index]) then
												AAPClassic.TooltipsList[AAP_index] = {}
											end
											if (not AAPClassic.TooltipsList[AAP_index][Qid.."-"..PartNr]) then
												AAPClassic.TooltipsList[AAP_index][Qid.."-"..PartNr] = Qid.."-"..PartNr
											end
											AAPClassic.TooltipsMapDBPlace[numberfortool] = x..y..z
											AAPClassic.Tooltips[numberfortool] = Tooltipz
											AAPClassic.MapMobListFontstrings(Tooltipz, Coloridz)
											local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
											AAPClassic.TooltipsMap[numberfortool2] = Tooltipz
										end
									end
								end
							end
						end
						if (AAPClassic["items"][Itemid]["U"]) then
							local Mobs = AAPClassic["items"][Itemid]["U"]
							for AAP_index,AAP_value in pairs(Mobs) do
								if (AAPClassic["units"][AAP_index] and AAPClassic["units"][AAP_index]["coords"]) then
									if (AAPClassic["units"][AAP_index]["lvl"]) then
										if (string.find(AAPClassic["units"][AAP_index]["lvl"], "%d\-%d")) then
											local _, _, derp1, derp2 = string.find(AAPClassic["units"][AAP_index]["lvl"], "(%d)-(%d)")
											local lvlz = 0
											if (not derp1) then
												lvlz = tonumber(AAPClassic["units"][AAP_index]["lvl"])
											else
												lvlz = tonumber(derp1)
											end
											if (AAPClassic.Level+2 < lvlz) then
												break
											end
										end
									end
									local coords = AAPClassic["units"][AAP_index]["coords"]
									local amath = 0
									for AAP_index2,AAP_value2 in pairs(coords) do
										amath = amath + 1
										local x = coords[amath][1] / 100
										local y = coords[amath][2] / 100
										local z = coords[amath][3]
										if (not AAPClassic.TooltipsMapDB[x..y..z]) then
											AAPClassic.TooltipsMapDB[x..y..z] = {}
											tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
										else
											tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
											break
										end
										local mz = C_Map.GetBestMapForUnit("player")
										if (AAPClassic["TranslateZones"][z] == mz) then
											Coloridz = AAP_index
											if (AAPClassic["unitsNames"][AAP_index]) then
												AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][AAP_index]] = Qid.."-"..PartNr
											end
											local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
											AAPClassic.ShowedDB[Qid][PartNr][numberfortool] = numberfortool
											AAPClassic.TooltipsMapDBPlace[numberfortool] = x..y..z
											if (not AAPClassic.TooltipsList[AAP_index]) then
												AAPClassic.TooltipsList[AAP_index] = {}
											end
											AAPClassic.TooltipsList[AAP_index][Qid.."-"..PartNr] = Qid.."-"..PartNr
											AAPClassic.Tooltips[numberfortool] = Tooltipz
											AAPClassic.Tooltips2[numberfortool] = "["..AAPClassic["units"][AAP_index]["lvl"].."] "..AAPClassic["unitsNames"][AAP_index]
											AAPClassic.MapMobListFontstrings("["..AAPClassic["units"][AAP_index]["lvl"].."] "..AAPClassic["unitsNames"][AAP_index],Coloridz)
											local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
											AAPClassic.TooltipsMap[numberfortool2] = Tooltipz
											AAPClassic.TooltipsMap2[numberfortool] = "["..AAPClassic["units"][AAP_index]["lvl"].."] "..AAPClassic["unitsNames"][AAP_index]
										end
									end
								end
							end
						end
					end
				end
			end
			if (AAPClassic.Locale == "enUS" and AAPClassic["quests"][Qid] and AAPClassic["quests"][Qid]["obj"] and AAPClassic["quests"][Qid]["obj"]["U"]) then
				for AAP_index3,AAP_value3 in pairs(AAPClassic["quests"][Qid]["obj"]["U"]) do
					if (Tooltipz and AAPClassic["unitsNames"][AAP_value3] and string.find(Tooltipz, AAPClassic["unitsNames"][AAP_value3])) then
						PartNr = AAP_index3
					end
				end
			end
			if (AAPClassic["quests"][Qid]["obj"]["U"]) then
				if (not AAPClassic.ShowedDB[Qid]) then
					AAPClassic.ShowedDB[Qid] = {}
				end
				if (not AAPClassic.ShowedDB[Qid][PartNr]) then
					AAPClassic.ShowedDB[Qid][PartNr] = {}
				else
					return
				end
				if (AAPClassic["quests"][Qid]["obj"]["U"][PartNr]) then
					local Mobid = AAPClassic["quests"][Qid]["obj"]["U"][PartNr]
					if (AAPClassic["units"][Mobid] and AAPClassic["units"][Mobid]["coords"]) then
						local coords = AAPClassic["units"][Mobid]["coords"]
						for AAP_index2,AAP_value2 in pairs(coords) do
							local x = coords[AAP_index2][1] / 100
							local y = coords[AAP_index2][2] / 100
							local z = coords[AAP_index2][3]
							if (not AAPClassic.TooltipsMapDB[x..y..z]) then
								AAPClassic.TooltipsMapDB[x..y..z] = {}
								tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
							else
								tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
								break
							end
							local mz = C_Map.GetBestMapForUnit("player")
							if (AAPClassic["TranslateZones"][z] == mz) then
								Coloridz = Mobid
								if (AAPClassic["unitsNames"][Mobid]) then
									AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][Mobid]] = Qid.."-"..PartNr
								end
								local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
								AAPClassic.ShowedDB[Qid][PartNr][numberfortool] = numberfortool
								AAPClassic.TooltipsMapDBPlace[numberfortool] = x..y..z
								AAPClassic.Tooltips[numberfortool] = Tooltipz
								AAPClassic.Tooltips2[numberfortool] = "["..AAPClassic["units"][Mobid]["lvl"].."] "..AAPClassic["unitsNames"][Mobid]
								AAPClassic.MapMobListFontstrings("["..AAPClassic["units"][Mobid]["lvl"].."] "..AAPClassic["unitsNames"][Mobid],Coloridz)
								local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
								AAPClassic.TooltipsMap2[numberfortool2] = "["..AAPClassic["units"][Mobid]["lvl"].."] "..AAPClassic["unitsNames"][Mobid]
								AAPClassic.TooltipsMap[numberfortool2] = Tooltipz
							end
						end
					end
				end
			end
			if (AAPClassic.Locale == "enUS" and AAPClassic["quests"][Qid] and AAPClassic["quests"][Qid]["obj"] and AAPClassic["quests"][Qid]["obj"]["U"]) then
				for AAP_index3,AAP_value3 in pairs(AAPClassic["quests"][Qid]["obj"]["U"]) do
					if (Tooltipz and AAPClassic["unitsNames"][AAP_value3] and string.find(Tooltipz, AAPClassic["unitsNames"][AAP_value3])) then
						PartNr = AAP_index3
					end
				end
			end
			if (AAPClassic["quests"][Qid]["obj"]["O"]) then
				for AAP_index,AAP_value in pairs(AAPClassic["quests"][Qid]["obj"]["O"]) do
					PartNr = AAP_index
					if (not AAPClassic.ShowedDB[Qid]) then
						AAPClassic.ShowedDB[Qid] = {}
					end
					if (not AAPClassic.ShowedDB[Qid][PartNr]) then
						AAPClassic.ShowedDB[Qid][PartNr] = {}
					end
					if (AAPClassic["quests"][Qid]["obj"]["O"][PartNr]) then
						local Object = AAPClassic["quests"][Qid]["obj"]["O"][PartNr]
						if (AAPClassic["objects"][Object] and AAPClassic["objects"][Object]["coords"]) then
							local coords = AAPClassic["objects"][Object]["coords"]
							for AAP_index2,AAP_value2 in pairs(coords) do
								local x = coords[AAP_index2][1] / 100
								local y = coords[AAP_index2][2] / 100
								local z = coords[AAP_index2][3]
								if (not AAPClassic.TooltipsMapDB[x..y..z]) then
									AAPClassic.TooltipsMapDB[x..y..z] = {}
									tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
								else
									tinsert(AAPClassic.TooltipsMapDB[x..y..z], Tooltipz)
									break
								end
								local mz = C_Map.GetBestMapForUnit("player")
								if (AAPClassic["TranslateZones"][z] == mz) then
									Coloridz = Object
									if (AAPClassic["unitsNames"][Object]) then
										AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][Object]] = Qid.."-"..PartNr
									end
									local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
									AAPClassic.ShowedDB[Qid][PartNr][numberfortool] = numberfortool
									AAPClassic.TooltipsMapDBPlace[numberfortool] = x..y..z
									AAPClassic.Tooltips[numberfortool] = Tooltipz
									AAPClassic.MapMobListFontstrings(Tooltipz, Coloridz)
									local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz, Fillerz)
									AAPClassic.TooltipsMap[numberfortool2] = Tooltipz
								end
							end
						end
					end
				end
			end
		end
	end

end
function AAPClassic.QuestDBShowMob(MobIdz,Qid,PartNr)
	if (AAPClassic["units"][MobIdz] and AAPClassic["units"][MobIdz]["coords"]) then
		local coords = AAPClassic["units"][MobIdz]["coords"]
		for AAP_index2,AAP_value2 in pairs(coords) do
			local x = coords[AAP_index2][1] / 100
			local y = coords[AAP_index2][2] / 100
			local z = coords[AAP_index2][3]
			local mz = C_Map.GetBestMapForUnit("player")
			if (AAPClassic["TranslateZones"][z] == mz) then
				Coloridz = MobIdz
				if (AAPClassic["unitsNames"][MobIdz]) then
					AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][MobIdz]] = Qid.."-"..PartNr
				end
				local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz)
				if (not AAPClassic.TooltipsList[MobIdz]) then
					AAPClassic.TooltipsList[MobIdz] = {}
				end
				if (not AAPClassic.TooltipsList[MobIdz][Qid.."-"..PartNr]) then
					AAPClassic.TooltipsList[MobIdz][Qid.."-"..PartNr] = Qid.."-"..PartNr
				end
				AAPClassic.Tooltips[numberfortool] = Tooltipz
				AAPClassic.Tooltips2[numberfortool] = AAPClassic["unitsNames"][MobIdz]
				local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz)
				AAPClassic.TooltipsMap[numberfortool2] = Tooltipz
				AAPClassic.TooltipsMap2[numberfortool] = AAPClassic["unitsNames"][MobIdz]
			end
		end
	end
end
function AAPClassic.QuestDBShowObj(MobIdz, Namez,Qid,PartNr)
	if (AAPClassic["objects"][MobIdz] and AAPClassic["objects"][MobIdz]["coords"]) then
		local coords = AAPClassic["objects"][MobIdz]["coords"]
		for AAP_index2,AAP_value2 in pairs(coords) do
			local x = coords[AAP_index2][1] / 100
			local y = coords[AAP_index2][2] / 100
			local z = coords[AAP_index2][3]
			local mz = C_Map.GetBestMapForUnit("player")
			if (AAPClassic["TranslateZones"][z] == mz) then
				Coloridz = MobIdz
				if (AAPClassic["unitsNames"][MobIdz]) then
					AAPClassic.ActiveMobIds[AAPClassic["unitsNames"][MobIdz]] = Qid.."-"..PartNr
				end
				local numberfortool = AAPClassic.AddIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz)
				if (not AAPClassic.TooltipsList[MobIdz]) then
					AAPClassic.TooltipsList[MobIdz] = {}
				end
				if (not AAPClassic.TooltipsList[MobIdz][Qid.."-"..PartNr]) then
					AAPClassic.TooltipsList[MobIdz][Qid.."-"..PartNr] = Qid.."-"..PartNr
				end
				AAPClassic.Tooltips[numberfortool] = Namez
				AAPClassic.Tooltips2[numberfortool] = AAPClassic["unitsNames"][MobIdz]
				local numberfortool2 = AAPClassic.AddMapIcon(C_Map.GetBestMapForUnit("player"), x, y, Coloridz)
				AAPClassic.TooltipsMap[numberfortool2] = Namez
				AAPClassic.TooltipsMap2[numberfortool] = AAPClassic["unitsNames"][MobIdz]
			end
		end
	end
end
function AAPClassic.GetPickUpDBCords(theqid)
	if (AAPClassic["quests"][theqid] and AAPClassic["quests"][theqid]["end"] and AAPClassic["quests"][theqid]["end"]["U"] and AAPClassic["quests"][theqid]["end"]["U"][1]) then
		local Uid = AAPClassic["quests"][theqid]["end"]["U"][1]
		if (AAPClassic["units"][Uid] and AAPClassic["units"][Uid]["coords"]) then
			local Zemapidz = C_Map.GetBestMapForUnit("player")
			local currentMapId, TOP_MOST = C_Map.GetBestMapForUnit('player'), true
			if (Enum and Enum.UIMapType and Enum.UIMapType.Continent and currentMapId) then
				Zemapidz = MapUtil.GetMapParentInfo(currentMapId, Enum.UIMapType.Continent+1, TOP_MOST)
			end
			if (Zemapidz and Zemapidz["mapID"]) then
				Zemapidz = Zemapidz["mapID"]
			else
				Zemapidz = C_Map.GetBestMapForUnit("player")
			end
			local ztable = AAPClassic["units"][Uid]["coords"][1]
			local translatez = AAPClassic["TranslateZones"][AAPClassic["units"][Uid]["coords"][1][3]]
			if (translatez == Zemapidz) then
				local Ys = AAPClassic["units"][Uid]["coords"][1][2]
				local Xs = AAPClassic["units"][Uid]["coords"][1][1]
				return Xs,Ys
			else
				return nil,nil
			end
		else
			return nil,nil
		end
	else
		return nil,nil
	end
end

