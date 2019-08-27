debug = false
require "utils"
require "values"

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
  poke1 = pokemon[love.math.random(1,#pokemon)]
  poke2 = pokemon[love.math.random(1,#pokemon)]
  
  local load_end_time = love.timer.getTime()
  print("load took "..tostring(round(load_end_time-game_start_time,4)).." seconds"..(load_end_time-game_start_time < 1 and ", fast" or ""))
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
  love.graphics.draw(sprites["battle/"..(poke1.sprite or poke1.name).."_f"..(poke1.anim and ("_"..tostring(anim_stage)) or "")],530,40)
  love.graphics.draw(sprites["battle/"..(poke2.sprite or poke2.name).."_b"..(poke2.anim and ("_"..tostring(anim_stage)) or "")],80,160)
end