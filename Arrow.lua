if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
AAPClassic.Arrow = {}
AAPClassic.ArrowActive = 0
AAPClassic.ArrowActive_X = 0
AAPClassic.ArrowActive_Y = 0
AAPClassic.SetArrowStep = 0
local AAPClassic_ArrowUpdateNr = 0

AAPClassic.ArrowFrameM = CreateFrame("Button", "AAPClassic_ArrowFrame", UIParent)
AAPClassic.ArrowFrameM:SetHeight(1)
AAPClassic.ArrowFrameM:SetWidth(1)
AAPClassic.ArrowFrameM:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
AAPClassic.ArrowFrameM:EnableMouse(true)
AAPClassic.ArrowFrameM:SetMovable(true)

AAPClassic.ArrowFrame = CreateFrame("Button", "AAPClassic_ArrowFrame2", UIParent)
AAPClassic.ArrowFrame:SetHeight(42)
AAPClassic.ArrowFrame:SetWidth(56)
AAPClassic.ArrowFrame:SetPoint("TOPLEFT", AAPClassic.ArrowFrameM, "TOPLEFT", 0, 0)
AAPClassic.ArrowFrame:EnableMouse(true)
AAPClassic.ArrowFrame:SetMovable(true)
AAPClassic.ArrowFrame.arrow = AAPClassic.ArrowFrame:CreateTexture(nil, "OVERLAY")
AAPClassic.ArrowFrame.arrow:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\Arrow.blp")
AAPClassic.ArrowFrame.arrow:SetAllPoints()
AAPClassic.ArrowFrame.distance = AAPClassic.ArrowFrame:CreateFontString("ARTWORK", "ChatFontNormal")
AAPClassic.ArrowFrame.distance:SetFontObject("GameFontNormalSmall")
AAPClassic.ArrowFrame.distance:SetPoint("TOP", AAPClassic.ArrowFrame, "BOTTOM", 0, 0)
AAPClassic.ArrowFrame:Hide()
AAPClassic.ArrowFrame:SetScript("OnMouseDown", function(self, button)
	if button == "LeftButton" and not AAPClassic.ArrowFrameM.isMoving then
		AAPClassic.ArrowFrameM:StartMoving();
		AAPClassic.ArrowFrameM.isMoving = true;
	end
end)
AAPClassic.ArrowFrame:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" and AAPClassic.ArrowFrameM.isMoving then
		AAPClassic.ArrowFrameM:StopMovingOrSizing();
		AAPClassic.ArrowFrameM.isMoving = false;
	end
end)
AAPClassic.ArrowFrame:SetScript("OnHide", function(self)
	if ( AAPClassic.ArrowFrameM.isMoving ) then
		AAPClassic.ArrowFrameM:StopMovingOrSizing();
		AAPClassic.ArrowFrameM.isMoving = false;
	end
end)

AAPClassic.ArrowFrame.Button = CreateFrame("Button", "AAPClassic_ArrowFrame_Button", AAP_ArrowFrame)
AAPClassic.ArrowFrame.Button:SetWidth(85)
AAPClassic.ArrowFrame.Button:SetHeight(17)
AAPClassic.ArrowFrame.Button:SetParent(AAPClassic.ArrowFrame)
AAPClassic.ArrowFrame.Button:SetPoint("BOTTOM", AAPClassic.ArrowFrame, "BOTTOM", 0, -30)
AAPClassic.ArrowFrame.Button:SetScript("OnMouseDown", function(self, button)
	AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
	print("AAP - Skipped Waypoint")
	AAPClassic.QH.FuncLoopNumber = 1
end)
AAPClassic.ArrowFrame.Button:SetBackdrop( { 
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
});
AAPClassic.ArrowFrame.Fontstring = AAPClassic.ArrowFrame:CreateFontString("AAPClassic_ArrowFrame_Fontstring ","ARTWORK", "ChatFontNormal")
AAPClassic.ArrowFrame.Fontstring:SetParent(AAPClassic.ArrowFrame.Button)
AAPClassic.ArrowFrame.Fontstring:SetPoint("CENTER", AAPClassic.ArrowFrame.Button, "CENTER", 0, 0)

AAPClassic.ArrowFrame.Fontstring:SetFontObject("GameFontNormalSmall")
AAPClassic.ArrowFrame.Fontstring:SetText("Skip waypoint")
AAPClassic.ArrowFrame.Fontstring:SetTextColor(1, 1, 0)
AAPClassic.ArrowFrame.Button:Hide()

function AAPClassic.SetQPTT()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	if (CurStep and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["TT"] and AAPClassic.SetArrowStep ~= CurStep) then
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		AAPClassic.SetArrowStep = CurStep
		if (Step and Step["DoneClass"]) then
			local Class = AAPClassic.Class[3]
			if (Step["DoneClass"][Class] and Step["DoneClass"][Class][AAPClassic.Race]) then
				AAPClassic.ArrowActive = 1
				AAPClassic.ArrowActive_X = Step["DoneClass"][Class][AAPClassic.Race]["x"]
				AAPClassic.ArrowActive_Y = Step["DoneClass"][Class][AAPClassic.Race]["y"]
			end
		elseif (Step and Step["PickUpClass"]) then
			local Class = AAPClassic.Class[3]
			if (Step["PickUpClass"][Class] and Step["PickUpClass"][Class][AAPClassic.Race]) then
				AAPClassic.ArrowActive = 1
				AAPClassic.ArrowActive_X = Step["PickUpClass"][Class][AAPClassic.Race]["x"]
				AAPClassic.ArrowActive_Y = Step["PickUpClass"][Class][AAPClassic.Race]["y"]
			end
		else
			AAPClassic.ArrowActive = 1
			AAPClassic.ArrowActive_X = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["TT"]["x"]
			AAPClassic.ArrowActive_Y = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["TT"]["y"]
		end
	end
end
function AAPClassic.ArrowFrame.CheckDistance()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	if (CurStep and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["CRange"]) then
			AAPClassic.ArrowFrame.Button:Show()
			local plusnr = CurStep
			local Distancenr = 0
			local testad = true
			if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["NoExtraRange"]) then
				testad = false
			end
			while testad do
				local oldx = AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]["x"]
				local oldy = AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]["y"]
				plusnr = plusnr + 1
				if (AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["CRange"]) then
					local newx = AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]["x"]
					local newy = AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]["y"]
					local deltaX, deltaY = oldx - newx, newy - oldy
					local distance = (deltaX * deltaX + deltaY * deltaY)^0.5
					Distancenr = Distancenr + distance
				else
					if (AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]) then
						local newx = AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]["x"]
						local newy = AAPClassic.Path[AAPClassic.QH.ZoneNr][plusnr]["TT"]["y"]
						local deltaX, deltaY = oldx - newx, newy - oldy
						local distance = (deltaX * deltaX + deltaY * deltaY)^0.5
						Distancenr = Distancenr + distance
					end
					return floor(Distancenr + 0.5)
				end
			end
		end
	end
	return 0
end
function AAPClassic.ArrowFrame.ArrowPosTest()
	if (1 == 0) then
		AAPClassic.ArrowActive = 0
		AAPClassic.ArrowFrame:Hide()
	else
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		if ((AAPClassic.ArrowActive == 0) or (AAPClassic.ArrowActive_X == 0) or (IsInInstance()) or not AAPClassic.Path[AAPClassic.QH.ZoneNr] or AAPClassic.QuestHelperEnable == "on") then
			AAPClassic.ArrowActive = 0
			AAPClassic.ArrowFrame:Hide()
		else
			AAPClassic.ArrowFrame:Show()
			AAPClassic.ArrowFrame.Button:Hide()
			local d_y, d_x = UnitPosition("player")
			if (d_x and d_y) then
				x = AAPClassic.ArrowActive_X
				y = AAPClassic.ArrowActive_Y
				local AAP_ArrowActive_TrigDistance
				local PI2 = math.pi * 2
				local atan2 = math.atan2
				local twopi = math.pi * 2
				local deltaX, deltaY = d_x - x, y - d_y
				local distance = (deltaX * deltaX + deltaY * deltaY)^0.5
				local angle = atan2(-deltaX, deltaY)
				local player = GetPlayerFacing()
				angle = angle - player
				local perc = math.abs((math.pi - math.abs(angle)) / math.pi)
				if perc > 0.98 and perc < 1.02 then
					AAPClassic.ArrowFrame.arrow:SetVertexColor(0,1,0)
				elseif perc >= 1.02 and perc < 1.49 then
					AAPClassic.ArrowFrame.arrow:SetVertexColor((perc-1)*2,1,0)
				elseif perc > 1.49 then
					perc = 2-perc
					AAPClassic.ArrowFrame.arrow:SetVertexColor(1,perc*2,0)
				elseif perc > 0.49 then
					AAPClassic.ArrowFrame.arrow:SetVertexColor((1-perc)*2,1,0)
				else
					AAPClassic.ArrowFrame.arrow:SetVertexColor(1,perc*2,0)
				end
				local cell = floor(angle / twopi * 108 + 0.5) % 108
				local cell = floor(angle / twopi * 108 + 0.5) % 108
				local col = cell % 9
				local row = floor(cell / 9)
				AAPClassic.ArrowFrame.arrow:SetTexCoord((col * 56) / 512,((col + 1) * 56) / 512,(row * 42) / 512,((row + 1) * 42) / 512)
				AAPClassic.ArrowFrame.distance:SetText(floor(distance + AAPClassic.ArrowFrame.CheckDistance()) .. " yards")
				local Classic_ArrowActive_Distance = 0
				if (CurStep and AAPClassic.QH.ZoneNr and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
					if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Trigger"]) then
						local d_y, d_x = UnitPosition("player")
						local AAP_ArrowActive_Trigger_X = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Trigger"]["x"]
						local AAP_ArrowActive_Trigger_Y = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Trigger"]["y"]
						local deltaX, deltaY = d_x - AAP_ArrowActive_Trigger_X, AAP_ArrowActive_Trigger_Y - d_y
						Classic_ArrowActive_Distance = (deltaX * deltaX + deltaY * deltaY)^0.5
						AAP_ArrowActive_TrigDistance = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["Range"]
						if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["HIDEME"]) then
							AAPClassic.ArrowActive = 0
						end
					end
				end
				if (distance < 5 and Classic_ArrowActive_Distance == 0) then
					AAPClassic.ArrowActive_X = 0
				elseif (Classic_ArrowActive_Distance and AAP_ArrowActive_TrigDistance and Classic_ArrowActive_Distance < AAP_ArrowActive_TrigDistance) then
					AAPClassic.ArrowActive_X = 0
					if (CurStep and AAPClassic.QH.ZoneNr and AAPClassic.Path[AAPClassic.QH.ZoneNr] and AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]) then
						if (AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]["CRange"]) then
							AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
							AAPClassic.QH.FuncLoopNumber = 1
						end
					end
				end
			end
		end
	end
end
function AAPClassic.ArrowUpdate()
	if (AAPClassic_ArrowUpdateNr >= 2) then
		AAPClassic.ArrowFrame.ArrowPosTest()
		AAPClassic_ArrowUpdateNr = 0
	else
		AAPClassic_ArrowUpdateNr = AAPClassic_ArrowUpdateNr + 1
	end
end

AAPClassic.ArrowFrame.LoopUpdate = CreateFrame("frame")
AAPClassic.ArrowFrame.LoopUpdate:SetScript("OnUpdate", AAPClassic.ArrowUpdate)


