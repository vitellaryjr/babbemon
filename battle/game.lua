function doSpriteTest(just_started)
  if just_started then
    battle.poke1 = poke[1]
    battle.poke2 = poke[1]
  else
    if poke_i[battle.poke1.name] == #poke then
      battle.spritetest = false
      battle.test_endtime = love.timer.getTime()
    else
      battle.poke1 = poke[poke_i[battle.poke1.name]+1]
      battle.poke2 = poke[poke_i[battle.poke2.name]+1]
    end
  end
end