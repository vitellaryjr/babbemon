function doUndo()
  local undos = overworld.undo_buffer[overworld.turn-1]
  overworld.turn = overworld.turn - 1
  if undos == nil or #undos == 0 then return end
  for _,v in ipairs(undos) do
    local reason = v[1]
    if reason == "update" then
      v[2]:move(v[3],v[4])
      v[2]:rotate(v[5])
    end
  end
  table.remove(undos,1)
end

function addUndo(data)
  if overworld.undo_buffer[overworld.turn] == nil then
    overworld.undo_buffer[overworld.turn] = {}
  end
  table.insert(overworld.undo_buffer[overworld.turn],1,data)
end