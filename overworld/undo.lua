function doUndo()
  overworld.turn = overworld.turn - 1
  local undos = overworld.undo_buffer[overworld.turn]
  if undos == nil or #undos == 0 then return end
  for i=#undos,1,-1 do
    local v = undos[i]
    local reason = v[1]
    if reason == "update" then
      v[2]:move(v[3],v[4])
      v[2]:rotate(v[5])
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