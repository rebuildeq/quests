function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, fellow child of the wild. I am Slea Pinewhisper, Druid of the Ancient Circle and artisan of nature's blessings. My Brother Ceel and I craft [armor] for those who walk in harmony with the land.");
	elseif(e.message:findi("armor")) then
		e.self:Say("I weave [Helms], [Gauntlets], [Boots], and [Vambraces] from the gifts of the wild. My brother Ceel fashions Bracers, Greaves, Pauldruns, and Tunics imbued with nature’s grace.");
	elseif(e.message:findi("Helms")) then
		e.self:Say("The Goblins living with Lake Rathetear are purging the lake of all aquatic animals. Among them is a poacher, and if allowed to continue, will wipe out the whole lake. Bring me proof of his demise, and one Ruby, \
		and you will be rewarded properly.");
	elseif(e.message:findi("Gauntlets")) then
		e.self:Say("There is a great Lich that lives in the Ocean of Tears. Living among the Spectres has kept it out of my reach. Bring me proof of his demise, and two Star Rubies for your reward.");
	elseif(e.message:findi("Boots")) then
		e.self:Say("There are reports of a spider thats has been poisoned in Lower Guk. We must dispatch of it, before it spreads to the other spiders. Bring me his flesh sample, and two Sapphires for your reward.");
	elseif(e.message:findi("Vambraces")) then
		e.self:Say("A Faerie in Lesser Faydark is trying to wipe out the Unicorn population. Once gone, we cannot undo the harm they are causing. Bring me a Unicorn Heart from the poacher, and two Fire Emeralds for your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 159008,item2 = 10035})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159005); -- Item: Verdant Helm
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 159012,item2 = 10032,item3 = 10032})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159003); -- Item: Verdant Gauntlets
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 159011,item2 = 10034,item3 = 10034})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159000); -- Item: Verdant Boots
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 159009,item2 = 10033,item3 = 10033})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159006); -- Item: Verdant Vambraces
		e.other:Ding();
		e.other:AddEXP(25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

