local spell_id = 42851

function event_spawn(e)
	eq.set_timer("first_cast",1000)
	eq.set_timer("cast_spell",10*1000)
	e.self:TempName("Campfire")
end

function event_timer(e)
	if e.timer=="cast_spell" then
		e.self:CastSpell(spell_id, e.self:GetID())
	elseif e.timer=="first_cast" then
		e.self:CastSpell(spell_id, e.self:GetID())
		eq.stop_timer("first_cast")
	end
end
