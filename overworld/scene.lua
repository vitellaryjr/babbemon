local scene = {}

local tile_size = 32
local move_delay = 0.2

function scene:load()
  self.objects = {}
  self.undo_buffer = {}
  self.turn = 1
  
  self.searching = false
  self.searchstr = ""
  
  self.steevdone = false
  self.grayscale = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 tc, vec2 pc)
    {
      vec4 pixel = Texel(texture, tc);
      float gray = (pixel.r + pixel.g + pixel.b)/3;
      pixel.r = gray;
      pixel.g = gray;
      pixel.b = gray;
      return pixel;
    }
  ]]

  self.width = 100
  self.height = 75
  self.tiles = {}
  for x = 0, self.width-1 do
    for y = 0, self.height-1 do
      self.tiles[pair(x,y)] = "grass"
      if math.random() < 0.05 then
        table.insert(self.objects, Object:new("tall_grass", {x = x+0.5, y = y+0.49, pivot={x=0.5, y=1}, layer=3}))
        table.insert(self.objects, Object:new("tall_grass", {x = x+0.5, y = y+0.99, pivot={x=0.5, y=1}, layer=7}))
      end
      if math.random() < 0.02 then
        table.insert(self.objects, Object:new("roc", {x = x+0.5, y = y+0.5, layer = 5, push = true}))
      end
    end
  end
  
  self.shiny = love.math.random(1,4096) == 69
  
  -- pokemon that follows the player around
  local follower = table.random(poke)
  self.follow = Object:new("pokemon", {sprite=follower.sprite or follower.name, x=0.5, y=0.5, layer=4, data=copyTable(follower)})
  table.insert(self.objects, self.follow)
  
  if self.follow:getSprite() == sprites["overworld/wat"] then
    print(self.follow.sprite)
  end

  self.player = Object:new("trainer", {sprite="player", x=0.5, y=0.5, layer=5})
  table.insert(self.objects, self.player)
  
  self.camera = {x=0.5, y=0.5, zoom=2}

  self.moving = nil
end

function scene:update(dt)
  if self.steevdone then return end
  if self.moving then
    self.moving.time = self.moving.time - dt
    local moved = false
    if self.moving.time <= 0 then
      self.moving.time = self.moving.time + move_delay
      
      -- manual direction check for now
      local dir
      if self.moving.x == 1  and self.moving.y == 0  then dir = 1 end
      if self.moving.x == 1  and self.moving.y == 1  then dir = 2 end
      if self.moving.x == 0  and self.moving.y == 1  then dir = 3 end
      if self.moving.x == -1 and self.moving.y == 1  then dir = 4 end
      if self.moving.x == -1 and self.moving.y == 0  then dir = 5 end
      if self.moving.x == -1 and self.moving.y == -1 then dir = 6 end
      if self.moving.x == 0  and self.moving.y == -1 then dir = 7 end
      if self.moving.x == 1  and self.moving.y == -1 then dir = 8 end
      
      local new_x = self.player.x + self.moving.x
      local new_y = self.player.y + self.moving.y
      if self.player:canMove(new_x, new_y) then
        moved = true
        if self.turn > 1 then
          addUndo{"update",self.follow,self.follow.x,self.follow.y,self.follow.dir}
          self.follow:move(self.player.x, self.player.y)
          self.follow:rotate(self.player.dir)
        end
        addUndo{"update",self.player,self.player.x,self.player.y,self.player.dir}
        self.player:move(new_x, new_y)
        self.player:rotate(dir,false,true)
      end
    end
    if self.follow.sprite == "steev" and self.turn > 6 then
      self.steevdone = true
      addUndo{"steev",self.camera.zoom}
      addTween(tween.new(2, self.camera, {zoom = 2.2}, "outQuad"), "steev_zoom")
      moved = true
    end
    if moved then
      self.turn = self.turn+1
    end
  end

  --[[local cam_x, cam_y = self.player.x + 0.5, self.player.y + 0.5
  if self.camera.x ~= cam_x or self.camera.y ~= cam_y then
    self.camera.x = cam_x
    self.camera.y = cam_y
    addTween(tween.new(0.5, self.camera.draw, {x = cam_x, y = cam_y}, "outCubic"), "move:camera")
  end]]
  self.camera.x = self.player.draw.x
  self.camera.y = self.player.draw.y
end

function scene:draw(dt)
  love.graphics.clear(0, 0, 0)

  love.graphics.push()
  love.graphics.translate(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
  love.graphics.scale(self.camera.zoom)
  love.graphics.translate(-self.camera.x*tile_size, -self.camera.y*tile_size)
  
  if self.steevdone then
    love.graphics.setShader(self.grayscale)
  else
    love.graphics.setShader()
  end

  for x = 0, self.width-1 do
    for y = 0, self.height-1 do
      love.graphics.draw(sprites["overworld/tiles/" .. self.tiles[pair(x,y)]], x*tile_size, y*tile_size)
    end
  end

  local sorted = {}
  for k,v in pairs(self.objects) do table.insert(sorted, v) end
  table.sort(sorted, function(a, b) 
    return a.layer <= b.layer and a.draw.y < b.draw.y
  end)
  for _,object in ipairs(sorted) do
    local sprite = object:getSprite()

    love.graphics.push()
    love.graphics.translate(object.draw.x*tile_size, object.draw.y*tile_size)
    love.graphics.rotate(math.rad(object.draw.rotation))
    love.graphics.scale(object.draw.scalex, object.draw.scaley)

    local ox = math.random() * object.draw.shake
    local oy = math.random() * object.draw.shake
    
    if sprite then
      love.graphics.draw(sprite, ox - sprite:getWidth()*object.pivot.x, oy - sprite:getHeight()*object.pivot.y)
    else
      print("this pokemon failed to render: "..dump(object))
    end

    love.graphics.pop()
  end
  
  if self.follow.name == "temmi" then
    local object = self.follow
    local sprite = object:getSprite()
    
    love.graphics.push()
    love.graphics.translate(object.temface.x*tile_size, object.temface.y*tile_size)
    love.graphics.rotate(math.rad(object.draw.rotation))
    love.graphics.scale(object.draw.scalex, object.draw.scaley)

    if sprite then
      love.graphics.draw(sprites["overworld/pokemon/temmi_face"], -(sprite:getWidth()*object.pivot.x), -(sprite:getHeight()*object.pivot.y))
    else
      print("this pokemon failed to render: "..dump(object))
    end

    love.graphics.pop()
  end

  love.graphics.pop()
  if self.searching then
    if #self.searchstr > 0 then
      love.graphics.printf(self.searchstr,2,2,9999)
    else
      love.graphics.printf("searching...",2,2,9999)
    end
  end
end

function scene:keyPressed(key)
  if key == "z" and not self.searching then
    doUndo()
  end
  if key == "r" and not self.searching then
    loadScene(self)
  end
  if key == "s" and keydown["ctrl"] and not self.searching then
    self.shiny = not self.shiny
  end
  if self.searching then
    local specialkeys = {
      space = " ",
      lshift = "",
      rshift = "",
      lctrl = "",
      rctrl = "",
      lalt = "",
      ralt = "",
    }
    for i=0,9 do
      specialkeys["kp"..i] = tostring(i)
    end
    key = specialkeys[key] or key
    if keydown["shift"] then
      local shifts = {"!","@","#","$","%","^","&","*"}
      key = shifts[tonumber(key)] or key
    end
    if keydown["ctrl"] then
      if key == "backspace" then self.searchstr = "" end
    else
      if key == "return" then
        if poke[self.searchstr] then
          local follower = poke[self.searchstr]
          addUndo{"follow_change",self.follow.sprite,self.follow.x,self.follow.y,self.follow.dir,self.follow.data}
          removeFromTable(self.objects, self.follow)
          self.follow = Object:new("pokemon", {sprite=follower.sprite or follower.name, x=self.follow.x, y=self.follow.y, dir=self.follow.dir, layer=4, data=copyTable(follower)})
          table.insert(self.objects, self.follow)
          self.searchstr = ""
          self.searching = false
          self.turn = self.turn + 1
        end
      elseif key == "backspace" then
        self.searchstr = self.searchstr:sub(1,-2)
      else
        self.searchstr = self.searchstr..key
      end
    end
  else
    self.searchstr = ""
  end
  if key == "f" and keydown["ctrl"] then
    self.searching = not self.searching
  end
  self:updateMoving()
end

function scene:keyReleased(key)
  self:updateMoving()
end

function scene:updateMoving()
  if keydown["ctrl"] or self.searching then return end
  local new_moving = {x=0, y=0}
  if keydown["w"] or keydown["up"] then new_moving.y = new_moving.y - 1 end
  if keydown["a"] or keydown["left"] then new_moving.x = new_moving.x - 1 end
  if keydown["s"] or keydown["down"] then new_moving.y = new_moving.y + 1 end
  if keydown["d"] or keydown["right"] then new_moving.x = new_moving.x + 1 end
  if new_moving.x ~= 0 or new_moving.y ~= 0 then
    self.moving = {x = new_moving.x, y = new_moving.y, time = self.moving and self.moving.time or move_delay/8}
  else
    self.moving = nil
  end
end

return scene