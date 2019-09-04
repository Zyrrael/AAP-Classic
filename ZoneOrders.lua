AAPClassic.ZO = {}
AAPClassic.ZO.Quests = {}
AAPClassic.ZO.QuestsDB = {}
AAPClassic.ZO.Scrollz = 0
function AAPClassic.ZO.MakeZOList()
	AAPClassic.ZO.MainFrame = CreateFrame("frame", "AAPClassic_ZO_MainFrame", UIParent)
	AAPClassic.ZO.MainFrame:SetWidth(1)
	AAPClassic.ZO.MainFrame:SetHeight(1)
	AAPClassic.ZO.MainFrame:SetMovable(true)
	AAPClassic.ZO.MainFrame:EnableMouse(true)
	AAPClassic.ZO.MainFrame:SetFrameStrata("MEDIUM")
	AAPClassic.ZO.MainFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 1, 1)

	AAPClassic.ZO.OrderFrame = CreateFrame("frame", "AAPClassic_ZO_OrderFrame", AAPClassic.ZO.MainFrame)
	AAPClassic.ZO.OrderFrame:SetWidth(400)
	AAPClassic.ZO.OrderFrame:SetHeight(520)
	AAPClassic.ZO.OrderFrame:SetFrameStrata("MEDIUM")
	AAPClassic.ZO.OrderFrame:SetPoint("TOPLEFT", AAPClassic.ZO.MainFrame, "TOPLEFT",0,0)
	AAPClassic.ZO.OrderFrame:SetMovable(true)
	AAPClassic.ZO.OrderFrame:EnableMouse(true)
	AAPClassic.ZO.OrderFrame:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton" and not AAPClassic.ZO.MainFrame.isMoving) then
			AAPClassic.ZO.MainFrame:StartMoving();
			AAPClassic.ZO.MainFrame.isMoving = true;
		end
	end)
	AAPClassic.ZO.OrderFrame:SetScript("OnMouseUp", function(self, button)
		if (button == "LeftButton" and AAPClassic.ZO.MainFrame.isMoving) then
			AAPClassic.ZO.MainFrame:StopMovingOrSizing();
			AAPClassic.ZO.MainFrame.isMoving = false;
		end
	end)
	AAPClassic.ZO.OrderFrame:SetScript("OnHide", function(self)
		if ( AAPClassic.ZO.MainFrame.isMoving ) then
			AAPClassic.ZO.MainFrame:StopMovingOrSizing();
			AAPClassic.ZO.MainFrame.isMoving = false;
		end
	end)
	AAPClassic.ZO.OrderFrame:SetScript("OnMouseWheel", function(self, arg1)
		if (arg1 == 1) then
			if (AAPClassic.ZO.Scrollz ~= 0) then
			AAPClassic.ZO.Scrollz = AAPClassic.ZO.Scrollz - 1
			AAPClassic.ZO.PrintOrder()
			end
		else
			AAPClassic.ZO.Scrollz = AAPClassic.ZO.Scrollz + 1
			AAPClassic.ZO.PrintOrder()
		end
	end)
	AAPClassic.ZO.OrderFrame:SetBackdrop( { 
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
	});
	local CLi
	for CLi = 1, 20 do
		AAPClassic.ZO.OrderFrame["Line"..CLi] = CreateFrame("frame", "AAPClassic_QL_QButton_ListFrameLine"..CLi, AAPClassic.ZO.MainFrame)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetWidth(496)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetHeight(20)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetFrameStrata("MEDIUM")
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetPoint("TOPLEFT", AAPClassic.ZO.MainFrame, "TOPLEFT",5,-((CLi * 25)+CLi-15))
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetMovable(true)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:EnableMouse(true)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetScript("OnMouseDown", function(self, button)
			if (button == "LeftButton" and not AAPClassic.ZO.MainFrame.isMoving) then
				AAPClassic.ZO.MainFrame:StartMoving();
				AAPClassic.ZO.MainFrame.isMoving = true;
			end
		end)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetScript("OnMouseUp", function(self, button)
			if (button == "LeftButton" and AAPClassic.ZO.MainFrame.isMoving) then
				AAPClassic.ZO.MainFrame:StopMovingOrSizing();
				AAPClassic.ZO.MainFrame.isMoving = false;
			end
		end)
		AAPClassic.ZO.OrderFrame["Line"..CLi]:SetScript("OnHide", function(self)
			if ( AAPClassic.ZO.MainFrame.isMoving ) then
				AAPClassic.ZO.MainFrame:StopMovingOrSizing();
				AAPClassic.ZO.MainFrame.isMoving = false;
			end
		end)

		AAPClassic.ZO.OrderFrame["Line2s"..CLi] = CreateFrame("frame", "AAPClassic_QL_QButton_ListFrameLine2s"..CLi, AAPClassic.ZO.MainFrame)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetWidth(496)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetHeight(30)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetFrameStrata("MEDIUM")
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetPoint("TOPLEFT", AAPClassic.ZO.MainFrame, "TOPLEFT",-35,-((CLi * 25)+CLi-25))
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetMovable(true)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:EnableMouse(true)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetScript("OnMouseDown", function(self, button)
			if (button == "LeftButton" and not AAPClassic.ZO.MainFrame.isMoving) then
				AAPClassic.ZO.MainFrame:StartMoving();
				AAPClassic.ZO.MainFrame.isMoving = true;
			end
		end)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetScript("OnMouseUp", function(self, button)
			if (button == "LeftButton" and AAPClassic.ZO.MainFrame.isMoving) then
				AAPClassic.ZO.MainFrame:StopMovingOrSizing();
				AAPClassic.ZO.MainFrame.isMoving = false;
			end
		end)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetScript("OnHide", function(self)
			if ( AAPClassic.ZO.MainFrame.isMoving ) then
				AAPClassic.ZO.MainFrame:StopMovingOrSizing();
				AAPClassic.ZO.MainFrame.isMoving = false;
			end
		end)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetBackdrop( { 
				bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
				tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
		});
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"] = AAPClassic.QL.ListFrame:CreateFontString("AAPClassic_ZO_OrderFrameLine2s"..CLi.."FS","ARTWORK", "ChatFontNormal")
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetParent(AAPClassic.ZO.OrderFrame["Line2s"..CLi])
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetPoint("LEFT",AAPClassic.ZO.OrderFrame["Line2s"..CLi],"LEFT",2,0)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetWidth(50)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetHeight(16)
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetJustifyH("LEFT")
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetFontObject("GameFontNormal")
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetText("123")
		AAPClassic.ZO.OrderFrame["Line2s"..CLi]["FS"]:SetTextColor(1, 1, 0)

		local CLi2
		for CLi2 = 1, 25 do

		
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2] = CreateFrame("frame", "AAPClassic_QL_QButton_ListFrameLine"..CLi.."Frame"..CLi2, AAPClassic.ZO.OrderFrame["Line"..CLi])
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetWidth(60)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetHeight(16)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetFrameStrata("HIGH")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetPoint("TOPLEFT", AAPClassic.ZO.OrderFrame["Line"..CLi], "TOPLEFT",((CLi2 * 60)+CLi2-60),0)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetMovable(true)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:EnableMouse(true)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetScript("OnMouseDown", function(self, button)
				if (button == "LeftButton" and not AAPClassic.ZO.MainFrame.isMoving) then
					AAPClassic.ZO.MainFrame:StartMoving();
					AAPClassic.ZO.MainFrame.isMoving = true;
				end
			end)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetScript("OnMouseUp", function(self, button)
				if (button == "LeftButton" and AAPClassic.ZO.MainFrame.isMoving) then
					AAPClassic.ZO.MainFrame:StopMovingOrSizing();
					AAPClassic.ZO.MainFrame.isMoving = false;
				end
			end)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetScript("OnHide", function(self)
				if ( AAPClassic.ZO.MainFrame.isMoving ) then
					AAPClassic.ZO.MainFrame:StopMovingOrSizing();
					AAPClassic.ZO.MainFrame.isMoving = false;
				end
			end)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetBackdrop( { 
				bgFile = "Interface\\Addons\\AAP-Classic\\Img\\bar.tga", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
				tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
			});
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:SetBackdropColor(0,0,0,1)


			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"] = CreateFrame("frame", "AAPClassic_QL_QButton_ListFrameLine"..CLi.."Frame"..CLi2, AAPClassic.ZO.OrderFrame["Line"..CLi])
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:SetWidth(2)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:SetFrameStrata("MEDIUM")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:SetHeight(26)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:SetPoint("TOP",AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2],"TOP",0,13)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]["L"] = AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:CreateTexture(nil, "OVERLAY")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]["L"]:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\bar.tga")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]["L"]:SetAllPoints()
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:Hide()

			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"] = AAPClassic.QL.ListFrame:CreateFontString("AAPClassic_ZO_OrderFrameLine"..CLi.."Frame"..CLi2.."FS","ARTWORK", "ChatFontNormal")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetParent(AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2])
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetPoint("TOPLEFT",AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2],"TOPLEFT",2,11)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetWidth(50)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetHeight(16)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetJustifyH("LEFT")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetFontObject("GameFontNormalSmall")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetText("Pick Up")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS"]:SetTextColor(1, 1, 0)
			
			
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"] = AAPClassic.QL.ListFrame:CreateFontString("AAPClassic_ZO_OrderFrameLine"..CLi.."Frame"..CLi2.."FS2","ARTWORK", "ChatFontNormal")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetParent(AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2])
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetPoint("TOP",AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2],"TOP",0,0)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetWidth(60)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetHeight(16)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetJustifyH("CENTER")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetFontObject("GameFontNormalSmall")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetText("Testing Quests")
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["FS2"]:SetTextColor(1, 1, 0)
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:Hide()
		end
	end
end
function AAPClassic.ZO.MakeDB()
	local Numbz = 0
	if (AAPClassic.Faction == "Alliance") then
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["1-5Human-Warrior"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["5-12Human-Warrior"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["12-13Human-LochModan-Darkshore"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["12-17Darkshore"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["17-18HumanDwarfGnome-LochModan"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["18-Human-IronforgeRedridge"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["18-20RedridgeMountains"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["20-RedridgeDarkshore"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["20-21Darkshore"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["21-22AshenvaleStonetalon"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["22-24Darkshore"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["24-Ashenvale"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["24-27Wetlands"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["27-28RedridgeMountains"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["28-30Duskwood"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["30-Ashenvale"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["30-31Wetlands"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["31-32HillsbradFoothills"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["32-RunAbout"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["32-33StranglethornVale"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["33-34Thousand Needles"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["34-36Desolace"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["36-37StranglethornVale"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["37-AlteracMountains"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["37-38ArathiHighlands"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["38-39DustwallowMarsh"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["39-40StranglethornVale"], Numbz)
	else
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["1-12OrcTroll-Warrior"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["12-15TheBarrens"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["15-16StonetalonMountains"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["16TheBarrens"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["16GotoTB-Rest"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["16-20TheBarrens"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["20-TB-Prep"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["20-23Ashenvale-SouthBarrens"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["23-25StonetalonMountains"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["25-SouthernBarrens"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["25-26ThousandNeedles"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["26-28Ashenvale"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["28-30TN-Hillsbrad"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["30-Arathi-STV"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["30-32STV-TN"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["32-34Desolace"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["34-37"], Numbz)
		Numbz = AAPClassic.ZO.MakeDBz(AAPClassic.Path["37-40"], Numbz)
		
	end
end
function AAPClassic.ZO.MakeDBz(Pathz, Number)
	local Numbzs = 0
	for AAPC_index,AAPC_value in pairs(Pathz) do
		Number = Number + 1
		Numbzs = Numbzs + 1
		if (not AAPClassic.ZO.QuestsDB["ShowLines"]) then
			AAPClassic.ZO.QuestsDB["ShowLines"] = {}
		end
		if (not AAPClassic.ZO.QuestsDB["ShowLines"][Number]) then
			AAPClassic.ZO.QuestsDB["ShowLines"][Number] = {}
		end
		if (not AAPClassic.ZO.QuestsDB["Quests"]) then
			AAPClassic.ZO.QuestsDB["Quests"] = {}
		end
		if (not AAPClassic.ZO.QuestsDB["Quests"][Number]) then
			AAPClassic.ZO.QuestsDB["Quests"][Number] = {}
		end
		if (Pathz[Numbzs]) then
			if (Pathz[Numbzs]["LeaveQuests"]) then
				for AAPC_index2,AAPC_value2 in pairs(Pathz[Numbzs]["LeaveQuests"]) do
					for AAPC_index3,AAPC_value3 in pairs(AAPClassic.ZO.Quests) do
						if (AAPC_value3 == AAPC_value2) then
							print("Removed:"..AAPC_value3)
							AAPClassic.ZO.Quests[tonumber(AAPC_index3)] = nil
						end
					end
				end
			end
			for AAPC_index,AAPC_value in pairs(AAPClassic.ZO.Quests) do
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][AAPC_index] = 1
			end
			if (Pathz[Numbzs]["PickUp"]) then
				for AAPC_index2,AAPC_value2 in pairs(Pathz[Numbzs]["PickUp"]) do
					local qNumb = AAPClassic.ZO.CheckQuests(AAPC_value2)
					AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 0
					AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
					AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["PickUp"] = AAPC_value2
				end
			elseif (Pathz[Numbzs]["Qpart"]) then
				for AAPC_index2,AAPC_value2 in pairs(Pathz[Numbzs]["Qpart"]) do
					if (995 == AAPC_index2) then
						Number = Number - 1
					else
						local qNumb = AAPClassic.ZO.CheckQuests(AAPC_index2)
						AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
						AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
						AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["Qpart"] = AAPC_index2
					end
				end
			elseif (Pathz[Numbzs]["Done"]) then
				for AAPC_index2,AAPC_value2 in pairs(Pathz[Numbzs]["Done"]) do
					local qNumb = AAPClassic.ZO.CheckQuests(AAPC_value2)
					AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
					AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
					AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["Done"] = AAPC_value2
					AAPClassic.ZO.Quests[qNumb] = nil
				end
			elseif (Pathz[Numbzs]["CRange"]) then
				local qNumb,zderps = AAPClassic.ZO.CheckQuests(Pathz[Numbzs]["CRange"])
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["CRange"] = Pathz[Numbzs]["CRange"]
				if (zderps == 1) then
					AAPClassic.ZO.Quests[qNumb] = nil
				end
			elseif (Pathz[Numbzs]["SetHS"]) then
				local qNumb,zderps = AAPClassic.ZO.CheckQuests(Pathz[Numbzs]["SetHS"])
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["SetHS"] = Pathz[Numbzs]["SetHS"]
				if (zderps == 1) then
					AAPClassic.ZO.Quests[qNumb] = nil
				end
			elseif (Pathz[Numbzs]["UseHS"]) then
				local qNumb,zderps = AAPClassic.ZO.CheckQuests(Pathz[Numbzs]["UseHS"])
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["UseHS"] = Pathz[Numbzs]["UseHS"]
				if (zderps == 1) then
					AAPClassic.ZO.Quests[qNumb] = nil
				end
			elseif (Pathz[Numbzs]["GetFP"]) then
				local qNumb,zderps = AAPClassic.ZO.CheckQuests(Pathz[Numbzs]["GetFP"])
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["GetFP"] = Pathz[Numbzs]["GetFP"]
				if (zderps == 1) then
					AAPClassic.ZO.Quests[qNumb] = nil
				end
			elseif (Pathz[Numbzs]["UseFlightPath"]) then
				local qNumb,zderps = AAPClassic.ZO.CheckQuests(Pathz[Numbzs]["UseFlightPath"])
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["UseFlightPath"] = Pathz[Numbzs]["UseFlightPath"]
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["Name"] = Pathz[Numbzs]["Name"]
				if (zderps == 1) then
					AAPClassic.ZO.Quests[qNumb] = nil
				end
			elseif (Pathz[Numbzs]["QaskPopup"]) then
				local qNumb = AAPClassic.ZO.CheckQuests(Pathz[Numbzs]["QaskPopup"])
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["QaskPopup"] = Pathz[Numbzs]["QaskPopup"]
			elseif (Pathz[Numbzs]["UpdMapID"]) then
				local qNumb = AAPClassic.ZO.CheckQuests(98231)
				AAPClassic.ZO.QuestsDB["ShowLines"][Number][qNumb] = 1
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb] = {}
				AAPClassic.ZO.QuestsDB["Quests"][Number][qNumb]["UpdMapID"] = 1
				AAPClassic.ZO.Quests[qNumb] = nil
			end
		end
	end
	return Number
end

function AAPClassic.ZO.PrintOrder()
	local CLi
	for CLi = 1, 20 do
		local CLi2
		for CLi2 = 1, 25 do
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]:Hide()
			AAPClassic.ZO.OrderFrame["Line"..CLi]["Frame"..CLi2]["Line"]:Hide()
		end
	end
	local Number = 0
	local witdhtz = 0
	for AAPC_index,AAPC_value in pairs(AAPClassic.ZO.QuestsDB["ShowLines"]) do
		Number = Number + 1
		if (AAPClassic.ZO.QuestsDB["ShowLines"][Number+AAPClassic.ZO.Scrollz]) then
			for AAPC_index2,AAPC_value2 in pairs(AAPClassic.ZO.QuestsDB["ShowLines"][Number+AAPClassic.ZO.Scrollz]) do
				if (AAPC_value2 == 1) then
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..AAPC_index2]["Line"]:Show()
				else
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..AAPC_index2]["Line"]:Hide()
				end
				if (witdhtz < AAPC_index2) then
					witdhtz = AAPC_index2
				end
			end
		end
		if (Number == 20) then
			AAPClassic.ZO.OrderFrame:SetWidth(witdhtz * 60 + 20)
			local CLi
			for CLi = 1, 20 do
				AAPClassic.ZO.OrderFrame["Line2s"..CLi]:SetWidth(witdhtz * 60 + 55)
			end
			break
		end
	end
	Number = 0
	for AAPC_index,AAPC_value in pairs(AAPClassic.ZO.QuestsDB["Quests"]) do
		Number = Number + 1
		if (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz]) then
			AAPClassic.ZO.OrderFrame["Line2s"..Number]["FS"]:SetText(Number+AAPClassic.ZO.Scrollz)
			for AAPC_index2,AAPC_value2 in pairs(AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz]) do
				if (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["PickUp"]) then
					local qNumb = AAPC_index2
					local zename = AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["PickUp"]
					if (AAPClassic["questsNames"][zename]) then
				--		zename = AAPClassic["questsNames"][zename]["T"]
					end
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("Pick Up")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText(zename)
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Hide()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["Qpart"]) then
					local qNumb = AAPC_index2
					local zename = AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["Qpart"]
					if (AAPClassic["questsNames"][zename]) then
				--		zename = AAPClassic["questsNames"][zename]["T"]
					end
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("DoQuest")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText(zename)
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["Done"]) then
					local qNumb = AAPC_index2
					local zename = AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["Done"]
					if (AAPClassic["questsNames"][zename]) then
				--		zename = AAPClassic["questsNames"][zename]["T"]
					end
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("Hand In")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText(zename)
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["CRange"]) then
					local qNumb = AAPC_index2
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText("WayPoint")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["UseFlightPath"]) then
					local qNumb = AAPC_index2
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("Use FP")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText(AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["Name"])
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["GetFP"]) then
					local qNumb = AAPC_index2
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText("Get Flightpath")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["SetHS"]) then
					local qNumb = AAPC_index2
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText("Set Hearthstone")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["UseHS"]) then
					local qNumb = AAPC_index2
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText("Use Hearthstone")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["UpdMapID"]) then
					local qNumb = AAPC_index2
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText("AAP-PathChange")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				elseif (AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["QaskPopup"]) then
					local qNumb = AAPC_index2
					local zename = AAPClassic.ZO.QuestsDB["Quests"][Number+AAPClassic.ZO.Scrollz][AAPC_index2]["QaskPopup"]
					if (AAPClassic["questsNames"][zename]) then
				--		zename = AAPClassic["questsNames"][zename]["T"]
					end
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS"]:SetText("Elite Quest")
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["FS2"]:SetText(zename)
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]:Show()
					AAPClassic.ZO.OrderFrame["Line"..Number]["Frame"..qNumb]["Line"]:Show()
				end
			end
		end
		if (Number == 20) then
			break
		end
	end
end

function AAPClassic.ZO.CheckQuests(Qid)
	local Numbz = 0
	local FreeNr = 0
	for AAPC_inde,AAPC_valu in pairs(AAPClassic.ZO.Quests) do
		Numbz = Numbz + 1
		if (AAPClassic.ZO.Quests[AAPC_inde] == Qid) then
			return AAPC_inde
		end
		if (not AAPClassic.ZO.Quests[Numbz] and FreeNr == 0) then
			FreeNr = Numbz
		end
	end
	if (FreeNr > 0) then
		AAPClassic.ZO.Quests[FreeNr] = Qid
		return FreeNr, 1
	else
		Numbz = Numbz + 1
		AAPClassic.ZO.Quests[Numbz] = Qid
		return Numbz, 1
	end
end
AAPClassic.ZO.QuestListEventFrame = CreateFrame("Frame")
AAPClassic.ZO.QuestListEventFrame:RegisterEvent ("ADDON_LOADED")

AAPClassic.ZO.QuestListEventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "AAP-Classic") then
			--AAPClassic.ZO.MakeZOList()
			--AAPClassic.ZO.MakeDB()
			--AAPClassic.ZO.PrintOrder()
		end
	end
end)