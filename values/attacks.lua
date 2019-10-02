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
  attacks[v.name] = v
  attack_i[v.name] = i
end