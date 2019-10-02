function inBounds(x, y)
  return x >= 0 and y >= 0 and x < overworld.width and y < overworld.height
end

function getObjectsOnTile(x, y, o)
  o = o or {}
  local objects = {}
  for _,object in ipairs(overworld.objects) do
    if object.x == x and object.y == y and object ~= o.exclude and (not o.type or object.type == o.type) then
      table.insert(objects, object)
    end
  end
  return objects
end