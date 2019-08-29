debug = false
require "utils"
require "values"
require "func"

local poke1,poke2

function love.load()
  print([[
  
            BBBBBBBB
        BBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBBB
    BBBBBBBBBBBBBBBBBBBBBBBBB
   BBBBBBBBBBBBBBBBBBBBBBBBBBB
  BBBBBBBBBB        BBBBBBBBBBB
              BBBB
  BBBBBBBBBB  BBBB  BBBBBBBBBBB
  BBBBBBBBBB        BBBBBBBBBBB
   BBBBBBBBBBBBBBBBBBBBBBBBBBB
    BBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBB
            BBBBBBBB
  ]])
  if love.math.random() > 0.5 then
    love.window.setTitle("babbemon reed")
  else
    love.window.setTitle("babbemon bleu")
  end
  default_font = love.graphics.newFont()
  game_start_time = love.timer.getTime()

  love.graphics.setDefaultFilter("nearest","nearest")
  --sprite loader stolen from bab be u, as i'm sure many other things will be
  sprites = {}
  local function addsprites(d)
    local dir = "assets/sprites"
    if d then
      dir = dir .. "/" .. d
    end
    local files = love.filesystem.getDirectoryItems(dir)
    for _,file in ipairs(files) do
      if string.sub(file, -4) == ".png" then
        local spritename = string.sub(file, 1, -5)
        local sprite = love.graphics.newImage(dir .. "/" .. file)
        if d then
          spritename = d .. "/" .. spritename
        end
        sprites[spritename] = sprite
      elseif love.filesystem.getInfo(dir .. "/" .. file).type == "directory" then
        local newdir = file
        if d then
          newdir = d .. "/" .. newdir
        end
        addsprites(newdir)
      end
    end
  end
  addsprites()
  if love.window.setIcon(love.image.newImageData("assets/sprites/icon.png")) then
    print("icon changed")
  end
  poke1 = poke[love.math.random(1,#poke)]
  poke2 = poke[love.math.random(1,#poke)]
  
  local load_end_time = love.timer.getTime()
  print("load took "..tostring(round(load_end_time-game_start_time,4)).." seconds, "..(load_end_time-game_start_time < 1 and "fast" or "slow"))
end

function love.update(dt)
  
end

function love.draw(dt)
  dt = love.timer.getDelta()
  anim_timer = anim_timer+dt
  if anim_timer > 0.2 then
    anim_stage = (anim_stage+1)%3
    anim_timer = anim_timer-0.2
  end
  local p1draw = sprites["battle/"..(poke1.sprite or poke1.name).."_f"..(poke1.anim and ("_"..tostring(anim_stage)) or "")]
  local p2draw = sprites["battle/"..(poke2.sprite or poke2.name).."_b"..(poke2.anim and ("_"..tostring(anim_stage)) or "")]
  local p1w = p1draw:getWidth()
  local p2w = p2draw:getWidth()
  local p1h = p1draw:getHeight()
  local p2h = p2draw:getHeight()
  
  love.graphics.setColor(0.8,0.8,0.8,1)
  love.graphics.setLineWidth(4)
  love.graphics.setLineStyle("rough")
  --[[
  love.graphics.ellipse("line",600,150,150,75)
  love.graphics.ellipse("line",175,250,150,75)
  ]]
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(p1draw,600-p1w/2,150-3*p1h/4)
  love.graphics.draw(p2draw,175-p2w/2,250-3*p2h/4)
end