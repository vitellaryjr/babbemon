function canBreed(a,b)
  local samegroup = false
  local dexa = poke[pokedex_i[a.name]]
  local dexb = poke[pokedex_i[b.name]]
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
  if a.name == "ditto" or b.name == "ditto" then
    return true
  end
  if samegroup then
    if a.gender == "enby" or b.gender == "enby" then
      return true
    elseif a.pref == b.gender and b.pref == a.gender then
      return true
    else
      return false
    end
  else
    return false
  end
end