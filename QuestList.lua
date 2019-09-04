AAPClassic.QL = {}
if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
		
		
function AAPClassic.MakeQuestList()


	AAPClassic.GroupQuestFrame = {}
	AAPClassic.GroupQuestFrame = CreateFrame("frame", "AAP_SugQuestFrameFrame", UIParent)
	AAPClassic.GroupQuestFrame:SetWidth(300)
	AAPClassic.GroupQuestFrame:SetHeight(150)
	AAPClassic.GroupQuestFrame:SetMovable(true)
	AAPClassic.GroupQuestFrame:EnableMouse(true)
	AAPClassic.GroupQuestFrame:SetFrameStrata("LOW")
	AAPClassic.GroupQuestFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	AAPClassic.GroupQuestFrame:SetBackdrop( { 
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
		});
	AAPClassic.GroupQuestFrame:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			AAPClassic.GroupQuestFrame:StartMoving();
			AAPClassic.GroupQuestFrame.isMoving = true;
		end
	end)
	AAPClassic.GroupQuestFrame:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and AAPClassic.GroupQuestFrame.isMoving then
			AAPClassic.GroupQuestFrame:StopMovingOrSizing();
			AAPClassic.GroupQuestFrame.isMoving = false;
		end
	end)
	AAPClassic.GroupQuestFrame:SetScript("OnHide", function(self)
		if ( AAPClassic.GroupQuestFrame.isMoving ) then
			AAPClassic.GroupQuestFrame:StopMovingOrSizing();
			AAPClassic.GroupQuestFrame.isMoving = false;
		end
	end)
	AAPClassic.GroupQuestFrame:Hide()

	AAPClassic.GroupQuestFrameFS1 = AAPClassic.GroupQuestFrame:CreateFontString("CLQaaFS1","ARTWORK", "ChatFontNormal")
	AAPClassic.GroupQuestFrameFS1:SetParent(AAPClassic.GroupQuestFrame)
	AAPClassic.GroupQuestFrameFS1:SetPoint("TOPLEFT",AAPClassic.GroupQuestFrame,"TOPLEFT",0,0)
	AAPClassic.GroupQuestFrameFS1:SetWidth(300)
	AAPClassic.GroupQuestFrameFS1:SetHeight(38)
	AAPClassic.GroupQuestFrameFS1:SetJustifyH("CENTER")
	AAPClassic.GroupQuestFrameFS1:SetFontObject("GameFontNormalLarge")
	AAPClassic.GroupQuestFrameFS1:SetText("Quests Text")
	AAPClassic.GroupQuestFrameFS1:SetTextColor(1, 1, 0)
	AAPClassic.GroupQuestFrameFS2 = AAPClassic.GroupQuestFrame:CreateFontString("CLQaaFS2","ARTWORK", "ChatFontNormal")
	AAPClassic.GroupQuestFrameFS2:SetParent(AAPClassic.GroupQuestFrame)
	AAPClassic.GroupQuestFrameFS2:SetPoint("TOPLEFT",AAPClassic.GroupQuestFrame,"TOPLEFT",0,-30)
	AAPClassic.GroupQuestFrameFS2:SetWidth(300)
	AAPClassic.GroupQuestFrameFS2:SetHeight(38)
	AAPClassic.GroupQuestFrameFS2:SetJustifyH("CENTER")
	AAPClassic.GroupQuestFrameFS2:SetFontObject("GameFontNormalLarge")
	AAPClassic.GroupQuestFrameFS2:SetText("Suggested Players: ")
	AAPClassic.GroupQuestFrameFS2:SetTextColor(1, 1, 0)

	AAPClassic.GroupQuestFrame["Button1"] = CreateFrame("Button", "AAP_SBX1", UIParent, "SecureActionButtonTemplate")
	AAPClassic.GroupQuestFrame["Button1"]:SetPoint("BOTTOMLEFT",AAPClassic.GroupQuestFrame,"BOTTOMLEFT",15,5)
	AAPClassic.GroupQuestFrame["Button1"]:SetWidth(110)
	AAPClassic.GroupQuestFrame["Button1"]:SetHeight(30)
	AAPClassic.GroupQuestFrame["Button1"]:SetText("Accept Quest")
	AAPClassic.GroupQuestFrame["Button1"]:SetParent(AAPClassic.GroupQuestFrame)
	AAPClassic.GroupQuestFrame.Button1:SetNormalFontObject("GameFontNormal")
	AAPClassic.GroupQuestFrame.Button1ntex = AAPClassic.GroupQuestFrame.Button1:CreateTexture()
	AAPClassic.GroupQuestFrame.Button1ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	AAPClassic.GroupQuestFrame.Button1ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.GroupQuestFrame.Button1ntex:SetAllPoints()	
	AAPClassic.GroupQuestFrame.Button1:SetNormalTexture(AAPClassic.GroupQuestFrame.Button1ntex)
	AAPClassic.GroupQuestFrame.Button1htex = AAPClassic.GroupQuestFrame.Button1:CreateTexture()
	AAPClassic.GroupQuestFrame.Button1htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	AAPClassic.GroupQuestFrame.Button1htex:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.GroupQuestFrame.Button1htex:SetAllPoints()
	AAPClassic.GroupQuestFrame.Button1:SetHighlightTexture(AAPClassic.GroupQuestFrame.Button1htex)
	AAPClassic.GroupQuestFrame.Button1ptex = AAPClassic.GroupQuestFrame.Button1:CreateTexture()
	AAPClassic.GroupQuestFrame.Button1ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	AAPClassic.GroupQuestFrame.Button1ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.GroupQuestFrame.Button1ptex:SetAllPoints()
	AAPClassic.GroupQuestFrame.Button1:SetPushedTexture(AAPClassic.GroupQuestFrame.Button1ptex)
	AAPClassic.GroupQuestFrame["Button1"]:SetScript("OnClick", function(self, arg1)
		AAPClassic.QAskPopWantedAsk("yes")
	end)
	AAPClassic.GroupQuestFrame["Button2"] = CreateFrame("Button", "AAP_SBX2", UIParent, "SecureActionButtonTemplate")
	AAPClassic.GroupQuestFrame["Button2"]:SetPoint("BOTTOMRIGHT",AAPClassic.GroupQuestFrame,"BOTTOMRIGHT",-15,5)
	AAPClassic.GroupQuestFrame["Button2"]:SetWidth(110)
	AAPClassic.GroupQuestFrame["Button2"]:SetHeight(30)
	AAPClassic.GroupQuestFrame["Button2"]:SetText("Decline Quest")
	AAPClassic.GroupQuestFrame["Button2"]:SetParent(AAPClassic.GroupQuestFrame)
	AAPClassic.GroupQuestFrame.Button2:SetNormalFontObject("GameFontNormal")
	AAPClassic.GroupQuestFrame.Button2ntex = AAPClassic.GroupQuestFrame.Button2:CreateTexture()
	AAPClassic.GroupQuestFrame.Button2ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	AAPClassic.GroupQuestFrame.Button2ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.GroupQuestFrame.Button2ntex:SetAllPoints()	
	AAPClassic.GroupQuestFrame.Button2:SetNormalTexture(AAPClassic.GroupQuestFrame.Button2ntex)
	AAPClassic.GroupQuestFrame.Button2htex = AAPClassic.GroupQuestFrame.Button2:CreateTexture()
	AAPClassic.GroupQuestFrame.Button2htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	AAPClassic.GroupQuestFrame.Button2htex:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.GroupQuestFrame.Button2htex:SetAllPoints()
	AAPClassic.GroupQuestFrame.Button2:SetHighlightTexture(AAPClassic.GroupQuestFrame.Button2htex)
	AAPClassic.GroupQuestFrame.Button2ptex = AAPClassic.GroupQuestFrame.Button2:CreateTexture()
	AAPClassic.GroupQuestFrame.Button2ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	AAPClassic.GroupQuestFrame.Button2ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.GroupQuestFrame.Button2ptex:SetAllPoints()
	AAPClassic.GroupQuestFrame.Button2:SetPushedTexture(AAPClassic.GroupQuestFrame.Button2ptex)
	AAPClassic.GroupQuestFrame["Button2"]:SetScript("OnClick", function(self, arg1)
		AAPClassic.QAskPopWantedAsk("no")
	end)





	AAPClassic.QL.MainFrame = CreateFrame("frame", "AAPClassic_QL_QButtonMi_MainFrame", UIParent)
	AAPClassic.QL.MainFrame:SetWidth(1)
	AAPClassic.QL.MainFrame:SetHeight(1)
	AAPClassic.QL.MainFrame:SetMovable(true)
	AAPClassic.QL.MainFrame:EnableMouse(true)
	AAPClassic.QL.MainFrame:SetFrameStrata("MEDIUM")
	AAPClassic.QL.MainFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 1, 1)

	AAPClassic.QL.QButtonFrame = CreateFrame("frame", "AAPClassic_QL_QButton_ListFrame", UIParent)
	AAPClassic.QL.QButtonFrame:SetWidth(55)
	AAPClassic.QL.QButtonFrame:SetHeight(55)
	AAPClassic.QL.QButtonFrame:SetFrameStrata("MEDIUM")
	AAPClassic.QL.QButtonFrame:SetPoint("CENTER", UIParent, "CENTER",0,0)
	AAPClassic.QL.QButtonFrame:SetMovable(true)
	AAPClassic.QL.QButtonFrame:EnableMouse(true)
	AAPClassic.QL.QButtonFrame:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton" and not AAPClassic.QL.QButtonFrame.isMoving) then
			AAPClassic.QL.QButtonFrame:StartMoving();
			AAPClassic.QL.QButtonFrame.isMoving = true;
		end
	end)
	AAPClassic.QL.QButtonFrame:SetScript("OnMouseUp", function(self, button)
		if (button == "LeftButton" and AAPClassic.QL.QButtonFrame.isMoving) then
			AAPClassic.QL.QButtonFrame:StopMovingOrSizing();
			AAPClassic.QL.QButtonFrame.isMoving = false;
		end
	end)
	AAPClassic.QL.QButtonFrame:SetScript("OnHide", function(self)
		if ( AAPClassic.QL.QButtonFrame.isMoving ) then
			AAPClassic.QL.QButtonFrame:StopMovingOrSizing();
			AAPClassic.QL.QButtonFrame.isMoving = false;
		end
	end)
	AAPClassic.QL.QButtonFrame:SetBackdrop( { 
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
		});

		AAPClassic.QL.QButtonFrame["Button"] = CreateFrame("Button", "AAPClassic_QL_QButtonFrame_Button", AAPClassic.QL.QButtonFrame, "SecureActionButtonTemplate")
		AAPClassic.QL.QButtonFrame["Button"]:SetWidth(37)
		AAPClassic.QL.QButtonFrame["Button"]:SetHeight(37)
		AAPClassic.QL.QButtonFrame["Button"]:SetText("X")
		AAPClassic.QL.QButtonFrame["Button"]:SetPoint("CENTER",AAPClassic.QL.QButtonFrame,"CENTER",0,0)
		AAPClassic.QL.QButtonFrame["Button"]:SetNormalFontObject("GameFontNormalLarge")
		AAPClassic.QL.QButtonFrame["Buttonntex"] = AAPClassic.QL.QButtonFrame["Button"]:CreateTexture()
		AAPClassic.QL.QButtonFrame["Buttonntex"]:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		AAPClassic.QL.QButtonFrame["Buttonntex"]:SetTexCoord(0, 0.625, 0, 0.6875)
		AAPClassic.QL.QButtonFrame["Buttonntex"]:SetAllPoints()	
		AAPClassic.QL.QButtonFrame["Button"]:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		AAPClassic.QL.QButtonFrame["Buttonhtex"] = AAPClassic.QL.QButtonFrame["Button"]:CreateTexture()
		AAPClassic.QL.QButtonFrame["Buttonhtex"]:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		AAPClassic.QL.QButtonFrame["Buttonhtex"]:SetTexCoord(0, 0.625, 0, 0.6875)
		AAPClassic.QL.QButtonFrame["Buttonhtex"]:SetAllPoints()
		AAPClassic.QL.QButtonFrame["Button"]:SetHighlightTexture(AAPClassic.QL.QButtonFrame["Buttonhtex"])
		AAPClassic.QL.QButtonFrame["Buttonptex"] = AAPClassic.QL.QButtonFrame["Button"]:CreateTexture()
		AAPClassic.QL.QButtonFrame["Buttonptex"]:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		AAPClassic.QL.QButtonFrame["Buttonptex"]:SetTexCoord(0, 0.625, 0, 0.6875)
		AAPClassic.QL.QButtonFrame["Buttonptex"]:SetAllPoints()
		AAPClassic.QL.QButtonFrame["Button"]:SetPushedTexture(AAPClassic.QL.QButtonFrame["Buttonptex"])
		AAPClassic.QL.QButtonFrame["ButtonCD"] = CreateFrame("Cooldown", "AAPClassic_QL_QButtonFrame_ButtonCooldown", AAPClassic.QL.QButtonFrame["Button"], "CooldownFrameTemplate")
		AAPClassic.QL.QButtonFrame["ButtonCD"]:SetAllPoints()
	AAPClassic.QL.QButtonFrame:Hide()



	AAPClassic.QL.ListFrame = CreateFrame("frame", "AAPClassic_QL_QuestList_ListFrame", UIParent)
	AAPClassic.QL.ListFrame:SetWidth(1)
	AAPClassic.QL.ListFrame:SetHeight(1)
	AAPClassic.QL.ListFrame:SetFrameStrata("MEDIUM")
	AAPClassic.QL.ListFrame:SetPoint("TOPLEFT", AAPClassic.QL.MainFrame, "TOPLEFT",0,0)
	AAPClassic.QL.ListFrame:SetMovable(true)
	AAPClassic.QL.ListFrame:EnableMouse(true)
	AAPClassic.QL.ListFrame:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton" and not AAPClassic.QL.MainFrame.isMoving) then
			AAPClassic.QL.MainFrame:StartMoving();
			AAPClassic.QL.MainFrame.isMoving = true;
		end
	end)
	AAPClassic.QL.ListFrame:SetScript("OnMouseUp", function(self, button)
		if (button == "LeftButton" and AAPClassic.QL.MainFrame.isMoving) then
			AAPClassic.QL.MainFrame:StopMovingOrSizing();
			AAPClassic.QL.MainFrame.isMoving = false;
		end
	end)
	AAPClassic.QL.ListFrame:SetScript("OnHide", function(self)
		if ( AAPClassic.QL.MainFrame.isMoving ) then
			AAPClassic.QL.MainFrame:StopMovingOrSizing();
			AAPClassic.QL.MainFrame.isMoving = false;
		end
	end)
	AAPClassic.QL.QuestFrames = {}
	local CLi
	for CLi = 1, 20 do
		AAPClassic.QL.QuestFrames[CLi] = CreateFrame("frame", "AAPClassic_QL_QuestFrames"..CLi, AAPClassic.QL.ListFrame)
		AAPClassic.QL.QuestFrames[CLi]:SetWidth(250)

		AAPClassic.QL.QuestFrames[CLi]:SetHeight(20)
		AAPClassic.QL.QuestFrames[CLi]:SetPoint("BOTTOMLEFT", AAPClassic.QL.ListFrame, "BOTTOMLEFT",0,-((CLi * 20)+CLi))
		AAPClassic.QL.QuestFrames[CLi]:SetBackdrop( { 
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
		});
		AAPClassic.QL.QuestFrames[CLi]:SetScript("OnMouseDown", function(self, button)
			if button == "LeftButton" then
				AAPClassic.QL.MainFrame:StartMoving();
				AAPClassic.QL.MainFrame.isMoving = true;
			end
		end)
		AAPClassic.QL.QuestFrames[CLi]:SetScript("OnMouseUp", function(self, button)
			if button == "LeftButton" and AAPClassic.QL.MainFrame.isMoving then
				AAPClassic.QL.MainFrame:StopMovingOrSizing();
				AAPClassic.QL.MainFrame.isMoving = false;
			end
		end)
		AAPClassic.QL.QuestFrames[CLi]:SetScript("OnHide", function(self)
			if ( AAPClassic.QL.MainFrame.isMoving ) then
				AAPClassic.QL.MainFrame:StopMovingOrSizing();
				AAPClassic.QL.MainFrame.isMoving = false;
			end
		end)
		AAPClassic.QL.QuestFrames[CLi]:Hide()
		AAPClassic.QL.QuestFrames["FS"..CLi] = AAPClassic.QL.ListFrame:CreateFontString("CLQFS"..CLi,"ARTWORK", "ChatFontNormal")
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetParent(AAPClassic.QL.QuestFrames[CLi])
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetPoint("TOPLEFT",AAPClassic.QL.QuestFrames[CLi],"TOPLEFT",5,0)
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetWidth(600)
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetHeight(20)
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetJustifyH("LEFT")
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetFontObject("GameFontNormal")
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetText("")
		AAPClassic.QL.QuestFrames["FS"..CLi]:SetTextColor(1, 1, 0)



	end
	
end

AAPClassic.QL.QuestListEventFrame = CreateFrame("Frame")
AAPClassic.QL.QuestListEventFrame:RegisterEvent ("ADDON_LOADED")

AAPClassic.QL.QuestListEventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "AAP-Classic") then
			AAPClassic.MakeQuestList()
		end
	end
end)