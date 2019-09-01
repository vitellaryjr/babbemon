local start_load = love.timer.getTime()

debug = false
require "utils"
require "values"
require "func"
battle = require 'battle/scene'

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
  
  love.graphics.setFont(default_font)
  love.graphics.setDefaultFilter("nearest","nearest")
  love.graphics.setLineStyle("rough")
  
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
  
  local end_load = love.timer.getTime()
  scene = battle
  print("load took "..tostring(round(end_load-start_load,4)).." seconds, "..(end_load-start_load < 1 and "fast" or "slow"))
end

function love.update()
  local dt = love.timer.getDelta()
  if scene and scene.update then
    scene.update(dt)
  end
end

function love.draw()
  local dt = love.timer.getDelta()
  anim_timer = anim_timer+dt
  if anim_timer > 0.2 then
    anim_stage = (anim_stage+1)%3
    anim_timer = anim_timer-0.2
  end
  if scene and scene.draw then
    scene.draw(dt)
  end
end

function love.keypressed(key)
  if scene and scene.keyPressed then
    scene.keyPressed(key)
  end
end