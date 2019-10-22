Object = {}

function Object:new(type, o)
  o = o or {}

  o.type = type
  o.sprite = o.sprite
  o.x = o.x or 0
  o.y = o.y or 0
  o.dir = o.dir or 1
  o.layer = o.layer or 0
  o.pivot = o.pivot or {x = 0.5, y = 0.5}
  o.push = o.push or false

  o.draw = {
    x = o.draw and o.draw.x or o.x,
    y = o.draw and o.draw.y or o.y,
    scalex = o.draw and o.draw.scalex or 1,
    scaley = o.draw and o.draw.scaley or 1,
    shake = o.draw and o.draw.shake or 0,
    rotation = o.draw and o.draw.rotation or (o.dir-1)*45
  }

  setmetatable(o, self)
  self.__index = self
  return o
end

-- this system is really placeholder until we figure out what works best for this game
function Object:getSprite()
  local sprite
  if self.type == "pokemon" then
    if overworld.shiny or love.math.random(1,4096) == 69 then
      sprite = sprites["overworld/pokemon/shiny/" .. self.sprite]
    else
      sprite = sprites["overworld/pokemon/" .. self.sprite]
    end
  elseif self.type == "trainer" then
    if self.dir == 1 then
      sprite = sprites["overworld/trainers/"..self.sprite.."_right"]
    elseif self.dir == 2 or self.dir == 3 or self.dir == 4 then
      sprite = sprites["overworld/trainers/"..self.sprite.."_down"]
    elseif self.dir == 5 then
      sprite = sprites["overworld/trainers/"..self.sprite.."_left"]
    elseif self.dir == 6 or self.dir == 7 or self.dir == 8 then
      sprite = sprites["overworld/trainers/"..self.sprite.."_up"]
    end
  else
    sprite = sprites["overworld/objects/" .. (self.sprite or self.type)]
  end
  if not sprite then
    if self.shiny then
      sprite = sprites["overworld/wat"]
    else
      sprite = sprites["overworld/wat_shiny"]
    end
  end
  return sprite
end

function Object:move(x, y, instant)
  self.x = x
  self.y = y
  if instant then
    self.draw.x = self.x
    self.draw.y = self.y
  else
    addTween(tween.new(0.1, self.draw, {x = self.x, y = self.y}), "move:" .. tostring(self))
  end
  -- silly shake effect just for fun
  for _,grass in ipairs(getObjectsOnTile(x, y, {type="tall_grass"})) do
    grass.draw.shake = 2
    addTween(tween.new(.4, grass.draw, {shake = 0}), "shake:" .. tostring(grass))
  end
end

-- i know you dont want this but just for fun: bab style rotation
function Object:rotate(dir, instant, dont)
  self.dir = dir
  if dont then return end
  local rotation = (dir - 1) * 45
  self.draw.rotation = self.draw.rotation % 360
  if instant then
    self.draw.rotation = rotation
  elseif math.abs(self.draw.rotation - rotation) == 180 then
    addTween(tween.new(0.05, self.draw, {scalex = 0}), "mirror:" .. tostring(self), function()
      self.draw.rotation = rotation
      addTween(tween.new(0.05, self.draw, {scalex = 1}), "mirror:" .. tostring(self))
    end)
  else
    if self.draw.rotation - rotation > 180 then
      rotation = rotation + 360
    elseif rotation - self.draw.rotation > 180 then
      rotation = rotation - 360
    end
    addTween(tween.new(0.1, self.draw, {rotation = rotation}), "rotate:" .. tostring(self))
  end
end

function Object:canMove(x,y)
  local result = true
  local stuff = getObjectsOnTile(x,y)
  local dx,dy = x-self.x,y-self.y
  for _,thing in ipairs(stuff) do
    if thing.push then
      if thing:canMove(thing.x+dx,thing.y+dy) then
        addUndo{"update",thing,thing.x,thing.y,1}
        thing:move(thing.x+dx,thing.y+dy)
      else
        result = false
      end
    end
  end
  if not inBounds(x,y) then
    result = false
  end
  return result
end