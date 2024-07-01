
local affinity = require("affinity")
local race_name = require("race_name")

--- Returns mob's affinity type name
---@param affinity_type number
---@return string
function Mob:AffinityName(affinity_type)
	if affinity_type == affinity.WATER then
		return "Water"
	elseif affinity_type == affinity.FIRE then
		return "Fire"
	elseif affinity_type == affinity.EARTH then
		return "Earth"
	elseif affinity_type == affinity.AIR then
		return "Air"
	elseif affinity_type == affinity.SPIRIT then
		return "Spirit"
	end
	return "None"
end

--- Returns value multiplied by affinity modifiers against enemy
---@param value number # damage value
---@param enemy Mob # enemy mob
---@return number # modified damage value
function Mob:AffinityDamage(value, enemy)
	local my_affinity = self:AffinityOffense()
	local enemy_affinity = enemy:AffinityDefense()

	if my_affinity == affinity.SPIRIT then
		if enemy_affinity == affinity.AIR then
			return value * 0.5
		end
		if enemy_affinity == affinity.WATER then
			return value * 1.5
		end
		return value
	end
	if my_affinity == affinity.WATER then
		if enemy_affinity == affinity.SPIRIT then
			return value * 0.5
		end
		if enemy_affinity == affinity.FIRE then
			return value * 1.5
		end
		return value
	end
	if my_affinity == affinity.FIRE then
		if enemy_affinity == affinity.WATER then
			return value * 0.5
		end
		if enemy_affinity == affinity.EARTH then
			return value * 1.5
		end
		return value
	end
	if my_affinity == affinity.EARTH then
		if enemy_affinity == affinity.FIRE then
			return value * 0.5
		end
		if enemy_affinity == affinity.AIR then
			return value * 1.5
		end
		return value
	end
	if my_affinity == affinity.AIR then
		if enemy_affinity == affinity.EARTH then
			return value * 0.5
		end
		if enemy_affinity == affinity.SPIRIT then
			return value * 1.5
		end
		return value
	end
	return value
end

---@param deity number
---@return number # 0: none, 1: spirit (magic), 2: fire, 3: water (cold), 4: (poison), 5: air (disease)
function deityAffinity(deity)
	if deity == 140 or deity == 396 then
		return affinity.EARTH -- agnostic
	end
	if deity == 201 then
		return affinity.EARTH -- bertox
	end
	if deity == 202 then
		return affinity.EARTH -- brell
	end
	if deity == 203 then
		return affinity.FIRE -- cazic fire
	end
	if deity == 204 then
		return affinity.AIR -- erollisi air
	end
	if deity == 205 then
		return affinity.SPIRIT -- bristlebane spirit
	end
	if deity == 206 then
		return affinity.FIRE -- innoruuk fire
	end
	if deity == 207 then
		return affinity.WATER -- karana water
	end
	if deity == 208 then
		return affinity.SPIRIT -- mithaniel spirit
	end
	if deity == 209 then
		return affinity.WATER -- prexus water
	end
	if deity == 210 then
		return affinity.AIR -- quellious air
	end
	if deity == 211 then
		return affinity.WATER -- rallos water
	end
	if deity == 212 then
		return affinity.SPIRIT -- rodect spirit
	end
	if deity == 213 then
		return affinity.FIRE -- solusek fire
	end
	if deity == 214 then
		return affinity.FIRE -- tribunal fire
	end
	if deity == 215 then
		return affinity.EARTH -- tunare
	end
	if deity == 216 then
		return affinity.AIR -- veeshan air
	end
	return 0
end


---@return number # 0: none, 1: spirit (magic), 2: fire, 3: water (cold), 4: (poison), 5: air (disease)
function Mob:AffinityDefense()
	local client = self:CastToClient()
	if client ~= nil and client.valid then
		-- TODO: add augs that change defensive affinity
		return deityAffinity(client:GetDeity())
	end

	local npc = self:CastToNPC()
	if npc == nil or not npc.valid then
		return affinity.NONE
	end

	return npc_affinity(eq.get_zone_id(), npc:GetRace(), npc:GetTexture())
end

function Mob:AffinityOffense()
	local client = self:CastToClient()
	if client ~= nil and client.valid then
		-- TODO: add augs that change offensive affinity
		return deityAffinity(client:GetDeity())
	end

	local npc = self:CastToNPC()
	if npc == nil or not npc.valid then
		return affinity.NONE
	end

	return npc_affinity(eq.get_zone_id(), npc:GetRace(), npc:GetTexture())
end


local ZoneAffinity = {
	[Zone.abysmal] = {Affinity = affinity.WATER},
	[Zone.acrylia] = {Affinity = affinity.SPIRIT},
	[Zone.airplane] = {Affinity = affinity.AIR},
	[Zone.akanon] = {Affinity = affinity.WATER},
	[Zone.akheva] = {Affinity = affinity.EARTH},
	[Zone.alkabormare] = {Affinity = affinity.AIR},
	[Zone.anguish] = {Affinity = affinity.AIR},
	[Zone.apprentice] = {Affinity = affinity.WATER},
	[Zone.arcstone] = {Affinity = affinity.SPIRIT},
	[Zone.arelis] = {Affinity = affinity.EARTH},
	[Zone.arena] = {Affinity = affinity.EARTH},
	[Zone.arena2] = {Affinity = affinity.EARTH},
	[Zone.argath] = {Affinity = affinity.WATER},
	[Zone.arthicrex] = {Affinity = affinity.EARTH},
	[Zone.arttest] = {Affinity = affinity.WATER},
	[Zone.ashengate] = {Affinity = affinity.FIRE},
	[Zone.atiiki] = {Affinity = affinity.EARTH},
	[Zone.aviak] = {Affinity = affinity.AIR},
	[Zone.barindu] = {Affinity = affinity.SPIRIT},
	[Zone.barren] = {Affinity = affinity.WATER},
	[Zone.barter] = {Affinity = affinity.WATER},
	[Zone.bazaar] = {Affinity = affinity.WATER},
	[Zone.beastdomain] = {Affinity = affinity.AIR},
	[Zone.befallen] = {Affinity = affinity.SPIRIT},
	[Zone.befallenb] = {Affinity = affinity.SPIRIT},
	[Zone.beholder] = {Affinity = affinity.WATER},
	[Zone.bertoxtemple] = {Affinity = affinity.WATER},
	[Zone.blackburrow] = {Affinity = affinity.WATER},
	[Zone.blacksail] = {Affinity = affinity.WATER},
	[Zone.bloodfields] = {Affinity = affinity.WATER},
	[Zone.bloodmoon] = {Affinity = affinity.WATER},
	[Zone.bothunder] = {Affinity = affinity.WATER},
	[Zone.breedinggrounds] = {Affinity = affinity.WATER},
	[Zone.brellsarena] = {Affinity = affinity.WATER},
	[Zone.brellsrest] = {Affinity = affinity.WATER},
	[Zone.brellstemple] = {Affinity = affinity.WATER},
	[Zone.broodlands] = {Affinity = affinity.WATER},
	[Zone.buriedsea] = {Affinity = affinity.WATER},
	[Zone.burningwood] = {Affinity = affinity.WATER},
	[Zone.butcher] = {Affinity = affinity.EARTH},
	[Zone.cabeast] = {Affinity = affinity.WATER},
	[Zone.cabwest] = {Affinity = affinity.WATER},
	[Zone.cauldron] = {Affinity = affinity.WATER},
	[Zone.causeway] = {Affinity = affinity.WATER},
	[Zone.cazicthule] = {Affinity = affinity.WATER},
	[Zone.chambersa] = {Affinity = affinity.WATER},
	[Zone.chambersb] = {Affinity = affinity.WATER},
	[Zone.chambersc] = {Affinity = affinity.WATER},
	[Zone.chambersd] = {Affinity = affinity.WATER},
	[Zone.chamberse] = {Affinity = affinity.WATER},
	[Zone.chambersf] = {Affinity = affinity.WATER},
	[Zone.chapterhouse] = {Affinity = affinity.WATER},
	[Zone.charasis] = {Affinity = affinity.WATER},
	[Zone.chardok] = {Affinity = affinity.EARTH},
	[Zone.chardokb] = {Affinity = affinity.SPIRIT},
	[Zone.citymist] = {Affinity = affinity.WATER},
	[Zone.cityofbronze] = {Affinity = affinity.WATER},
	[Zone.clz] = {Affinity = affinity.WATER},
	[Zone.cobaltscar] = {Affinity = affinity.WATER},
	[Zone.codecay] = {Affinity = affinity.SPIRIT},
	[Zone.commonlands] = {Affinity = affinity.FIRE},
	[Zone.commons] = {Affinity = affinity.FIRE},
	[Zone.convorteum] = {Affinity = affinity.WATER},
	[Zone.coolingchamber] = {Affinity = affinity.WATER},
	[Zone.corathus] = {Affinity = affinity.WATER},
	[Zone.corathusa] = {Affinity = affinity.WATER},
	[Zone.corathusb] = {Affinity = affinity.WATER},
	[Zone.crescent] = {Affinity = affinity.WATER},
	[Zone.crushbone] = {Affinity = affinity.AIR},
	[Zone.cryptofshade] = {Affinity = affinity.WATER},
	[Zone.crystal] = {Affinity = affinity.WATER},
	[Zone.crystallos] = {Affinity = affinity.WATER},
	[Zone.crystalshard] = {Affinity = affinity.WATER},
	[Zone.cshome] = {Affinity = affinity.WATER},
	[Zone.dalnir] = {Affinity = affinity.WATER},
	[Zone.dawnshroud] = {Affinity = affinity.WATER},
	[Zone.deadbone] = {Affinity = affinity.WATER},
	[Zone.delvea] = {Affinity = affinity.WATER},
	[Zone.delveb] = {Affinity = affinity.WATER},
	[Zone.devastation] = {Affinity = affinity.WATER},
	[Zone.devastationa] = {Affinity = affinity.WATER},
	[Zone.direwind] = {Affinity = affinity.WATER},
	[Zone.discord] = {Affinity = affinity.WATER},
	[Zone.discordtower] = {Affinity = affinity.WATER},
	[Zone.drachnidhive] = {Affinity = affinity.FIRE},
	[Zone.drachnidhivea] = {Affinity = affinity.FIRE},
	[Zone.drachnidhiveb] = {Affinity = affinity.FIRE},
	[Zone.drachnidhivec] = {Affinity = affinity.FIRE},
	[Zone.dragoncrypt] = {Affinity = affinity.WATER},
	[Zone.dragonscale] = {Affinity = affinity.WATER},
	[Zone.dragonscaleb] = {Affinity = affinity.WATER},
	[Zone.dranik] = {Affinity = affinity.WATER},
	[Zone.dranikcatacombsa] = {Affinity = affinity.WATER},
	[Zone.dranikcatacombsb] = {Affinity = affinity.WATER},
	[Zone.dranikcatacombsc] = {Affinity = affinity.WATER},
	[Zone.dranikhollowsa] = {Affinity = affinity.WATER},
	[Zone.dranikhollowsb] = {Affinity = affinity.WATER},
	[Zone.dranikhollowsc] = {Affinity = affinity.WATER},
	[Zone.draniksewersa] = {Affinity = affinity.WATER},
	[Zone.draniksewersb] = {Affinity = affinity.WATER},
	[Zone.draniksewersc] = {Affinity = affinity.WATER},
	[Zone.draniksscar] = {Affinity = affinity.WATER},
	[Zone.dreadlands] = {Affinity = affinity.WATER},
	[Zone.dreadspire] = {Affinity = affinity.WATER},
	[Zone.droga] = {Affinity = affinity.WATER},
	[Zone.dulak] = {Affinity = affinity.WATER},
	[Zone.eastkarana] = {Affinity = affinity.WATER},
	[Zone.eastkorlach] = {Affinity = affinity.WATER},
	[Zone.eastkorlacha] = {Affinity = affinity.WATER},
	[Zone.eastsepulcher] = {Affinity = affinity.WATER},
	[Zone.eastwastes] = {Affinity = affinity.WATER},
	[Zone.eastwastesshard] = {Affinity = affinity.WATER},
	[Zone.echo_] = {Affinity = affinity.WATER},
	[Zone.ecommons] = {Affinity = affinity.WATER},
	[Zone.elddar] = {Affinity = affinity.WATER},
	[Zone.elddara] = {Affinity = affinity.WATER},
	[Zone.emeraldjungle] = {Affinity = affinity.WATER},
	[Zone.erudnext] = {Affinity = affinity.WATER},
	[Zone.erudnint] = {Affinity = affinity.WATER},
	[Zone.erudsxing] = {Affinity = affinity.WATER},
	[Zone.erudsxing2] = {Affinity = affinity.WATER},
	[Zone.everfrost] = {Affinity = affinity.WATER},
	[Zone.eviltree] = {Affinity = affinity.WATER},
	[Zone.fallen] = {Affinity = affinity.WATER},
	[Zone.fearplane] = {Affinity = affinity.FIRE},
	[Zone.feerrott] = {Affinity = affinity.WATER},
	[Zone.feerrott2] = {Affinity = affinity.WATER},
	[Zone.felwithea] = {Affinity = affinity.EARTH},
	[Zone.felwitheb] = {Affinity = affinity.EARTH},
	[Zone.ferubi] = {Affinity = affinity.WATER},
	[Zone.fhalls] = {Affinity = affinity.WATER},
	[Zone.fieldofbone] = {Affinity = affinity.SPIRIT},
	[Zone.firiona] = {Affinity = affinity.EARTH},
	[Zone.foundation] = {Affinity = affinity.WATER},
	[Zone.freeportacademy] = {Affinity = affinity.FIRE},
	[Zone.freeportarena] = {Affinity = affinity.FIRE},
	[Zone.freeportcityhall] = {Affinity = affinity.FIRE},
	[Zone.freeporteast] = {Affinity = affinity.FIRE},
	[Zone.freeporthall] = {Affinity = affinity.FIRE},
	[Zone.freeportmilitia] = {Affinity = affinity.FIRE},
	[Zone.freeportsewers] = {Affinity = affinity.FIRE},
	[Zone.freeporttemple] = {Affinity = affinity.FIRE},
	[Zone.freeporttheater] = {Affinity = affinity.FIRE},
	[Zone.freeportwest] = {Affinity = affinity.FIRE},
	[Zone.freporte] = {Affinity = affinity.SPIRIT},
	[Zone.freportn] = {Affinity = affinity.FIRE},
	[Zone.freportw] = {Affinity = affinity.FIRE},
	[Zone.frontiermtns] = {Affinity = affinity.WATER},
	[Zone.frostcrypt] = {Affinity = affinity.WATER},
	[Zone.frozenshadow] = {Affinity = affinity.WATER},
	[Zone.fungalforest] = {Affinity = affinity.WATER},
	[Zone.fungusgrove] = {Affinity = affinity.WATER},
	[Zone.gfaydark] = {Affinity = affinity.WATER},
	[Zone.greatdivide] = {Affinity = affinity.WATER},
	[Zone.grelleth] = {Affinity = affinity.WATER},
	[Zone.griegsend] = {Affinity = affinity.WATER},
	[Zone.grimling] = {Affinity = affinity.WATER},
	[Zone.grobb] = {Affinity = affinity.WATER},
	[Zone.growthplane] = {Affinity = affinity.WATER},
	[Zone.guardian] = {Affinity = affinity.WATER},
	[Zone.guildhall] = {Affinity = affinity.WATER},
	[Zone.guildlobby] = {Affinity = affinity.WATER},
	[Zone.guka] = {Affinity = affinity.WATER},
	[Zone.gukb] = {Affinity = affinity.WATER},
	[Zone.gukbottom] = {Affinity = affinity.EARTH},
	[Zone.gukc] = {Affinity = affinity.SPIRIT},
	[Zone.gukd] = {Affinity = affinity.SPIRIT},
	[Zone.guke] = {Affinity = affinity.SPIRIT},
	[Zone.gukf] = {Affinity = affinity.SPIRIT},
	[Zone.gukg] = {Affinity = affinity.SPIRIT},
	[Zone.gukh] = {Affinity = affinity.SPIRIT},
	[Zone.guktop] = {Affinity = affinity.AIR},
	[Zone.gunthak] = {Affinity = affinity.WATER},
	[Zone.gyrospireb] = {Affinity = affinity.WATER},
	[Zone.gyrospirez] = {Affinity = affinity.WATER},
	[Zone.halas] = {Affinity = affinity.WATER},
	[Zone.harbingers] = {Affinity = affinity.WATER},
	[Zone.hateplane] = {Affinity = affinity.WATER},
	[Zone.hateplaneb] = {Affinity = affinity.WATER},
	[Zone.hatesfury] = {Affinity = affinity.WATER},
	[Zone.highkeep] = {Affinity = affinity.WATER},
	[Zone.highpass] = {Affinity = affinity.WATER},
	[Zone.highpasshold] = {Affinity = affinity.WATER},
	[Zone.highpasskeep] = {Affinity = affinity.WATER},
	[Zone.hillsofshade] = {Affinity = affinity.WATER},
	[Zone.hohonora] = {Affinity = affinity.WATER},
	[Zone.hohonorb] = {Affinity = affinity.WATER},
	[Zone.hole] = {Affinity = affinity.WATER},
	[Zone.hollowshade] = {Affinity = affinity.WATER},
	[Zone.housegarden] = {Affinity = affinity.WATER},
	[Zone.iceclad] = {Affinity = affinity.WATER},
	[Zone.icefall] = {Affinity = affinity.WATER},
	[Zone.ikkinz] = {Affinity = affinity.WATER},
	[Zone.illsalin] = {Affinity = affinity.WATER},
	[Zone.illsalina] = {Affinity = affinity.WATER},
	[Zone.illsalinb] = {Affinity = affinity.WATER},
	[Zone.illsalinc] = {Affinity = affinity.WATER},
	[Zone.inktuta] = {Affinity = affinity.WATER},
	[Zone.innothule] = {Affinity = affinity.WATER},
	[Zone.innothuleb] = {Affinity = affinity.WATER},
	[Zone.jaggedpine] = {Affinity = affinity.WATER},
	[Zone.jardelshook] = {Affinity = affinity.WATER},
	[Zone.kael] = {Affinity = affinity.WATER},
	[Zone.kaelshard] = {Affinity = affinity.WATER},
	[Zone.kaesora] = {Affinity = affinity.WATER},
	[Zone.kaladima] = {Affinity = affinity.WATER},
	[Zone.kaladimb] = {Affinity = affinity.WATER},
	[Zone.karnor] = {Affinity = affinity.WATER},
	[Zone.katta] = {Affinity = affinity.WATER},
	[Zone.kattacastrum] = {Affinity = affinity.WATER},
	[Zone.kedge] = {Affinity = affinity.WATER},
	[Zone.kerraridge] = {Affinity = affinity.WATER},
	[Zone.kithforest] = {Affinity = affinity.WATER},
	[Zone.kithicor] = {Affinity = affinity.WATER},
	[Zone.kodtaz] = {Affinity = affinity.WATER},
	[Zone.korascian] = {Affinity = affinity.WATER},
	[Zone.kurn] = {Affinity = affinity.WATER},
	[Zone.lakeofillomen] = {Affinity = affinity.WATER},
	[Zone.lakerathe] = {Affinity = affinity.WATER},
	[Zone.lavastorm] = {Affinity = affinity.FIRE},
	[Zone.letalis] = {Affinity = affinity.WATER},
	[Zone.lfaydark] = {Affinity = affinity.WATER},
	[Zone.lichencreep] = {Affinity = affinity.WATER},
	[Zone.load] = {Affinity = affinity.WATER},
	[Zone.load2] = {Affinity = affinity.WATER},
	[Zone.lopingplains] = {Affinity = affinity.WATER},
	[Zone.maiden] = {Affinity = affinity.WATER},
	[Zone.maidensgrave] = {Affinity = affinity.WATER},
	[Zone.mansion] = {Affinity = affinity.WATER},
	[Zone.mechanotus] = {Affinity = affinity.WATER},
	[Zone.mesa] = {Affinity = affinity.WATER},
	[Zone.mira] = {Affinity = affinity.WATER},
	[Zone.miragulmare] = {Affinity = affinity.WATER},
	[Zone.mirb] = {Affinity = affinity.WATER},
	[Zone.mirc] = {Affinity = affinity.WATER},
	[Zone.mird] = {Affinity = affinity.WATER},
	[Zone.mire] = {Affinity = affinity.WATER},
	[Zone.mirf] = {Affinity = affinity.WATER},
	[Zone.mirg] = {Affinity = affinity.WATER},
	[Zone.mirh] = {Affinity = affinity.WATER},
	[Zone.miri] = {Affinity = affinity.WATER},
	[Zone.mirj] = {Affinity = affinity.WATER},
	[Zone.mischiefplane] = {Affinity = affinity.WATER},
	[Zone.mistmoore] = {Affinity = affinity.WATER},
	[Zone.misty] = {Affinity = affinity.WATER},
	[Zone.mistythicket] = {Affinity = affinity.WATER},
	[Zone.mmca] = {Affinity = affinity.WATER},
	[Zone.mmcb] = {Affinity = affinity.WATER},
	[Zone.mmcc] = {Affinity = affinity.WATER},
	[Zone.mmcd] = {Affinity = affinity.WATER},
	[Zone.mmce] = {Affinity = affinity.WATER},
	[Zone.mmcf] = {Affinity = affinity.WATER},
	[Zone.mmcg] = {Affinity = affinity.WATER},
	[Zone.mmch] = {Affinity = affinity.WATER},
	[Zone.mmci] = {Affinity = affinity.WATER},
	[Zone.mmcj] = {Affinity = affinity.WATER},
	[Zone.monkeyrock] = {Affinity = affinity.WATER},
	[Zone.moors] = {Affinity = affinity.WATER},
	[Zone.morellcastle] = {Affinity = affinity.WATER},
	[Zone.mseru] = {Affinity = affinity.WATER},
	[Zone.nadox] = {Affinity = affinity.WATER},
	[Zone.najena] = {Affinity = affinity.WATER},
	[Zone.natimbi] = {Affinity = affinity.WATER},
	[Zone.necropolis] = {Affinity = affinity.WATER},
	[Zone.nedaria] = {Affinity = affinity.WATER},
	[Zone.neighborhood] = {Affinity = affinity.WATER},
	[Zone.nektropos] = {Affinity = affinity.WATER},
	[Zone.nektulos] = {Affinity = affinity.WATER},
	[Zone.nektulosa] = {Affinity = affinity.WATER},
	[Zone.neriaka] = {Affinity = affinity.WATER},
	[Zone.neriakb] = {Affinity = affinity.WATER},
	[Zone.neriakc] = {Affinity = affinity.WATER},
	[Zone.neriakd] = {Affinity = affinity.WATER},
	[Zone.netherbian] = {Affinity = affinity.WATER},
	[Zone.nexus] = {Affinity = affinity.WATER},
	[Zone.nightmareb] = {Affinity = affinity.WATER},
	[Zone.northkarana] = {Affinity = affinity.WATER},
	[Zone.northro] = {Affinity = affinity.WATER},
	[Zone.nro] = {Affinity = affinity.WATER},
	[Zone.nurga] = {Affinity = affinity.WATER},
	[Zone.oasis] = {Affinity = affinity.WATER},
	[Zone.oceangreenhills] = {Affinity = affinity.WATER},
	[Zone.oceangreenvillage] = {Affinity = affinity.WATER},
	[Zone.oceanoftears] = {Affinity = affinity.WATER},
	[Zone.oggok] = {Affinity = affinity.WATER},
	[Zone.oldblackburrow] = {Affinity = affinity.WATER},
	[Zone.oldbloodfield] = {Affinity = affinity.WATER},
	[Zone.oldcommons] = {Affinity = affinity.WATER},
	[Zone.olddranik] = {Affinity = affinity.WATER},
	[Zone.oldfieldofbone] = {Affinity = affinity.WATER},
	[Zone.oldhighpass] = {Affinity = affinity.WATER},
	[Zone.oldkaesoraa] = {Affinity = affinity.WATER},
	[Zone.oldkaesorab] = {Affinity = affinity.WATER},
	[Zone.oldkithicor] = {Affinity = affinity.WATER},
	[Zone.oldkurn] = {Affinity = affinity.WATER},
	[Zone.oot] = {Affinity = affinity.WATER},
	[Zone.overthere] = {Affinity = affinity.WATER},
	[Zone.paineel] = {Affinity = affinity.WATER},
	[Zone.paludal] = {Affinity = affinity.WATER},
	[Zone.paw] = {Affinity = affinity.WATER},
	[Zone.pellucid] = {Affinity = affinity.WATER},
	[Zone.permafrost] = {Affinity = affinity.WATER},
	[Zone.pillarsalra] = {Affinity = affinity.WATER},
	[Zone.poair] = {Affinity = affinity.WATER},
	[Zone.podisease] = {Affinity = affinity.WATER},
	[Zone.poeartha] = {Affinity = affinity.WATER},
	[Zone.poearthb] = {Affinity = affinity.WATER},
	[Zone.pofire] = {Affinity = affinity.WATER},
	[Zone.poinnovation] = {Affinity = affinity.WATER},
	[Zone.pojustice] = {Affinity = affinity.WATER},
	[Zone.poknowledge] = {Affinity = affinity.WATER},
	[Zone.ponightmare] = {Affinity = affinity.WATER},
	[Zone.postorms] = {Affinity = affinity.WATER},
	[Zone.potactics] = {Affinity = affinity.WATER},
	[Zone.potimea] = {Affinity = affinity.WATER},
	[Zone.potimeb] = {Affinity = affinity.WATER},
	[Zone.potorment] = {Affinity = affinity.WATER},
	[Zone.potranquility] = {Affinity = affinity.WATER},
	[Zone.povalor] = {Affinity = affinity.WATER},
	[Zone.powar] = {Affinity = affinity.WATER},
	[Zone.powater] = {Affinity = affinity.WATER},
	[Zone.precipiceofwar] = {Affinity = affinity.WATER},
	[Zone.provinggrounds] = {Affinity = affinity.WATER},
	[Zone.qcat] = {Affinity = affinity.WATER},
	[Zone.qey2hh1] = {Affinity = affinity.WATER},
	[Zone.qeynos] = {Affinity = affinity.WATER},
	[Zone.qeynos2] = {Affinity = affinity.WATER},
	[Zone.qeytoqrg] = {Affinity = affinity.WATER},
	[Zone.qinimi] = {Affinity = affinity.WATER},
	[Zone.qrg] = {Affinity = affinity.WATER},
	[Zone.qvic] = {Affinity = affinity.WATER},
	[Zone.qvicb] = {Affinity = affinity.WATER},
	[Zone.rage] = {Affinity = affinity.WATER},
	[Zone.ragea] = {Affinity = affinity.WATER},
	[Zone.rathechamber] = {Affinity = affinity.WATER},
	[Zone.rathemtn] = {Affinity = affinity.WATER},
	[Zone.redfeather] = {Affinity = affinity.WATER},
	[Zone.relic] = {Affinity = affinity.WATER},
	[Zone.resplendent] = {Affinity = affinity.WATER},
	[Zone.riftseekers] = {Affinity = affinity.WATER},
	[Zone.rivervale] = {Affinity = affinity.WATER},
	[Zone.riwwi] = {Affinity = affinity.WATER},
	[Zone.roost] = {Affinity = affinity.WATER},
	[Zone.rubak] = {Affinity = affinity.WATER},
	[Zone.ruja] = {Affinity = affinity.WATER},
	[Zone.rujb] = {Affinity = affinity.WATER},
	[Zone.rujc] = {Affinity = affinity.WATER},
	[Zone.rujd] = {Affinity = affinity.WATER},
	[Zone.ruje] = {Affinity = affinity.WATER},
	[Zone.rujf] = {Affinity = affinity.WATER},
	[Zone.rujg] = {Affinity = affinity.WATER},
	[Zone.rujh] = {Affinity = affinity.WATER},
	[Zone.ruji] = {Affinity = affinity.WATER},
	[Zone.rujj] = {Affinity = affinity.WATER},
	[Zone.runnyeye] = {Affinity = affinity.WATER},
	[Zone.sarithcity] = {Affinity = affinity.WATER},
	[Zone.scarlet] = {Affinity = affinity.WATER},
	[Zone.sebilis] = {Affinity = affinity.WATER},
	[Zone.sepulcher] = {Affinity = affinity.WATER},
	[Zone.shadeweaver] = {Affinity = affinity.WATER},
	[Zone.shadowhaven] = {Affinity = affinity.WATER},
	[Zone.shadowrest] = {Affinity = affinity.WATER},
	[Zone.shadowspine] = {Affinity = affinity.WATER},
	[Zone.shardslanding] = {Affinity = affinity.WATER},
	[Zone.sharvahl] = {Affinity = affinity.WATER},
	[Zone.shiningcity] = {Affinity = affinity.WATER},
	[Zone.shipmvm] = {Affinity = affinity.WATER},
	[Zone.shipmvp] = {Affinity = affinity.WATER},
	[Zone.shipmvu] = {Affinity = affinity.WATER},
	[Zone.shippvu] = {Affinity = affinity.WATER},
	[Zone.shipuvu] = {Affinity = affinity.WATER},
	[Zone.shipworkshop] = {Affinity = affinity.WATER},
	[Zone.silyssar] = {Affinity = affinity.WATER},
	[Zone.sirens] = {Affinity = affinity.WATER},
	[Zone.skyfire] = {Affinity = affinity.WATER},
	[Zone.skylance] = {Affinity = affinity.WATER},
	[Zone.skyshrine] = {Affinity = affinity.WATER},
	[Zone.sleeper] = {Affinity = affinity.WATER},
	[Zone.sncrematory] = {Affinity = affinity.WATER},
	[Zone.snlair] = {Affinity = affinity.WATER},
	[Zone.snplant] = {Affinity = affinity.WATER},
	[Zone.snpool] = {Affinity = affinity.WATER},
	[Zone.soldunga] = {Affinity = affinity.FIRE},
	[Zone.soldungb] = {Affinity = affinity.FIRE},
	[Zone.soldungc] = {Affinity = affinity.FIRE},
	[Zone.solrotower] = {Affinity = affinity.FIRE},
	[Zone.soltemple] = {Affinity = affinity.FIRE},
	[Zone.solteris] = {Affinity = affinity.WATER},
	[Zone.somnium] = {Affinity = affinity.WATER},
	[Zone.southkarana] = {Affinity = affinity.WATER},
	[Zone.southro] = {Affinity = affinity.WATER},
	[Zone.sro] = {Affinity = affinity.WATER},
	[Zone.sseru] = {Affinity = affinity.WATER},
	[Zone.ssratemple] = {Affinity = affinity.WATER},
	[Zone.steamfactory] = {Affinity = affinity.WATER},
	[Zone.steamfont] = {Affinity = affinity.WATER},
	[Zone.steamfontmts] = {Affinity = affinity.WATER},
	[Zone.steppes] = {Affinity = affinity.WATER},
	[Zone.stillmoona] = {Affinity = affinity.WATER},
	[Zone.stillmoonb] = {Affinity = affinity.WATER},
	[Zone.stonebrunt] = {Affinity = affinity.WATER},
	[Zone.stonehive] = {Affinity = affinity.WATER},
	[Zone.stonesnake] = {Affinity = affinity.WATER},
	[Zone.suncrest] = {Affinity = affinity.WATER},
	[Zone.sunderock] = {Affinity = affinity.WATER},
	[Zone.swampofnohope] = {Affinity = affinity.WATER},
	[Zone.tacvi] = {Affinity = affinity.WATER},
	[Zone.taka] = {Affinity = affinity.WATER},
	[Zone.takb] = {Affinity = affinity.WATER},
	[Zone.takc] = {Affinity = affinity.WATER},
	[Zone.takd] = {Affinity = affinity.WATER},
	[Zone.take] = {Affinity = affinity.WATER},
	[Zone.takf] = {Affinity = affinity.WATER},
	[Zone.takg] = {Affinity = affinity.WATER},
	[Zone.takh] = {Affinity = affinity.WATER},
	[Zone.taki] = {Affinity = affinity.WATER},
	[Zone.takishruins] = {Affinity = affinity.WATER},
	[Zone.takishruinsa] = {Affinity = affinity.WATER},
	[Zone.takj] = {Affinity = affinity.WATER},
	[Zone.templeveeshan] = {Affinity = affinity.WATER},
	[Zone.tenebrous] = {Affinity = affinity.WATER},
	[Zone.thalassius] = {Affinity = affinity.WATER},
	[Zone.theater] = {Affinity = affinity.WATER},
	[Zone.theatera] = {Affinity = affinity.WATER},
	[Zone.thedeep] = {Affinity = affinity.WATER},
	[Zone.thegrey] = {Affinity = affinity.WATER},
	[Zone.thenest] = {Affinity = affinity.WATER},
	[Zone.thevoida] = {Affinity = affinity.WATER},
	[Zone.thevoidb] = {Affinity = affinity.WATER},
	[Zone.thevoidc] = {Affinity = affinity.WATER},
	[Zone.thevoidd] = {Affinity = affinity.WATER},
	[Zone.thevoide] = {Affinity = affinity.WATER},
	[Zone.thevoidf] = {Affinity = affinity.WATER},
	[Zone.thevoidg] = {Affinity = affinity.WATER},
	[Zone.thuledream] = {Affinity = affinity.WATER},
	[Zone.thulehouse1] = {Affinity = affinity.WATER},
	[Zone.thulehouse2] = {Affinity = affinity.WATER},
	[Zone.thulelibrary] = {Affinity = affinity.WATER},
	[Zone.thundercrest] = {Affinity = affinity.WATER},
	[Zone.thurgadina] = {Affinity = affinity.WATER},
	[Zone.thurgadinb] = {Affinity = affinity.WATER},
	[Zone.timorous] = {Affinity = affinity.WATER},
	[Zone.tipt] = {Affinity = affinity.WATER},
	[Zone.torgiran] = {Affinity = affinity.WATER},
	[Zone.toskirakk] = {Affinity = affinity.WATER},
	[Zone.tox] = {Affinity = affinity.WATER},
	[Zone.toxxulia] = {Affinity = affinity.WATER},
	[Zone.trakanon] = {Affinity = affinity.WATER},
	[Zone.tutorial] = {Affinity = affinity.WATER},
	[Zone.tutoriala] = {Affinity = affinity.WATER},
	[Zone.tutorialb] = {Affinity = affinity.WATER},
	[Zone.twilight] = {Affinity = affinity.WATER},
	[Zone.txevu] = {Affinity = affinity.WATER},
	[Zone.umbral] = {Affinity = affinity.WATER},
	[Zone.underquarry] = {Affinity = affinity.WATER},
	[Zone.unrest] = {Affinity = affinity.WATER},
	[Zone.uqua] = {Affinity = affinity.WATER},
	[Zone.valdeholm] = {Affinity = affinity.WATER},
	[Zone.veeshan] = {Affinity = affinity.WATER},
	[Zone.veksar] = {Affinity = affinity.WATER},
	[Zone.velketor] = {Affinity = affinity.WATER},
	[Zone.vergalid] = {Affinity = affinity.WATER},
	[Zone.vexthal] = {Affinity = affinity.WATER},
	[Zone.vxed] = {Affinity = affinity.WATER},
	[Zone.wakening] = {Affinity = affinity.WATER},
	[Zone.wallofslaughter] = {Affinity = affinity.WATER},
	[Zone.warrens] = {Affinity = affinity.WATER},
	[Zone.warslikswood] = {Affinity = affinity.WATER},
	[Zone.weddingchapel] = {Affinity = affinity.WATER},
	[Zone.weddingchapeldark] = {Affinity = affinity.WATER},
	[Zone.well] = {Affinity = affinity.WATER},
	[Zone.westkorlach] = {Affinity = affinity.WATER},
	[Zone.westkorlacha] = {Affinity = affinity.WATER},
	[Zone.westkorlachb] = {Affinity = affinity.WATER},
	[Zone.westkorlachc] = {Affinity = affinity.WATER},
	[Zone.westsepulcher] = {Affinity = affinity.WATER},
	[Zone.westwastes] = {Affinity = affinity.WATER},
	[Zone.windsong] = {Affinity = affinity.WATER},
	[Zone.xorbb] = {Affinity = affinity.WATER},
	[Zone.yxtta] = {Affinity = affinity.WATER},
	[Zone.zhisza] = {Affinity = affinity.WATER},
}

---@param zone_id number # zone ID
---@param race_id number # race ID
---@param texture_id number # texture ID
function npc_affinity(zone_id, race_id, texture_id)
	if zone_id == Zone.sebilis and race_id == race_name.Dragon then return affinity.EARTH end -- Trakanon

	if ZoneAffinity[zone_id] ~= nil then
		return ZoneAffinity[zone_id].Affinity
	end

	return affinity.WATER
end

