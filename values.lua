types = {
  --new types
  "you",
  "defeat",
  "push",
  
  --other
  "grass",
  "fire",
  "water",
  "electric",
  "ice",
  "ground",
  "rock",
  "flying",
  "poison",
  "normal",
  "ghost",
  "dark",
  "steel",
  "fairy",
  "fighting",
  "psychic",
  "bug",
  "dragon",
}

egg_group = {
  monster = {},   --1,  reptilian but not draconic
  frog = {},      --2
  fish = {},      --3
  aquatic = {},   --4,  describes invertebrates like squids
  insect = {},    --5
  bird = {},      --6
  field = {},     --7,  most pokemon go here if they don't belong elsewhere
  fairy = {},     --8
  plant = {},     --9
  humanoid = {},  --10
  inorganic = {}, --11, rocks, metals, machines
  amorphous = {}, --12, blob-like or otherwise abnormal
  dragon = {},    --13
  undead = {},    --14
  other = {},     --15, pokemon that can't breed go here
}

pokemon = {
  --[[
    name = name of the pokemon, easy
    sprite = used if the sprite name is different from the name
    anim = boolean that states whether the sprite animates or not. reserved for baba
    types = table of the types the pokemon has. list of types above
    gendm,gendf = odds of the pokemon being a certain gender. 0.2,0.3 means that there's 20% chance of male, 30% chance of female, and 50% chance of other.
    gaypb = odds of the pokemon being gay. preference only affects breeding, and yes, gay breeding can happen
    catch = the odds that a pokemon will be caught. an integer between 0 and 255, with 255 being very high likelihood of catching and 0 being impossible
    able = lists the first, second and hidden abilities that the pokemon can have. if the pokemon can only have 1 ability, then both first and second need to be that ability
    egg = numbers corresponding to the egg groups that the pokemon is in. numbers are found above in egg_group
  ]]
  {
    name = "bab",
    types = {"you"},
    gendm = 0.1,
    gendf = 0.85,
    gaypb = 0.7,
    catch = 45,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      field = true
    },
  },
  {
    name = "keek",
    types = {"push"},
    gendm = 0.8,
    gendf = 0.2,
    gaypb = 0.5,
    catch = 45,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      inorganic = true
    },
  },
  {
    name = "meem",
    types = {"defeat"},
    gendm = 0.05,
    gendf = 0.005,
    gaypb = 0,
    catch = 45,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      humanoid = true
    },
  },
  {
    name = "skul",
    types = {"defeat"},
    gendm = 0.6,
    gendf = 0.3,
    gaypb = 0.6,
    catch = 240,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      undead = true
    },
  },
  {
    name = "kirb",
    types = {"normal"},
    gendm = 0.9,
    gendf = 0,
    gaypb = 0,
    catch = 200,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {},
  },
  {
    name = "ghost fren",
    sprite = "ghostfren",
    types = {"ghost"},
    gendm = 0.4,
    gendf = 0.4,
    gaypb = 0,
    catch = 190,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      amorphous = true,
      undead = true,
    },
  },
  {
    name = "wog",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0.001,
    catch = 220,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      bird = true,
    },
  },
  --[[
    name = "wogotch",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0.001,
    catch = 150,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      bird = true,
    },
  ]]
  {
    name = "baba",
    anim = true,
    types = {"you"},
    gendm = 0,
    gendf = 1,
    gaypb = 1,
    catch = 40,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      other = true,
    },
  },
}

pokemon_index = {}
for i,v in ipairs(pokemon) do
  pokemon_index[v.name] = i
  --there is almost definitely a simpler way to do this but i'm bad at coding so
  if v.egg.monster then
    egg_group.monster[v.name] = true
  end
  if v.egg.frog then
    egg_group.frog[v.name] = true
  end
  if v.egg.fish then
    egg_group.fish[v.name] = true
  end
  if v.egg.aquatic then
    egg_group.aquatic[v.name] = true
  end
  if v.egg.insect then
    egg_group.insect[v.name] = true
  end
  if v.egg.bird then
    egg_group.bird[v.name] = true
  end
  if v.egg.field then
    egg_group.field[v.name] = true
  end
  if v.egg.fairy then
    egg_group.fairy[v.name] = true
  end
  if v.egg.plant then
    egg_group.plant[v.name] = true
  end
  if v.egg.humanoid then
    egg_group.humanoid[v.name] = true
  end
  if v.egg.inorganic then
    egg_group.inorganic[v.name] = true
  end
  if v.egg.amorphous then
    egg_group.amorphous[v.name] = true
  end
  if v.egg.dragon then
    egg_group.dragon[v.name] = true
  end
  if v.egg.undead then
    egg_group.undead[v.name] = true
  end
  if v.egg.other then
    egg_group.other[v.name] = true
  end
end
print(dump(egg_group))