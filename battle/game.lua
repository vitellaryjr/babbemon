function doSpriteTest(just_started)
  if just_started then
    poke1 = poke[1]
    poke2 = poke[1]
  else
    if pokedex_i[poke1.name] == #poke then
      spritetest = false
      test_endtime = love.timer.getTime()
    else
      poke1 = poke[pokedex_i[poke1.name]+1]
      poke2 = poke[pokedex_i[poke2.name]+1]
    end
  end
end