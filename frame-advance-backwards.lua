
-- Frame advance backwards
-- Gens Lua script by the members of Youtube Sonic TAS community <http://ystc.ru>

-- Script settings:
local history_size = 255;
local hotkey_number = 1;

-- Below is the code itself
local stack = {};

input.registerhotkey(hotkey_number, function()
	if(#stack == 0) then
		print('History is empty');
		return;
	end;
	
	savestate.load(table.remove(stack, #stack));
	gens.redraw();
	print('Step back');
end);

gens.registerbefore(function()
	local slot = savestate.create();
	savestate.save(slot);
	table.insert(stack, slot);
	
	if #stack > history_size then
		table.remove(stack, 1);
	end;
end);
