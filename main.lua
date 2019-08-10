debug = false
keek = nil

function love.load()
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
        addsprites(file)
      end
    end
  end
  addsprites()
end

function love.update(dt)

end

function love.draw(dt)
  love.graphics.draw(sprites["keek"],0,0)
end