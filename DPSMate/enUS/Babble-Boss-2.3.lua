﻿--[[
Name: Babble-Boss-2.2
Revision: $Rev: 17545 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Documentation: http://wiki.wowace.com/index.php/Babble-Boss-2.2
SVN: http://svn.wowace.com/root/trunk/Babble-2.2/Babble-Boss-2.2
Description: A library to provide localizations for bosses.
Dependencies: AceLibrary, AceLocale-2.2
]]

local MAJOR_VERSION = "DPSBabble-Boss-2.3"
local MINOR_VERSION = tonumber(string.sub("$Revision: 17545 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.3") then error(MAJOR_VERSION .. " requires AceLocale-2.3") end

local _, x = AceLibrary("AceLocale-2.3"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleBoss = AceLibrary("AceLocale-2.3"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleBoss:EnableDebugging()

local bosses = {
	-- Costum bosses
	["Firesworn"] = true,

	["Avalanchion"] = true,
	["The Windreaver"] = true,
	["Baron Charr"] = true,
	["Princess Tempestria"] = true,
	["Grethok the Controller"] = true,
	["Patchwerk"] = true,
	["Grobbulus"] = true,
	["Gluth"] = true,
	["Feugen"] = true,
	["Stalagg"] = true,
	["Thaddius"] = true,
	["Anub'Rekhan"] = true,
	["Grand Widow Faerlina"] = true,
	["Maexxna"] = true,
	["Instructor Razuvious"] = true,
	--["Deathknight Understudy"] = true,
	["Gothik the Harvester"] = true,
	["Highlord Mograine"] = true,
	["Thane Korth'azz"] = true,
	["Lady Blaumeux"] = true,
	["Sir Zeliek"] = true,
	["The Four Horsemen"] = true,
	["Noth the Plaguebringer"] = true,
	["Heigan the Unclean"] = true,
	["Loatheb"] = true,
	["Sapphiron"] = true,
	["Kel'Thuzad"] = true,
	["Lord Victor Nefarius"] = true,
	["Nefarian"] = true,
	["Vaelastrasz the Corrupt"] = true,
	["Razorgore the Untamed"] = true,
	["Broodlord Lashlayer"] = true,
	["Chromaggus"] = true,
	["Ebonroc"] = true,
	["Firemaw"] = true,
	["Flamegor"] = true,
	["Majordomo Executus"] = true,
	["Ragnaros"] = true,
	["Baron Geddon"] = true,
	["Golemagg the Incinerator"] = true,
	["Garr"] = true,
	["Sulfuron Harbinger"] = true,
	["Shazzrah"] = true,
	["Lucifron"] = true,
	["Gehennas"] = true,
	["Magmadar"] = true,
	["Onyxia"] = true,
	["Azuregos"] = true,
	["Lord Kazzak"] = true,
	["Ysondre"] = true,
	["Emeriss"] = true,
	["Taerar"] = true,
	["Lethon"] = true,
	["High Priestess Jeklik"] = true,
	["High Priest Venoxis"] = true,
	["High Priest Thekal"] = true,
	["High Priestess Arlokk"] = true,
	["High Priestess Mar'li"] = true,
	["Jin'do the Hexxer"] = true,
	["Bloodlord Mandokir"] = true,
	["Gahz'ranka"] = true,
	["Gri'lek"] = true,
	["Hazza'rah"] = true,
	["Renataki"] = true,
	["Wushoolay"] = true,
	["Hakkar"] = true,
	["Ayamiss the Hunter"] = true,
	["Buru the Gorger"] = true,
	["General Rajaxx"] = true,
	["Lieutenant General Andorov"] = true,
	["Moam"] = true,
	["Ossirian the Unscarred"] = true,
	["Lord Kri"] = true,
	["Princess Yauj"] = true,
	["Vem"] = true,
	["The Bug Family"] = true,
	["Eye of C'Thun"] = true,
	["C'Thun"] = true,
	["Fankriss the Unyielding"] = true,
	["Princess Huhuran"] = true,
	["Ouro"] = true,
	["Battleguard Sartura"] = true,
	["The Prophet Skeram"] = true,
	["Emperor Vek'lor"] = true,
	["Emperor Vek'nilash"] = true,
	["The Twin Emperors"] = true,
	["Viscidus"] = true,
	["Alzzin the Wildshaper"] = true,
	["Ambassador Flamelash"] = true,
	["Anger'rel"] = true,
	["Archivist Galford"] = true,
	["Atal'alarion"] = true,
	["Avatar of Hakkar"] = true,
	["Bael'Gar"] = true,
	["Balnazzar"] = true,
	["Baroness Anastari"] = true,
	["Baron Rivendare"] = true,
	["Cannon Master Willey"] = true,
	["Captain Kromcrush"] = true,
	["Celebras the Cursed"] = true,
	["Crystal Fang"] = true,
	["Darkmaster Gandling"] = true,
	["Doctor Theolen Krastinov"] = true,
	["Doom'rel"] = true,
	["Dope'rel"] = true,
	["Dreamscythe"] = true,
	["Emperor Dagran Thaurissan"] = true,
	["Fineous Darkvire"] = true,
	["Gasher"] = true,
	["General Angerforge"] = true,
	["General Drakkisath"] = true,
	["Gloom'rel"] = true,
	["Golem Lord Argelmach"] = true,
	["Goraluk Anvilcrack"] = true,
	["Guard Fengus"] = true,
	["Guard Mol'dar"] = true,
	["Guard Slip'kik"] = true,
	["Gyth"] = true,
	["Halycon"] = true,
	["Hate'rel"] = true,
	["Hazzas"] = true,
	["Hearthsinger Forresten"] = true,
	["High Interrogator Gerstahn"] = true,
	["Highlord Omokk"] = true,
	["Hukku"] = true,
	["Hurley Blackbreath"] = true,
	["Hydrospawn"] = true,
	["Illyanna Ravenoak"] = true,
	["Immol'thar"] = true,
	["Instructor Malicia"] = true,
	["Jammal'an the Prophet"] = true,
	["Jandice Barov"] = true,
	["King Gordok"] = true,
	["Kirtonos the Herald"] = true,
	["Lady Illucia Barov"] = true,
	["Landslide"] = true,
	["Lethtendris"] = true,
	["Lord Alexei Barov"] = true,
	["Lord Incendius"] = true,
	["Lord Vyletongue"] = true,
	["Lorekeeper Polkelt"] = true,
	["Loro"] = true,
	["Magister Kalendris"] = true,
	["Magistrate Barthilas"] = true,
	["Magmus"] = true,
	["Maleki the Pallid"] = true,
	["Marduk Blackpool"] = true,
	["Meshlok the Harvester"] = true,
	["Mijan"] = true,
	["Morphaz"] = true,
	["Mother Smolderweb"] = true,
	["Nerub'enkan"] = true,
	["Noxxion"] = true,
	["Ogom the Wretched"] = true,
	["Overlord Wyrmthalak"] = true,
	["Phalanx"] = true,
	["Plugger Spazzring"] = true,
	["Postmaster Malown"] = true,
	["Princess Moira Bronzebeard"] = true,
	["Princess Theradras"] = true,
	["Prince Tortheldrin"] = true,
	["Pusillin"] = true,
	["Pyroguard Emberseer"] = true,
	["Ramstein the Gorger"] = true,
	["Ras Frostwhisper"] = true,
	["Rattlegore"] = true,
	["Razorlash"] = true,
	["Warchief Rend Blackhand"] = true,
	["Ribbly Screwspigot"] = true,
	["Rotgrip"] = true,
	["Seeth'rel"] = true,
	["Shade of Eranikus"] = true,
	["Shadow Hunter Vosh'gajin"] = true,
	["Solakar Flamewreath"] = true,
	["Stomper Kreeg"] = true,
	["Tendris Warpwood"] = true,
	["The Beast"] = true,
	["The Ravenian"] = true,
	["Timmy the Cruel"] = true,
	["Tinkerer Gizlock"] = true,
	["Tsu'zee"] = true,
	["Vectus"] = true,
	["Vile'rel"] = true,
	["War Master Voone"] = true,
	["Weaver"] = true,
	["Zevrim Thornhoof"] = true,
	["Zolo"] = true,
	["Zul'Lor"] = true,
	
	-- From Mendeleev
	["Cho'Rush the Observer"] = true,
	["Lord Hel'nurath"] = true,
	["Pimgib"] = true,
	["Knot Thimblejack's Cache"] = true,
	["Cannonmaster Willey"] = true,
	["Emperor Dagran Thaurissian"] = true,
	["Archmage Arugal"] = true,
	["Archmage Arugal's Voidwalker"] = true,
	["Baron Silverlaine"] = true,
	["Commander Springvale"] = true,
	["Deathsworn Captain"] = true,
	["Fenrus the Devourer"] = true,
	["Odo the Blindwatcher"] = true,
	["Razorclaw the Butcher"] = true,
	["Wolf Master Nandos"] = true,
	["Rend Blackhand"] = true,
	["Kurinnaxx"] = true,

	-- OUTLANDS
	-- XXX: These are subject to change and may not be correct.
	-- Karazhan
	["Prince Malchazzar"] = true,
	["Attumen the Huntsman"] = true,
	["Dorathee"] = true,
	["Toto"] = true,
	["Tinhead"] = true,
	["Strawman"] = true,
	["Roar"] = true,
	["Crone"] = true,
	["Romulo"] = true,
	["Julianne"] = true,
	-- Caverns of Time
	["Lieutenant Drake"] = true,
	["Captain Skarloc"] = true,
	["The Epoch Hunter"] = true,
	["Archimonde"] = true,
	-- Hellfire Ramparts
	["Watchkeeper Gargolmar"] = true,
	["Vazruden"] = true,
	["Omor the Unscarred"] = true,
	-- The Blood Furnace
	["The Maker"] = true,
	["Broggok"] = true,
	["Keli'dan the Breaker"] = true,
	-- The Shattered Halls
	["Kargath Bladefist"] = true,
	["Grand Warlock Nethekurse"] = true,
	["Warbringer O'omrogg"] = true,
	-- Magtheridon's Lair
	["Magtheridon"] = true,
	-- The Slave Pens
	["Mennu the Betrayer"] = true,
	["Rokmar the Crackler"] = true,
	["Quagmirran"] = true,
	-- The Underbog
	["Hungarfen"] = true,
	["Ghaz'an"] = true,
	["Overseer Tidewrath"] = true,
	["Claw"] = true,
	["Swamplord Musel'ek"] = true,
	["The Black Stalker"] = true,
	-- The Steamvault
	-- Serpentshrine Cavern
	["Lady Vashj"] = true,
	-- Mana Tombs
	["Pandemonius"] = true,
	["Tavarok"] = true,
	["Nexus-Prince Shaffar"] = true,
	-- Auchenai Crypts
	["Shirrak the Dead Watcher"] = true,
	["Exarch Maladaar"] = true,
	-- Sethekk Halls
	["Talon King Ikiss"] = true,
	["Darkweaver Syth"] = true,
	-- Shadow Labyrinth
	-- The Mechanar
	-- The Botanica
	-- The Arcatraz
	-- Eye of the Storm
	["Prince Kael'thas Sunstrider"] = true,
	-- Gruul's Lair
	["Gruul"] = true,
	-- Black Temple
	["Illidan Stormrage"] = true,
	-- Ring of Blood
	["Brokentoe"] = true,
	["Murkblood Twin"] = true,
	["Murkblood Twins"] = true,
	["The Blue Brothers"] = true,
	["Rokdar the Sundered Lord"] = true,
	["Skra'gath"] = true,
	["Warmaul Champion"] = true,
	["Mogor"] = true,
}

BabbleBoss:Debug()
BabbleBoss:SetStrictness(true)

function BabbleBoss:Contains(name)
	if bosses[name] or bosses[self:HasReverseTranslation(name) and self:GetReverseTranslation(name) or false] then
		return true
	end
	return false
end

AceLibrary:Register(BabbleBoss, MAJOR_VERSION, MINOR_VERSION)
BabbleBoss = nil