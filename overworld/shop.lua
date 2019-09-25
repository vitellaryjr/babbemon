function canBreed(a,b)
  local samegroup = false
  local dexa = poke[a.name]
  local dexb = poke[b.name]
  for _,egga in ipairs(dexa.egg) do
    for _,eggb in ipairs(dexb.egg) do
      if egga == "cant" or eggb == "cant" then
        return false
      end
      if egga == eggb then
        samegroup = true
      end
    end
  end
  if a.name == "ditto" or b.name == "ditto" and a.name ~= b.name then
    return true
  end
  if samegroup then
    if a.gender == "enby" or b.gender == "enby" then
      return true
    elseif a.gay and b.gay and a.gender == b.gender then
      return true
    elseif not a.gay and not b.gay and a.gender ~= b.gender then
      return true
    else
      return false
    end
  else
    return false
  end
end