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

function effect(attack,enemy)
  local result = 1
  for _,atype in ipairs(enemy.types) do
    if attack == "you" then
      if atype == "push" then
        result = result*2
      end
    elseif attack == "push" then
      if atype == "defeat" or atype == "rock" then
        result = result*2
      end
    elseif attack == "defeat" then
      if atype == "you" then
        result = result*2
      end
    elseif attack == "grass" then
      if atype == "ground" or atype == "rock" or atype == "water" then
        result = result*2
      elseif atype == "flying" or atype == "poison" or atype == "bug" or atype == "steel" or atype == "fire" or atype == "grass" or atype == "dragon" then
        result = result/2
      end
    elseif attack == "fire" then
      if atype == "bug" or atype == "steel" or atype == "grass" or atype == "ice" then
        result = result*2
      elseif atype == "rock" or atype == "fire" or atype == "water" or atype == "dragon" then
        result = result/2
      end
    elseif attack == "water" then
      if atype == "ground" or atype == "rock" or atype == "fire" then
        result = result*2
      elseif atype == "water" or atype == "grass" or atype == "dragon" then
        result = result/2
      end
    elseif attack == "electric" then
      if atype == "ground" then
        return 0
      elseif atype == "flying" or atype == "water" then
        result = result*2
      elseif atype == "grass" or atype == "electric" or atype == "dragon" then
        result = result/2
      end
    elseif attack == "ice" then
      if atype == "flying" or atype == "ground" or atype == "grass" or atype == "dragon" then
        result = result*2
      elseif atype == "steel" or atype == "fire" or atype == "water" or atype == "ice" then
        result = result/2
      end
    elseif attack == "ground" then
      if atype == "flying" then
        return 0
      elseif atype == "poison" or atype == "rock" or atype == "steel" or atype == "fire" or atype == "electric" then
        result = result*2
      elseif atype == "bug" or atype == "grass" then
        result = result/2
      end
    elseif attack == "rock" then
      if atype == "flying" or atype == "bug" or atype == "fire" or atype == "ice" then
        result = result*2
      elseif atype == "fighting" or atype == "ground" or atype == "steel" then
        result = result/2
      end
    elseif attack == "flying" then
      if atype == "fighting" or atype == "bug" or atype == "grass" then
        result = result*2
      elseif atype == "rock" or atype == "steel" or atype == "electric" then
        result = result/2
      end
    elseif attack == "poison" then
      if atype == "steel" then
        return 0
      elseif atype == "grass" or atype == "fairy" then
        result = result*2
      elseif atype == "poison" or atype == "rock" or atype == "ground" or atype == "ghost" then
        result = result/2
      end
    elseif attack == "normal" then
      if atype == "ghost" then
        return 0
      elseif atype == "rock" or atype == "steel" then
        result = result/2
      end
    elseif attack == "ghost" then
      if atype == "normal" then
        return 0
      elseif atype == "ghost" or atype == "psychic" then
        result = result*2
      elseif atype == "dark" then
        result = result/2
      end
    elseif attack == "dark" then
      if atype == "ghost" or atype == "psychic" then
        result = result*2
      elseif atype == "fighting" or atype == "dark" or atype == "fairy" then
        result = result/2
      end
    elseif attack == "steel" then
      if atype == "rock" or atype == "ice" or atype == "fairy" then
        result = result*2
      elseif atype == "steel" or atype == "fire" or atype == "water" or atype == "electric" then
        result = result/2
      end
    elseif attack == "fairy" then
      if atype == "fighting" or atype == "dragon" or atype == "dark" then
        result = result*2
      elseif atype == "poison" or atype == "steel" or atype == "fire" then
        result = result/2
      end
    elseif attack == "fighting" then
      if atype == "ghost" then
        return 0
      elseif atype == "normal" or atype == "rock" or atype == "ice" or atype == "dark" then
        result = result*2
      elseif atype == "flying" or atype == "poison" or atype == "bug" or atype == "psychic" or atype == "fairy" then
        result = result/2
      end
    elseif attack == "psychic" then
      if atype == "dark" then
        return 0
      elseif atype == "fighting" or atype == "poison" then
        result = result*2
      elseif atype == "steel" or atype == "psychic" then
        result = result/2
      end
    elseif attack == "bug" then
      if atype == "grass" or atype == "psychic" or atype == "dark" then
        result = result*2
      elseif atype == "fighting" or atype == "flying" or atype == "poison" or atype == "ghost" or atype == "steel" or atype == "fire" or atype == "fairy" then
        result = result/2
      end
    elseif attack == "dragon" then
      if atype == "fairy" then
        return 0
      elseif atype == "dragon" then
        result = result*2
      elseif atype == "steel" then
        result = result/2
      end
    end
  end
  return result
end