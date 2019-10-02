--usage: types[attack type][opponent type 1] * types[attack type][opponent type 2]
--eg: types["psychic"]["you"] * types["psychic"]["fighting"] = 0.5*2 = 1
types = {
  you = {
    you = 0.5,
    defeat = 1,
    push = 2,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 0.5,
    ground = 1,
    rock = 2,
    flying = 1,
    poison = 1,
    normal = 0.5,
    ghost = 1,
    dark = 1,
    steel = 1,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 1,
  },
  defeat = {
    you = 2,
    defeat = 1,
    push = 0.5,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 1,
    poison = 0.5,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 1,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 1,
  },
  push = {
    you = 0.5,
    defeat = 2,
    push = 2,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 0.5,
    ground = 1,
    rock = 2,
    flying = 2,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 1,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 1,
  },
  grass = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 0.5,
    fire = 0.5,
    water = 2,
    electric = 1,
    ice = 1,
    ground = 2,
    rock = 2,
    flying = 0.5,
    poison = 0.5,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 0.5,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 0.5,
    dragon = 0.5,
  },
  fire = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 2,
    fire = 0.5,
    water = 0.5,
    electric = 1,
    ice = 2,
    ground = 1,
    rock = 0.5,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 2,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 2,
    dragon = 0.5,
  },
  water = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 0.5,
    fire = 2,
    water = 0.5,
    electric = 1,
    ice = 1,
    ground = 2,
    rock = 2,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 1,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 0.5,
  },
  electric = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 0.5,
    fire = 1,
    water = 2,
    electric = 0.5,
    ice = 1,
    ground = 0,
    rock = 1,
    flying = 2,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 2,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 0.5,
  },
  ice = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 2,
    fire = 2,
    water = 2,
    electric = 1,
    ice = 2,
    ground = 2,
    rock = 1,
    flying = 2,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 2,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 2,
  },
  ground = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 0.5,
    fire = 2,
    water = 1,
    electric = 2,
    ice = 1,
    ground = 1,
    rock = 2,
    flying = 0,
    poison = 2,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 2,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 0.5,
    dragon = 1,
  },
  rock = {
    you = 1,
    defeat = 2,
    push = 1,
    grass = 1,
    fire = 2,
    water = 1,
    electric = 1,
    ice = 2,
    ground = 0.5,
    rock = 1,
    flying = 2,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 0.5,
    fairy = 1,
    fighting = 0.5,
    psychic = 1,
    bug = 2,
    dragon = 1,
  },
  flying = {
    you = 1,
    defeat = 0.5,
    push = 1,
    grass = 2,
    fire = 1,
    water = 1,
    electric = 0.5,
    ice = 1,
    ground = 1,
    rock = 0.5,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 0.5,
    fairy = 1,
    fighting = 2,
    psychic = 1,
    bug = 2,
    dragon = 1,
  },
  poison = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 2,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 0.5,
    rock = 0.5,
    flying = 1,
    poison = 0.5,
    normal = 1,
    ghost = 0.5,
    dark = 1,
    steel = 0,
    fairy = 2,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 1,
  },
  normal = {
    you = 1,
    defeat = 0.5,
    push = 1,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 0.5,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 0,
    dark = 1,
    steel = 0.5,
    fairy = 1,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 1,
  },
  ghost = {
    you = 1,
    defeat = 2,
    push = 1,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 1,
    poison = 1,
    normal = 0,
    ghost = 2,
    dark = 0.5,
    steel = 1,
    fairy = 1,
    fighting = 1,
    psychic = 2,
    bug = 1,
    dragon = 1,
  },
  dark = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 2,
    dark = 0.5,
    steel = 1,
    fairy = 0.5,
    fighting = 0.5,
    psychic = 2,
    bug = 1,
    dragon = 1,
  },
  steel = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 1,
    fire = 0.5,
    water = 0.5,
    electric = 0.5,
    ice = 2,
    ground = 1,
    rock = 2,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 0.5,
    fairy = 2,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 1,
  },
  fairy = {
    you = 1,
    defeat = 0.5,
    push = 1,
    grass = 1,
    fire = 0.5,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 1,
    poison = 0.5,
    normal = 1,
    ghost = 1,
    dark = 2,
    steel = 0.5,
    fairy = 1,
    fighting = 2,
    psychic = 1,
    bug = 1,
    dragon = 2,
  },
  fighting = {
    you = 1,
    defeat = 1,
    push = 2,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 2,
    ground = 1,
    rock = 2,
    flying = 0.5,
    poison = 0.5,
    normal = 2,
    ghost = 0,
    dark = 2,
    steel = 1,
    fairy = 0.5,
    fighting = 1,
    psychic = 0.5,
    bug = 0.5,
    dragon = 1,
  },
  psychic = {
    you = 0.5,
    defeat = 1,
    push = 1,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 1,
    poison = 2,
    normal = 1,
    ghost = 1,
    dark = 0,
    steel = 0.5,
    fairy = 1,
    fighting = 2,
    psychic = 0.5,
    bug = 1,
    dragon = 1,
  },
  bug = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 2,
    fire = 0.5,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 0.5,
    poison = 0.5,
    normal = 1,
    ghost = 0.5,
    dark = 2,
    steel = 0.5,
    fairy = 0.5,
    fighting = 0.5,
    psychic = 2,
    bug = 1,
    dragon = 1,
  },
  dragon = {
    you = 1,
    defeat = 1,
    push = 1,
    grass = 1,
    fire = 1,
    water = 1,
    electric = 1,
    ice = 1,
    ground = 1,
    rock = 1,
    flying = 1,
    poison = 1,
    normal = 1,
    ghost = 1,
    dark = 1,
    steel = 0.5,
    fairy = 0,
    fighting = 1,
    psychic = 1,
    bug = 1,
    dragon = 2,
  },
}

type_colors = {
  you = {1,0,.525},
  push = {.686,.443,.267},
  defeat = {.482,.047,0},
  grass = {.29,.698,.271},
  fire = {1,.208,.122},
  water = {.275,.478,.918},
  electric = {1,.871,.227},
  ice = {.698,.827,.957},
  ground = {.62,.365,.184},
  rock = {.918,.510,.275},
  flying = {.29,.976,.851},
  poison = {.71,.282,.796},
  normal = {1,1,1},
  ghost = {.482,.353,.808},
  dark = {.275,.275,.318},
  steel = {.678,.71,.71},
  fairy = {1,.561,.776},
  fighting = {.6,.11,0},
  psychic = {.937,.545,.91},
  bug = {.639,.757,.22},
  dragon = {.392,.22,.878},
}

--[[ egg groups
monster   -reptilian but not draconic
frog
fish
aquatic   -describes invertebrates like squids
insect
bird
field     -most pokemon go here if they don't belong elsewhere
fairy
plant
humanoid
inorganic -rocks, metals, machines
amorphous -blob-like or otherwise abnormal
dragon
undead
cant      -pokemon that can't breed go here
]]

poke = {
  --[[
    name = name of the pokemon, easy
    sprite = used if the sprite name is different from the name
    anim = boolean that states whether the sprite animates or not. reserved for baba
    types = table of the types the pokemon has. list of types above
    gendm,gendf = odds of the pokemon being a certain gender. 0.2,0.3 means that there's 20% chance of male, 30% chance of female, and 50% chance of other.
    gaypb = odds of the pokemon being gay. preference only affects breeding, and yes, gay breeding can happen
    catch = the odds that a pokemon will be caught. an integer between 0 and 255, with 255 being very high likelihood (not guaranteed?) of catching and 0 being impossible
    expy = the amount of exp you'll get from defeating the pokemon. number between 1 and 255. https://textuploader.com/atre4
    able = lists the first, second and hidden abilities that the pokemon can have. if the pokemon can only have 1 ability, then both first and second need to be that ability
    egg = numbers corresponding to the egg groups that the pokemon is in. numbers are found above in egg_group
    growth = how quickly the pokemon goes between levels. options are "fast", "medium_fast", "medium_slow", "slow", "erratic", and "fluctuating" https://bulbapedia.bulbagarden.net/wiki/Experience#Relation_to_level
    attacks = list of attacks the pokemon can learn, by level. example:
    {
      1 = {
        "tackle",
        "explosion",
      },
      3 = {
        "hyper beam",
      },
    },
  ]]
  {
    name = "bab",
    types = {"you"},
    gendm = 0.1,
    gendf = 0.88,
    gaypb = 0.7,
    catch = 45,
    expy = 64,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"field"},
    growth = "medium_slow",
    attacks = {},
  },
  {
    name = "babi",
    types = {"you","psychic"},
    gendm = 0.1,
    gendf = 0.88,
    gaypb = 0.7,
    catch = 45,
    expy = 141,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"field"},
    growth = "medium_slow",
  },
  {
    name = "babber",
    types = {"you","psychic"},
    gendm = 0.1,
    gendf = 0.88,
    gaypb = 0.7,
    catch = 45,
    expy = 208,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"field"},
    growth = "medium_slow",
  },
  {
    name = "keek",
    types = {"push"},
    gendm = 0.8,
    gendf = 0.2,
    gaypb = 0.5,
    catch = 45,
    expy = 64,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"inorganic"},
    growth = "medium_slow",
  },
  {
    name = "meem",
    types = {"defeat"},
    gendm = 0.05,
    gendf = 0.005,
    gaypb = 0,
    catch = 45,
    expy = 64,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"humanoid"},
    growth = "medium_slow",
  },
  {
    name = "flof",
    types = {"you"},
    gendm = 0.88,
    gendf = 0.1,
    gaypb = 0.7,
    catch = 90,
    expy = 72,
    able = {
      first = "fluffy",
      second = "fur_coat",
      hidden = "unaware",
    },
    egg = {"field"},
    growth = "medium_slow",
    attacks = {},
  },
  {
    name = "furlof",
    types = {"you","water"},
    gendm = 0.88,
    gendf = 0.1,
    gaypb = 0.7,
    catch = 45,
    expy = 90,
    able = {
      first = "fluffy",
      second = "fur_coat",
      hidden = "unaware",
    },
    egg = {"field"},
    growth = "medium_slow",
    attacks = {},
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
    egg = {"undead"},
    growth = "medium_slow",
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
    egg = {"undead"},
    growth = "medium_slow",
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
    egg = {"amorphous","humanoid"},
    growth = "fast",
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
    egg = {"amorphous","undead"},
    growth = "medium_fast",
  },
  {
    name = "wog",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0.001,
    catch = 220,
    expy = 55,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"bird"},
    growth = "medium_slow",
  },
  {
    name = "wogotch",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0.001,
    catch = 150,
    expy = 113,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"bird"},
    growth = "medium_slow",
  },
  {
    name = "snoboy",
    types = {"ice","normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 230,
    expy = 70,
    able = {
      first = "hydration",
      second = "ice_body",
      hidden = "snow_warning",
    },
    egg = {"inorganic"},
    growth = "medium_fast",
  },
  {
    name = "snoman",
    types = {"ice","normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 115,
    expy = 115,
    able = {
      first = "hydration",
      second = "ice_body",
      hidden = "snow_warning",
    },
    egg = {"inorganic"},
    growth = "medium_fast",
  },
  {
    name = "wurm",
    types = {"bug"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 250,
    expy = 50,
    able = {
      first = "frisk",
      second = "harvest",
      hidden = "unnerve",
    },
    egg = {"insect"},
    growth = "fast",
  },
  {
    name = "sneel",
    types = {"water"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 240,
    expy = 65,
    able = {
      first = "slow_start",
      second = "storm_drain",
      hidden = "solid_rock",
    },
    egg = {"aquatic"},
    growth = "medium_fast",
  },
  {
    name = "sneelectric",
    types = {"water","electric"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 120,
    expy = 100,
    able = {
      first = "swift_swim",
      second = "storm_drain",
      hidden = "solid_rock",
    },
    egg = {"aquatic"},
    growth = "medium_fast",
  },
   {
    name = "fishe",
    types = {"water","normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 240,
    expy = 65,
    able = {
      first = "run_away",
      second = "torrent",
      hidden = "water_bubble",
    },
    egg = {"aquatic"},
    growth = "medium_fast",
  },
   {
    name = "migri",
    types = {"you","defeat"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 80,
    expy = 100,
    able = {
      first = "levitate",
      second = "infiltrator",
      hidden = "magic_guard",
    },
    egg = {"amorphous"},
    growth = "medium",
  },
  {
    name = "oddish",
    types = {"grass","poison"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 255,
    expy = 64,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"plant"},
    growth = "medium_slow",
  },
  {
    name = "magnemite",
    types = {"steel","electric"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 190,
    expy = 65,
    able = {
      first = "magnet_pull",
      second = "sturdy",
      hidden = "analytic",
    },
    egg = {"cant"},
    growth = "medium_fast",
  },
  {
    name = "beldum",
    types = {"steel","psychic"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 3,
    expy = 60,
    able = {
      first = "clear_body",
      second = "clear_body",
      hidden = "light_metal",
    },
    egg = {"cant"},
    growth = "slow",
  },
  {
    name = "sentret",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 255,
    expy = 43,
    able = {
      first = "run_away",
      second = "keen_eye",
      hidden = "frisk",
    },
    egg = {"field"},
    growth = "medium_fast",
  },
  {
    name = "eevee",
    types = {"normal"},
    gendm = 0.875,
    gendf = 0.125,
    gaypb = 0,
    catch = 45,
    expy = 65,
    able = {
      first = "run_away",
      second = "adaptability",
      hidden = "anticipation",
    },
    egg = {"field"},
    growth = "medium_fast",
  },
  {
    name = "koffing",
    types = {"poison"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 190,
    expy = 68,
    able = {
      first = "levitate",
      second = "nil",
      hidden = "nil",
    },
    egg = {"amorphous"},
    growth = "medium_fast",
  },
  {
    name = "shuppet",
    types = {"ghost"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 225,
    expy = 59,
    able = {
      first = "insomnia",
      second = "frisk",
      hidden = "cursed_body",
    },
    egg = {"amorphous"},
    growth = "medium_fast",
  },
  {
    name = "litwick",
    types = {"ghost","fire"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 190,
    expy = 55,
    able = {
      first = "flash_fire",
      second = "flame_body",
      hidden = "infiltrator",
    },
    egg = {"amorphous"},
    growth = "medium_slow",
  },
  {
    name = "lampent",
    types = {"ghost","fire"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 90,
    expy = 130,
    able = {
      first = "flash_fire",
      second = "flame_body",
      hidden = "infiltrator",
    },
    egg = {"amorphous"},
    growth = "medium_slow",
  },
  {
    name = "solosis",
    types = {"psychic"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 200,
    expy = 58,
    able = {
      first = "overcoat",
      second = "magic_guard",
      hidden = "regenerator",
    },
    egg = {"amorphous"},
    growth = "medium_slow",
  },
  {
    name = "duosion",
    types = {"psychic"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 100,
    expy = 130,
    able = {
      first = "overcoat",
      second = "magic_guard",
      hidden = "regenerator",
    },
    egg = {"amorphous"},
    growth = "medium_slow",
  },
  {
    name = "dratini",
    types = {"dragon"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 45,
    expy = 60,
    able = {
      first = "shed_skin",
      second = "shed_skin",
      hidden = "marvel_scale",
    },
    egg = {"aquatic","dragon"},
    growth = "slow",
  },
  {
    name = "azurill",
    types = {"normal","fairy"},
    gendm = 0.25,
    gendf = 0.75,
    gaypb = 0,
    catch = 150,
    expy = 38,
    able = {
      first = "thick_fat",
      second = "huge_power",
      hidden = "sap_sipper",
    },
    egg = {"cant"},
    growth = "fast",
  },
  {
    name = "drifloon",
    types = {"ghost","flying"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 125,
    expy = 70,
    able = {
      first = "aftermath",
      second = "unburden",
      hidden = "flare_boost",
    },
    egg = {"amorphous"},
    growth = "fluctuating",
  },
  {
    name = "spiritomb",
    types = {"ghost","dark"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 100,
    expy = 170,
    able = {
      first = "pressure",
      second = "pressure",
      hidden = "infiltrator",
    },
    egg = {"amorphous"},
    growth = "medium_fast",
  },
  {
    name = "pyukumuku",
    types = {"water"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0,
    catch = 60,
    expy = 144,
    able = {
      first = "innards_out",
      second = "innards_out",
      hidden = "unaware",
    },
    egg = {"aquatic"},
    growth = "fast",
  },
  {
    name = "baba",
    anim = true,
    types = {"you"},
    gendm = 0,
    gendf = 1,
    gaypb = 1,
    catch = 40,
    expy = 64,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"cant"},
    growth = "slow",
  },
  {
    name = "missingno.",
    sprite = "missingno",
    types = {},
    gendm = 0,
    gendf = 0,
    gaypb = 0,
    catch = 255,
    expy = 0,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"cant"},
    growth = "erratic",
  },
  {
    name = "indexnil",
    types = {},
    gendm = 0,
    gendf = 0,
    gaypb = 0,
    catch = 255,
    expy = 0,
    able = {
      first = nil,
      second = nil,
      hidden = nil,
    },
    egg = {"cant"},
    growth = "erratic",
  },
}

poke_i = {}
for i,v in ipairs(poke) do
  poke[v.name] = v
  poke_i[v.name] = i
end

attacks = {
  --[[ https://bulbapedia.bulbagarden.net/wiki/List_of_moves
    name = name of the attack
    atype = type that the move is
    cat = damage category, options are "physical", "special" and "status"
    pp = normal pp that the move has
    maxpp = max pp that the move can achieve using PP Up or PP Max
    power = influences the amount of damage the move deals. set as -1 for moves that don't do damage
    accur = chance of the attack hitting, from 1-100
    contact = boolean that says whether the attack touches the opponent
    protect = boolean that says whether the attack is affected by protect
    magiccoat =  "      "   "      "     "    "     "     "     " magic coat
    snatch =     "      "   "      "     "    "     "     "     " snatch
    mirror =     "      "   "      "     "    "     "     "     " mirror move
    kingrock =   "      "   "      "     "    "     "     "     " king's rock
    tm,hm,tutor = boolean that states that the move is learned via tm / hm / move tutor
  ]]
  {
    name = "tackle",
    atype = "normal",
    cat = "physical",
    pp = 35,
    maxpp = 52,
    power = 40,
    accur = 100,
    contact = true,
    protect = true,
    mirror = true,
    kingrock = true,
  },
}

attack_i = {}
for i,v in ipairs(attacks) do
  attack_i[v.name] = i
end