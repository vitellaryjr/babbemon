Object = {}

function Object:new(type, o)
  o = o or {}

  o.type = type
  o.sprite = o.sprite
  o.x = o.x or 0
  o.y = o.y or 0
  o.dir = o.dir or 0

  o.draw = {
    x = o.draw and o.draw.x or o.x,
    y = o.draw and o.draw.y or o.y,
    scalex = o.draw and o.draw.scalex or 1,
    scaley = o.draw and o.draw.scaley or 1,
    shake = o.draw and o.draw.shake or 0,
    rotation = o.draw and o.draw.rotation or o.dir*45
  }

  setmetatable(o, self)
  self.__index = self
  return o
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
end

-- i know you dont want this but just for fun: bab style rotation
function Object:rotate(dir, instant)
  self.dir = dir

  local rotation = dir * 45
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