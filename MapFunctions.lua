if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
AAPClassic.Icons = {}
AAPClassic.MapIcons = {}
AAPClassic.PickupIcons = {}
AAPClassic.PickupIconsMap = {}
AAPClassic.HandinIcons = {}
AAPClassic.HandinIconsMap = {}
AAPClassic.Tooltips = {}
AAPClassic.Tooltips2 = {}
AAPClassic.TooltipsMap = {}
AAPClassic.TooltipsMap2 = {}
AAPClassic.PickupTooltips = {}
AAPClassic.PickupTooltips2 = {}
AAPClassic.DotColorNr = 0
AAPClassic.MapMobListNr = 0
AAPClassic.ActiveMapIcons = 0
AAPClassic.ActiveIcons = 0
AAPClassic.DotColorQList = {}
AAPClassic["DotColorList"] = {
	[1] = {
		1,
		0,
		0,
	},
	[2] = {
		0,
		1,
		0,
	},
	[3] = {
		0,
		0,
		1,
	},
	[4] = {
		1,
		1,
		0,
	},
	[5] = {
		1,
		0,
		1,
	},
	[6] = {
		0,
		1,
		1,
	},
	[7] = {
		1,
		0.5,
		0,
	},
	[8] = {
		1,
		0,
		0.5,
	},
	[9] = {
		0.5,
		1,
		0,
	},
	[10] = {
		0,
		1,
		0.5,
	},
	[11] = {
		0.5,
		0,
		1,
	},
	[12] = {
		0,
		0.5,
		1,
	},
	[13] = {
		0,
		0.2,
		1,
	},
	[14] = {
		0,
		1,
		0.2,
	},
	[15] = {
		1,
		0.2,
		0.4,
	},
	[16] = {
		1,
		0.6,
		0.1,
	},
	[17] = {
		0.6,
		0.2,
		0.1,
	},
	[18] = {
		0.2,
		0.9,
		0.1,
	},
}
AAPClassic["TranslateZones"] = {
	[1] = 1426,   --Dun Morogh 
	[2] = 0,   --Longshore 
	[3] = 1418,   --Badlands 
	[4] = 1419,   --Blasted Lands 
	[7] = 0,   --Blackwater Cove 
	[8] = 1435,   --Swamp of Sorrows 
	[9] = 0,   --Northshire Valley 
	[10] = 1431,   --Duskwood 
	[11] = 1437,   --Wetlands 
	[12] = 1429,   --Elwynn Forest  
	[13] = 0,   --The World Tree  
	[14] = 1411,   --Durotar  
	[15] = 1445,   --Dustwallow Marsh  
	[16] = 1447,   --Azshara  
	[17] = 1413,   --The Barrens  
	[18] = 0,   --Crystal Lake  
	[19] = 0,   --Zul'Gurub  
	[20] = 0,   --Moonbrook  
	[21] = 0,   --Kul Tiras  
	[22] = 0,   --Programmer Isle  
	[23] = 0,   --Northshire River  
	[24] = 0,   --Northshire Abbey  
	[25] = 0,   --Blackrock Mountain  
	[26] = 0,   --Lighthouse  
	[28] = 1422,   --Western Plaguelands  
	[30] = 0,   --Nine  
	[32] = 0,   --The Cemetary  
	[33] = 1434,   --Stranglethorn Vale  
	[34] = 0,   --Echo Ridge Mine  
	[35] = 0,   --Booty Bay  
	[36] = 1416,   --Alterac Mountains  
	[37] = 0,   --Lake Nazferiti  
	[38] = 1432,   --Loch Modan  
	[40] = 1436,   --Westfall  
	[41] = 1430,   --Deadwind Pass  
	[42] = 0,   --Darkshire  
	[43] = 0,   --Wild Shore  
	[44] = 1433,   --Redridge Mountains  
	[45] = 1417,   --Arathi Highlands  
	[46] = 1428,   --Burning Steppes  
	[47] = 1425,   --The Hinterlands  
	[49] = 0,   --Dead Man's Hole  
	[51] = 1427,   --Searing Gorge  
	[53] = 0,   --Thieves Camp  
	[54] = 0,   --Jasperlode Mine  
	[55] = 0,   --Valley of Heroes  
	[56] = 0,   --Heroes' Vigil  
	[57] = 0,   --Fargodeep Mine  
	[59] = 0,   --Northshire Vineyards  
	[60] = 0,   --Forest's Edge  
	[61] = 0,   --Thunder Falls  
	[62] = 0,   --Brackwell Pumpkin Patch  
	[63] = 0,   --The Stonefield Farm  
	[64] = 0,   --The Maclure Vineyards  
	[68] = 0,   --Lake Everstill  
	[69] = 1433,   --Lakeshire  
	[70] = 0,   --Stonewatch  
	[71] = 0,   --Stonewatch Falls  
	[72] = 0,   --The Dark Portal  
	[73] = 0,   --The Tainted Scar  
	[74] = 0,   --Pool of Tears  
	[75] = 0,   --Stonard  
	[76] = 0,   --Fallow Sanctuary  
	[77] = 0,   --Anvilmar  
	[80] = 0,   --Stormwind Mountains  
	[85] = 1420,   --Tirisfal Glades  
	[86] = 0,   --Stone Cairn Lake  
	[87] = 0,   --Goldshire  
	[88] = 0,   --Eastvale Logging Camp  
	[89] = 0,   --Mirror Lake Orchard  
	[91] = 0,   --Tower of Azora  
	[92] = 0,   --Mirror Lake  
	[93] = 0,   --Vul'Gol Ogre Mound  
	[94] = 0,   --Raven Hill  
	[95] = 0,   --Redridge Canyons  
	[96] = 0,   --Tower of Ilgalar  
	[97] = 0,   --Alther's Mill  
	[98] = 0,   --Rethban Caverns  
	[99] = 0,   --Rebel Camp  
	[100] = 0,   --Nesingwary's Expedition  
	[101] = 0,   --Kurzen's Compound  
	[102] = 0,   --Ruins of Zul'Kunda  
	[103] = 0,   --Ruins of Zul'Mamwe  
	[104] = 0,   --The Vile Reef  
	[105] = 0,   --Mosh'Ogg Ogre Mound  
	[106] = 0,   --The Stockpile  
	[107] = 0,   --Saldean's Farm  
	[108] = 0,   --Sentinel Hill  
	[109] = 0,   --Furlbrow's Pumpkin Farm  
	[111] = 0,   --Jangolode Mine  
	[113] = 0,   --Gold Coast Quarry  
	[115] = 0,   --Westfall Lighthouse  
	[116] = 0,   --Misty Valley  
	[117] = 0,   --Grom'gol Base Camp  
	[118] = 0,   --Whelgar's Excavation Site  
	[120] = 0,   --Westbrook Garrison  
	[121] = 0,   --Tranquil Gardens Cemetery  
	[122] = 0,   --Zuuldaia Ruins  
	[123] = 0,   --Bal'lal Ruins  
	[125] = 0,   --Kal'ai Ruins  
	[126] = 0,   --Tkashi Ruins  
	[127] = 0,   --Balia'mah Ruins  
	[128] = 0,   --Ziata'jai Ruins  
	[129] = 0,   --Mizjah Ruins  
	[130] = 1421,   --Silverpine Forest  
	[131] = 0,   --Kharanos  
	[132] = 0,   --Coldridge Valley  
	[133] = 0,   --Gnomeregan  
	[134] = 0,   --Gol'Bolar Quarry  
	[135] = 0,   --Frostmane Hold  
	[136] = 0,   --The Grizzled Den  
	[137] = 0,   --Brewnall Village  
	[138] = 0,   --Misty Pine Refuge  
	[139] = 1423,   --Eastern Plaguelands  
	[141] = 1438,   --Teldrassil  
	[142] = 0,   --Ironband's Excavation Site  
	[143] = 0,   --Mo'grosh Stronghold  
	[144] = 0,   --Thelsamar  
	[145] = 0,   --Algaz Gate  
	[146] = 0,   --Stonewrought Dam  
	[147] = 0,   --The Farstrider Lodge  
	[148] = 1439,   --Darkshore  
	[149] = 0,   --Silver Stream Mine  
	[150] = 0,   --Menethil Harbor  
	[151] = 0,   --Designer Island  
	[152] = 0,   --The Bulwark  
	[153] = 0,   --Ruins of Lordaeron  
	[154] = 0,   --Deathknell  
	[155] = 0,   --Night Web's Hollow  
	[156] = 0,   --Solliden Farmstead  
	[157] = 0,   --Agamand Mills  
	[158] = 0,   --Agamand Family Crypt  
	[159] = 0,   --Brill  
	[160] = 0,   --Whispering Gardens  
	[161] = 0,   --Terrace of Repose  
	[162] = 0,   --Brightwater Lake  
	[163] = 0,   --Gunther's Retreat  
	[164] = 0,   --Garren's Haunt  
	[165] = 0,   --Balnir Farmstead  
	[166] = 0,   --Cold Hearth Manor  
	[167] = 0,   --Crusader Outpost  
	[168] = 0,   --The North Coast  
	[169] = 0,   --Whispering Shore  
	[170] = 0,   --Lordamere Lake  
	[172] = 0,   --Fenris Isle  
	[173] = 0,   --Faol's Rest  
	[186] = 0,   --Dolanaar  
	[188] = 0,   --Shadowglen  
	[189] = 0,   --Steelgrill's Depot  
	[190] = 0,   --Hearthglen  
	[192] = 0,   --Northridge Lumber Camp  
	[193] = 0,   --Ruins of Andorhal  
	[195] = 0,   --School of Necromancy  
	[196] = 0,   --Uther's Tomb  
	[197] = 0,   --Sorrow Hill  
	[198] = 0,   --The Weeping Cave  
	[199] = 0,   --Felstone Field  
	[200] = 0,   --Dalson's Tears  
	[201] = 0,   --Gahrron's Withering  
	[202] = 0,   --The Writhing Haunt  
	[203] = 0,   --Mardenholde Keep  
	[204] = 0,   --Pyrewood Village  
	[205] = 0,   --Dun Modr  
	[207] = 0,   --The Great Sea  
	[208] = 0,   --Unused Ironcladcove  
	[209] = 0,   --Shadowfang Keep  
	[211] = 0,   --Iceflow Lake  
	[212] = 0,   --Helm's Bed Lake  
	[213] = 0,   --Deep Elem Mine  
	[214] = 0,   --The Great Sea  
	[215] = 1412,   --Mulgore  
	[219] = 0,   --Alexston Farmstead  
	[220] = 0,   --Red Cloud Mesa  
	[221] = 0,   --Camp Narache  
	[222] = 0,   --Bloodhoof Village  
	[223] = 0,   --Stonebull Lake  
	[224] = 0,   --Ravaged Caravan  
	[225] = 0,   --Red Rocks  
	[226] = 0,   --The Skittering Dark  
	[227] = 0,   --Valgan's Field  
	[228] = 0,   --The Sepulcher  
	[229] = 0,   --Olsen's Farthing  
	[230] = 0,   --The Greymane Wall  
	[231] = 0,   --Beren's Peril  
	[232] = 0,   --The Dawning Isles  
	[233] = 0,   --Ambermill  
	[235] = 0,   --Fenris Keep  
	[236] = 0,   --Shadowfang Keep  
	[237] = 0,   --The Decrepit Ferry  
	[238] = 0,   --Malden's Orchard  
	[239] = 0,   --The Ivar Patch  
	[240] = 0,   --The Dead Field  
	[241] = 0,   --The Rotting Orchard  
	[242] = 0,   --Brightwood Grove  
	[243] = 0,   --Forlorn Rowe  
	[244] = 0,   --The Whipple Estate  
	[245] = 0,   --The Yorgen Farmstead  
	[246] = 0,   --The Cauldron  
	[247] = 0,   --Grimesilt Dig Site  
	[249] = 0,   --Dreadmaul Rock  
	[250] = 0,   --Ruins of Thaurissan  
	[251] = 0,   --Flame Crest  
	[252] = 0,   --Blackrock Stronghold  
	[253] = 0,   --The Pillar of Ash  
	[254] = 0,   --Blackrock Mountain  
	[255] = 0,   --Altar of Storms  
	[256] = 0,   --Aldrassil  
	[257] = 0,   --Shadowthread Cave  
	[258] = 0,   --Fel Rock  
	[259] = 0,   --Lake Al'Ameth  
	[260] = 0,   --Starbreeze Village  
	[261] = 0,   --Gnarlpine Hold  
	[262] = 0,   --Ban'ethil Barrow Den  
	[263] = 0,   --The Cleft  
	[264] = 0,   --The Oracle Glade  
	[265] = 0,   --Wellspring River  
	[266] = 0,   --Wellspring Lake  
	[267] = 1424,   --Hillsbrad Foothills  
	[268] = 0,   --Azshara Crater  
	[269] = 0,   --Dun Algaz  
	[271] = 0,   --Southshore  
	[272] = 0,   --Tarren Mill  
	[275] = 0,   --Durnholde Keep  
	[276] = 0,   --Stonewrought Pass  
	[277] = 0,   --The Foothill Caverns  
	[278] = 0,   --Lordamere Internment Camp  
	[279] = 0,   --Dalaran  
	[280] = 0,   --Strahnbrad  
	[281] = 0,   --Ruins of Alterac  
	[282] = 0,   --Crushridge Hold  
	[283] = 0,   --Slaughter Hollow  
	[284] = 0,   --The Uplands  
	[285] = 0,   --Southpoint Tower  
	[286] = 0,   --Hillsbrad Fields  
	[287] = 0,   --Hillsbrad  
	[288] = 0,   --Azurelode Mine  
	[289] = 0,   --Nethander Stead  
	[290] = 0,   --Dun Garok  
	[293] = 0,   --Thoradin's Wall  
	[294] = 0,   --Eastern Strand  
	[295] = 0,   --Western Strand  
	[297] = 0,   --Jaguero Isle  
	[298] = 0,   --Baradin Bay  
	[299] = 0,   --Menethil Bay  
	[300] = 0,   --Misty Reed Strand  
	[301] = 0,   --The Savage Coast  
	[302] = 0,   --The Crystal Shore  
	[303] = 0,   --Shell Beach  
	[305] = 0,   --North Tide's Run  
	[306] = 0,   --South Tide's Run  
	[307] = 0,   --The Overlook Cliffs  
	[308] = 0,   --The Forbidding Sea  
	[309] = 0,   --Ironbeard's Tomb  
	[310] = 0,   --Crystalvein Mine  
	[311] = 0,   --Ruins of Aboraz  
	[312] = 0,   --Janeiro's Point  
	[313] = 0,   --Northfold Manor  
	[314] = 0,   --Go'Shek Farm  
	[315] = 0,   --Dabyrie's Farmstead  
	[316] = 0,   --Boulderfist Hall  
	[317] = 0,   --Witherbark Village  
	[318] = 0,   --Drywhisker Gorge  
	[320] = 0,   --Refuge Pointe  
	[321] = 0,   --Hammerfall  
	[322] = 0,   --Blackwater Shipwrecks  
	[323] = 0,   --O'Breen's Camp  
	[324] = 0,   --Stromgarde Keep  
	[325] = 0,   --The Tower of Arathor  
	[326] = 0,   --The Sanctum  
	[327] = 0,   --Faldir's Cove  
	[328] = 0,   --The Drowned Reef  
	[330] = 0,   --Thandol Span  
	[331] = 1440,   --Ashenvale  
	[332] = 0,   --The Great Sea  
	[333] = 0,   --Circle of East Binding  
	[334] = 0,   --Circle of West Binding  
	[335] = 0,   --Circle of Inner Binding  
	[336] = 0,   --Circle of Outer Binding  
	[337] = 0,   --Apocryphan's Rest  
	[338] = 0,   --Angor Fortress  
	[339] = 0,   --Lethlor Ravine  
	[340] = 0,   --Kargath  
	[341] = 0,   --Camp Kosh  
	[342] = 0,   --Camp Boff  
	[343] = 0,   --Camp Wurg  
	[344] = 0,   --Camp Cagg  
	[345] = 0,   --Agmond's End  
	[346] = 0,   --Hammertoe's Digsite  
	[347] = 0,   --Dustbelch Grotto  
	[348] = 0,   --Aerie Peak  
	[349] = 0,   --Wildhammer Keep  
	[350] = 0,   --Quel'Danil Lodge  
	[351] = 0,   --Skulk Rock  
	[352] = 0,   --Zun'watha  
	[353] = 0,   --Shadra'Alor  
	[354] = 0,   --Jintha'Alor  
	[355] = 0,   --The Altar of Zul  
	[356] = 0,   --Seradane  
	[357] = 1444,   --Feralas  
	[358] = 0,   --Brambleblade Ravine  
	[359] = 0,   --Bael Modan  
	[360] = 0,   --The Venture Co. Mine  
	[361] = 1448,   --Felwood  
	[362] = 0,   --Razor Hill  
	[363] = 0,   --Valley of Trials  
	[364] = 0,   --The Den  
	[365] = 0,   --Burning Blade Coven  
	[366] = 0,   --Kolkar Crag  
	[367] = 0,   --Sen'jin Village  
	[368] = 0,   --Echo Isles  
	[369] = 0,   --Thunder Ridge  
	[370] = 0,   --Drygulch Ravine  
	[371] = 0,   --Dustwind Cave  
	[372] = 0,   --Tiragarde Keep  
	[373] = 0,   --Scuttle Coast  
	[374] = 0,   --Bladefist Bay  
	[375] = 0,   --Deadeye Shore  
	[377] = 0,   --Southfury River  
	[378] = 0,   --Camp Taurajo  
	[379] = 0,   --Far Watch Post  
	[380] = 0,   --The Crossroads  
	[381] = 0,   --Boulder Lode Mine  
	[382] = 0,   --The Sludge Fen  
	[383] = 0,   --The Dry Hills  
	[384] = 0,   --Dreadmist Peak  
	[385] = 0,   --Northwatch Hold  
	[386] = 0,   --The Forgotten Pools  
	[387] = 0,   --Lushwater Oasis  
	[388] = 0,   --The Stagnant Oasis  
	[390] = 0,   --Field of Giants  
	[391] = 0,   --The Merchant Coast  
	[392] = 0,   --Ratchet  
	[393] = 0,   --Darkspear Strand  
	[396] = 0,   --Winterhoof Water Well  
	[397] = 0,   --Thunderhorn Water Well  
	[398] = 0,   --Wildmane Water Well  
	[399] = 0,   --Skyline Ridge  
	[400] = 1441,   --Thousand Needles  
	[401] = 0,   --The Tidus Stair  
	[403] = 0,   --Shady Rest Inn  
	[404] = 0,   --Bael'dun Digsite  
	[405] = 1443,   --Desolace  
	[406] = 1442,   --Stonetalon Mountains  
	[408] = 0,   --Gillijim's Isle  
	[409] = 0,   --Island of Doctor Lapidis  
	[410] = 0,   --Razorwind Canyon  
	[411] = 0,   --Bathran's Haunt  
	[412] = 0,   --The Ruins of Ordil'Aran  
	[413] = 0,   --Maestra's Post  
	[414] = 0,   --The Zoram Strand  
	[415] = 0,   --Astranaar  
	[416] = 0,   --The Shrine of Aessina  
	[417] = 0,   --Fire Scar Shrine  
	[418] = 0,   --The Ruins of Stardust  
	[419] = 0,   --The Howling Vale  
	[420] = 0,   --Silverwind Refuge  
	[421] = 0,   --Mystral Lake  
	[422] = 0,   --Fallen Sky Lake  
	[424] = 0,   --Iris Lake  
	[425] = 0,   --Moonwell  
	[426] = 0,   --Raynewood Retreat  
	[427] = 0,   --The Shady Nook  
	[428] = 0,   --Night Run  
	[429] = 0,   --Xavian  
	[430] = 0,   --Satyrnaar  
	[431] = 0,   --Splintertree Post  
	[432] = 0,   --The Dor'Danil Barrow Den  
	[433] = 0,   --Falfarren River  
	[434] = 0,   --Felfire Hill  
	[435] = 0,   --Demon Fall Canyon  
	[436] = 0,   --Demon Fall Ridge  
	[437] = 0,   --Warsong Lumber Camp  
	[438] = 0,   --Bough Shadow  
	[439] = 0,   --The Shimmering Flats  
	[440] = 1446,   --Tanaris  
	[441] = 0,   --Lake Falathim  
	[442] = 0,   --Auberdine  
	[443] = 0,   --Ruins of Mathystra  
	[444] = 0,   --Tower of Althalaxx  
	[445] = 0,   --Cliffspring Falls  
	[446] = 0,   --Bashal'Aran  
	[447] = 0,   --Ameth'Aran  
	[448] = 0,   --Grove of the Ancients  
	[449] = 0,   --The Master's Glaive  
	[450] = 0,   --Remtravel's Excavation  
	[452] = 0,   --Mist's Edge  
	[453] = 0,   --The Long Wash  
	[454] = 0,   --Wildbend River  
	[455] = 0,   --Blackwood Den  
	[456] = 0,   --Cliffspring River  
	[457] = 0,   --The Veiled Sea  
	[458] = 0,   --Gold Road  
	[459] = 0,   --Scarlet Watch Post  
	[460] = 0,   --Sun Rock Retreat  
	[461] = 0,   --Windshear Crag  
	[463] = 0,   --Cragpool Lake  
	[464] = 0,   --Mirkfallon Lake  
	[465] = 0,   --The Charred Vale  
	[466] = 0,   --Valley of the Bloodfuries  
	[467] = 0,   --Stonetalon Peak  
	[468] = 0,   --The Talon Den  
	[469] = 0,   --Greatwood Vale  
	[471] = 0,   --Brave Wind Mesa  
	[472] = 0,   --Fire Stone Mesa  
	[473] = 0,   --Mantle Rock  
	[477] = 0,   --Ruins of Jubuwal  
	[478] = 0,   --Pools of Arlithrien  
	[479] = 0,   --The Rustmaul Dig Site  
	[480] = 0,   --Camp E'thok  
	[481] = 0,   --Splithoof Crag  
	[482] = 0,   --Highperch  
	[483] = 0,   --The Screeching Canyon  
	[484] = 0,   --Freewind Post  
	[485] = 0,   --The Great Lift  
	[486] = 0,   --Galak Hold  
	[487] = 0,   --Roguefeather Den  
	[488] = 0,   --The Weathered Nook  
	[489] = 0,   --Thalanaar  
	[490] = 1449,   --Un'Goro Crater  
	[491] = 0,   --Razorfen Kraul  
	[492] = 0,   --Raven Hill Cemetery  
	[493] = 1450,   --Moonglade  
	[496] = 0,   --Brackenwall Village  
	[497] = 0,   --Swamplight Manor  
	[498] = 0,   --Bloodfen Burrow  
	[499] = 0,   --Darkmist Cavern  
	[500] = 0,   --Moggle Point  
	[501] = 0,   --Beezil's Wreck  
	[502] = 0,   --Witch Hill  
	[503] = 0,   --Sentry Point  
	[504] = 0,   --North Point Tower  
	[505] = 0,   --West Point Tower  
	[506] = 0,   --Lost Point  
	[507] = 0,   --Bluefen  
	[508] = 0,   --Stonemaul Ruins  
	[509] = 0,   --The Den of Flame  
	[510] = 0,   --The Dragonmurk  
	[511] = 0,   --Wyrmbog  
	[512] = 0,   --Onyxia's Lair  
	[513] = 0,   --Theramore Isle  
	[514] = 0,   --Foothold Citadel  
	[515] = 0,   --Ironclad Prison  
	[516] = 0,   --Dustwallow Bay  
	[517] = 0,   --Tidefury Cove  
	[518] = 0,   --Dreadmurk Shore  
	[536] = 0,   --Addle's Stead  
	[537] = 0,   --Fire Plume Ridge  
	[538] = 0,   --Lakkari Tar Pits  
	[539] = 0,   --Terror Run  
	[540] = 0,   --The Slithering Scar  
	[541] = 0,   --Marshal's Refuge  
	[542] = 0,   --Fungal Rock  
	[543] = 0,   --Golakka Hot Springs  
	[556] = 0,   --The Loch  
	[576] = 0,   --Beggar's Haunt  
	[596] = 0,   --Kodo Graveyard  
	[597] = 0,   --Ghost Walker Post  
	[598] = 0,   --Sar'theris Strand  
	[599] = 0,   --Thunder Axe Fortress  
	[600] = 0,   --Bolgan's Hole  
	[602] = 0,   --Mannoroc Coven  
	[603] = 0,   --Sargeron  
	[604] = 0,   --Magram Village  
	[606] = 0,   --Gelkis Village  
	[607] = 0,   --Valley of Spears  
	[608] = 0,   --Nijel's Point  
	[609] = 0,   --Kolkar Village  
	[616] = 0,   --Hyjal  
	[618] = 1452,   --Winterspring  
	[636] = 0,   --Blackwolf River  
	[637] = 0,   --Kodo Rock  
	[638] = 0,   --Hidden Path  
	[639] = 0,   --Spirit Rock  
	[640] = 0,   --Shrine of the Dormant Flame  
	[656] = 0,   --Lake Elune'ara  
	[657] = 0,   --The Harborage  
	[676] = 0,   --Outland  
	[696] = 0,   --Craftsmen's Terrace  
	[697] = 0,   --Tradesmen's Terrace  
	[698] = 0,   --The Temple Gardens  
	[699] = 0,   --Temple of Elune  
	[700] = 0,   --Cenarion Enclave  
	[701] = 0,   --Warrior's Terrace  
	[702] = 0,   --Rut'theran Village  
	[716] = 0,   --Ironband's Compound  
	[717] = 0,   --The Stockade  
	[718] = 0,   --Wailing Caverns  
	[719] = 0,   --Blackfathom Deeps  
	[720] = 0,   --Fray Island  
	[721] = 0,   --Gnomeregan  
	[722] = 0,   --Razorfen Downs  
	[736] = 0,   --Ban'ethil Hollow  
	[796] = 0,   --Scarlet Monastery  
	[797] = 0,   --Jerod's Landing  
	[798] = 0,   --Ridgepoint Tower  
	[799] = 0,   --The Darkened Bank  
	[800] = 0,   --Coldridge Pass  
	[801] = 0,   --Chill Breeze Valley  
	[802] = 0,   --Shimmer Ridge  
	[803] = 0,   --Amberstill Ranch  
	[804] = 0,   --The Tundrid Hills  
	[805] = 0,   --South Gate Pass  
	[806] = 0,   --South Gate Outpost  
	[807] = 0,   --North Gate Pass  
	[808] = 0,   --North Gate Outpost  
	[809] = 0,   --Gates of Ironforge  
	[810] = 0,   --Stillwater Pond  
	[811] = 0,   --Nightmare Vale  
	[812] = 0,   --Venomweb Vale  
	[813] = 0,   --The Bulwark  
	[814] = 0,   --Southfury River  
	[815] = 0,   --Southfury River  
	[816] = 0,   --Razormane Grounds  
	[817] = 0,   --Skull Rock  
	[818] = 0,   --Palemane Rock  
	[819] = 0,   --Windfury Ridge  
	[820] = 0,   --The Golden Plains  
	[821] = 0,   --The Rolling Plains  
	[836] = 0,   --Dun Algaz  
	[837] = 0,   --Dun Algaz  
	[838] = 0,   --North Gate Pass  
	[839] = 0,   --South Gate Pass  
	[856] = 0,   --Twilight Grove  
	[876] = 0,   --GM Island  
	[878] = 0,   --Southfury River  
	[879] = 0,   --Southfury River  
	[880] = 0,   --Thandol Span  
	[881] = 0,   --Thandol Span  
	[896] = 0,   --Purgation Isle  
	[916] = 0,   --The Jansen Stead  
	[917] = 0,   --The Dead Acre  
	[918] = 0,   --The Molsen Farm  
	[919] = 0,   --Stendel's Pond  
	[920] = 0,   --The Dagger Hills  
	[921] = 0,   --Demont's Place  
	[922] = 0,   --The Dust Plains  
	[923] = 0,   --Stonesplinter Valley  
	[924] = 0,   --Valley of Kings  
	[925] = 0,   --Algaz Station  
	[926] = 0,   --Bucklebree Farm  
	[927] = 0,   --The Shining Strand  
	[928] = 0,   --North Tide's Hollow  
	[936] = 0,   --Grizzlepaw Ridge  
	[956] = 0,   --The Verdant Fields  
	[976] = 0,   --Gadgetzan  
	[977] = 0,   --Steamwheedle Port  
	[978] = 0,   --Zul'Farrak  
	[979] = 0,   --Sandsorrow Watch  
	[980] = 0,   --Thistleshrub Valley  
	[981] = 0,   --The Gaping Chasm  
	[982] = 0,   --The Noxious Lair  
	[983] = 0,   --Dunemaul Compound  
	[984] = 0,   --Eastmoon Ruins  
	[985] = 0,   --Waterspring Field  
	[986] = 0,   --Zalashji's Den  
	[987] = 0,   --Land's End Beach  
	[988] = 0,   --Wavestrider Beach  
	[989] = 0,   --Uldum  
	[990] = 0,   --Valley of the Watchers  
	[991] = 0,   --Gunstan's Post  
	[992] = 0,   --Southmoon Ruins  
	[996] = 0,   --Render's Camp  
	[997] = 0,   --Render's Valley  
	[998] = 0,   --Render's Rock  
	[999] = 0,   --Stonewatch Tower  
	[1000] = 0,   --Galardell Valley 
	[1001] = 0,   --Lakeridge Highway 
	[1002] = 0,   --Three Corners 
	[1016] = 0,   --Direforge Hill 
	[1017] = 0,   --Raptor Ridge 
	[1018] = 0,   --Black Channel Marsh 
	[1019] = 0,   --The Green Belt 
	[1020] = 0,   --Mosshide Fen 
	[1021] = 0,   --Thelgen Rock 
	[1022] = 0,   --Bluegill Marsh 
	[1023] = 0,   --Saltspray Glen 
	[1024] = 0,   --Sundown Marsh 
	[1025] = 0,   --The Green Belt 
	[1036] = 0,   --Angerfang Encampment 
	[1037] = 0,   --Grim Batol 
	[1038] = 0,   --Dragonmaw Gates 
	[1039] = 0,   --The Lost Fleet 
	[1056] = 0,   --Darrow Hill 
	[1057] = 0,   --Thoradin's Wall 
	[1076] = 0,   --Webwinder Path 
	[1097] = 0,   --The Hushed Bank 
	[1098] = 0,   --Manor Mistmantle 
	[1099] = 0,   --Camp Mojache 
	[1100] = 0,   --Grimtotem Compound 
	[1101] = 0,   --The Writhing Deep 
	[1102] = 0,   --Wildwind Lake 
	[1103] = 0,   --Gordunni Outpost 
	[1104] = 0,   --Mok'Gordun 
	[1105] = 0,   --Feral Scar Vale 
	[1106] = 0,   --Frayfeather Highlands 
	[1107] = 0,   --Idlewind Lake 
	[1108] = 0,   --The Forgotten Coast 
	[1109] = 0,   --East Pillar 
	[1110] = 0,   --West Pillar 
	[1111] = 0,   --Dream Bough 
	[1112] = 0,   --Jademir Lake 
	[1113] = 0,   --Oneiros 
	[1114] = 0,   --Ruins of Ravenwind 
	[1115] = 0,   --Rage Scar Hold 
	[1116] = 0,   --Feathermoon Stronghold 
	[1117] = 0,   --Ruins of Solarsal 
	[1119] = 0,   --The Twin Colossals 
	[1120] = 0,   --Sardor Isle 
	[1121] = 0,   --Isle of Dread 
	[1136] = 0,   --High Wilderness 
	[1137] = 0,   --Lower Wilds 
	[1156] = 0,   --Southern Barrens 
	[1157] = 0,   --Southern Gold Road 
	[1176] = 0,   --Zul'Farrak 
	[1216] = 0,   --Timbermaw Hold 
	[1217] = 0,   --Vanndir Encampment 
	[1219] = 0,   --Legash Encampment 
	[1220] = 0,   --Thalassian Base Camp 
	[1221] = 0,   --Ruins of Eldarath 
	[1222] = 0,   --Hetaera's Clutch 
	[1223] = 0,   --Temple of Zin-Malor 
	[1224] = 0,   --Bear's Head 
	[1225] = 0,   --Ursolan 
	[1226] = 0,   --Temple of Arkkoran 
	[1227] = 0,   --Bay of Storms 
	[1228] = 0,   --The Shattered Strand 
	[1229] = 0,   --Tower of Eldara 
	[1230] = 0,   --Jagged Reef 
	[1231] = 0,   --Southridge Beach 
	[1232] = 0,   --Ravencrest Monument 
	[1233] = 0,   --Forlorn Ridge 
	[1234] = 0,   --Lake Mennar 
	[1235] = 0,   --Shadowsong Shrine 
	[1236] = 0,   --Haldarr Encampment 
	[1237] = 0,   --Valormok 
	[1256] = 0,   --The Ruined Reaches 
	[1276] = 0,   --The Talondeep Path 
	[1277] = 0,   --The Talondeep Path 
	[1296] = 0,   --Rocktusk Farm 
	[1297] = 0,   --Jaggedswine Farm 
	[1316] = 0,   --Razorfen Downs 
	[1336] = 0,   --Lost Rigger Cove 
	[1337] = 0,   --Uldaman 
	[1338] = 0,   --Lordamere Lake 
	[1339] = 0,   --Lordamere Lake 
	[1357] = 0,   --Gallows' Corner 
	[1377] = 1451,   --Silithus 
	[1397] = 0,   --Emerald Forest 
	[1417] = 0,   --Sunken Temple 
	[1437] = 0,   --Dreadmaul Hold 
	[1438] = 0,   --Nethergarde Keep 
	[1439] = 0,   --Dreadmaul Post 
	[1440] = 0,   --Serpent's Coil 
	[1441] = 0,   --Altar of Storms 
	[1442] = 0,   --Firewatch Ridge 
	[1443] = 0,   --The Slag Pit 
	[1444] = 0,   --The Sea of Cinders 
	[1445] = 0,   --Blackrock Mountain 
	[1446] = 0,   --Thorium Point 
	[1457] = 0,   --Garrison Armory 
	[1477] = 0,   --The Temple of Atal'Hakkar 
	[1497] = 1458,   --Undercity 
	[1517] = 0,   --Uldaman 
	[1518] = 0,   --Not Used Deadmines 
	[1519] = 1453,   --Stormwind City 
	[1537] = 1455,   --Ironforge 
	[1557] = 0,   --Splithoof Hold 
	[1577] = 0,   --The Cape of Stranglethorn 
	[1578] = 0,   --Southern Savage Coast 
	[1579] = 0,   --Unused The Deadmines 	[002] = 0,   --
	[1580] = 0,   --Unused Ironclad Cove 	[003] = 0,   --
	[1581] = 0,   --The Deadmines 
	[1582] = 0,   --Ironclad Cove 
	[1583] = 0,   --Blackrock Spire 
	[1584] = 0,   --Blackrock Depths 
	[1597] = 0,   --Raptor Grounds UNUSED 
	[1598] = 0,   --Grol'dom Farm UNUSED 
	[1599] = 0,   --Mor'shan Base Camp 
	[1600] = 0,   --Honor's Stand UNUSED 
	[1601] = 0,   --Blackthorn Ridge UNUSED 
	[1602] = 0,   --Bramblescar UNUSED 
	[1603] = 0,   --Agama'gor UNUSED 
	[1617] = 0,   --Valley of Heroes 
	[1637] = 1454,   --Orgrimmar 
	[1638] = 1456,   --Thunder Bluff 
	[1639] = 0,   --Elder Rise 
	[1640] = 0,   --Spirit Rise 
	[1641] = 0,   --Hunter Rise 
	[1657] = 1457,   --Darnassus 
	[1658] = 0,   --Cenarion Enclave 
	[1659] = 0,   --Craftsmen's Terrace 
	[1660] = 0,   --Warrior's Terrace 
	[1661] = 0,   --The Temple Gardens 
	[1662] = 0,   --Tradesmen's Terrace 
	[1677] = 0,   --Gavin's Naze 
	[1678] = 0,   --Sofera's Naze 
	[1679] = 0,   --Corrahn's Dagger 
	[1680] = 0,   --The Headland 
	[1681] = 0,   --Misty Shore 
	[1682] = 0,   --Dandred's Fold 
	[1683] = 0,   --Growless Cave 
	[1684] = 0,   --Chillwind Point 
	[1697] = 0,   --Raptor Grounds 
	[1698] = 0,   --Bramblescar 
	[1699] = 0,   --Thorn Hill 
	[1700] = 0,   --Agama'gor 
	[1701] = 0,   --Blackthorn Ridge 
	[1702] = 0,   --Honor's Stand 
	[1703] = 0,   --The Mor'shan Rampart 
	[1704] = 0,   --Grol'dom Farm 
	[1717] = 0,   --Razorfen Kraul 
	[1718] = 0,   --The Great Lift 
	[1737] = 0,   --Mistvale Valley 
	[1738] = 0,   --Nek'mani Wellspring 
	[1739] = 0,   --Bloodsail Compound 
	[1740] = 0,   --Venture Co. Base Camp 
	[1741] = 0,   --Gurubashi Arena 
	[1742] = 0,   --Spirit Den 
	[1757] = 0,   --The Crimson Veil 
	[1758] = 0,   --The Riptide 
	[1759] = 0,   --The Damsel's Luck 
	[1760] = 0,   --Venture Co. Operations Center 
	[1761] = 0,   --Deadwood Village 
	[1762] = 0,   --Felpaw Village 
	[1763] = 0,   --Jaedenar 
	[1764] = 0,   --Bloodvenom River 
	[1765] = 0,   --Bloodvenom Falls 
	[1766] = 0,   --Shatter Scar Vale 
	[1767] = 0,   --Irontree Woods 
	[1768] = 0,   --Irontree Cavern 
	[1769] = 0,   --Timbermaw Hold 
	[1770] = 0,   --Shadow Hold 
	[1771] = 0,   --Shrine of the Deceiver 
	[1777] = 0,   --Itharius's Cave 
	[1778] = 0,   --Sorrowmurk 
	[1779] = 0,   --Draenil'dur Village 
	[1780] = 0,   --Splinterspear Junction 
	[1797] = 0,   --Stagalbog 
	[1798] = 0,   --The Shifting Mire 
	[1817] = 0,   --Stagalbog Cave 
	[1837] = 0,   --Witherbark Caverns 
	[1857] = 0,   --Thoradin's Wall 
	[1858] = 0,   --Boulder'gor 
	[1877] = 0,   --Valley of Fangs 
	[1878] = 0,   --The Dustbowl 
	[1879] = 0,   --Mirage Flats 
	[1880] = 0,   --Featherbeard's Hovel 
	[1881] = 0,   --Shindigger's Camp 
	[1882] = 0,   --Plaguemist Ravine 
	[1883] = 0,   --Valorwind Lake 
	[1884] = 0,   --Agol'watha 
	[1885] = 0,   --Hiri'watha 
	[1886] = 0,   --The Creeping Ruin 
	[1887] = 0,   --Bogen's Ledge 
	[1897] = 0,   --The Maker's Terrace 
	[1898] = 0,   --Dustwind Gulch 
	[1917] = 0,   --Shaol'watha 
	[1937] = 0,   --Noonshade Ruins 
	[1938] = 0,   --Broken Pillar 
	[1939] = 0,   --Abyssal Sands 
	[1940] = 0,   --Southbreak Shore 
	[1941] = 0,   --Caverns of Time 
	[1942] = 0,   --The Marshlands 
	[1943] = 0,   --Ironstone Plateau 
	[1957] = 0,   --Blackchar Cave 
	[1958] = 0,   --Tanner Camp 
	[1959] = 0,   --Dustfire Valley 
	[1977] = 0,   --Zul'Gurub 
	[1978] = 0,   --Misty Reed Post 
	[1997] = 0,   --Bloodvenom Post 
	[1998] = 0,   --Talonbranch Glade 
	[2017] = 0,   --Stratholme 
	[2037] = 0,   --Quel'thalas 
	[2057] = 0,   --Scholomance 
	[2077] = 0,   --Twilight Vale 
	[2078] = 0,   --Twilight Shore 
	[2079] = 0,   --Alcaz Island 
	[2097] = 0,   --Darkcloud Pinnacle 
	[2098] = 0,   --Dawning Wood Catacombs 
	[2099] = 0,   --Stonewatch Keep 
	[2100] = 0,   --Maraudon 
	[2101] = 0,   --Stoutlager Inn 
	[2102] = 0,   --Thunderbrew Distillery 
	[2103] = 0,   --Menethil Keep 
	[2104] = 0,   --Deepwater Tavern 
	[2117] = 0,   --Shadow Grave 
	[2118] = 0,   --Brill Town Hall 
	[2119] = 0,   --Gallows' End Tavern 
	[2137] = 0,   --The Pools of Vision 
	[2138] = 0,   --Dreadmist Den 
	[2157] = 0,   --Bael'dun Keep 
	[2158] = 0,   --Emberstrife's Den 
	[2159] = 0,   --Onyxia's Lair 
	[2160] = 0,   --Windshear Mine 
	[2161] = 0,   --Roland's Doom 
	[2177] = 0,   --Battle Ring 
	[2197] = 0,   --The Pools of Vision 
	[2198] = 0,   --Shadowbreak Ravine 
	[2217] = 0,   --Broken Spear Village 
	[2237] = 0,   --Whitereach Post 
	[2238] = 0,   --Gornia 
	[2239] = 0,   --Zane's Eye Crater 
	[2240] = 0,   --Mirage Raceway 
	[2241] = 0,   --Frostsaber Rock 
	[2242] = 0,   --The Hidden Grove 
	[2243] = 0,   --Timbermaw Post 
	[2244] = 0,   --Winterfall Village 
	[2245] = 0,   --Mazthoril 
	[2246] = 0,   --Frostfire Hot Springs 
	[2247] = 0,   --Ice Thistle Hills 
	[2248] = 0,   --Dun Mandarr 
	[2249] = 0,   --Frostwhisper Gorge 
	[2250] = 0,   --Owl Wing Thicket 
	[2251] = 0,   --Lake Kel'Theril 
	[2252] = 0,   --The Ruins of Kel'Theril 
	[2253] = 0,   --Starfall Village 
	[2254] = 0,   --Ban'Thallow Barrow Den 
	[2255] = 0,   --Everlook 
	[2256] = 0,   --Darkwhisper Gorge 
	[2257] = 0,   --Deeprun Tram 
	[2258] = 0,   --The Fungal Vale 
	[2259] = 0,   --The Marris Stead 
	[2260] = 0,   --The Marris Stead 
	[2261] = 0,   --The Undercroft 
	[2262] = 0,   --Darrowshire 
	[2263] = 0,   --Crown Guard Tower 
	[2264] = 0,   --Corin's Crossing 
	[2265] = 0,   --Scarlet Base Camp 
	[2266] = 0,   --Tyr's Hand 
	[2267] = 0,   --The Scarlet Basilica 
	[2268] = 0,   --Light's Hope Chapel 
	[2269] = 0,   --Browman Mill 
	[2270] = 0,   --The Noxious Glade 
	[2271] = 0,   --Eastwall Tower 
	[2272] = 0,   --Northdale 
	[2273] = 0,   --Zul'Mashar 
	[2274] = 0,   --Mazra'Alor 
	[2275] = 0,   --Northpass Tower 
	[2276] = 0,   --Quel'Lithien Lodge 
	[2277] = 0,   --Plaguewood 
	[2278] = 0,   --Scourgehold 
	[2279] = 0,   --Stratholme 
	[2280] = 0,   --Stratholme 
	[2297] = 0,   --Darrowmere Lake 
	[2298] = 0,   --Caer Darrow 
	[2299] = 0,   --Darrowmere Lake 
	[2300] = 0,   --Caverns of Time 
	[2301] = 0,   --Thistlefur Village 
	[2302] = 0,   --The Quagmire 
	[2303] = 0,   --Windbreak Canyon 
	[2317] = 0,   --South Seas 
	[2318] = 0,   --The Great Sea 
	[2319] = 0,   --The Great Sea 
	[2320] = 0,   --The Great Sea 
	[2321] = 0,   --The Great Sea 
	[2322] = 0,   --The Veiled Sea 
	[2323] = 0,   --The Veiled Sea 
	[2324] = 0,   --The Veiled Sea 
	[2325] = 0,   --The Veiled Sea 
	[2326] = 0,   --The Veiled Sea 
	[2337] = 0,   --Razor Hill Barracks 
	[2338] = 0,   --South Seas 
	[2339] = 0,   --The Great Sea 
	[2357] = 0,   --Bloodtooth Camp 
	[2358] = 0,   --Forest Song 
	[2359] = 0,   --Greenpaw Village 
	[2360] = 0,   --Silverwing Outpost 
	[2361] = 0,   --Nighthaven 
	[2362] = 0,   --Shrine of Remulos 
	[2363] = 0,   --Stormrage Barrow Dens 
	[2364] = 0,   --The Great Sea 
	[2365] = 0,   --The Great Sea 
	[2366] = 0,   --The Black Morass 
	[2367] = 0,   --Old Hillsbrad Foothills 
	[2368] = 0,   --Tarren Mill 
	[2369] = 0,   --Southshore 
	[2370] = 0,   --Durnholde Keep 
	[2371] = 0,   --Dun Garok 
	[2372] = 0,   --Hillsbrad Fields 
	[2373] = 0,   --Eastern Strand 
	[2374] = 0,   --Nethander Stead 
	[2375] = 0,   --Darrow Hill 
	[2376] = 0,   --Southpoint Tower 
	[2377] = 0,   --Thoradin's Wall 
	[2378] = 0,   --Western Strand 
	[2379] = 0,   --Azurelode Mine 
	[2397] = 0,   --The Great Sea 
	[2398] = 0,   --The Great Sea 
	[2399] = 0,   --The Great Sea 
	[2400] = 0,   --The Forbidding Sea 
	[2401] = 0,   --The Forbidding Sea 
	[2402] = 0,   --The Forbidding Sea 
	[2403] = 0,   --The Forbidding Sea 
	[2404] = 0,   --Tethris Aran 
	[2405] = 0,   --Ethel Rethor 
	[2406] = 0,   --Ranazjar Isle 
	[2407] = 0,   --Kormek's Hut 
	[2408] = 0,   --Shadowprey Village 
	[2417] = 0,   --Blackrock Pass 
	[2418] = 0,   --Morgan's Vigil 
	[2419] = 0,   --Slither Rock 
	[2420] = 0,   --Terror Wing Path 
	[2421] = 0,   --Draco'dar 
	[2437] = 0,   --Ragefire Chasm 
	[2457] = 0,   --Nightsong Woods 
	[2477] = 0,   --The Veiled Sea 
	[2478] = 0,   --Morlos'Aran 
	[2479] = 0,   --Emerald Sanctuary 
	[2480] = 0,   --Jadefire Glen 
	[2481] = 0,   --Ruins of Constellas 
	[2497] = 0,   --Bitter Reaches 
	[2517] = 0,   --Rise of the Defiler 
	[2518] = 0,   --Lariss Pavilion 
	[2519] = 0,   --Woodpaw Hills 
	[2520] = 0,   --Woodpaw Den 
	[2521] = 0,   --Verdantis River 
	[2522] = 0,   --Ruins of Isildien 
	[2537] = 0,   --Grimtotem Post 
	[2538] = 0,   --Camp Aparaje 
	[2539] = 0,   --Malaka'jin 
	[2540] = 0,   --Boulderslide Ravine 
	[2541] = 0,   --Sishir Canyon 
	[2557] = 0,   --Dire Maul 
	[2558] = 0,   --Deadwind Ravine 
	[2559] = 0,   --Diamondhead River 
	[2560] = 0,   --Ariden's Camp 
	[2561] = 0,   --The Vice 
	[2562] = 0,   --Karazhan 
	[2563] = 0,   --Morgan's Plot 
	[2577] = 0,   --Dire Maul 
	[2597] = 1459,   --Alterac Valley 
	[2617] = 0,   --Scrabblescrew's Camp 
	[2618] = 0,   --Jadefire Run 
	[2619] = 0,   --Thondroril River 
	[2620] = 0,   --Thondroril River 
	[2621] = 0,   --Lake Mereldar 
	[2622] = 0,   --Pestilent Scar 
	[2623] = 0,   --The Infectis Scar 
	[2624] = 0,   --Blackwood Lake 
	[2625] = 0,   --Eastwall Gate 
	[2626] = 0,   --Terrorweb Tunnel 
	[2627] = 0,   --Terrordale 
	[2637] = 0,   --Kargathia Keep 
	[2657] = 0,   --Valley of Bones 
	[2677] = 0,   --Blackwing Lair 
	[2697] = 0,   --Deadman's Crossing 
	[2717] = 0,   --Molten Core 
	[2737] = 0,   --The Scarab Wall 
	[2738] = 0,   --Southwind Village 
	[2739] = 0,   --Twilight Base Camp 
	[2740] = 0,   --The Crystal Vale 
	[2741] = 0,   --The Scarab Dais 
	[2742] = 0,   --Hive'Ashi 
	[2743] = 0,   --Hive'Zora 
	[2744] = 0,   --Hive'Regal 
	[2757] = 0,   --Shrine of the Fallen Warrior 
	[2777] = 0,   --Alterac Valley 
	[2797] = 0,   --Blackfathom Deeps 
	[2837] = 0,   --The Master's Cellar 
	[2838] = 0,   --Stonewrought Pass 
	[2839] = 0,   --Alterac Valley 
	[2857] = 0,   --The Rumble Cage 
	[2877] = 0,   --Chunk Test 
	[2897] = 0,   --Zoram'gar Outpost 
	[2917] = 0,   --Hall of Legends 
	[2918] = 0,   --Champions' Hall 
	[2937] = 0,   --Grosh'gok Compound 
	[2938] = 0,   --Sleeping Gorge 
	[2957] = 0,   --Irondeep Mine 
	[2958] = 0,   --Stonehearth Outpost 
	[2959] = 0,   --Dun Baldar 
	[2960] = 0,   --Icewing Pass 
	[2961] = 0,   --Frostwolf Village 
	[2962] = 0,   --Tower Point 
	[2963] = 0,   --Coldtooth Mine 
	[2964] = 0,   --Winterax Hold 
	[2977] = 0,   --Iceblood Garrison 
	[2978] = 0,   --Frostwolf Keep 
	[2979] = 0,   --Tor'kren Farm 
	[3017] = 0,   --Frost Dagger Pass 
	[3037] = 0,   --Ironstone Camp 
	[3038] = 0,   --Weazel's Crater 
	[3039] = 0,   --Tahonda Ruins 
	[3057] = 0,   --Field of Strife 
	[3058] = 0,   --Icewing Cavern 
	[3077] = 0,   --Valor's Rest 
	[3097] = 0,   --The Swarming Pillar 
	[3098] = 0,   --Twilight Post 
	[3099] = 0,   --Twilight Outpost 
	[3100] = 0,   --Ravaged Twilight Camp 
	[3117] = 0,   --Shalzaru's Lair 
	[3137] = 0,   --Talrendis Point 
	[3138] = 0,   --Rethress Sanctum 
	[3139] = 0,   --Moon Horror Den 
	[3140] = 0,   --Scalebeard's Cave 
	[3157] = 0,   --Boulderslide Cavern 
	[3177] = 0,   --Warsong Labor Camp 
	[3197] = 0,   --Chillwind Camp 
	[3217] = 0,   --The Maul 
	[3237] = 0,   --The Maul 
	[3257] = 0,   --Bones of Grakkarond 
	[3277] = 1460,   --Warsong Gulch 
	[3297] = 0,   --Frostwolf Graveyard 
	[3298] = 0,   --Frostwolf Pass 
	[3299] = 0,   --Dun Baldar Pass 
	[3300] = 0,   --Iceblood Graveyard 
	[3301] = 0,   --Snowfall Graveyard 
	[3302] = 0,   --Stonehearth Graveyard 
	[3303] = 0,   --Stormpike Graveyard 
	[3304] = 0,   --Icewing Bunker 
	[3305] = 0,   --Stonehearth Bunker 
	[3306] = 0,   --Wildpaw Ridge 
	[3317] = 0,   --Revantusk Village 
	[3318] = 0,   --Rock of Durotan 
	[3319] = 0,   --Silverwing Grove 
	[3320] = 0,   --Warsong Lumber Mill 
	[3321] = 0,   --Silverwing Hold 
	[3337] = 0,   --Wildpaw Cavern 
	[3338] = 0,   --The Veiled Cleft 
	[3357] = 0,   --Yojamba Isle 
	[3358] = 1461,   --Arathi Basin 
	[3377] = 0,   --The Coil 
	[3378] = 0,   --Altar of Hir'eek 
	[3379] = 0,   --Shadra'zaar 
	[3380] = 0,   --Hakkari Grounds 
	[3381] = 0,   --Naze of Shirvallah 
	[3382] = 0,   --Temple of Bethekk 
	[3383] = 0,   --The Bloodfire Pit 
	[3384] = 0,   --Altar of the Blood God 
	[3397] = 0,   --Zanza's Rise 
	[3398] = 0,   --Edge of Madness 
	[3417] = 0,   --Trollbane Hall 
	[3418] = 0,   --Defiler's Den 
	[3419] = 0,   --Pagle's Pointe 
	[3420] = 0,   --Farm 
	[3421] = 0,   --Blacksmith 
	[3422] = 0,   --Lumber Mill 
	[3423] = 0,   --Gold Mine 
	[3424] = 0,   --Stables 
	[3425] = 0,   --Cenarion Hold 
	[3426] = 0,   --Staghelm Point 
	[3427] = 0,   --Bronzebeard Encampment 
	[3428] = 0,   --Ahn'Qiraj 
	[3429] = 0,   --Ruins of Ahn'Qiraj 
	[3430] = 0,   --Eversong Woods 
	[3431] = 0,   --Sunstrider Isle 
	[3432] = 0,   --Shrine of Dath'Remar 
	[3433] = 0,   --Ghostlands 
	[3434] = 0,   --Scarab Terrace 
	[3435] = 0,   --General's Terrace 
	[3436] = 0,   --The Reservoir 
	[3437] = 0,   --The Hatchery 
	[3438] = 0,   --The Comb 
	[3439] = 0,   --Watchers' Terrace 
	[3440] = 0,   --Scarab Terrace 
	[3441] = 0,   --General's Terrace 
	[3442] = 0,   --The Reservoir 
	[3443] = 0,   --The Hatchery 
	[3444] = 0,   --The Comb 
	[3445] = 0,   --Watchers' Terrace 
	[3446] = 0,   --Twilight's Run 
	[3447] = 0,   --Ortell's Hideout 
	[3448] = 0,   --Scarab Terrace 
	[3449] = 0,   --General's Terrace 
	[3450] = 0,   --The Reservoir 
	[3451] = 0,   --The Hatchery 
	[3452] = 0,   --The Comb 
	[3453] = 0,   --Watchers' Terrace 
	[3454] = 0,   --Ruins of Ahn'Qiraj 
	[3455] = 0,   --The North Sea 
	[3456] = 0,   --Naxxramas 
	[3457] = 0,   --Karazhan 
	[3460] = 0,   --Golden Strand 
	[3461] = 0,   --Sunsail Anchorage 
	[3462] = 0,   --Fairbreeze Village 
	[3463] = 0,   --Magisters Gate 
	[3464] = 0,   --Farstrider Retreat 
	[3465] = 0,   --North Sanctum 
	[3466] = 0,   --West Sanctum 
	[3467] = 0,   --East Sanctum 
	[3468] = 0,   --Saltheril's Haven 
	[3469] = 0,   --Thuron's Livery 
	[3470] = 0,   --Stillwhisper Pond 
	[3471] = 0,   --The Living Wood 
	[3472] = 0,   --Azurebreeze Coast 
	[3473] = 0,   --Lake Elrendar 
	[3474] = 0,   --The Scorched Grove 
	[3475] = 0,   --Zeb'Watha 
	[3476] = 0,   --Tor'Watha 
	[3477] = 0,   --Karazhan 
	[3478] = 0,   --Gates of Ahn'Qiraj 
	[3479] = 0,   --The Veiled Sea 
	[3480] = 0,   --Duskwither Grounds 
	[3481] = 0,   --Duskwither Spire 
	[3482] = 0,   --The Dead Scar 
	[3483] = 0,   --Hellfire Peninsula 
	[3484] = 0,   --The Sunspire 
	[3485] = 0,   --Falthrien Academy 
	[3486] = 0,   --Ravenholdt Manor 
	[3487] = 0,   --Silvermoon City 
	[3488] = 0,   --Tranquillien 
	[3489] = 0,   --Suncrown Village 
	[3490] = 0,   --Goldenmist Village 
	[3491] = 0,   --Windrunner Village 
	[3492] = 0,   --Windrunner Spire 
	[3493] = 0,   --Sanctum of the Sun 
	[3494] = 0,   --Sanctum of the Moon 
	[3495] = 0,   --Dawnstar Spire 
	[3496] = 0,   --Farstrider Enclave 
	[3497] = 0,   --An'daroth 
	[3498] = 0,   --An'telas 
	[3499] = 0,   --An'owyn 
	[3500] = 0,   --Deatholme 
	[3501] = 0,   --Bleeding Ziggurat 
	[3502] = 0,   --Howling Ziggurat 
	[3503] = 0,   --Shalandis Isle 
	[3504] = 0,   --Toryl Estate 
	[3505] = 0,   --Underlight Mines 
	[3506] = 0,   --Andilien Estate 
	[3507] = 0,   --Hatchet Hills 
	[3508] = 0,   --Amani Pass 
	[3509] = 0,   --Sungraze Peak 
	[3510] = 0,   --Amani Catacombs 
	[3511] = 0,   --Tower of the Damned 
	[3512] = 0,   --Zeb'Sora 
	[3513] = 0,   --Lake Elrendar 
	[3514] = 0,   --The Dead Scar 
	[3515] = 0,   --Elrendar River 
	[3516] = 0,   --Zeb'Tela 
	[3517] = 0,   --Zeb'Nowa 
	[3518] = 0,   --Nagrand 
	[3519] = 0,   --Terokkar Forest 
	[3520] = 0,   --Shadowmoon Valley 
	[3521] = 0,   --Zangarmarsh 
	[3522] = 0,   --Blade's Edge Mountains 
	[3523] = 0,   --Netherstorm 
	[3524] = 0,   --Azuremyst Isle 
	[3525] = 0,   --Bloodmyst Isle 
	[3526] = 0,   --Ammen Vale 
	[3527] = 0,   --Crash Site 
	[3528] = 0,   --Silverline Lake 
	[3529] = 0,   --Nestlewood Thicket 
	[3530] = 0,   --Shadow Ridge 
	[3531] = 0,   --Skulking Row 
	[3532] = 0,   --Dawning Lane 
	[3533] = 0,   --Ruins of Silvermoon 
	[3534] = 0,   --Feth's Way 
	[3535] = 0,   --Hellfire Citadel 
	[3536] = 0,   --Thrallmar 
	[3537] = 0,   --REUSE 
	[3538] = 0,   --Honor Hold 
	[3539] = 0,   --The Stair of Destiny 
	[3540] = 0,   --Twisting Nether 
	[3541] = 0,   --Forge Camp: Mageddon 
	[3542] = 0,   --The Path of Glory 
	[3543] = 0,   --The Great Fissure 
	[3544] = 0,   --Plain of Shards 
	[3545] = 0,   --Hellfire Citadel 
	[3546] = 0,   --Expedition Armory 
	[3547] = 0,   --Throne of Kil'jaeden 
	[3548] = 0,   --Forge Camp: Rage 
	[3549] = 0,   --Invasion Point: Annihilator 
	[3550] = 0,   --Borune Ruins 
	[3551] = 0,   --Ruins of Sha'naar 
	[3552] = 0,   --Temple of Telhamat 
	[3553] = 0,   --Pools of Aggonar 
	[3554] = 0,   --Falcon Watch 
	[3555] = 0,   --Mag'har Post 
	[3556] = 0,   --Den of Haal'esh 
	[3557] = 0,   --The Exodar 
	[3558] = 0,   --Elrendar Falls 
	[3559] = 0,   --Nestlewood Hills 
	[3560] = 0,   --Ammen Fields 
	[3561] = 0,   --The Sacred Grove 
	[3562] = 0,   --Hellfire Ramparts 
	[3563] = 0,   --Hellfire Citadel 
	[3564] = 0,   --Emberglade 
	[3565] = 0,   --Cenarion Refuge 
	[3566] = 0,   --Moonwing Den 
	[3567] = 0,   --Pod Cluster 
	[3568] = 0,   --Pod Wreckage 
	[3569] = 0,   --Tides' Hollow 
	[3570] = 0,   --Wrathscale Point 
	[3571] = 0,   --Bristlelimb Village 
	[3572] = 0,   --Stillpine Hold 
	[3573] = 0,   --Odesyus' Landing 
	[3574] = 0,   --Valaar's Berth 
	[3575] = 0,   --Silting Shore 
	[3576] = 0,   --Azure Watch 
	[3577] = 0,   --Geezle's Camp 
	[3578] = 0,   --Menagerie Wreckage 
	[3579] = 0,   --Traitor's Cove 
	[3580] = 0,   --Wildwind Peak 
	[3581] = 0,   --Wildwind Path 
	[3582] = 0,   --Zeth'Gor 
	[3583] = 0,   --Beryl Coast 
	[3584] = 0,   --Blood Watch 
	[3585] = 0,   --Bladewood 
	[3586] = 0,   --The Vector Coil 
	[3587] = 0,   --The Warp Piston 
	[3588] = 0,   --The Cryo-Core 
	[3589] = 0,   --The Crimson Reach 
	[3590] = 0,   --Wrathscale Lair 
	[3591] = 0,   --Ruins of Loreth'Aran 
	[3592] = 0,   --Nazzivian 
	[3593] = 0,   --Axxarien 
	[3594] = 0,   --Blacksilt Shore 
	[3595] = 0,   --The Foul Pool 
	[3596] = 0,   --The Hidden Reef 
	[3597] = 0,   --Amberweb Pass 
	[3598] = 0,   --Wyrmscar Island 
	[3599] = 0,   --Talon Stand 
	[3600] = 0,   --Bristlelimb Enclave 
	[3601] = 0,   --Ragefeather Ridge 
	[3602] = 0,   --Kessel's Crossing 
	[3603] = 0,   --Tel'athion's Camp 
	[3604] = 0,   --The Bloodcursed Reef 
	[3605] = 0,   --Hyjal Past 
	[3606] = 0,   --Hyjal Summit 
	[3607] = 0,   --Coilfang Reservoir 
	[3608] = 0,   --Vindicator's Rest 
	[3610] = 0,   --Burning Blade Ruins 
	[3611] = 0,   --Clan Watch 
	[3612] = 0,   --Bloodcurse Isle 
	[3613] = 0,   --Garadar 
	[3614] = 0,   --Skysong Lake 
	[3615] = 0,   --Throne of the Elements 
	[3616] = 0,   --Laughing Skull Ruins 
	[3617] = 0,   --Warmaul Hill 
	[3618] = 0,   --Gruul's Lair 
	[3619] = 0,   --Auren Ridge 
	[3620] = 0,   --Auren Falls 
	[3621] = 0,   --Lake Sunspring 
	[3622] = 0,   --Sunspring Post 
	[3623] = 0,   --Aeris Landing 
	[3624] = 0,   --Forge Camp: Fear 
	[3625] = 0,   --Forge Camp: Hate 
	[3626] = 0,   --Telaar 
	[3627] = 0,   --Northwind Cleft 
	[3628] = 0,   --Halaa 
	[3629] = 0,   --Southwind Cleft 
	[3630] = 0,   --Oshu'gun 
	[3631] = 0,   --Spirit Fields 
	[3632] = 0,   --Shamanar 
	[3633] = 0,   --Ancestral Grounds 
	[3634] = 0,   --Windyreed Village 
	[3636] = 0,   --Elemental Plateau 
	[3637] = 0,   --Kil'sorrow Fortress 
	[3638] = 0,   --The Ring of Trials 
	[3639] = 0,   --Silvermyst Isle 
	[3640] = 0,   --Daggerfen Village 
	[3641] = 0,   --Umbrafen Village 
	[3642] = 0,   --Feralfen Village 
	[3643] = 0,   --Bloodscale Enclave 
	[3644] = 0,   --Telredor 
	[3645] = 0,   --Zabra'jin 
	[3646] = 0,   --Quagg Ridge 
	[3647] = 0,   --The Spawning Glen 
	[3648] = 0,   --The Dead Mire 
	[3649] = 0,   --Sporeggar 
	[3650] = 0,   --Ango'rosh Grounds 
	[3651] = 0,   --Ango'rosh Stronghold 
	[3652] = 0,   --Funggor Cavern 
	[3653] = 0,   --Serpent Lake 
	[3654] = 0,   --The Drain 
	[3655] = 0,   --Umbrafen Lake 
	[3656] = 0,   --Marshlight Lake 
	[3657] = 0,   --Portal Clearing 
	[3658] = 0,   --Sporewind Lake 
	[3659] = 0,   --The Lagoon 
	[3660] = 0,   --Blades' Run 
	[3661] = 0,   --Blade Tooth Canyon 
	[3662] = 0,   --Commons Hall 
	[3663] = 0,   --Derelict Manor 
	[3664] = 0,   --Huntress of the Sun 
	[3665] = 0,   --Falconwing Square 
	[3666] = 0,   --Halaani Basin 
	[3667] = 0,   --Hewn Bog 
	[3668] = 0,   --Boha'mu Ruins 
	[3669] = 0,   --The Stadium 
	[3670] = 0,   --The Overlook 
	[3671] = 0,   --Broken Hill 
	[3672] = 0,   --Mag'hari Procession 
	[3673] = 0,   --Nesingwary Safari 
	[3674] = 0,   --Cenarion Thicket 
	[3675] = 0,   --Tuurem 
	[3676] = 0,   --Veil Shienor 
	[3677] = 0,   --Veil Skith 
	[3678] = 0,   --Veil Shalas 
	[3679] = 0,   --Skettis 
	[3680] = 0,   --Blackwind Valley 
	[3681] = 0,   --Firewing Point 
	[3682] = 0,   --Grangol'var Village 
	[3683] = 0,   --Stonebreaker Hold 
	[3684] = 0,   --Allerian Stronghold 
	[3685] = 0,   --Bonechewer Ruins 
	[3686] = 0,   --Veil Lithic 
	[3687] = 0,   --Olembas 
	[3688] = 0,   --Auchindoun 
	[3689] = 0,   --Veil Reskk 
	[3690] = 0,   --Blackwind Lake 
	[3691] = 0,   --Lake Ere'Noru 
	[3692] = 0,   --Lake Jorune 
	[3693] = 0,   --Skethyl Mountains 
	[3694] = 0,   --Misty Ridge 
	[3695] = 0,   --The Broken Hills 
	[3696] = 0,   --The Barrier Hills 
	[3697] = 0,   --The Bone Wastes 
	[3698] = 0,   --Nagrand Arena 
	[3699] = 0,   --Laughing Skull Courtyard 
	[3700] = 0,   --The Ring of Blood 
	[3701] = 0,   --Arena Floor 
	[3702] = 0,   --Blade's Edge Arena 
	[3703] = 0,   --Shattrath City 
	[3704] = 0,   --The Shepherd's Gate 
	[3705] = 0,   --Telaari Basin 
	[3706] = 0,   --The Dark Portal 
	[3707] = 0,   --Alliance Base 
	[3708] = 0,   --Horde Encampment 
	[3709] = 0,   --Night Elf Village 
	[3710] = 0,   --Nordrassil 
	[3711] = 0,   --Black Temple 
	[3712] = 0,   --Area 	[52] = 0,   --
	[3713] = 0,   --The Blood Furnace 
	[3714] = 0,   --The Shattered Halls 
	[3715] = 0,   --The Steamvault 
	[3716] = 0,   --The Underbog 
	[3717] = 0,   --The Slave Pens 
	[3718] = 0,   --Swamprat Post 
	[3719] = 0,   --Bleeding Hollow Ruins 
	[3720] = 0,   --Twin Spire Ruins 
	[3721] = 0,   --The Crumbling Waste 
	[3722] = 0,   --Manaforge Ara 
	[3723] = 0,   --Arklon Ruins 
	[3724] = 0,   --Cosmowrench 
	[3725] = 0,   --Ruins of Enkaat 
	[3726] = 0,   --Manaforge B'naar 
	[3727] = 0,   --The Scrap Field 
	[3728] = 0,   --The Vortex Fields 
	[3729] = 0,   --The Heap 
	[3730] = 0,   --Manaforge Coruu 
	[3731] = 0,   --The Tempest Rift 
	[3732] = 0,   --Kirin'Var Village 
	[3733] = 0,   --The Violet Tower 
	[3734] = 0,   --Manaforge Duro 
	[3735] = 0,   --Voidwind Plateau 
	[3736] = 0,   --Manaforge Ultris 
	[3737] = 0,   --Celestial Ridge 
	[3738] = 0,   --The Stormspire 
	[3739] = 0,   --Forge Base: Oblivion 
	[3740] = 0,   --Forge Base: Gehenna 
	[3741] = 0,   --Ruins of Farahlon 
	[3742] = 0,   --Socrethar's Seat 
	[3743] = 0,   --Legion Hold 
	[3744] = 0,   --Shadowmoon Village 
	[3745] = 0,   --Wildhammer Stronghold 
	[3746] = 0,   --The Hand of Gul'dan 
	[3747] = 0,   --The Fel Pits 
	[3748] = 0,   --The Deathforge 
	[3749] = 0,   --Coilskar Cistern 
	[3750] = 0,   --Coilskar Point 
	[3751] = 0,   --Sunfire Point 
	[3752] = 0,   --Illidari Point 
	[3753] = 0,   --Ruins of Baa'ri 
	[3754] = 0,   --Altar of Sha'tar 
	[3755] = 0,   --The Stair of Doom 
	[3756] = 0,   --Ruins of Karabor 
	[3757] = 0,   --Ata'mal Terrace 
	[3758] = 0,   --Netherwing Fields 
	[3759] = 0,   --Netherwing Ledge 
	[3760] = 0,   --The Barrier Hills 
	[3761] = 0,   --The High Path 
	[3762] = 0,   --Windyreed Pass 
	[3763] = 0,   --Zangar Ridge 
	[3764] = 0,   --The Twilight Ridge 
	[3765] = 0,   --Razorthorn Trail 
	[3766] = 0,   --Orebor Harborage 
	[3767] = 0,   --Blades' Run 
	[3768] = 0,   --Jagged Ridge 
	[3769] = 0,   --Thunderlord Stronghold 
	[3770] = 0,   --Blade Tooth Canyon 
	[3771] = 0,   --The Living Grove 
	[3772] = 0,   --Sylvanaar 
	[3773] = 0,   --Bladespire Hold 
	[3774] = 0,   --Gruul's Lair 
	[3775] = 0,   --Circle of Blood 
	[3776] = 0,   --Bloodmaul Outpost 
	[3777] = 0,   --Bloodmaul Camp 
	[3778] = 0,   --Draenethyst Mine 
	[3779] = 0,   --Trogma's Claim 
	[3780] = 0,   --Blackwing Coven 
	[3781] = 0,   --Grishnath 
	[3782] = 0,   --Veil Lashh 
	[3783] = 0,   --Veil Vekh 
	[3784] = 0,   --Forge Camp: Terror 
	[3785] = 0,   --Forge Camp: Wrath 
	[3786] = 0,   --Felstorm Point 
	[3787] = 0,   --Forge Camp: Anger 
	[3788] = 0,   --The Low Path 
	[3789] = 0,   --Shadow Labyrinth 
	[3790] = 0,   --Auchenai Crypts 
	[3791] = 0,   --Sethekk Halls 
	[3792] = 0,   --Mana-Tombs 
	[3793] = 0,   --Felspark Ravine 
	[3794] = 0,   --Valley of Bones 
	[3795] = 0,   --Sha'naari Wastes 
	[3796] = 0,   --The Warp Fields 
	[3797] = 0,   --Fallen Sky Ridge 
	[3798] = 0,   --Haal'eshi Gorge 
	[3799] = 0,   --Stonewall Canyon 
	[3800] = 0,   --Thornfang Hill 
	[3801] = 0,   --Mag'har Grounds 
	[3802] = 0,   --Void Ridge 
	[3803] = 0,   --The Abyssal Shelf 
	[3804] = 0,   --The Legion Front 
	[3805] = 0,   --Zul'Aman 
	[3806] = 0,   --Supply Caravan 
	[3807] = 0,   --Reaver's Fall 
	[3808] = 0,   --Cenarion Post 
	[3809] = 0,   --Southern Rampart 
	[3810] = 0,   --Northern Rampart 
	[3811] = 0,   --Gor'gaz Outpost 
	[3812] = 0,   --Spinebreaker Post 
	[3813] = 0,   --The Path of Anguish 
	[3814] = 0,   --East Supply Caravan 
	[3815] = 0,   --Expedition Point 
	[3816] = 0,   --Zeppelin Crash 
	[3817] = 0,   --Testing 
	[3818] = 0,   --Bloodscale Grounds 
	[3819] = 0,   --Darkcrest Enclave 
	[3820] = 0,   --Eye of the Storm 
	[3821] = 0,   --Warden's Cage 
	[3822] = 0,   --Eclipse Point 
	[3823] = 0,   --Isle of Tribulations 
	[3824] = 0,   --Bloodmaul Ravine 
	[3825] = 0,   --Dragons' End 
	[3826] = 0,   --Daggermaw Canyon 
	[3827] = 0,   --Vekhaar Stand 
	[3828] = 0,   --Ruuan Weald 
	[3829] = 0,   --Veil Ruuan 
	[3830] = 0,   --Raven's Wood 
	[3831] = 0,   --Death's Door 
	[3832] = 0,   --Vortex Pinnacle 
	[3833] = 0,   --Razor Ridge 
	[3834] = 0,   --Ridge of Madness 
	[3835] = 0,   --Dustquill Ravine 
	[3836] = 0,   --Magtheridon's Lair 
	[3837] = 0,   --Sunfury Hold 
	[3838] = 0,   --Spinebreaker Mountains 
	[3839] = 0,   --Abandoned Armory 
	[3840] = 0,   --The Black Temple 
	[3841] = 0,   --Darkcrest Shore 
	[3842] = 0,   --Tempest Keep 
	[3844] = 0,   --Mok'Nathal Village 
	[3845] = 0,   --Tempest Keep 
	[3846] = 0,   --The Arcatraz 
	[3847] = 0,   --The Botanica 
	[3848] = 0,   --The Arcatraz 
	[3849] = 0,   --The Mechanar 
	[3850] = 0,   --Netherstone 
	[3851] = 0,   --Midrealm Post 
	[3852] = 0,   --Tuluman's Landing 
	[3854] = 0,   --Protectorate Watch Post 
	[3855] = 0,   --Circle of Blood Arena 
	[3856] = 0,   --Elrendar Crossing 
	[3857] = 0,   --Ammen Ford 
	[3858] = 0,   --Razorthorn Shelf 
	[3859] = 0,   --Silmyr Lake 
	[3860] = 0,   --Raastok Glade 
	[3861] = 0,   --Thalassian Pass 
	[3862] = 0,   --Churning Gulch 
	[3863] = 0,   --Broken Wilds 
	[3864] = 0,   --Bash'ir Landing 
	[3865] = 0,   --Crystal Spine 
	[3866] = 0,   --Skald 
	[3867] = 0,   --Bladed Gulch 
	[3868] = 0,   --Gyro-Plank Bridge 
	[3869] = 0,   --Mage Tower 
	[3870] = 0,   --Blood Elf Tower 
	[3871] = 0,   --Draenei Ruins 
	[3872] = 0,   --Fel Reaver Ruins 
	[3873] = 0,   --The Proving Grounds 
	[3874] = 0,   --Eco-Dome Farfield 
	[3875] = 0,   --Eco-Dome Skyperch 
	[3876] = 0,   --Eco-Dome Sutheron 
	[3877] = 0,   --Eco-Dome Midrealm 
	[3878] = 0,   --Ethereum Staging Grounds 
	[3879] = 0,   --Chapel Yard 
	[3880] = 0,   --Access Shaft Zeon 
	[3881] = 0,   --Trelleum Mine 
	[3882] = 0,   --Invasion Point: Destroyer 
	[3883] = 0,   --Camp of Boom 
	[3884] = 0,   --Spinebreaker Pass 
	[3885] = 0,   --Netherweb Ridge 
	[3886] = 0,   --Derelict Caravan 
	[3887] = 0,   --Refugee Caravan 
	[3888] = 0,   --Shadow Tomb 
	[3889] = 0,   --Veil Rhaze 
	[3890] = 0,   --Tomb of Lights 
	[3891] = 0,   --Carrion Hill 
	[3892] = 0,   --Writhing Mound 
	[3893] = 0,   --Ring of Observance 
	[3894] = 0,   --Auchenai Grounds 
	[3895] = 0,   --Cenarion Watchpost 
	[3896] = 0,   --Aldor Rise 
	[3897] = 0,   --Terrace of Light 
	[3898] = 0,   --Scryer's Tier 
	[3899] = 0,   --Lower City 
	[3900] = 0,   --Invasion Point: Overlord 
	[3901] = 0,   --Allerian Post 
	[3902] = 0,   --Stonebreaker Camp 
	[3903] = 0,   --Boulder'mok 
	[3904] = 0,   --Cursed Hollow 
	[3905] = 0,   --Coilfang Reservoir 
	[3906] = 0,   --The Bloodwash 
	[3907] = 0,   --Veridian Point 
	[3908] = 0,   --Middenvale 
	[3909] = 0,   --The Lost Fold 
	[3910] = 0,   --Mystwood 
	[3911] = 0,   --Tranquil Shore 
	[3912] = 0,   --Goldenbough Pass 
	[3913] = 0,   --Runestone Falithas 
	[3914] = 0,   --Runestone Shan'dor 
	[3915] = 0,   --Fairbridge Strand 
	[3916] = 0,   --Moongraze Woods 
	[3917] = 0,   --Auchindoun 
	[3918] = 0,   --Toshley's Station 
	[3919] = 0,   --Singing Ridge 
	[3920] = 0,   --Shatter Point 
	[3921] = 0,   --Arklonis Ridge 
	[3922] = 0,   --Bladespire Outpost 
	[3923] = 0,   --Gruul's Lair 
	[3924] = 0,   --Northmaul Tower 
	[3925] = 0,   --Southmaul Tower 
	[3926] = 0,   --Shattered Plains 
	[3927] = 0,   --Oronok's Farm 
	[3928] = 0,   --The Altar of Damnation 
	[3929] = 0,   --The Path of Conquest 
	[3930] = 0,   --Eclipsion Fields 
	[3931] = 0,   --Bladespire Grounds 
	[3932] = 0,   --Sketh'lon Base Camp 
	[3933] = 0,   --Sketh'lon Wreckage 
	[3934] = 0,   --Town Square 
	[3935] = 0,   --Wizard Row 
	[3936] = 0,   --Deathforge Tower 
	[3937] = 0,   --Slag Watch 
	[3938] = 0,   --Sanctum of the Stars 
	[3939] = 0,   --Dragonmaw Fortress 
	[3940] = 0,   --The Fetid Pool 
	[3942] = 0,   --Razaan's Landing 
	[3943] = 0,   --Invasion Point: Cataclysm 
	[3944] = 0,   --The Altar of Shadows 
	[3945] = 0,   --Netherwing Pass 
	[3946] = 0,   --Wayne's Refuge 
	[3947] = 0,   --The Scalding Pools 
	[3948] = 0,   --Brian and Pat Test 
	[3949] = 0,   --Magma Fields 
	[3950] = 0,   --Crimson Watch 
	[3951] = 0,   --Evergrove 
	[3952] = 0,   --Wyrmskull Bridge 
	[3953] = 0,   --Scalewing Shelf 
	[3954] = 0,   --Wyrmskull Tunnel 
	[3955] = 0,   --Hellfire Basin 
	[3956] = 0,   --The Shadow Stair 
	[3957] = 0,   --Sha'tari Outpost 
}
local MapRects = {};
local TempVec2D = CreateVector2D(0,0);
function AAPClassic.GetPlayerMapPos(MapID, dx, dy)
    local R,P,_ = MapRects[MapID],TempVec2D;
    if not R then
        R = {};
        _, R[1] = C_Map.GetWorldPosFromMapPos(MapID,CreateVector2D(0,0));
        _, R[2] = C_Map.GetWorldPosFromMapPos(MapID,CreateVector2D(1,1));
        R[2]:Subtract(R[1]);
        MapRects[MapID] = R;
    end
	if (dx) then
		P.x, P.y = dx, dy
	else
		P.x, P.y = UnitPosition('Player');
	end
    P:Subtract(R[1]);
    return (1/R[2].y)*P.y, (1/R[2].x)*P.x;
end


function AAPClassic.GetDotColors(qidz)
	--red, green, blue, alpha
	if (AAPClassic.DotColorQList[qidz]) then
		local nmb = AAPClassic.DotColorQList[qidz]
		return AAPClassic["DotColorList"][nmb]
	else
		AAPClassic.DotColorNr = AAPClassic.DotColorNr + 1
		AAPClassic.DotColorQList[qidz] = AAPClassic.DotColorNr
		return AAPClassic["DotColorList"][AAPClassic.DotColorNr]
	end
end

function AAPClassic.RemoveQuestIcons()
	local CLi2
	for CLi2 = 1, 20 do
		AAPClassic.PickupIcons[CLi2].A = 0
		AAPClassic.PickupIconsMap[CLi2].A = 0
		AAPClassic.HBDP:RemoveMinimapIcon("AAPClassicPickUp", AAPClassic.PickupIcons[CLi2])
		AAPClassic.HBDP:RemoveWorldMapIcon("AAPClassicPickUpMap", AAPClassic.PickupIconsMap[CLi2])
		AAPClassic.HandinIcons[CLi2].A = 0
		AAPClassic.HandinIconsMap[CLi2].A = 0
		AAPClassic.HBDP:RemoveMinimapIcon("AAPClassicHandin", AAPClassic.HandinIcons[CLi2])
		AAPClassic.HBDP:RemoveWorldMapIcon("AAPClassicHandinMap", AAPClassic.HandinIconsMap[CLi2])
		AAPClassic.PickupIcons[CLi2]:Hide()
		AAPClassic.PickupIconsMap[CLi2]:Hide()
		AAPClassic.HandinIcons[CLi2]:Hide()
		AAPClassic.HandinIconsMap[CLi2]:Hide()
	end
	--if (AAPClassic.QuestHelperEnable == "on") then	
		--AAPClassic.QH.ListDBOnMap = 1
	--end	
end
function AAPClassic.AddQuestPickUpIconFunc()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local mz = C_Map.GetBestMapForUnit("player")
	local IdList = Step["PickUp"]
	for h=1, getn(IdList) do
		local theqid = IdList[h]
		if (not AAPClassic.QuestList[theqid] and C_QuestLog.IsQuestFlaggedCompleted(theqid) == false) then
			local px, py = AAPClassic.GetPlayerMapPos(mz, Step["TT"]["y"], Step["TT"]["x"])
			AAPClassic.AddQuestPickUpIcon(mz, px, py)
		end
	end
end
function AAPClassic.AddQuestHandinIconFunc()
	local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
	local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
	local mz = C_Map.GetBestMapForUnit("player")
	local IdList = Step["Done"]
	if (IdList) then
	for h=1, getn(IdList) do
		local theqid = IdList[h]
		if (C_QuestLog.IsQuestFlaggedCompleted(theqid) == false) then
			local Ys, Xs
			if (Step and Step["TT"] and Step["TT"]["y"]) then
				Ys = Step["TT"]["y"]
				Xs = Step["TT"]["x"]
			end
			if (Ys and Xs) then
				local px, py = AAPClassic.GetPlayerMapPos(mz, Ys, Xs)
				if (AAPClassic.QuestHelperEnable == "on") then
					AAPClassic.AddQuestHandinIcon(mz, (Ys/100), (Xs/100))
				else
					AAPClassic.AddQuestHandinIcon(mz, px, py)
				end
			end
		end
	end
	end
end
function AAPClassic.AddQuestHandinIcon(SetMapIDs, px, py)
	local CLi2
	for CLi2 = 1, 20 do
		if (AAPClassic.HandinIcons[CLi2].A == 0) then
			AAPClassic.HBDP:AddMinimapIconMap("AAPClassicHandin", AAPClassic.HandinIcons[CLi2], SetMapIDs, px, py, true, false)
			AAPClassic.HandinIcons[CLi2]:Show()
			AAPClassic.HandinIcons[CLi2].A = 1
			break
		end
	end
	local CLi
	for CLi = 1, 20 do
		if (AAPClassic.HandinIconsMap[CLi].A == 0) then
			AAPClassic.HBDP:AddWorldMapIconMap("AAPClassicHandinMap", AAPClassic.HandinIconsMap[CLi], SetMapIDs, px, py, HBD_PINS_WORLDMAP_SHOW_PARENT)
			AAPClassic.HandinIconsMap[CLi]:Show()
			AAPClassic.HandinIconsMap[CLi].A = 1
			break
		end
	end
end
function AAPClassic.AddQuestPickUpIcon(SetMapIDs, px, py, Tooltipz, Tooltipz2)
	local CLi2
	for CLi2 = 1, 20 do
		if (AAPClassic.PickupIcons[CLi2].A == 0) then
			AAPClassic.HBDP:AddMinimapIconMap("AAPClassicPickUp", AAPClassic.PickupIcons[CLi2], SetMapIDs, px, py, true, false)
			AAPClassic.PickupIcons[CLi2]:Show()
			AAPClassic.PickupIcons[CLi2].A = 1
			if (not Tooltipz) then
				Tooltipz = "NoTooltip"
				Tooltipz2 = "NoTooltip"
			end
			AAPClassic.PickupTooltips[CLi2] = Tooltipz
			AAPClassic.PickupTooltips2[CLi2] = Tooltipz2
			break
		end
	end
	local CLi
	for CLi = 1, 20 do
		if (AAPClassic.PickupIconsMap[CLi].A == 0) then
			AAPClassic.HBDP:AddWorldMapIconMap("AAPClassicPickUpMap", AAPClassic.PickupIconsMap[CLi], SetMapIDs, px, py, HBD_PINS_WORLDMAP_SHOW_PARENT)
			AAPClassic.PickupIconsMap[CLi]:Show()
			AAPClassic.PickupIconsMap[CLi].A = 1
			break
		end
	end
end

function AAPClassic.MakeIcons()
	AAPClassic.MapMobList = CreateFrame("frame", "AAPClassic_MapMobList", WorldMapFrame)
	AAPClassic.MapMobList:SetWidth(150)
	AAPClassic.MapMobList:SetHeight(250)
	AAPClassic.MapMobList:SetFrameStrata("HIGH")
	AAPClassic.MapMobList:SetMovable(true)
	AAPClassic.MapMobList:SetPoint("LEFT", WorldMapFrame, "RIGHT", 5, 0)




	local CLi2
	for CLi2 = 1, 20 do
		AAPClassic.PickupIcons[CLi2] = CreateFrame("Frame",nil,UIParent)
		AAPClassic.PickupIcons[CLi2]:SetFrameStrata("HIGH")
		AAPClassic.PickupIcons[CLi2]:SetWidth(14)
		AAPClassic.PickupIcons[CLi2]:SetHeight(14)
		local t = 	AAPClassic.PickupIcons[CLi2]:CreateTexture(nil,"HIGH")
		t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\pickup.tga")
		t:SetAllPoints(AAPClassic.PickupIcons[CLi2])
		AAPClassic.PickupIcons[CLi2].texture = t
		AAPClassic.PickupIcons[CLi2]:SetPoint("CENTER",0,0)
		AAPClassic.PickupIcons[CLi2]:Hide()
		AAPClassic.PickupIcons[CLi2].A = 0
		AAPClassic.PickupIcons[CLi2]:SetScript("OnEnter", function(self, button)
			GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR_LEFT")
			if (AAPClassic.PickupTooltips2[CLi2]) then
				GameTooltip:SetText(AAPClassic.PickupTooltips2[CLi2], 1, 1, 1,  1, true);
				GameTooltip:AddLine(AAPClassic.PickupTooltips[CLi2], 1, 1, 1)
			else
				GameTooltip:SetText(AAPClassic.PickupTooltips[CLi2], 1, 1, 1,  1, true);
			end
			GameTooltip:Show()
		end)
		AAPClassic.PickupIcons[CLi2]:SetScript("OnLeave", function(self, button)
			GameTooltip:Hide()
		end)
		
		
		AAPClassic.PickupIconsMap[CLi2] = CreateFrame("Frame",nil,WorldMapFrame)
		AAPClassic.PickupIconsMap[CLi2]:SetFrameStrata("HIGH")
		AAPClassic.PickupIconsMap[CLi2]:SetWidth(14)
		AAPClassic.PickupIconsMap[CLi2]:SetHeight(14)
		AAPClassic.PickupIconsMap[CLi2]:SetParent(WorldMapFrame)
		local t = 	AAPClassic.PickupIconsMap[CLi2]:CreateTexture(nil,"HIGH")
		t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\pickup.tga")
		t:SetAllPoints(AAPClassic.PickupIconsMap[CLi2])
		AAPClassic.PickupIconsMap[CLi2].texture = t
		AAPClassic.PickupIconsMap[CLi2]:SetPoint("CENTER",0,0)
		AAPClassic.PickupIconsMap[CLi2]:Hide()
		AAPClassic.PickupIconsMap[CLi2].A = 0
		AAPClassic.PickupIconsMap[CLi2]:SetScript("OnEnter", function(self, button)
			GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR_LEFT")
			if (AAPClassic.PickupTooltips2[CLi2]) then
				GameTooltip:SetText(AAPClassic.PickupTooltips2[CLi2], 1, 1, 1,  1, true);
				GameTooltip:AddLine(AAPClassic.PickupTooltips[CLi2], 1, 1, 1)
			else
				GameTooltip:SetText(AAPClassic.PickupTooltips[CLi2], 1, 1, 1,  1, true);
			end
			GameTooltip:Show()
		end)
		AAPClassic.PickupIconsMap[CLi2]:SetScript("OnLeave", function(self, button)
			GameTooltip:Hide()
		end)
		
		AAPClassic.HandinIconsMap[CLi2] = CreateFrame("Frame",nil,WorldMapFrame)
		AAPClassic.HandinIconsMap[CLi2]:SetFrameStrata("HIGH")
		AAPClassic.HandinIconsMap[CLi2]:SetWidth(14)
		AAPClassic.HandinIconsMap[CLi2]:SetHeight(14)
		AAPClassic.HandinIconsMap[CLi2]:SetParent(WorldMapFrame)
		local t = 	AAPClassic.HandinIconsMap[CLi2]:CreateTexture(nil,"HIGH")
		t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\handin.tga")
		t:SetAllPoints(AAPClassic.HandinIconsMap[CLi2])
		AAPClassic.HandinIconsMap[CLi2].texture = t
		AAPClassic.HandinIconsMap[CLi2]:SetPoint("CENTER",0,0)
		AAPClassic.HandinIconsMap[CLi2]:Hide()
		AAPClassic.HandinIconsMap[CLi2].A = 0

		AAPClassic.HandinIcons[CLi2] = CreateFrame("Frame",nil,UIParent)
		AAPClassic.HandinIcons[CLi2]:SetFrameStrata("HIGH")
		AAPClassic.HandinIcons[CLi2]:SetWidth(14)
		AAPClassic.HandinIcons[CLi2]:SetHeight(14)
		local t = 	AAPClassic.HandinIcons[CLi2]:CreateTexture(nil,"HIGH")
		t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\handin.tga")
		t:SetAllPoints(AAPClassic.HandinIcons[CLi2])
		AAPClassic.HandinIcons[CLi2].texture = t
		AAPClassic.HandinIcons[CLi2]:SetPoint("CENTER",0,0)
		AAPClassic.HandinIcons[CLi2]:Hide()
		AAPClassic.HandinIcons[CLi2].A = 0
	end

end
function AAPClassic.MapMobListFontstrings(TheText, color)
	if (1 == 1) then
		return
	end
	local CLi
	local newLine = 0
	for CLi = 1, AAPClassic.MapMobListNr do
		if (AAPClassic.MapMobList["FS"..CLi]:GetText() == TheText or AAPClassic.MapMobList["FS"..CLi]:GetText() == "" or AAPClassic.MapMobList["FS"..CLi]:GetText() == nil) then
			local colortable = AAPClassic.GetDotColors(color)
			if (colortable) then
				local a1, a2, a3 = colortable[1], colortable[2], colortable[3]
				AAPClassic.MapMobList[CLi].texture:SetVertexColor(a1, a2, a3, 1)
			end
			AAPClassic.MapMobList["FS"..CLi]:SetText(TheText)
			AAPClassic.MapMobList[CLi]:Show()
			newLine = 1
			break
		end
	end
	if (newLine == 0) then
		AAPClassic.MapMobListNr = AAPClassic.MapMobListNr + 1
		CLi = AAPClassic.MapMobListNr
		AAPClassic.MapMobList["FS"..CLi] = AAPClassic.MapMobList:CreateFontString("AAPMobListFS"..CLi,"ARTWORK", "ChatFontNormal")
		AAPClassic.MapMobList["FS"..CLi]:SetParent(AAPClassic.MapMobList)
		AAPClassic.MapMobList["FS"..CLi]:SetPoint("TOPLEFT",AAPClassic.MapMobList,"TOPLEFT",5,-CLi*15)
		AAPClassic.MapMobList["FS"..CLi]:SetWidth(600)
		AAPClassic.MapMobList["FS"..CLi]:SetHeight(20)
		AAPClassic.MapMobList["FS"..CLi]:SetJustifyH("LEFT")
		AAPClassic.MapMobList["FS"..CLi]:SetFontObject("GameFontNormalSmall")
		AAPClassic.MapMobList["FS"..CLi]:SetText(TheText)
		AAPClassic.MapMobList["FS"..CLi]:SetTextColor(1, 1, 0)
		AAPClassic.MapMobList[CLi] = CreateFrame("Frame",nil,UIParent)
		AAPClassic.MapMobList[CLi]:SetFrameStrata("HIGH")
		AAPClassic.MapMobList[CLi]:SetParent(AAPClassic.MapMobList)
		AAPClassic.MapMobList[CLi]:SetWidth(10)
		AAPClassic.MapMobList[CLi]:SetHeight(10)
		local t = 	AAPClassic.MapMobList[CLi]:CreateTexture(nil,"HIGH")
		t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\Icon.blp")
		t:SetAllPoints(AAPClassic.MapMobList[CLi])
		AAPClassic.MapMobList[CLi].texture = t
		AAPClassic.MapMobList[CLi]:SetPoint("TOPLEFT",AAPClassic.MapMobList,"TOPLEFT",-6,(-CLi*15)-5)
		local colortable = AAPClassic.GetDotColors(color)
		if (colortable) then
			local a1, a2, a3 = colortable[1], colortable[2], colortable[3]
			AAPClassic.MapMobList[CLi].texture:SetVertexColor(a1, a2, a3, 1)
		end
		AAPClassic.MapMobList[CLi]:Show()
	end

end
function AAPClassic.RemoveIcons()
	AAPClassic.DotColorNr = 0
	AAPClassic.ActiveMobIds = nil
	AAPClassic.ActiveMobIds = {}
	AAPClassic.DotColorQList = nil
	AAPClassic.DotColorQList = {}
	local CLi
	for CLi = 1, AAPClassic.ActiveIcons do
		AAPClassic.Icons[CLi].A = 0
		AAPClassic.Icons[CLi].P = 0
		AAPClassic.Icons[CLi].D = 0
		AAPClassic.Tooltips[CLi] = nil
		AAPClassic.Tooltips2[CLi] = nil
		AAPClassic.HBDP:RemoveMinimapIcon("AAPClassic", AAPClassic.Icons[CLi])
		AAPClassic.MapIcons[CLi].A = 0
		AAPClassic.MapIcons[CLi].P = 0
		AAPClassic.MapIcons[CLi].D = 0
		AAPClassic.TooltipsMap[CLi] = nil
		AAPClassic.TooltipsMap2[CLi] = nil
		AAPClassic.HBDP:RemoveWorldMapIcon("AAPClassicMap", AAPClassic.MapIcons[CLi])
	end
	local CLi2
	--for CLi2 = 1, AAPClassic.MapMobListNr do
	--	AAPClassic.MapMobList["FS"..CLi2]:SetText("")
	--	AAPClassic.MapMobList[CLi2]:Hide()
	--end
	AAPClassic.ShowedDB = nil
	AAPClassic.ShowedDB = {}
	AAPClassic.TooltipsMapDB = nil
	AAPClassic.TooltipsMapDB = {}
	AAPClassic.TooltipsMapDBPlace = nil
	AAPClassic.TooltipsMapDBPlace = {}
end
function AAPClassic.RemoveMapIcons()
	AAPClassic.DotColorNr = 0
	AAPClassic.DotColorQList = nil
	AAPClassic.DotColorQList = {}
	local CLi
	for CLi = 1, AAPClassic.ActiveMapIcons do
		AAPClassic.MapIcons[CLi].A = 0
		AAPClassic.MapIcons[CLi].P = 0
		AAPClassic.MapIcons[CLi].D = 0
		AAPClassic.TooltipsMap[CLi] = nil
		AAPClassic.TooltipsMap2[CLi] = nil
		AAPClassic.HBDP:RemoveWorldMapIcon("AAPClassicMap", AAPClassic.MapIcons[CLi])
	end
end
function AAPClassic.MakeIconsz(CLi)

	AAPClassic.Icons[CLi] = CreateFrame("Frame",nil,UIParent)
	AAPClassic.Icons[CLi]:SetFrameStrata("HIGH")
	AAPClassic.Icons[CLi]:SetWidth(10)
	AAPClassic.Icons[CLi]:SetHeight(10)
	local t = 	AAPClassic.Icons[CLi]:CreateTexture(nil,"HIGH")
	t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\Icon.blp")
	t:SetAllPoints(AAPClassic.Icons[CLi])
	AAPClassic.Icons[CLi].texture = t
	AAPClassic.Icons[CLi]:SetPoint("CENTER",0,0)
	AAPClassic.Icons[CLi]:Hide()
	AAPClassic.Icons[CLi].P = 0
	AAPClassic.Icons[CLi].A = 0
	AAPClassic.Icons[CLi].D = 0
	AAPClassic.Icons[CLi].texture:SetAlpha(1)
	AAPClassic.Icons[CLi]:SetScript("OnEnter", function(self, button)
		GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR_LEFT")
		if (AAPClassic.Tooltips2[CLi]) then
			GameTooltip:SetText(AAPClassic.Tooltips2[CLi], 1, 1, 1,  1, true);
		end
		if (AAPClassic.TooltipsMapDBPlace[CLi]) then
			for AAP_index,AAP_value in pairs(AAPClassic.TooltipsMapDB[AAPClassic.TooltipsMapDBPlace[CLi]]) do
				GameTooltip:AddLine(AAP_value, 1, 1, 1)
			end
		end
		GameTooltip:Show()
	end)
	AAPClassic.Icons[CLi]:SetScript("OnLeave", function(self, button)
		GameTooltip:Hide()
	end)
end
function AAPClassic.AddIcon(SetMapIDs, px, py, Coloridz, Fillerz)
	local CLi
	local FreeNr
	for CLi = 1, AAPClassic.ActiveIcons do
		if (AAPClassic.Icons[CLi].A == 0) then
			FreeNr = CLi
		end
	end
	if (not FreeNr) then
		AAPClassic.ActiveIcons = AAPClassic.ActiveIcons + 1
		FreeNr = AAPClassic.ActiveIcons
		AAPClassic.MakeIconsz(FreeNr)
	end
	AAPClassic.HBDP:AddMinimapIconMap("AAPClassic", AAPClassic.Icons[FreeNr], SetMapIDs, px, py, true, false)
	if (Fillerz and Fillerz == "Filler") then
		AAPClassic.Icons[FreeNr].texture:SetVertexColor(1, 1, 1, 0.5)
	else
		local colortable = AAPClassic.GetDotColors(Coloridz)
		if (colortable) then
			local a1, a2, a3 = colortable[1], colortable[2], colortable[3]
			AAPClassic.Icons[FreeNr].texture:SetVertexColor(a1, a2, a3)
		end
	end
	AAPClassic.Icons[FreeNr]:Show()
	AAPClassic.Icons[FreeNr].A = 1
	return FreeNr
end
function AAPClassic.MakeMapIcons(CLi)
		AAPClassic.MapIcons[CLi] = CreateFrame("Frame",nil,UIParent)
		AAPClassic.MapIcons[CLi]:SetFrameStrata("HIGH")
		AAPClassic.MapIcons[CLi]:SetWidth(10)
		AAPClassic.MapIcons[CLi]:SetHeight(10)
		AAPClassic.MapIcons[CLi]:SetParent(WorldMapFrame)
		local t = 	AAPClassic.MapIcons[CLi]:CreateTexture(nil,"HIGH")
		t:SetTexture("Interface\\Addons\\AAP-Classic\\Img\\Icon.blp")
		t:SetAllPoints(AAPClassic.MapIcons[CLi])
		AAPClassic.MapIcons[CLi].texture = t
		AAPClassic.MapIcons[CLi]:SetPoint("CENTER",0,0)
		AAPClassic.MapIcons[CLi]:Hide()
		AAPClassic.MapIcons[CLi].P = 0
		AAPClassic.MapIcons[CLi].A = 0
		AAPClassic.MapIcons[CLi].D = 0
		AAPClassic.MapIcons[CLi]:SetScript("OnEnter", function(self, button)
			GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR_LEFT")
			if (AAPClassic.TooltipsMap2[CLi]) then
				GameTooltip:SetText(AAPClassic.TooltipsMap2[CLi], 1, 1, 1,  1, true);
			end
			if (AAPClassic.TooltipsMapDBPlace[CLi]) then
				for AAP_index,AAP_value in pairs(AAPClassic.TooltipsMapDB[AAPClassic.TooltipsMapDBPlace[CLi]]) do
					GameTooltip:AddLine(AAP_value, 1, 1, 1)
				end
			end
			GameTooltip:Show()
		end)
		AAPClassic.MapIcons[CLi]:SetScript("OnLeave", function(self, button)
			GameTooltip:Hide()
		end)
end
function AAPClassic.AddMapIcon(SetMapIDs, px, py, Coloridz, Fillerz)
	local CLi
	local FreeNr
	for CLi = 1, AAPClassic.ActiveMapIcons do
		if (AAPClassic.MapIcons[CLi].A == 0) then
			FreeNr = CLi
		end
	end
	if (not FreeNr) then
		AAPClassic.ActiveMapIcons = AAPClassic.ActiveMapIcons + 1
		FreeNr = AAPClassic.ActiveMapIcons
		AAPClassic.MakeMapIcons(FreeNr)
	end
	AAPClassic.HBDP:AddWorldMapIconMap("AAPClassicMap", AAPClassic.MapIcons[FreeNr], SetMapIDs, px, py, HBD_PINS_WORLDMAP_SHOW_PARENT)
	if (Fillerz and Fillerz == "Filler") then
		AAPClassic.MapIcons[FreeNr].texture:SetVertexColor(1, 1, 1, 0.5)
	else
		local colortable = AAPClassic.GetDotColors(Coloridz)
		if (colortable) then
			local a1, a2, a3 = colortable[1], colortable[2], colortable[3]
			AAPClassic.MapIcons[FreeNr].texture:SetVertexColor(a1, a2, a3, 1)
		end
	end
	AAPClassic.MapIcons[FreeNr].A = 1
	return FreeNr
end


AAPClassic.MapIconsEventFrame = CreateFrame("Frame")
AAPClassic.MapIconsEventFrame:RegisterEvent ("ADDON_LOADED")

AAPClassic.MapIconsEventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "AAP-Classic") then
			AAPClassic.MakeIcons()
		end
	end
end)


