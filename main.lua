local start_load = love.timer.getTime()

debug = false
require "utils"
require "values/attacks"
require "values/pokemon"
require "values/types"
battle = require 'battle/scene'
overworld = require 'overworld/scene'
require "battle/game"
require "overworld/game"
require "overworld/object"
require "overworld/shop"
require "overworld/undo"

-- lily's opinion: maybe gooi shouldn't be used? it disappoints me that it cant be scaled by graphics transforms
-- but also my custom ui system from bab still isn't complete so there's not really the perfect option yet
require "lib/gooi"
tween = require "lib/tween"

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
  
  keydown = {}
  tweens = {}
  
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
  
  local end_load = love.timer.getTime()
  loadScene(overworld)
  print("load took "..tostring(round(end_load-start_load,4)).." seconds, "..(end_load-start_load < 1 and "fast" or "slow"))
end

function loadScene(new)
  loaded_scene = false
  scene = new
  if scene.load then
    scene:load()
  end
end

function addTween(tween, id, after)
  tweens[id] = {tween = tween, after = after}
end

function love.update()
  loaded_scene = true
  local dt = love.timer.getDelta()
  for k,v in pairs(tweens) do
    if v.tween:update(dt) then
      tweens[k] = nil
      if v.after then v:after() end
    end
  end
  if loaded_scene and scene.update then
    scene:update(dt)
  end
end

function love.draw()
  local dt = love.timer.getDelta()
  anim_timer = anim_timer+dt
  if anim_timer > 0.2 then
    anim_stage = (anim_stage+1)%3
    anim_timer = anim_timer-0.2
  end
  if loaded_scene and scene.draw then
    scene:draw(dt)
  end
end

function love.keypressed(key)
  keydown[key] = true
  if key == "lshift" or key == "rshift" then
    keydown["shift"] = true
  end
  if key == "lctrl" or key == "rctrl" then
    keydown["ctrl"] = true
  end
  if key == "lalt" or key == "ralt" then
    keydown["alt"] = true
  end
  if key == "return" or key == "kpenter" then
    keydown["enter"] = true
  end
  if key == "f1" then
    loadScene(overworld)
  elseif key == "f2" then
    loadScene(battle)
  end
  if scene and scene.keyPressed then
    scene:keyPressed(key)
  end
end

function love.keyreleased(key)
  keydown[key] = false
  if key == "lshift" or key == "rshift" then
    keydown["shift"] = false
  end
  if key == "lctrl" or key == "rctrl" then
    keydown["ctrl"] = false
  end
  if key == "lalt" or key == "ralt" then
    keydown["alt"] = false
  end
  if key == "return" or key == "kpenter" then
    keydown["enter"] = false
  end
  if loaded_scene and scene.keyReleased then
    scene:keyReleased(key)
  end
end