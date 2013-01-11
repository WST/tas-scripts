-- A simple Sonic 3 and Knuckles HUD
-- Gens Lua script by the members of Youtube Sonic TAS community <http://ystc.ru>
-- Includes code by Felipe @ TASvideos


-- create space in memory for a savestate
state = savestate.create()

-- register a function to run when the screen gets updated
gui.register( function ()


--first, the timer:
  

  --reading datas
    timerpart1 = memory.readbytesigned(0xfffe23)
    timerpart2 = memory.readbytesigned(0xfffe24)
    timerpart3 = memory.readbytesigned(0xfffe25)

  --show them
if memory.readbytesigned(0xfffe25) < 10 then
if memory.readbytesigned(0xfffe24) < 10 then
        message = string.format("real timer:")
        gui.text(114, 01, message, "#FFFFFFFF", "black")
	message = string.format("  %d", timerpart1)
	gui.text(153, 01, message, "#FFFFFFFF", "black")
	message = string.format(":0%d:", timerpart2)
	gui.text(165, 01, message, "#FFFFFFFF", "black")
	message = string.format(" :0%d", timerpart3)
	gui.text(176, 01, message, "#FFFFFFFF", "black")
else
        message = string.format("real timer:")
        gui.text(114, 01, message, "#FFFFFFFF", "black")
	message = string.format("  %d", timerpart1)
	gui.text(153, 01, message, "#FFFFFFFF", "black")
	message = string.format(":%d:", timerpart2)
	gui.text(165, 01, message, "#FFFFFFFF", "black")
	message = string.format(" :0%d", timerpart3)
	gui.text(176, 01, message, "#FFFFFFFF", "black")
end
else
if memory.readbytesigned(0xfffe24) < 10 then
        message = string.format("real timer:")
        gui.text(114, 01, message, "#FFFFFFFF", "black")
	message = string.format("  %d", timerpart1)
	gui.text(153, 01, message, "#FFFFFFFF", "black")
	message = string.format(":0%d:", timerpart2)
	gui.text(165, 01, message, "#FFFFFFFF", "black")
	message = string.format(" :%d", timerpart3)
	gui.text(176, 01, message, "#FFFFFFFF", "black")
else
        message = string.format("real timer:")
        gui.text(114, 01, message, "#FFFFFFFF", "black")
	message = string.format("  %d", timerpart1)
	gui.text(153, 01, message, "#FFFFFFFF", "black")
	message = string.format(":%d:", timerpart2)
	gui.text(165, 01, message, "#FFFFFFFF", "black")
	message = string.format(" :%d", timerpart3)
	gui.text(176, 01, message, "#FFFFFFFF", "black")
end

end

--now, players'speed and position

	-- get the X and Y velocity of the player
	xvel = memory.readwordsigned(0xffb018) -- sonic the hedgehog 3
	bxvel = memory.readbytesigned(0xffb018)
	yvel = memory.readwordsigned(0xffb01a)
	byvel = memory.readbytesigned(0xffb01a)


	-- get the X and Y velocity of the player 2
	txvel = memory.readwordsigned(0xffb062) -- tails (miles) prower
	btxvel = memory.readbytesigned(0xffb062)
	tyvel = memory.readwordsigned(0xffb064)
	btyvel = memory.readbytesigned(0xffb064) 


	-- get the position of each character
   camX = memory.readword(0xffee78) -- x position of the camera 
   camY = memory.readword(0xffee7c) -- y position of the camera 
   p1x = memory.readwordunsigned(0xffb010) -- x position of sonic 
   p1y = memory.readwordunsigned(0xffb014) -- y position of sonic 
   p2x = memory.readwordunsigned(0xffb05a) -- x position of tails 
   p2y = memory.readwordunsigned(0xffb05e) -- y position of tails 


	ss = p2x-p1x
	st = p2y-p1y

	message = string.format("sonic: %d, %d, : %d", p1x, p1y, ss)
	gui.text(10, 51, message, "#FFFF00FF", "black")
	message = string.format("tails: %d, %d, : %d", p2x, p2y, st)
	gui.text(10, 59, message, "#FFFF00FF", "black")


if memory.readwordsigned(0xffb018)>0 then





if memory.readwordsigned(0xffb018)<257 then
	message = string.format("velocity: %d, %d", xvel, yvel)
	gui.text(10, 80, message, "#32CD32FF", "black")
else 	message = string.format("velocity: %d, %d", xvel, yvel)
	gui.text(10, 80, message, "#FF0000FF", "black") end
if memory.readbytesigned(0xffb018)<10 then
	message = string.format("velocity: %d, %d", bxvel, byvel)
	gui.text(10, 90, message, "#FF0000FF", "black")
elseif memory.readbytesigned(0xffb018)>15 then
	message = string.format("velocity: %d, %d", bxvel, byvel)
	gui.text(10, 90, message, "#FFFFFFFF", "black")
else    message = string.format("velocity: %d, %d", bxvel, byvel)
	gui.text(10, 90, message, "#32CD32FF", "black") end

else





if memory.readwordsigned(0xffb018)>-257 then
	message = string.format("velocity: %d, %d", xvel, yvel)
	gui.text(10, 80, message, "#32CD32FF", "black")
else 	message = string.format("velocity: %d, %d", xvel, yvel)
	gui.text(10, 80, message, "#FF0000FF", "black") end
if memory.readbytesigned(0xffb018)>-10 then
	message = string.format("velocity: %d, %d", bxvel, byvel)
	gui.text(10, 90, message, "#FF0000FF", "black")
elseif memory.readbytesigned(0xffb018)<-15 then
	message = string.format("velocity: %d, %d", bxvel, byvel)
	gui.text(10, 90, message, "#FFFFFFFF", "black")
else    message = string.format("velocity: %d, %d", bxvel, byvel)
	gui.text(10, 90, message, "#32CD32FF", "black") end

end

if memory.readwordsigned(0xffb062)>0 then





if memory.readwordsigned(0xffb062)<257 then
	message = string.format("velocity: %d, %d", txvel, tyvel)
	gui.text(220, 80, message, "#32CD32FF", "black")
else 	message = string.format("velocity: %d, %d", txvel, tyvel)
	gui.text(220, 80, message, "#FF0000FF", "black") end
if memory.readbytesigned(0xffb062)<10 then
	message = string.format("velocity: %d, %d", btxvel, btyvel)
	gui.text(220, 90, message, "#FF0000FF", "black")
elseif memory.readbytesigned(0xffb062)>15 then
	message = string.format("velocity: %d, %d", btxvel, btyvel)
	gui.text(220, 90, message, "#FFFFFFFF", "black")
else    message = string.format("velocity: %d, %d", btxvel, btyvel)
	gui.text(220, 90, message, "#32CD32FF", "black") end
else





if memory.readwordsigned(0xffb062)>-257 then
	message = string.format("velocity: %d, %d", txvel, tyvel)
	gui.text(220, 80, message, "#32CD32FF", "black")
else 	message = string.format("velocity: %d, %d", txvel, tyvel)
	gui.text(220, 80, message, "#FF0000FF", "black") end
if memory.readbytesigned(0xffb062)>-10 then
	message = string.format("velocity: %d, %d", btxvel, btyvel)
	gui.text(220, 90, message, "#FF0000FF", "black")
elseif memory.readbytesigned(0xffb062)<-15 then
	message = string.format("velocity: %d, %d", btxvel, btyvel)
	gui.text(220, 90, message, "#FFFFFFFF", "black")
else    message = string.format("velocity: %d, %d", btxvel, btyvel)
	gui.text(220, 90, message, "#32CD32FF", "black") end
end

	message = string.format("speed:    %d", memory.readwordsigned(0xffb01c))
	gui.text(10, 100, message, "#0080FFFF", "black")
	message = string.format("speed:    %d", memory.readwordsigned(0xffb066))
	gui.text(220, 100, message, "#FF8000FF", "black")

-- compare Tails position to Sonic's

   xposvisual1 = p1x - camX 
   yposvisual1 = p1y - camY 
   xposvisual2 = p2x - camX 
   yposvisual2 = p2y - camY 

   gui.box(xposvisual1 - 16, yposvisual1 - 16, xposvisual1 + 16, yposvisual1 + 16, {0, 0, 255, 128}, "blue") 
   gui.box(xposvisual2 - 16, yposvisual2 - 16, xposvisual2 + 16, yposvisual2 + 16, {255, 127, 0, 128}, {255, 127, 0}) 
   gui.line(xposvisual1, yposvisual1, xposvisual2, yposvisual2 , "white") 
    
   x = math.abs(xposvisual2 - xposvisual1) 
   y = math.abs(yposvisual2 - yposvisual1) 
   distance = (x^2+y^2)^(1/2) 

   message = string.format("%d px.", distance) 
   gui.text(xposvisual1 - 10, yposvisual1 - 25, message, "white", "black") 

--end of the HUD

end)
