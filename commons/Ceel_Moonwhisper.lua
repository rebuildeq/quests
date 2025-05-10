function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Blessings of the wild upon you. I am Ceel Moonwhisper, Grovekeeper of the Moonwhisper family and shaper of nature-forged attire. My sister and I craft armor for druids who walk in balance with the wilds. \
		Recently we have seen some unexpected activity in regards to poachers and their willingness to plot against the groves. If you are willing, we are in need of a sturdy adventurer to find us evidence. In return, we would be \
		willing to give you some of our [armor].");
	elseif(e.message:findi("armor")) then
		e.self:Say("I weave [Bracers], [Greaves], and [Tunics] imbued with the strength of the forest. My sister Slea crafts Helms, Gauntlets, Boots, and Vambraces drawn from deeper magics of the grove.");
	elseif(e.message:findi("Bracers")) then
		e.self:Say("You will prove your harmony with the natural world in the old way — by walking the wilds, protecting its sanctity, and returning with signs of your service. Among the Gnolls in Blackburrow, \
		you will find a heinous monster. A Gnoll so hellbent on destroying our groves, he knows no bounds. His Elite Gnoll Guards will assist and put up quite a fight. Bring me proof of his demise, and one Sapphire for your reward.");
	elseif(e.message:findi("Greaves")) then
		e.self:Say("In Mistmoore, the cooks are making something that could potentially wipe out everything we know. The druids have been trying to make a remedy for the rampant poison spreading, but we need another sample. \
		Bring me Grove Poisons, and two Star Rubies for your reward.");
	elseif(e.message:findi("Tunics")) then
		e.self:Say("The Aviaks have been persuaded to help the poachers kill. The Aviak Poachers have been tasks with killing Treants. Bring me an Ancient Treant Heart, and 3 Rubies for your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 159007,item2 = 10034})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159001); -- Item: Verdant Bracer
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 159010,item2 = 10032,item3 = 10032})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159004); -- Item: Verdant Greaves
		e.other:Ding();
		e.other:AddEXP(25000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 159008,item2 = 10035,item3 = 10035,item4 = 10035})) then
		e.self:Say("Excellent! Here is your reward, you have earned it!");
		e.other:SummonItem(159002); -- Item: Verdant Tunic
		e.other:Ding();
		e.other:AddEXP(25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end