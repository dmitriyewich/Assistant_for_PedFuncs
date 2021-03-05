script_name('Assistant for PedFuncs')
script_author('dmitriyewich',  'Junior_Djjr')
script_description("Assistant for PedFuncs")
script_url("https://vk.com/dmitriyewichmods")
script_dependencies("ffi")
script_properties('work-in-pause')
script_version('1.3')

require("moonloader")
local lffi, ffi =  pcall(require, 'ffi') assert(lffi, 'Library \'ffi\' not found.')
local lpedfuncs, pedfuncs = pcall(ffi.load, 'PedFuncs.asi') assert(lpedfuncs, 'Library \'PedFuncs.asi\' not found.')
local lvkeys, vkeys =  pcall(require, 'vkeys') assert(lvkeys, 'Library \'vkeys\' not found.')
local linicfg, inicfg =  pcall(require, 'inicfg') assert(linicfg, 'Library \'inicfg\' not found.')
local lencoding, encoding = pcall(require, 'encoding') assert(lencoding, 'Library \'encoding\' not found.')
local lglob, glob =  pcall(require, 'lib.game.globals') assert(lglob, 'Library \'lib.game.globals\' not found.')
encoding.default = 'CP1251'
u8 = encoding.UTF8

local mainIni = inicfg.load({
	settings = {
		language = "EN",
		help_text = false
	}
}, "AssistantForPedFuncs.ini")
if not doesFileExist('moonloader/config/AssistantForPedFuncs.ini') then inicfg.save(mainIni, 'AssistantForPedFuncs.ini') end

local function NameModel(x)
	local testNameModel = {
		[0] = "cj", [1] = "truth", [2] = "maccer", [3] = "andre", [4] = "bbthin", [5] = "bb", [6] = "emmet", [7] = "male01", [8] = "janitor", [9] = "bfori", 
		[10] = "bfost", [11] = "vbfycrp", [12] = "bfyri", [13] = "bfyst", [14] = "bmori", [15] = "bmost", [16] = "bmyap", [17] = "bmybu", [18] = "bmybe", 
		[19] = "bmydj", [20] = "bmyri", [21] = "bmycr", [22] = "bmyst", [23] = "wmybmx", [24] = "wbdyg1", [25] = "wbdyg2", [26] = "wmybp", [27] = "wmycon", 
		[28] = "bmydrug", [29] = "wmydrug", [30] = "hmydrug", [31] = "dwfolc", [32] = "dwmolc1", [33] = "dwmolc2", [34] = "dwmylc1", [35] = "hmogar", [36] = "wmygol1", 
		[37] = "wmygol2", [38] = "hfori", [39] = "hfost", [40] = "hfyri", [41] = "hfyst", [42] = "jethro", [43] = "hmori", [44] = "hmost", [45] = "hmybe", [46] = "hmyri", 
		[47] = "hmycr", [48] = "hmyst", [49] = "omokung", [50] = "wmymech", [51] = "bmymoun", [52] = "wmymoun", [53] = "ofori", [54] = "ofost", [55] = "ofyri", [56] = "ofyst", 
		[57] = "omori", [58] = "omost", [59] = "omyri", [60] = "omyst", [61] = "wmyplt", [62] = "wmopj", [63] = "bfypro", [64] = "hfypro", [65] = "kendl", [66] = "bmypol1", 
		[67] = "bmypol2", [68] = "wmoprea", [69] = "sbfyst", [70] = "wmosci", [71] = "wmysgrd", [72] = "swmyhp1", [73] = "swmyhp2", [74] = "-", [75] = "swfopro", [76] = "wfystew", 
		[77] = "swmotr1", [78] = "wmotr1", [79] = "bmotr1", [80] = "vbmybox", [81] = "vwmybox", [82] = "vhmyelv", [83] = "vbmyelv", [84] = "vimyelv", [85] = "vwfypro", 
		[86] = "ryder3", [87] = "vwfyst1", [88] = "wfori", [89] = "wfost", [90] = "wfyjg", [91] = "wfyri", [92] = "wfyro", [93] = "wfyst", [94] = "wmori", [95] = "wmost", 
		[96] = "wmyjg", [97] = "wmylg", [98] = "wmyri", [99] = "wmyro", [100] = "wmycr", [101] = "wmyst", [102] = "ballas1", [103] = "ballas2", [104] = "ballas3", [105] = "fam1", 
		[106] = "fam2", [107] = "fam3", [108] = "lsv1", [109] = "lsv2", [110] = "lsv3", [111] = "maffa", [112] = "maffb", [113] = "mafboss", [114] = "vla1", [115] = "vla2", 
		[116] = "vla3", [117] = "triada", [118] = "triadb", [119] = "sindaco", [120] = "triboss", [121] = "dnb1", [122] = "dnb2", [123] = "dnb3", [124] = "vmaff1", 
		[125] = "vmaff2", [126] = "vmaff3", [127] = "vmaff4", [128] = "dnmylc", [129] = "dnfolc1", [130] = "dnfolc2", [131] = "dnfylc", [132] = "dnmolc1", [133] = "dnmolc2", 
		[134] = "sbmotr2", [135] = "swmotr2", [136] = "sbmytr3", [137] = "swmotr3", [138] = "wfybe", [139] = "bfybe", [140] = "hfybe", [141] = "sofybu", [142] = "sbmyst", [143] = "sbmycr", 
		[144] = "bmycg", [145] = "wfycrk", [146] = "hmycm", [147] = "wmybu", [148] = "bfybu", [149] = "smokev", [150] = "wfybu", [151] = "dwfylc1", [152] = "wfypro", [153] = "wmyconb", 
		[154] = "wmybe", [155] = "wmypizz", [156] = "bmobar", [157] = "cwfyhb", [158] = "cwmofr", [159] = "cwmohb1", [160] = "cwmohb2", [161] = "cwmyfr", [162] = "cwmyhb1", 
		[163] = "bmyboun", [164] = "wmyboun", [165] = "wmomib", [166] = "bmymib", [167] = "wmybell", [168] = "bmochil", [169] = "sofyri", [170] = "somyst", [171] = "vwmybjd", 
		[172] = "vwfycrp", [173] = "sfr1", [174] = "sfr2", [175] = "sfr3", [176] = "bmybar", [177] = "wmybar", [178] = "wfysex", [179] = "wmyammo", [180] = "bmytatt", 
		[181] = "vwmycr", [182] = "vbmocd", [183] = "vbmycr", [184] = "vhmycr", [185] = "sbmyri", [186] = "somyri", [187] = "somybu", [188] = "swmyst", [189] = "wmyva", 
		[190] = "copgrl3", [191] = "gungrl3", [192] = "mecgrl3", [193] = "nurgrl3", [194] = "crogrl3", [195] = "gangrl3", [196] = "cwfofr", [197] = "cwfohb", 
		[198] = "cwfyfr1", [199] = "cwfyfr2", [200] = "cwmyhb2", [201] = "dwfylc2", [202] = "dwmylc2", [203] = "omykara", [204] = "wmykara", [205] = "wfyburg", 
		[206] = "vwmycd", [207] = "vhfypro", [208] = "suzie", [209] = "omonood", [210] = "omoboat", [211] = "wfyclot", [212] = "vwmotr1", [213] = "vwmotr2", 
		[214] = "vwfywai", [215] = "sbfori", [216] = "swfyri", [217] = "wmyclot", [218] = "sbfost", [219] = "sbfyri", [220] = "sbmocd", [221] = "sbmori", 
		[222] = "sbmost", [223] = "shmycr", [224] = "sofori", [225] = "sofost", [226] = "sofyst", [227] = "somobu", [228] = "somori", [229] = "somost", 
		[230] = "swmotr5", [231] = "swfori", [232] = "swfost", [233] = "swfyst", [234] = "swmocd", [235] = "swmori", [236] = "swmost", [237] = "shfypro", 
		[238] = "sbfypro", [239] = "swmotr4", [240] = "swmyri", [241] = "smyst", [242] = "smyst2", [243] = "sfypro", [244] = "vbfyst2", [245] = "vbfypro", 
		[246] = "vhfyst3", [247] = "bikera", [248] = "bikerb", [249] = "bmypimp", [250] = "swmycr", [251] = "wfylg", [252] = "wmyva2", [253] = "bmosec", 
		[254] = "bikdrug", [255] = "wmych", [256] = "sbfystr", [257] = "swfystr", [258] = "heck1", [259] = "heck2", [260] = "bmycon", [261] = "wmycd1", 
		[262] = "bmocd", [263] = "vwfywa2", [264] = "wmoice", [265] = "tenpen", [266] = "pulaski", [267] = "hern", [268] = "dwayne", [269] = "smoke", [270] = "sweet", 
		[271] = "ryder", [272] = "forelli", [273] = "tbone", [274] = "laemt1", [275] = "lvemt1", [276] = "sfemt1", [277] = "lafd1", [278] = "lvfd1", [279] = "sffd1", 
		[280] = "lapd1", [281] = "sfpd1", [282] = "lvpd1", [283] = "csher", [284] = "lapdm1", [285] = "swat", [286] = "fbi", [287] = "army", [288] = "dsher", [289] = "zero", 
		[290] = "rose", [291] = "paul", [292] = "cesar", [293] = "ogloc", [294] = "wuzimu", [295] = "torino", [296] = "jizzy", [297] = "maddogg", [298] = "cat", 
		[299] = "claude", [300] = "lapdna", [301] = "sfpdna", [302] = "lvpdna", [303] = "lapdpc", [304] = "lapdpd", [305] = "lvpdpc", [306] = "wfyclpd", [307] = "vbfycpd", 
		[308] = "wfyclem", [309] = "wfycllv", [310] = "csherna", [311] = "dsherna";
	}
	for i = 1, #testNameModel do
		if x == i then
		return testNameModel[i]
		end
	end
	return 'None'
end

ffi.cdef[[
	int Ext_GetPedRemap(uint32_t, int index);
	void Ext_SetPedRemap(uint32_t, int index, int num);
]]

local my_font = renderCreateFont('Arial', 12, 12)
local active = false
local active_change_ini = true

function main()

	local samp = 0
	if isSampLoaded() then samp = 1 end
	
	if samp == 1 then
		sampRegisterChatCommand('pdremap', function(arg)
			active = not active
			sampAddChatMessage((active and 'Assistant for PedFuncs activated, {ff6666}RMB + Left/Right - _remap, RMB + Up/Down - index' or 'Assistant for PedFuncs deactivated'), -1)
		end)
		sampSetClientCommandDescription('pdremap', (string.format('Active remap for PedFuncs, File: %s', thisScript().filename)))

		sampRegisterChatCommand('setremap', function(arg) set_remap(arg) end)
		sampSetClientCommandDescription('setremap', (string.format('User set remap for PedFuncs, File: %s', thisScript().filename)))

		sampRegisterChatCommand('getremap', function(arg) get_remap(arg) end)
		sampSetClientCommandDescription('getremap', (string.format('Use get remap for PedFuncs, File: %s', thisScript().filename)))
	end
	
	if mainIni.settings.help_text then
		if mainIni.settings.language == 'ru' or mainIni.settings.language == 'RU' then
			text_help = u8:decode'\n{ff6666}Отсчет начинается с конца\n{ff6666}Например, в чате/рендере bmydj_remap0 = bmydj_remap(последний) в bmydj.txd\n{ff6666}Если скин сломался, то _remap начал новый круг :)'
			text_help_samp = u8:decode' | {ff6666}Отсчет начинается с конца, например, bmydj_remap0 равен to bmydj_remap(последний) в .txd'
		end
		if mainIni.settings.language == 'en' or mainIni.settings.language == 'EN' then
			text_help = '\n{ff6666}Counting goes from the end\n{ff6666}Example, in chat/render bmydj_remap0 = bmydj_remap(last) in bmydj.txd\n{ff6666}If the skin is broken, it means that _remap is the last :)'
			text_help_samp = ' | {ff6666}Counting goes from the end, example, bmydj_remap0 is equal to bmydj_remap(last) in .txd'
		end
	else
		text_help = ''
		text_help_samp = ''
	end	
	
	local sw, sh = getScreenResolution()
	local index = 0

	local mission_char_tbl = {86, 252, 265, 266, 267, 269, 270, 271, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299}

	while true do wait(0)
		if samp == 0 then
			if testCheat("remap") then
				active = not active
				printHelpString((active and 'Assistant for PedFuncs activated' or 'Assistant for PedFuncs deactivated'))
			end
			if hasCutsceneLoaded() or getGameGlobal(glob.ONMISSION) == 1 then
				for k, v in ipairs(getAllChars()) do
					mission_char = getCharModel(v)
					if mission_char == mission_char_tbl then
						if pedfuncs.Ext_GetPedRemap(getCharPointer(v), 0) ~= -1 then 
							pedfuncs.Ext_SetPedRemap(getCharPointer(v), 0, -1)
						end
					end
				end
			end
		end
		
		if active then
			local delta = getMousewheelDelta()
			local rresult, pped = getCharPlayerIsTargeting(PLAYER_HANDLE)
			if rresult and isKeyDown(vkeys.VK_RBUTTON) then
				local skin_id = getCharModel(pped)
				renderFontDrawText(my_font, 'Index: '..index..'\nModel: '..NameModel(skin_id)..'('..skin_id..')\n_remap: '..pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index)..text_help, sw / 2, sh / 2, 0xFFFFFFFF)
					if delta ~= 0 then
						if pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) >= -1 then 
							pedfuncs.Ext_SetPedRemap(getCharPointer(pped), index, pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) + delta)
							if pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) <= -1 then
								pedfuncs.Ext_SetPedRemap(getCharPointer(pped), index, -1)
							end
						end
					end
				if isKeyDown(vkeys.VK_RBUTTON) and wasKeyPressed(vkeys.VK_UP) then
					if index >= 0 and index <= 3 then 
						index = index + 1
						if index <= 0 or index > 3 then
							index = 0
						end
					end
				end
				if isKeyDown(vkeys.VK_RBUTTON) and wasKeyPressed(vkeys.VK_DOWN) then
					if index >= 0 and index <= 3 then 
						index = index - 1
						if index <= 0 or index > 3 then
							index = 0
						end
					end
				end
				if isKeyDown(vkeys.VK_RBUTTON) and wasKeyPressed(vkeys.VK_RIGHT) then
					if pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) >= -1 then 
						pedfuncs.Ext_SetPedRemap(getCharPointer(pped), index, pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) + 1)
					end
				end
				if isKeyDown(vkeys.VK_RBUTTON) and wasKeyPressed(vkeys.VK_LEFT) then
					if pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) >= -1 then 
						pedfuncs.Ext_SetPedRemap(getCharPointer(pped), index, pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) - 1)
						if pedfuncs.Ext_GetPedRemap(getCharPointer(pped), index) <= -1 then
							pedfuncs.Ext_SetPedRemap(getCharPointer(pped), index, -1)
						end
					end
				end
			end

			if isKeyDown(vkeys.VK_RCONTROL) then
				renderFontDrawText(my_font, 'Index: '..index..'\nModel: '..NameModel(getCharModel(PLAYER_PED))..'('..getCharModel(PLAYER_PED)..')\n_remap: '..pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index)..text_help, sw / 2, sh / 2, 0xFFFFFFFF)
				if delta ~= 0 then
					if pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) >= -1 then 
						pedfuncs.Ext_SetPedRemap(getCharPointer(PLAYER_PED), index, pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) + delta)
						if pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) <= -1 then
							pedfuncs.Ext_SetPedRemap(getCharPointer(PLAYER_PED), index, -1)
						end
					end
				end
			end
			if isKeyDown(vkeys.VK_RCONTROL) and wasKeyPressed(vkeys.VK_UP) then
				if index >= 0 and index <= 3 then 
					index = index + 1
					if index <= 0 or index > 3 then
						index = 0
					end
				end
			end
			if isKeyDown(vkeys.VK_RCONTROL) and wasKeyPressed(vkeys.VK_DOWN) then
				if index >= 0 and index <= 3 then 
					index = index - 1
					if index <= 0 or index > 3 then
						index = 0
					end
				end
			end
			if isKeyDown(vkeys.VK_RCONTROL) and wasKeyPressed(vkeys.VK_RIGHT) then
				if pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) >= -1 then 
					pedfuncs.Ext_SetPedRemap(getCharPointer(PLAYER_PED), index, pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) + 1)
				end
			end
			if isKeyDown(vkeys.VK_RCONTROL) and wasKeyPressed(vkeys.VK_LEFT) then
				if pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) >= -1 then 
					pedfuncs.Ext_SetPedRemap(getCharPointer(PLAYER_PED), index, pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) - 1)
					if pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), index) <= -1 then
						pedfuncs.Ext_SetPedRemap(getCharPointer(PLAYER_PED), index, -1)
					end
				end
			end
		end
	end
end

function onWindowMessage(msg, wparam, lparam)
	if active and isKeyDown(vkeys.VK_RCONTROL) or isKeyDown(vkeys.VK_RBUTTON) then
		if msg == 0x100 or msg == 0x101 then
			if bit.band(lparam, 0x40000000) == 0 then
				if wparam == 0x25 or wparam == 0x26 or wparam == 0x27 or wparam == 0x28 then
					consumeWindowMessage(true, false)
				end
			end
		end
	end
end

function set_remap(arg)
	local arg = split(arg, '%s+', false)
	if tonumber(arg[1]) ~= nil and tonumber(arg[2]) ~= nil and tonumber(arg[3]) == nil then
		local skin_id = getCharModel(PLAYER_PED)
		pedfuncs.Ext_SetPedRemap(getCharPointer(PLAYER_PED), tonumber(arg[1]), tonumber(arg[2]))
		sampAddChatMessage('Model: '..NameModel(skin_id)..'('..skin_id..') | Index: '..arg[1]..' | _remap: '..pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), tonumber(arg[1]))..text_help_samp, -1)
	end
	if tonumber(arg[1]) ~= nil and tonumber(arg[2]) ~= nil and tonumber(arg[3]) ~= nil then
		result, ped = sampGetCharHandleBySampPlayerId(tonumber(arg[1]))
		local skin_id = getCharModel(ped)
		pedfuncs.Ext_SetPedRemap(getCharPointer(ped), tonumber(arg[2]), tonumber(arg[3]))
		sampAddChatMessage('Model: '..NameModel(skin_id)..'('..skin_id..') | Index: '..arg[2]..' | _remap: '..pedfuncs.Ext_GetPedRemap(getCharPointer(ped), tonumber(arg[2]))..text_help_samp, -1)
	end
end

function get_remap(arg)
	local arg = split(arg, '%s+', false)
	if tonumber(arg[1]) == nil and tonumber(arg[2]) == nil then
		sampAddChatMessage('Please enter an index! {ff6666}/getremap 0-4', -1)
	end
	if tonumber(arg[1]) ~= nil and tonumber(arg[2]) == nil then
		local skin_id = getCharModel(PLAYER_PED)
		sampAddChatMessage('Model: '..NameModel(skin_id)..'('..skin_id..') | Index: '..arg[1]..' | _remap: '..pedfuncs.Ext_GetPedRemap(getCharPointer(PLAYER_PED), tonumber(arg[1]))..text_help_samp, -1)
	end
	if tonumber(arg[1]) ~= nil and tonumber(arg[2]) ~= nil then
		result, ped = sampGetCharHandleBySampPlayerId(tonumber(arg[1]))
		local skin_id = getCharModel(ped)
		sampAddChatMessage('Model: '..NameModel(skin_id)..'('..skin_id..') | Index: '..arg[2]..' | _remap: '..pedfuncs.Ext_GetPedRemap(getCharPointer(ped), tonumber(arg[2]))..text_help_samp, -1)
	end
end

function split(str, delim, plain)
	local tokens, pos, plain = {}, 1, not (plain == false)
	repeat
		local npos, epos = string.find(str, delim, pos, plain)
		table.insert(tokens, string.sub(str, pos, npos and npos - 1))
		pos = epos and epos + 1
	until not pos
	return tokens
end
