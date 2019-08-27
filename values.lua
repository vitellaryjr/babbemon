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
  monster = {},   --reptilian but not draconic
  frog = {},      --
  fish = {},      --
  aquatic = {},   --describes invertebrates like squids
  insect = {},    --
  bird = {},      --
  field = {},     --most pokemon go here if they don't belong elsewhere
  fairy = {},     --
  plant = {},     --
  humanoid = {},  --
  inorganic = {}, --rocks, metals, machines
  amorphous = {}, --blob-like or otherwise abnormal
  dragon = {},    --
  undead = {},    --
  cant = {},     --pokemon that can't breed go here
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
      field = true,
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
      inorganic = true,
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
      humanoid = true,
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
      undead = true,
    },
  },
  {
    name = "skulnbon",
    types = {"defeat"},
    gendm = 0.6,
    gendf = 0.3,
    gaypb = 0.6,
    catch = 120,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {
      undead = true,
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
      cant = true,
    },
  },
}

pokemon_index = {}
for i,v in ipairs(pokemon) do
  pokemon_index[v.name] = i
end
print(dump(egg_group))