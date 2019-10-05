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

local function AAP_Quest_Text(AAP_Value) 
        if (type(AAP_Value) == "table" ) then
            local index,value,text
            text = ""
            for index,value in pairs(AAP_Value) do
                text = text .. ("[".. index .. "]")
            end
            return text
        end
        if AAP_Value == nil then return "nil" end
        if (AAPClassic["questsNames"][AAP_Value] and AAPClassic["questsNames"][AAP_Value]["T"]) then
                return ("[" .. AAP_Value .. "] " .. AAPClassic["questsNames"][AAP_Value]["T"] )
        else
                return ("["..AAP_Value .. "]")
        end
end


local function AAP_SlashCmd(AAP_index)
	if (AAP_index == "reset") then
		print("AAP: Resetting Zone.")
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (string.find(AAP_index,"^setzone")) then
                local _, _, cmd, newZone = string.find(AAP_index, "%s?(%w+)%s?(.*)")
                print("Setting zone to: ".. newZone)
                if (AAPClassic.Path[newZone]) then
                    AAPClassic.QH.ZoneNr = newZone
                    AAPC1[AAPClassic.Realm][AAPClassic.Name]["setzone"]=newZone
                    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
                    AAPClassic.QH.FuncLoopNumber = 1
                else 
                    print("No such zone: "..newZone)
                end
            
	elseif (AAP_index == "zones") then
                    local k, zone, zones
                    zones={}
                    for k in pairs(AAPClassic.Path) do table.insert(zones, k) end
                    table.sort(zones, function(a,b) 
                        return (tonumber(string.match(a,"[0-9]*")) or 0) < (tonumber(string.match(b,"[0-9]*")) or 0) 
                    end );
                    for _,zone in ipairs(zones) do 
                        print("Zone: " .. zone)
                    end

                    --print("Scammomg Zone: ".. zone)

	elseif (AAP_index == "checkup") then
                local QuestZones, zone, list, order, id, remove, need, TurninStep
                QuestZones={}
                remove={}
                need={} 
                TurninStep={}
                local ZoneSteps = AAPClassic.Path[AAPClassic.QH.ZoneNr]
                local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
                local NumSteps = getn(ZoneSteps)
                print("AAP Current Zone: " .. AAPClassic.QH.ZoneNr);
                print("AAP Current Step: " .. CurStep .. " of " .. NumSteps)
                --This does a lot of work.  
                --It makes a map of all quest turnins and the zones they are in so we can check the quest log against them.
                --This lets the user remove unneeded quests from their log. 
                --It also lets us tell them which zone each quest in their log is for, so if they should have turned it in earlier 
                --they can choose to abandon it or go back and turn it in.
                for zone,list in pairs(AAPClassic.Path) do 
                    --print("Scanning Zone: ".. zone)
                    for i = getn(list), 1, -1 do 
                        --print(zone .. ":" .. i)
                        if list[i]["PickUp"] then 
                            for order,id in pairs(list[i]["PickUp"]) do 
                                QuestZones[id]=zone
                            end
                        end
                        if list[i]["Done"] then 
                            for order,id in pairs(list[i]["Done"]) do 
                                --print(zone .. ":" .. id)
                                QuestZones[id]=zone
                            end
                        end
                        if list[i]["Qpart"] then 
                            for id,ignore in pairs(list[i]["Qpart"]) do 
                                QuestZones[id]=zone
                            end
                        end
                    end
                end
                --gather which step we turn each quest in in this zone
                for i = NumSteps, 1,-1 do 
                    if ZoneSteps[i]["Done"] then 
                        for order,id in pairs(ZoneSteps[i]["Done"]) do 
                            TurninStep[id] = i
                        end
                    end
                end
                --look for quests we should have now by checking what quests we turn in after this step but don't pick up
                for i = NumSteps, CurStep,-1 do 
                    if ZoneSteps[i]["Qpart"] then 
                        for id,ignore in pairs(ZoneSteps[i]["Qpart"]) do 
                            need[id] = i
                        end
                    end
                    if ZoneSteps[i]["Done"] then 
                        for order,id in pairs(ZoneSteps[i]["Done"]) do 
                            need[id] = i
                        end 
                    end
                    if ZoneSteps[i]["PickUp"] then 
                        for order,id in pairs(ZoneSteps[i]["PickUp"]) do 
                            need[id] = nil
                        end
                    end
                end
                for id,step in pairs(need) do
                    --print("Need " .. id .. " for " .. step)
                end

                for i = 1, GetNumQuestLogEntries() do 
        	    local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, id = GetQuestLogTitle(i)
                    if (isHeader) then 
                        --ignore
                    elseif (need[id]) then 
                        --print("Finishing in this zone: " .. AAP_Quest_Text(id))
                        need[id]=nil
                    elseif (QuestZones[id]) then
                        if (QuestZones[id] == AAPClassic.QH.ZoneNr) then 
                            if (TurninStep[id] and (TurninStep[id] < CurStep)) then
                                print("Should have completed quest already " .. AAP_Quest_Text(id) .. " in step " .. TurninStep[id])
                            end
                        else 
                            print("For another zone:" .. QuestZones[id] .. ": " .. AAP_Quest_Text(id))
                        end
                    else
                        --this quest isn't anywhere in the list of quests to be done
                        remove[id]=1
                    end

                    
                end 
                for i = 1, GetNumQuestLogEntries() do 
        	    local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, id = GetQuestLogTitle(i)
                    if (not isHeader and remove[id]) then 
                        print("Quest not part of autopilot!: " .. AAP_Quest_Text(id))
                    end
                end 
                for id,ignore in pairs(need) do
                    if  (IsQuestFlaggedCompleted(id)) then
                        need[id]=nil
                    end
                end
                for id,ignore in pairs(need) do
                    print("WARNING! Quest Missing From Log: ".. AAP_Quest_Text(id))
                end

                
	elseif (AAP_index == "auto") then
            AAPC1[AAPClassic.Realm][AAPClassic.Name]["noauto"]=false
	elseif (AAP_index == "noauto") then
            AAPC1[AAPClassic.Realm][AAPClassic.Name]["noauto"]=true
	elseif (AAP_index == "status") then
                local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
                local ZoneSteps = AAPClassic.Path[AAPClassic.QH.ZoneNr]
                local NumSteps = getn(ZoneSteps)

                print("AAP Current Zone: " .. AAPClassic.QH.ZoneNr)
                print("AAP Current Step: " .. CurStep .. " of " .. NumSteps)
                for i=0,10 do 
                    local StepNo = CurStep+i
                    local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][StepNo]
                    if (Step ~= nil) then 
                        if (Step["PickUp"]) then 
                            local id =  Step["PickUp"][1]
                            print ("Next Steps: " .. StepNo .. " Pick Up: " .. AAP_Quest_Text(id))
                        elseif (Step["Done"]) then 
                            print ("Next Steps: " .. StepNo .. " Hand In: " .. AAP_Quest_Text(Step["Done"][1]))
                        elseif (Step["CRange"]) then
                            if (Step["ExtraLine"] ~= nil) then 
                                print ("Next Steps: " .. StepNo .. " Run to Waypoint " .. Step["TT"]["x"] .. "," .. Step["TT"]["y"] .. "(" .. Step["ExtraLine"] .. ")")
                            else 
                                print ("Next Steps: " .. StepNo .. " Run to Waypoint " .. Step["TT"]["x"] .. "," .. Step["TT"]["y"])
                            end
                        elseif (Step["Qpart"]) then
                             for id,ignore in pairs(Step["Qpart"]) do 
                                print ("Next Steps: " .. StepNo .. " Work On: " .. AAP_Quest_Text(id))
                             end
                        elseif (Step["ExtraLine"] ~= nil) then 
                            print("Next Steps: " .. CurStep+i .. ":" .. Step["ExtraLine"])
                        else
                            print("Next Steps: " .. CurStep+i .. ":" )
                        end
                        if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep+i]["PickUp"] ~= nil) then 
                        end
                    end
                end 
	elseif (AAP_index == "skip") then
		print("AAP: Skipping QuestStep.")
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
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
                if (AAP_index and AAP_index ~= "help" and AAP_index ~= '') then 
                    print("No such aap command: "..AAP_index)
                end
                local cc = "|cFF00FFCC"
                print ("Azeroth Auto Pilot Usage:  /aap [command] where command can be:")
                print ("/aap [no]auto: "..cc.."turn automatic skipping of dialogs on [or off] ")
                print ("/aap reset: "..cc.."reset progress in this zone to the beginning")
                print ("/aap skip: "..cc.."skip the current step and move to the next one")
                print ("/aap helper: "..cc.."toggle quest helper integration")
                print ("/aap status: "..cc.."show current zone and next few steps")
                print ("/aap explore: "..cc.."toggle human exploring mode")
                print ("/aap zones: "..cc.."list the zones of questing that have been configured")
                print ("/aap setzone: "..cc.."override the auto-detection and manually set the current zone")
                print ("/aap checkup: "..cc.."scan quest log for unneeded, missing or old quests")
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
