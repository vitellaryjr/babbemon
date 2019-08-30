local scene = {}

function scene.draw(dt)
  local p1draw = sprites["battle/"..(poke1.sprite or poke1.name).."_f"..(poke1.anim and ("_"..tostring(anim_stage)) or "")]
  local p2draw = sprites["battle/"..(poke2.sprite or poke2.name).."_b"..(poke2.anim and ("_"..tostring(anim_stage)) or "")]
  local p1w = p1draw:getWidth()
  local p2w = p2draw:getWidth()
  local p1h = p1draw:getHeight()
  local p2h = p2draw:getHeight()
  
  love.graphics.setLineWidth(4)
  love.graphics.setColor(0.2,0.2,0.2,1)
  love.graphics.ellipse("fill",600,150,150,75)
  love.graphics.ellipse("fill",175,250,150,75)
  
  love.graphics.setColor(0.8,0.8,0.8,1)
  love.graphics.ellipse("line",600,150,150,75)
  love.graphics.ellipse("line",175,250,150,75)
  
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(p1draw,600-p1w/2,150-3*p1h/4)
  love.graphics.draw(p2draw,175-p2w/2,250-3*p2h/4)
end

return scene