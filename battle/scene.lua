local scene = {}

function scene:load()
  self.poke1 = poke[love.math.random(1,#poke)]
  self.poke2 = poke[love.math.random(1,#poke)]
  self.poke1shiny = love.math.random(1,4096) == 1
  self.poke2shiny = love.math.random(1,4096) == 1

  self.searching = false
  self.searchstr = ""

  self.spritetest = false
  self.test_starttime = 0
  self.test_endtime = 0
  self.st_shiny = false
end

function scene:draw(dt)
  local p1draw,p2draw
  if self.spritetest then
    if self.st_shiny then
      doSpriteTest()
    end
    self.st_shiny = not self.st_shiny
  else
    if self.test_endtime ~= 0 then
      print("sprite test took "..tostring(round((self.test_endtime - self.test_starttime),3)).." seconds")
      self.test_endtime = 0
      self.test_starttime = 0
    end
  end
  p1draw = sprites["battle/"..((self.st_shiny or self.poke1shiny) and "shiny/" or "")..(self.poke1.sprite or self.poke1.name).."_f"..(self.poke1.anim and ("_"..tostring(anim_stage)) or "")]
  p2draw = sprites["battle/"..((self.st_shiny or self.poke2shiny) and "shiny/" or "")..(self.poke2.sprite or self.poke2.name).."_b"..(self.poke2.anim and ("_"..tostring(anim_stage)) or "")]
  
  local p1w,p1h,p2w,p2h = 160,160,160,160
  if p1draw then
    p1w = p1draw:getWidth()
    p1h = p1draw:getHeight()
  end
  if p2draw then
    p2w = p2draw:getWidth()
    p2h = p2draw:getHeight()
  end
  
  if self.poke1.name == "debil" then
    love.graphics.draw(p1draw,534,200)
  end
  
  if self.poke2.name == "debil" then
    love.graphics.draw(p2draw,109,300)
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
    if self.poke1.name ~= "debil" then
      love.graphics.draw(p1draw,round(600-p1w/2),round(150-5*p1h/8))
    end
  else
    print("this opponent failed: "..(self.poke1shiny and "shiny " or "")..self.poke1.name)
  end
  if p2draw then
    if self.poke2.name ~= "debil" then
      love.graphics.draw(p2draw,round(175-p2w/2),round(250-5*p2h/8))
    end
  else
    print("this player failed: "..(self.poke2shiny and "shiny " or "")..self.poke2.name)
  end
  
  local texty = 250
  if self.poke1.name == "debil" then
    texty = 380
  end
  
  love.graphics.printf("press r to refresh pokemon",450,texty,500)
  love.graphics.printf("press s to set pokemon to shiny",450,texty+30,500)
  if self.searching then
    love.graphics.printf("searching: "..self.searchstr,450,texty+60,500)
  else
    love.graphics.printf("press ctrl+f to search for a specific pokemon",450,texty+60,500)
  end
end

function scene:keyPressed(key)
  if key == "f" and keydown["ctrl"] then
    self.searching = not self.searching
  end
  if self.searching then
    if key == "backspace" then
      if keydown["ctrl"] then
        self.searchstr = ""
      else
        self.searchstr = self.searchstr:sub(1,-2)
      end
    elseif key == "return" then
      if poke[self.searchstr] then
        self.poke1 = poke[self.searchstr]
        self.poke2 = poke[self.searchstr]
        self.searchstr = ""
        self.searching = false
      end
    elseif not keydown["ctrl"] then
      if key == "space" then key = " " end
      self.searchstr = self.searchstr..key
    end
  else
    if key == "r" then
      local newpoke1 = self.poke1
      local newpoke2 = self.poke2
      while newpoke1 == self.poke1 do
        newpoke1 = poke[love.math.random(1,#poke)]
      end
      while newpoke2 == self.poke2 do
        newpoke2 = poke[love.math.random(1,#poke)]
      end
      self.poke1 = newpoke1
      self.poke2 = newpoke2
      if keydown["ctrl"] then
        self.poke1shiny = love.math.random(1,4096) == 1
        self.poke2shiny = love.math.random(1,4096) == 1
      end
    end
    if key == "s" then
      if keydown["ctrl"] then
        if keydown["1"] then
          self.poke1shiny = true
        elseif keydown["2"] then
          self.poke2shiny = true
        else
          self.poke1shiny = true
          self.poke2shiny = true
        end
      else
        if keydown["1"] then
          self.poke1shiny = not self.poke1shiny
        elseif keydown["2"] then
          self.poke2shiny = not self.poke2shiny
        else
          self.poke1shiny = not self.poke1shiny
          self.poke2shiny = not self.poke2shiny
        end
      end
    end
    if key == "f12" then
      self.test_starttime = love.timer.getTime()
      self.spritetest = true
      doSpriteTest(true)
    end
  end
end

return scene