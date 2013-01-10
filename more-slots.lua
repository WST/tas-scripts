
-- Additional quick-save slots
-- Gens Lua script by the members of Youtube Sonic TAS community <http://ystc.ru>

local slots = {savestate.create(), savestate.create(), savestate.create(), savestate.create()};
local saved = {false, false, false, false};

input.registerhotkey(8, function()
	savestate.save(slots[1]);
	saved[1] = true;
end);

input.registerhotkey(9, function()
	savestate.save(slots[2]);
	saved[2] = true;
end);

input.registerhotkey(10, function()
	savestate.save(slots[3]);
	saved[3] = true;
end);

input.registerhotkey(11, function()
	savestate.save(slots[4]);
	saved[4] = true;
end);

input.registerhotkey(12, function()
	if saved[1] then
		savestate.load(slots[1]);
		gens.redraw();
	else
		print('Slot is empty');
	end;
end);

input.registerhotkey(13, function()
	if saved[2] then
		savestate.load(slots[2]);
		gens.redraw();
	else
		print('Slot is empty');
	end;
end);

input.registerhotkey(14, function()
	if saved[3] then
		savestate.load(slots[3]);
		gens.redraw();
	else
		print('Slot is empty');
	end;
end);

input.registerhotkey(15, function()
	if saved[4] then
		savestate.load(slots[4]);
		gens.redraw();
	else
		print('Slot is empty');
	end;
end);
