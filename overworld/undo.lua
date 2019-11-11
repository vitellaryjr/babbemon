function doUndo()
  overworld.turn = overworld.turn - 1
  local undos = overworld.undo_buffer[overworld.turn]
  if undos == nil or #undos == 0 then return end
  for i=#undos,1,-1 do
    local v = undos[i]
    if v.reason == "update" then
      local subject
      if v.unit.type == "pokemon" then subject = overworld.follow else subject = v.unit end
      subject:move(v.x,v.y)
      subject:rotate(v.dir,false,v.unit.type == "trainer")
    elseif v.reason == "follow_change" then
      removeFromTable(overworld.objects, overworld.follow)
      overworld.follow = Object:new("pokemon", {sprite=v.sprite, x=v.x, y=v.y, dir=v.dir, layer=4, data=v.data})
      table.insert(overworld.objects, overworld.follow)
    elseif v.reason == "steev" then
      overworld.steevdone = false
      tweens["steev_zoom"] = nil
      addTween(tween.new(0.3, overworld.camera, {zoom = v.zoom}, "outQuad"), "steev_zoom_undo")
    else
      print("unknown undo reason: "..reason)
    end
    table.remove(undos,i)
  end
end

function addUndo(data)
  if overworld.undo_buffer[overworld.turn] == nil then
    overworld.undo_buffer[overworld.turn] = {}
  end
  table.insert(overworld.undo_buffer[overworld.turn],1,data)
end