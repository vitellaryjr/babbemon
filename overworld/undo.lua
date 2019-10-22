function doUndo()
  overworld.turn = overworld.turn - 1
  local undos = overworld.undo_buffer[overworld.turn]
  if undos == nil or #undos == 0 then return end
  for i=#undos,1,-1 do
    local v = undos[i]
    local reason = v[1]
    if reason == "update" then
      local subject
      if v[2].type == "pokemon" then subject = overworld.follow else subject = v[2] end
      subject:move(v[3],v[4])
      subject:rotate(v[5],false,v[2].type == "trainer")
    elseif reason == "follow_change" then
      removeFromTable(overworld.objects, overworld.follow)
      overworld.follow = Object:new("pokemon", {sprite=v[2], x=v[3], y=v[4], dir=v[5], layer=4, data=v[6]})
      table.insert(overworld.objects, overworld.follow)
    elseif reason == "steev" then
      overworld.steevdone = false
      tweens["steev_zoom"] = nil
      addTween(tween.new(0.3, overworld.camera, {zoom = v[2]}, "outQuad"), "steev_zoom_undo")
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