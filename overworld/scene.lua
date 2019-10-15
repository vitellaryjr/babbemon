local scene = {}

local tile_size = 32
local move_delay = 0.2

function scene:load()
  self.objects = {}
  self.undo_buffer = {}
  self.turn = 1

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
  
  self.shiny = false
  
  -- pokemon that follows the player around
  local follower = table.random(poke)
  self.follow = Object:new("pokemon", {sprite=follower.sprite or follower.name, x=0.5, y=0.5, layer=4})
  table.insert(self.objects, self.follow)

  self.player = Object:new("trainer", {sprite="player", x=0.5, y=0.5, layer=5})
  table.insert(self.objects, self.player)
  
  self.camera = {x=0.5, y=0.5, zoom=2}

  self.moving = nil
end

function scene:update(dt)
  if self.moving then
    self.moving.time = self.moving.time - dt
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
      local moved = false
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
      if moved then
        self.turn = self.turn+1
      end
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
    
    if object.sprite == "baba" then
      sprite = sprites["overworld/pokemon/"..(self.shiny and "shiny/" or "").."baba_"..anim_stage]
    end

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

  love.graphics.pop()
end

function scene:keyPressed(key)
  if key == "z" then
    doUndo()
  end
  if key == "r" then
    loadScene(self)
  end
  if key == "s" and keydown["ctrl"] then
    self.shiny = not self.shiny
  end
  self:updateMoving()
end

function scene:keyReleased(key)
  self:updateMoving()
end

function scene:updateMoving()
  if keydown["ctrl"] then return end
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