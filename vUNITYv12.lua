local memFrom, memTo, lib, num, lim, results, src, ok = 0, -1, nil, 0, 32, {}, nil, false
function name(n)
	if lib ~= n then
		lib = n
		local ranges = gg.getRangesList(lib)
		if #ranges == 0 then
			gg.toast("Connect To The Game To Run The Script")
			os.exit()
		else
			memFrom = ranges[1].start
			memTo = ranges[#ranges]["end"]
		end
	end
end
function hex2tbl(hex)
	local ret = {}
	hex:gsub("%S%S", function (ch)
		ret[#ret + 1] = ch
		return ""
	end)
	return ret
end
function original(orig)
	local tbl = hex2tbl(orig)
	local len = #tbl
	if len == 0 then return end
	local used = len
	if len > lim then used = lim end
	local s = ''
	for i = 1, used do
		if i ~= 1 then s = s..";" end
		local v = tbl[i]
		if v == "??" or v == "**" then v = "0~~0" end		
		s = s..v.."r"
	end
	s = s.."::"..used
	gg.searchNumber(s, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, memFrom, memTo)
	if len > used then
		for i = used + 1, len do
			local v = tbl[i]
			if v == "??" or v == "**" then
				v = 256
			else
				v = ("0x"..v) + 0
				if v > 127 then v = v - 256 end
			end
			tbl[i] = v
		end
	end
	local found = gg.getResultCount();
	results = {}
	local count = 0
	local checked = 0
	while true do
		if checked >= found then
			break
		end
		local all = gg.getResults(8)
		local total = #all
		local start = checked
		if checked + used > total then
			break
		end
		for i, v in ipairs(all) do
	    v.address = v.address + myoffset
        end
         gg.loadResults(all)
		while start < total do		
			local good = true
			local offset = all[1 + start].address - 1
			if used < len then			
				local get = {}
				for i = lim + 1, len do
					get[i - lim] = {address = offset + i, flags = gg.TYPE_BYTE, value = 0}
				end
				get = gg.getValues(get)
				for i = lim + 1, len do
					local ch = tbl[i]
					if ch ~= 256 and get[i - lim].value ~= ch then
						good = false
						break
					end
				end
			end
			if good then
				count = count + 1
				results[count] = offset
				checked = checked + used
			else
				local del = {}
				for i = 1, used do
					del[i] = all[i + start]
				end
				gg.removeResults(del)
			end
			start = start + used
		end
	end
	
end
function replaced(repl)
	num = num + 1
	local tbl = hex2tbl(repl)
	if src ~= nil then
		local source = hex2tbl(src)
		for i, v in ipairs(tbl) do
			if v ~= "??" and v ~= "**" and v == source[i] then tbl[i] = "**" end
		end
		src = nil
	end
	local cnt = #tbl
	local set = {}
	local s = 0
	for _, addr in ipairs(results) do
		for i, v in ipairs(tbl) do
			if v ~= "??" and v ~= "**" then
				s = s + 1
				set[s] = {
					["address"] = addr + i, 
					["value"] = v.."r",
					["flags"] = gg.TYPE_BYTE,
				}
			end
		end		
	end
	if s ~= 0 then gg.setValues(set) end
	ok = true
end
local Passwords = {"UNITY VIP12","UNITY VIP12"}
gg.toast("\n🔒Şifrelenmiş Komut Dosyası🔒")
local Menu = gg.prompt({"🔰EMİRHAN\n🎬YouTube: EMİRHAN UNITY\n🔒Şifreyi Giriniz:"},{"🛡️Şifreyi Giriniz..."},{"text"}) 
if not Menu then gg.toast("\n【☑️】Şifreyi Giriniz !!! 【☑️】") os.exit(3) end
for l , I in pairs(Passwords) do  if Menu[1] == I then A = true end end
if A ~= true then
gg.alert("⚠ Yanlış Şifre ⚠\n\n🔐 Tekrar Deneyiniz.  🔐","╔━━━━━━━━━━━━╗\n 》》 🆃🅰🅼🅰🅼   》》\n╚━━━━━━━━━━━━╝")
print("🔰EMİRHAN\n🎬YouTube: EMİRHAN UNITY")
os.exit(2022)  else
end
gg.toast("\n🔓(-_^) Doğru Şifre (^_-) 🔓") gg.sleep(1000)
gg.sleep(300)
gg.toast(" ◼◻◻◻◻◻◻◻◻◻10%")
gg.sleep(300)
gg.toast(" ◼◼◻◻◻◻◻◻◻◻20%")
gg.sleep(300)
gg.toast(" ◼◼◼◻◻◻◻◻◻◻30%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◻◻◻◻◻◻40%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◻◻◻◻◻50%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◻◻◻◻60%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◻◻◻70%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◼◻◻80%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◼◼◻90%")
gg.sleep(300)
gg.toast(" ◼◼◼◼◼◼◼◼◼◼100%")
gg.sleep(300)
gg.alert('ঔৣ͜͡➳ ➣MƛƘЄƊ ƁƳ ЄMƖƦӇƛƝ】   ঔৣ͜͡➳ ➣Yt=emirhan_unity')
gg.alert('best script ever')
EMIRHAN = -1 
function MainMenu()
Main = gg.choice({ 
	"📁 ➣【𝐰𝐞𝐚𝐩𝐨𝐧 𝐦𝐞𝐧𝐮】",
	"📁 ➣【𝐩𝐥𝐚𝐲𝐞𝐫 𝐦𝐞𝐧𝐮】",
	"📁➣【𝐬𝐩𝐞𝐞𝐝 𝐦𝐞𝐧𝐮】",
	"📁➣【𝐜𝐚𝐫 𝐦𝐞𝐧𝐮】",
	"📁 ➣【𝐦𝐚𝐩 𝐦𝐞𝐧𝐮】",
	"📁 ➣【𝐚𝐢𝐦 𝐦𝐞𝐧𝐮】",
	"📁 ➣【𝐯𝐢𝐩 𝐦𝐞𝐧𝐮】",
	"📁 ➣【𝐜𝐡𝐢𝐞𝐧𝐬𝐞 𝐦𝐞𝐧𝐮】",
    "📁 ➣【𝐦𝐨𝐝 𝐦𝐞𝐧𝐮】",
    "📁 ➣【𝐠𝐨𝐝 𝐦𝐞𝐧𝐮】",
    "【↺】𝐁𝐀𝐂𝐊",
},nil," ঔৣ͜͡➳ ➣【MƛƘЄƊ ƁƳ ЄMƖƦӇƛƝ】@ᴇᴍɪʀʜᴀɴ_ʟᴇɢᴀᴄʏ")

if Main == nil then else
if Main == 1 then MENU1() end
if Main == 2 then MENU2() end
if Main == 3 then MENU3()  end
if Main == 4 then MENU4()  end
if Main == 5 then  MENU5() end
if Main == 6 then  MENU6() end
if Main == 7 then MENU7() end
if Main == 8 then MENU8() end
if Main == 9 then MENU9() end
if Main == 10 then MENU10() end
end
EMIRHAN = -1 
end

function MENU1()
WeaponMenu = gg.multiChoice({
	"【𝐎𝐍】Ξ ғᴀsᴛ ʙᴜʟʟᴇᴛs",
	"【𝐎𝐍】Ξ ғᴀsᴛ ʙᴜʟʟᴇᴛsV2",
	"【𝐎𝐍】Ξ ɴᴏ ʀᴇᴄᴏɪʟ",
	"【𝐎𝐍】Ξ high recoil",
	"【𝐎𝐍】Ξ 𝟷 sʜᴏᴏᴛ ᴋɪʟʟ",
	"【𝐎𝐍】 Ξ sʜᴏᴏᴛ ᴋɪʟʟ",
    "【𝐎𝐍】Ξ 𝟹𝟼𝟶 sʜᴏᴛ",
    "【𝐎𝐍】Ξ 𝟹𝟼𝟶 sʜᴏᴛ",
    "【𝐎𝐍】Ξ sᴍᴀʟʟ ᴀɪᴍ",
      "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"➣【🔫】♌︎【ƜЄƛƤƠƝ MЄƝƲ")

if WeaponMenu == nil then else
if WeaponMenu[1] == true then HACK1() end
if WeaponMenu[2] == true then HACK2() end
if WeaponMenu[3] == true then HACK3() end
if WeaponMenu[4] == true then HACK4() end
if WeaponMenu[5] == true then HACK5() end
if WeaponMenu[6] == true then HACK6() end
if WeaponMenu[7] == true then HACK7() end
if WeaponMenu[8] == true then HACK8() end
if WeaponMenu[9] == true then HACK9() end
end
EMIRHAN = -1 
end

function HACK1()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.3", gg.TYPE_FLOAT)
  gg.getResults(100000)
  gg.editAll("1", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Fast Bullets (On) by Emirhan")
  gg.setVisible(false)
  end
  function HACK2()
  gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber(0.30, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(3000)
gg.editAll(1, gg.TYPE_FLOAT)
gg.toast("🔥ƑƛƧƬ ƁƲԼԼЄƬƧ BY emirhan🔫")
end  --Ꙅ1�7 ﴾🌺𝐃𝐊😎۝𝐄1�7
function HACK3()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.009999999999", gg.TYPE_FLOAT )
  gg.getResults(100000)
  gg.editAll("0", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("No Recoil (On) By Emirhan")
  gg.setVisible(false)
  end
  function HACK4()
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.01", gg.TYPE_FLOAT)
gg.getResults(30000)
gg.editAll("0.99", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast('ঔৣ͜͡➳ ➣【high rec】')
end
function HACK5()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.3", gg.TYPE_FLOAT)
  gg.getResults(100000)
  gg.editAll("4.25", gg.TYPE_FLOAT)
  gg.clearResults()
gg.toast('ঔৣ͜͡➳ ➣1 Shoot kill')
end
function HACK6()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4.25", gg.TYPE_FLOAT)
  gg.getResults(100000)
  gg.editAll("0.3", gg.TYPE_FLOAT)
  gg.clearResults()
gg.toast('ঔৣ͜͡➳ ➣Ultra Fast Bullets off')
end
function HACK7()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("600", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-200", gg.TYPE_FLOAT)
gg.toast(" 360° SHOT (On) By EMIRHAN")
gg.clearResults()
gg.setVisible(false)
  end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function HACK8()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("600", gg.TYPE_FLOAT)
gg.toast(" 360° SHOT (OFF) By emirhan ")
gg.clearResults()
gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function HACK9()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("12", gg.TYPE_FLOAT)
gg.getResults(10000)
gg.editAll("2.11", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("ঔৣ͜͡➳ ➣SmallAim")
end

function MENU2()
PlayerMenu = gg.multiChoice({
	"ঔৣ͜͡➳ ➣【ON】ʙɪɢ ᴘʟᴀʏᴇʀ",
	"ঔৣ͜͡➳ ➣【ON】ʙʟᴏᴏᴅ ᴇғғᴇᴄᴛ",
	"ঔৣ͜͡➳ ➣【ON】𝟺x ᴢᴏᴏᴍ",
	"ঔৣ͜͡➳ ➣【OFF】𝟺x ᴢᴏᴏᴍ",
    "ঔৣ͜͡➳ ➣【ON】ʙᴏxɪɴɢ ᴍᴏᴅᴇ",
    "ঔৣ͜͡➳ ➣【ON】ᴊᴜᴍᴘ ʙᴀᴄᴋ",
    "ঔৣ͜͡➳ ➣【ON】ɴᴏ ᴡᴀʟʟ",
    "ঔৣ͜͡➳ ➣【ON】ɴᴏ ᴡᴀʟʟ",
    "ঔৣ͜͡➳ ➣【ON】ɢʜᴏsᴛ (ᴇʏᴇs)",
    "ঔৣ͜͡➳ ➣【OFF】ɢʜᴏsᴛ (ᴇʏᴇs)",
    "ঔৣ͜͡➳ ➣【ON】sʟᴏᴡ ᴄʜᴀʀᴀᴄᴛᴇʀ",
    "ঔৣ͜͡➳ ➣【OFF】sʟᴏᴡ ᴄʜᴀʀᴀᴄᴛᴇʀ",
     "ঔৣ͜͡➳ ➣【ON】sᴜᴘᴇʀ ᴊᴜᴍᴘ",
     "ঔৣ͜͡➳ ➣【𝐎𝐍】Lɪʟ Pʟᴀʏᴇʀ",
      "ঔৣ͜͡➳ ➣【𝐎𝐍】ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ",
      "ঔৣ͜͡➳ ➣【𝐎FF】ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ",
      "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
    },nil,"【🥷】♌︎ƤԼƛƳЄƦ MЄƝƲ")
    
  if PlayerMenu == nil then else
if PlayerMenu[1] == true then SUCK1() end
if PlayerMenu[2] == true then SUCK2() end
if PlayerMenu[3] == true then SUCK3() end
if PlayerMenu[4] == true then SUCK4() end
if PlayerMenu[5] == true then SUCK5() end
if PlayerMenu[6] == true then SUCK6() end
if PlayerMenu[7] == true then SUCK7() end
if PlayerMenu[8] == true then SUCK8() end
if PlayerMenu[9] == true then SUCK9() end
if PlayerMenu[10] == true then SUCK10() end
if PlayerMenu[11] == true then SUCK11() end
if PlayerMenu[12] == true then SUCK12() end
if PlayerMenu[13] == true then SUCK13() end
if PlayerMenu[14] == true then SUCK14() end
if PlayerMenu[15] == true then SUCK15() end
if PlayerMenu[16] == true then SUCK15() end
end
EMIRHAN = -1 
end

function SUCK1()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("2", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("3", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('Big PLAYER on By emirhan')
  end
  function SUCK2()
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.17", gg.TYPE_FLOAT, false)
  gg.getResults(1000)
  gg.editAll("800", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('ঔৣ͜͡➳ ➣Unity Blood effect')
  end
  function SUCK3()
  gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.01", gg.TYPE_FLOAT)
gg.getResults(2920)
gg.editAll("0.121", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("4x zoom(On) By EMIRHAN ✔ ")
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function SUCK4()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.121", gg.TYPE_FLOAT)
gg.getResults(2920)
gg.editAll("0.01", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("4x(Off) By EMIRHAN ✔ ")
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰
function SUCK5()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("10000000000", gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults()
gg.toast("✅Boxing Mode ON✅\n❤️‍🔥Instagram : @legacy emirhan❤️‍🔥")
end
function SUCK6()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.98", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("-8", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.clearResults()
gg.toast("✅Jump Back Active✅\n❤️‍🔥Instagram : @emirhan_unity❤️‍🔥")
end
function SUCK7()
gg.getRanges()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.1", gg.TYPE_FLOAT, false)
gg.getResults(100000)
gg.editAll("99999999", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.setVisible(false)
gg.toast("Emirhan")
end
function SUCK8()
gg.getRanges()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("99999999", gg.TYPE_FLOAT, false)
gg.getResults(100000)
gg.editAll("0.1", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.setVisible(false)
gg.clearResults()
gg.toast("Emirhan")
end
function SUCK9()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.15", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("5.100", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".     .     .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('ɢʜᴏsᴛ (ᴇʏᴇs) on')
end
function SUCK10()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("5.100", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("0.15", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".      .    .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('ghost eyes on')
end
function SUCK11()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.400", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("5.100", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".     .     .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('Slow Motion/funny on')
end
function SUCK12()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("5.100", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("0.400", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast(".      .    .")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
gg.toast('slow motion/funny off')
end
function SUCK13()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.28", gg.TYPE_FLOAT)
gg.getResults(3000)
gg.editAll("15", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.clearResults()
gg.toast("✅Super Jump ON✅\n❤️‍🔥Instagram : @legacy_emirhan❤️‍🔥")
end
function SUCK14()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("2", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("1.61", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('lil player')
  end
  function SUCK15()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("250", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("280", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("෴ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
  function SUCK16()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("280", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("250", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("ঔৣ͜͡➳ ➣ᴡᴀʟᴋɪɴɢ ᴏɴ Wᴀᴛᴇʀ")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�

  function MENU3()
SpeedMenu = gg.multiChoice({
	"【𝐎FF】♌︎ sᴘᴇᴇᴅ ʜᴀᴄᴋs",
	"【𝐎𝐍】♌︎sᴘᴇᴇᴅ ʜᴀᴄᴋ X2",
    "【𝐎𝐍】♌︎sᴘᴇᴇᴅ ʜᴀᴄᴋ X3",
    "【𝐎𝐍】♌︎sᴘᴇᴇᴅ ʜᴀᴄᴋ X4",
    "【𝐎𝐍】♌︎sᴘᴇᴇᴅ ʜᴀᴄᴋ X5",
    "【𝐎𝐍】♌︎ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀ",
	"┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"➣【🏃】♌︎【ƧƤЄЄƊ MЄƝƲ】 】")

if SpeedMenu == nil then else
if SpeedMenu[1] == true then FUCK1() end
if SpeedMenu[2] == true then FUCK2() end
if SpeedMenu[3] == true then FUCK3() end
if SpeedMenu[4] == true then FUCK4() end
if SpeedMenu[5] == true then FUCK5() end
if SpeedMenu[6] == true then FUCK6() end
end
EMIRHAN = -1 
end

function FUCK1()
gg.setSpeed(1)
end
function FUCK2()
gg.setSpeed(2)
end
function FUCK3()
gg.setSpeed(3)
end
function FUCK4()
gg.setSpeed(4)
end
function FUCK5()
gg.setSpeed(5)
end
function FUCK6()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-1;-2;1", gg.TYPE_FLOAT)
gg.getResults(17700)
gg.editAll("1;-15", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast('🌩chiense speed🌩【On')
end--fakyu

function MENU4()
CarMenu = gg.multiChoice({
	"ঔৣ͜͡➳ ➣【ON】ᴄᴀʀ ғʟʏ🚗",
	"ঔৣ͜͡➳ ➣【ON】ᴄᴀʀ ғʟʏ v2🚗",
	"ঔৣ͜͡➳ ➣【ON】1 shoot ak 🚗",
	"ঔৣ͜͡➳ ➣【ON】 ᴄᴀʀᴜɴᴅᴇʀɢʀᴏᴜɴᴅ ",
	"ঔৣ͜͡➳ ➣【OFF】ᴄᴀʀ ᴜɴᴅᴇʀɢʀᴏᴜɴᴅ",
	"ঔৣ͜͡➳ ➣【ON】ᴄᴀʀ sᴘᴇᴇᴅ🚗",
	"┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"ঔৣ͜͡➳ ➣【🚗】【ƇƛƦ MЄƝƲ】")
if CarMenu == nil then else
if CarMenu[1] == true then SACK1() end
if CarMenu[2] == true then SACK2() end
if CarMenu[3] == true then SACK3() end
if CarMenu[4] == true then SACK4() end
if CarMenu[5] == true then SACK5() end
if CarMenu[6] == true then SACK6() end
end
EMIRHAN = -1 
end

function SACK1()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.05", gg.TYPE_FLOAT, false)
gg.getResults(999999)
gg.editAll("2000", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.05", gg.TYPE_FLOAT, false)
gg.getResults(999999)
gg.editAll("2000", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("✅Car Fly Active✅\n❤️‍🔥Instagram : @emirhan_unity❤️‍🔥")
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈
function SACK2()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("250", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("286", gg.TYPE_FLOAT)
gg.clearResults()
end
function SACK3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("8", gg.TYPE_FLOAT)
gg.getResults(10000)
gg.editAll("999999", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert('【On】ঔৣ͜͡➳ ➣by emirhan')
end --kingEmirhan
function SACK4()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("250", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("243", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("✅Car UnderGround ON✅\n❤️‍🔥Instagram : @emirhan_unity❤️‍🔥")
end
function SACK5()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("243", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("250", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("✅Car UnderGround OFF✅\n❤️‍🔥Instagram : @emirhan_unity❤️‍🔥")
end
function SACK6()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.searchNumber("0.25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.getResults(600, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("120", gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults()
gg.toast("✅Car Speed Active✅\n❤️‍🔥Instagram : @emirhan_unity❤️‍🔥")
end--lol

function MENU5()
MapMenu = gg.multiChoice({
	"ঔৣ͜͡➳ ➣【ON】ғᴘs ʜᴀᴄᴋ",
	"ঔৣ͜͡➳ ➣【OFF】ғᴘs ʜᴀᴄᴋ",
	"ঔৣ͜͡➳ ➣【ON】ʜᴅ ɢʀᴀᴘʜɪᴄs",
	"ঔৣ͜͡➳ ➣【ON】ʀᴇᴍᴏᴠᴇ ᴍᴀᴘ",
	"ঔৣ͜͡➳ ➣【OFF】ʀᴇᴍᴏᴠᴇ ᴍᴀᴘ",
	"ঔৣ͜͡➳ ➣【𝐎𝐍】Dʀᴏɴᴇ Mᴏᴅᴇ",
	"ঔৣ͜͡➳ ➣【𝐎FF】Dʀᴏɴᴇ Mᴏᴅᴇ",
	"ঔৣ͜͡➳ ➣【𝐎N】ɴɪɢʜᴛ ᴍᴏᴅᴇ",
    "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"➣【❂】♌︎【MƛƤ MЄƝƲ】 ")

if MapMenu == nil then else
if MapMenu[1] == true then MACK1() end
if MapMenu[2] == true then MACK2() end
if MapMenu[3] == true then MACK3() end
if MapMenu[4] == true then MACK4() end
if MapMenu[5] == true then MACK5() end
if MapMenu[6] == true then MACK6() end
if MapMenu[7] == true then MACK7() end
if MapMenu[8] == true then MACK8() end
end
EMIRHAN = -1 
end

function MACK1()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.getResults(170)
gg.editAll("4000", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("FPS Hack ON. By Emirhan")
end
function MACK2()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("20", gg.TYPE_FLOAT)
gg.getResults(17700)
gg.editAll("1000", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("FPS Hack OFF. By Emirhan")
end
function MACK3()
gg.clearResults()
gg.getRanges()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-1", gg.TYPE_FLOAT, false)
gg.getResults(100000)
gg.editAll("1.573;.01;1.0e-6", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Hd Graphics")
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
end
function MACK4()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("3000", gg.TYPE_FLOAT)
  gg.getResults(10000)
  gg.editAll("1", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Remove Map NoCrsh")
  gg.setVisible(false)
end 
function MACK5()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.getResults(10000)
  gg.editAll("3000", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Remove Map NoCrsh off")
  gg.setVisible(false)
end 
function MACK6()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.60000", gg.TYPE_FLOAT, false)
  gg.getResults(7080)
  gg.editAll("900", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('ঔৣ͜͡➳ ➣Unity Drone Mod')
  end
function MACK7()
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("900", gg.TYPE_FLOAT, false)
  gg.getResults(7080)
  gg.editAll("0.60000", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast('ঔৣ͜͡➳ ➣Unity Drone Mod off')
  end
 function MACK8()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(".57735025883;.01;1.0e-6", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1.0e-6", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("-1", gg.TYPE_FLOAT, false, 536870912, 0, -1)
gg.clearResults()
gg.toast("ঔৣ͜͡➳ ➣【NightMode】")
end

function MENU6()
WeaponMenu = gg.multiChoice({
    " ঔৣ͜͡➳ ➣🎯【ᴀɪᴍʙᴏᴛ】%60",
    " ঔৣ͜͡➳ ➣🎯【ᴀɪᴍʙᴏᴛ】%30",
    " ঔৣ͜͡➳ ➣🎯【ᴀɪᴍʙᴏᴛ】%60",
  "ঔৣ͜͡➳ ➣🎯【ᴀɪᴍʀᴇᴄᴏɪʟ】%10",
     "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"ঔৣ͜͡➳ ➣【🎯】♌︎【ƛƖM MЄƝƲ】")

if AimMenu == nil then else
if AimMenu[1] == true then NAYS1() end
if AimMenu[2] == true then NAYS2() end
if AimMenu[3] == true then NAYS3() end
if AimMenu[4] == true then NAYS4() end
end
EMIRHAN = -1 
end

function NAYS1()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(3000)
gg.editAll("0.30", gg.TYPE_FLOAT)
gg.toast("楤螿蒙玄")
end
function NAYS2()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("-4", gg.TYPE_FLOAT, false)
  gg.getResults(100000)
  gg.editAll("5.05", gg.TYPE_FLOAT, false)
  gg.clearResults()
  gg.toast("God Hack On Hack on by emirhan")
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
  gg.setVisible(false)
end --brah
function NAYS3()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.3", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll(" 2.2 ", gg.TYPE_FLOAT)
gg.toast('AimBot`on')
end
function NAYS4()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.009999999999", gg.TYPE_FLOAT )
  gg.getResults(100000)
  gg.editAll("0", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ᴀɪᴍʀᴇᴄᴏɪʟ(On) By Emirhan")
  gg.setVisible(false)
  end
  
function MENU7()
NewMenu = gg.multiChoice({
    "ঔৣ͜͡➳ ➣么ᴀɪᴍʙᴏᴛ %𝟾𝟶螿",
	"ঔৣ͜͡➳ ➣么ʜᴇᴀᴅsʜᴏᴛ%100螿",
	"ঔৣ͜͡➳ ➣么ᴍᴀᴄɪᴄ ʙᴜʟʟᴇᴛss螿",
	"ঔৣ͜͡➳ ➣么𝐥𝐨𝐨𝐤 𝐟𝐨𝐫𝐰𝐚𝐫𝐝螿",
	"ঔৣ͜͡➳ ➣OFF么𝐥𝐨𝐨𝐤 𝐟𝐨𝐫𝐰𝐚𝐫𝐝螿",
    "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
	},nil,"ঔৣ͜͡➳ ➣【⚠️】♌︎【ƔƖƤ MЄƝƲ】")

if NewMenu == nil then else
if NewMenu[1] == true then A1() end
if NewMenu[2] == true then A2() end
if NewMenu[3] == true then A3() end
end
EMIRHAN = -1 
end

function A1()
gg.searchNumber("-3.82564576e28;-2.78989171e28;-3.74440972e28;-2.8053577e28;2015175168.0;-3.74440972e28:21", 16, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("-3.74440972e28", 16, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(6)
gg.editAll("0", 16, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.clearResults()
gg.clearResults()
gg.searchNumber("360;0.0001;1478828288", 16, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("0.0001", 16, false, gg.SIGN_EQUAL, 0, -1)
hack4off=gg.getResults(100)
gg.editAll("9999", gg.TYPE_FLOAT)
gg.toast("➸❤️‍🔥Aɪᴍʙᴏᴛ❤️‍🔥 ")
end
function A2()
gg.clearResults()
gg.setRanges(gg.REGION_BAD)
gg.searchNumber("-88.66608428955;26:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-460", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("-88.73961639404;28:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-560", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("100", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("❤️‍🔥Aᴜᴛᴏ Hᴇᴀᴅsʜᴏᴛ Oɴ❤️‍🔥")
end
function A3()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("360", gg.TYPE_FLOAT)
gg.clearResults()

gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("10.0;46.0;1.0;45.0;10.0;135.0;225.0;10.0:193", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("10.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(50000)
gg.editAll("999", gg.TYPE_FLOAT)

gg.setRanges(gg.REGION_ANONYMOUS)
gg.clearResults()
gg.searchNumber("1,100,159,584", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("1,122,159,584", gg.TYPE_DWORD)
gg.clearResults()
end


function MENU8()
ChienseMenu = gg.multiChoice({
	"【𝐎N】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀ X15",
    "【𝐎N】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀ X40",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀ X100",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀx150",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀx200",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX300",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX400",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX500",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX600",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX700",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX800",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX900",
    "【ON】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX999",
    "【OFF】Ξ ᴄʜɪᴇɴsᴇ sᴘᴇᴇᴅᴇʀX999",
    "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
    },nil,"ঔৣ͜͡➳ ➣【⚠️】♌︎【ƇӇƖЄƝƧЄ ƧƤЄЄƊЄƦ】")

if ChienseMenu == nil then else
if ChienseMenu[1] == true then AMK1() end
if ChienseMenu[2] == true then AMK2() end
if ChienseMenu[3] == true then AMK3() end
if ChienseMenu[4] == true then AMK4() end
if ChienseMenu[5] == true then AMK5() end
if ChienseMenu[6] == true then AMK6() end
if ChienseMenu[7] == true then AMK7() end
if ChienseMenu[8] == true then AMK8() end
if ChienseMenu[9] == true then AMK9() end
if ChienseMenu[10] == true then AMK10() end
if ChienseMenu[11] == true then AMK11() end
if ChienseMenu[12] == true then AMK12() end
if ChienseMenu[13] == true then AMK13() end
if ChienseMenu[14] == true then AMK14() end
end
EMIRHAN = -1 
end

function AMK1()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "15"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK2()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "40"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "100"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK4()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "150"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK5()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "200"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK6()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "300"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK7()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "400"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK8()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "500"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK9()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "600"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK10()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "700"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK11()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "800"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK12()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "900"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK13()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "999"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end
function AMK15()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("999;0.0700000003;0.02999999933::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("999", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1)
for i, v in ipairs(t) do
 t[i].value = "1"
 t[i].freeze = true
end
gg.addListItems(t)
gg.clearResults()
end

function MENU9()
ModMenu = gg.multiChoice({
	"【𝐎𝐍】Ξ fℓу ѕтσρ",
	"【𝐎FF】Ξ fℓу ѕтσρ",
    "【𝐎𝐍】Ξ вσмв вυттσиѕ",
    "ঔৣ͜͡➳ ➣么𝐥𝐨𝐨𝐤 𝐟𝐨𝐫𝐰𝐚𝐫𝐝螿",
	"ঔৣ͜͡➳ ➣OFF么𝐥𝐨𝐨𝐤 𝐟𝐨𝐫𝐰𝐚𝐫𝐝螿",
	    "┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
    },nil,"ঔৣ͜͡➳ ➣【🅜🅞🅓 🅜🅔🅝🅤")

if ModMenu == nil then else
if ModMenu[1] == true then SJ1() end
if ModMenu[2] == true then SJ2() end
if ModMenu[3] == true then SJ3() end
if ModMenu[4] == true then SJ4() end
if ModMenu[5] == true then SJ5() end
end
EMIRHAN = -1 
end

function SJ1()
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0x186431C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")
gg.clearResults()

gg.sleep(350)
gg.toast("Loadingâ€¦50%")
gg.sleep(350)
gg.toast("Loadingâ€¦100%")
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0x1861038
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 34 42")
gg.clearResults()
gg.toast("Activated")
end
function SJ2()
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0x186431C
original("7F 45 4C 46 01 01 01 00")
replaced("F0 4F 2D E9 1C B0 8D E2")
gg.clearResults()
end
function SJ3()
gg.setRanges(gg.REGION_CODE_APP)
name("libil2cpp.so")
myoffset = 0xB3E994
original("7F 45 4C 46 01 01 01 00")
replaced("01 00 A0 E3 1E FF 2F E1")
gg.clearResults()
gg.toast("Activated")
end 
function SJ4()
gg.getRanges()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("600", gg.TYPE_FLOAT)
gg.getResults(100000)
gg.editAll("-200", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Oww")
gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function SJ5()
gg.getRanges()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("-200", gg.TYPE_FLOAT)
  gg.getResults(100000)
  gg.editAll("600", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast('"oww')
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼

function MENU10()
GodMenu = gg.multiChoice({
	"【ON】ムɪɴᴠɪsɪʙʟᴇ ",
	"【𝐎FF】ムɪɴᴠɪsɪʙʟᴇ",
    "【ON】ムɢᴏᴅ ғʟʏ",
    "【OFF】ムɢᴏᴅ ғʟʏ",
    "【𝐎𝐍】ムɢᴏᴅ ᴜɴᴅᴇʀɢʀᴏᴜɴᴅ",
    "【OFF】ムɢᴏᴅ ᴜɴᴅᴇʀɢʀᴏᴜɴᴅ",
	"┏━━❂𝐁𝐀𝐂𝐊❂━━┓",
},nil,"ঔৣ͜📁 ➣〘𝐠𝐨𝐝 𝐦𝐞𝐧𝐮〙")

if GodMenu == nil then else
if GodMenu[1] == true then CK1() end
if GodMenu[2] == true then CK2() end
if GodMenu[3] == true then CK3() end
if GodMenu[4] == true then CK4() end
if GodMenu[5] == true then CK5() end
if GodMenu[6] == true then CK6() end
end
EMIRHAN = -1 
end

function CK1()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("6,000.0", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("1,000.0", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("GOD MODE ACTIVATED")
  gg.setVisible(false)
end
function CK2()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("1,000.0", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("6,000.0", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("DEACTIVE")
  gg.setVisible(false)
end
function CK3()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("250", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("280", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("fly god")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function CK4()
  gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("280", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("250", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("Hack")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷
function CK5()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("250", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("230", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("GOD MODE ACTIVATED")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣娼楀噥娼楀⿶鐓掑簠婵旀綏锟介ゾ鎮滈ゾ鎮侀ゾ鎮らゾ鎮庨ゾ鎮旸韫妲戦ゾ鎮嗛ゾ鎮愰灏攷锟� --闅�锟�
function CK6()
gg.getRanges()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("230", gg.TYPE_FLOAT,false)
  gg.getResults(100000)
  gg.editAll("250", gg.TYPE_FLOAT,false)
  gg.clearResults()
  gg.toast("GOD MODE ACTIVATED")
  gg.setVisible(false)
end --闅�锟� 閿庢敨鐓傚惣


MainMenu()

while(true)
do
  while gg.isVisible(true)
    do
      gg.setVisible(false)
      MainMenu()
    end
end
