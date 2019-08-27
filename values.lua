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
pokemon = {
  --[[
    name = name of the pokemon, easy
    sprite = used if the sprite name is different from the name
    anim = boolean that states whether the sprite animates or not. reserved for baba
    types = table of the types the pokemon has. list of types above
    gendm,gendf = odds of the pokemon being a certain gender. 0.2,0.3 means that there's 20% chance of male, 30% chance of female, and 50% chance of other.
    gaypb = odds of the pokemon being gay. preference doesn't actually affect gameplay
    catch = the odds that a pokemon will be caught. an integer between 0 and 255, with 255 being very high likelihood of catching and 0 being impossible
  ]]
  {
    name = "bab",
    types = {"you"},
    gendm = 0.1,
    gendf = 0.85,
    gaypb = 0.7,
  },
  {
    name = "keek",
    types = {"push"},
    gendm = 0.8,
    gendf = 0.2,
    gaypb = 0.5,
  },
  {
    name = "meem",
    types = {"defeat"},
    gendm = 0.05,
    gendf = 0.005,
    gaypb = 0,
  },
  {
    name = "skul",
    types = {"defeat"},
    gendm = 0.6,
    gendf = 0.3,
    gaypb = 0.6,
    catch = 240,
  },
  {
    name = "kirb",
    types = {"normal"},
    gendm = 0.9,
    gendf = 0,
    gaypb = 0,
    catch = 200,
  },
  {
    name = "ghost fren",
    sprite = "ghostfren",
    types = {"ghost"},
    gendm = 0.4,
    gendf = 0.4,
    gaypb = 0,
    catch = 190,
  },
  {
    name = "wog",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0.001,
    catch = 220,
  },
  --[[
    name = "wogotch",
    types = {"normal"},
    gendm = 0.5,
    gendf = 0.5,
    gaypb = 0.001,
    catch = 150,
  ]]
  {
    name = "baba",
    anim = true,
    types = {"you"},
    gendm = 0,
    gendf = 1,
    gaypb = 1,
    catch = 40,
  },
}