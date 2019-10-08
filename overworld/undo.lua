function doUndo()
  local undos = overworld.undo_buffer
  if #undos == 0 then return end
  local v = undos[1]
  local reason = v[1]
  if reason == "update" then
    v[2]:move(v[3],v[4])
    v[2]:rotate(v[5])
  end
  table.remove(undos,1)
end

function addUndo(data)
  table.insert(overworld.undo_buffer,1,data)
end