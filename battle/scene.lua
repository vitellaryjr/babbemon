local scene = {}
local searching = false

function scene.draw(dt)
  local p1draw,p2draw
  if spritetest then
    if st_shiny then
      doSpriteTest()
    end
    st_shiny = not st_shiny
  else
    if test_endtime ~= 0 then
      print("sprite test took "..tostring(round((test_endtime - test_starttime),3)).." seconds")
      test_endtime = 0
      test_starttime = 0
    end
  end
  p1draw = sprites["battle/"..((st_shiny or poke1shiny) and "shiny/" or "")..(poke1.sprite or poke1.name).."_f"..(poke1.anim and ("_"..tostring(anim_stage)) or "")]
  p2draw = sprites["battle/"..((st_shiny or poke2shiny) and "shiny/" or "")..(poke2.sprite or poke2.name).."_b"..(poke2.anim and ("_"..tostring(anim_stage)) or "")]
  
  local p1w,p1h,p2w,p2h = 160,160,160,160
  if p1draw then
    p1w = p1draw:getWidth()
    p1h = p1draw:getHeight()
  end
  if p2draw then
    p2w = p2draw:getWidth()
    p2h = p2draw:getHeight()
  end
  
  love.graphics.setLineWidth(4)
  love.graphics.setColor(0.2,0.2,0.2,1)
  love.graphics.ellipse("fill",600,150,150,75)
  love.graphics.ellipse("fill",175,250,150,75)
  
  love.graphics.setColor(0.8,0.8,0.8,1)
  love.graphics.ellipse("line",600,150,150,75)
  love.graphics.ellipse("line",175,250,150,75)
  
  love.graphics.setColor(1,1,1,1)
  if p1draw then
    love.graphics.draw(p1draw,round(600-p1w/2),round(150-5*p1h/8))
  else
    print("this opponent failed: "..(poke1shiny and "shiny " or "")..poke1.name)
  end
  if p2draw then
    love.graphics.draw(p2draw,round(175-p2w/2),round(250-5*p2h/8))
  else
    print("this player failed: "..(poke2shiny and "shiny " or "")..poke2.name)
  end
  
  love.graphics.printf("press r to refresh pokemon",450,250,500)
  love.graphics.printf("press s to set pokemon to shiny",450,280,500)
  if searching then
    love.graphics.printf("searching: "..searchstr,450,310,500)
  else
    love.graphics.printf("press ctrl+f to search for a specific pokemon",450,310,500)
  end
end

function scene.keyPressed(key)
  if key == "f" and keydown["ctrl"] then
    searching = not searching
  end
  if searching then
    if key == "backspace" then
      if keydown["ctrl"] then
        searchstr = ""
      else
        searchstr = searchstr:sub(1,-2)
      end
    elseif key == "return" then
      if poke[searchstr] then
        poke1 = poke[searchstr]
        poke2 = poke[searchstr]
        searchstr = ""
        searching = false
      end
    elseif not keydown["ctrl"] then
      if key == "space" then key = " " end
      searchstr = searchstr..key
    end
  else
    if key == "r" then
      local newpoke1 = poke1
      local newpoke2 = poke2
      while newpoke1 == poke1 do
        newpoke1 = poke[love.math.random(1,#poke)]
      end
      while newpoke2 == poke2 do
        newpoke2 = poke[love.math.random(1,#poke)]
      end
      poke1 = newpoke1
      poke2 = newpoke2
      if keydown["ctrl"] then
        poke1shiny = love.math.random(1,4096) == 1
        poke2shiny = love.math.random(1,4096) == 1
      end
    end
    if key == "s" then
      if keydown["ctrl"] then
        if keydown["1"] then
          poke1shiny = true
        elseif keydown["2"] then
          poke2shiny = true
        else
          poke1shiny = true
          poke2shiny = true
        end
      else
        if keydown["1"] then
          poke1shiny = not poke1shiny
        elseif keydown["2"] then
          poke2shiny = not poke2shiny
        else
          poke1shiny = not poke1shiny
          poke2shiny = not poke2shiny
        end
      end
    end
    if key == "f12" then
      test_starttime = love.timer.getTime()
      spritetest = true
      doSpriteTest(true)
    end
  end
end

return scene