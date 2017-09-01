name = "Cerulean Bot"
author = "Sekki"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean City and Route 4.]]

function onPathAction()
if isPokemonUsable(1) then
if getMapName() == "Pokecenter Cerulean" then
moveToMap("Cerulean City")
elseif getPlayerX() == 26 and getPlayerY() == 31 then
if not isMounted() then
useItem("Bicycle")
elseif isMounted() then
moveToMap("Route 4")
end
elseif getMapName() == "Cerulean City" or getMapName() == "Route 4" then
return moveToMap("Cerulean Cave 1F") or moveToCell(96, 14)
elseif getMapName() == "Cerulean Cave 1F" then
return moveToRectangle(44, 34, 50, 36)
end
else
if getMapName() == "Cerulean Cave 1F" then
moveToMap("Cerulean City")
elseif ( getPlayerX() == 1 and getPlayerY() == 20 ) then
if not isMounted() then
useItem("Bicycle")
elseif isMounted() then
return moveToCell(26, 30)
end
elseif getMapName() == "Cerulean City" then
return moveToMap("Route 4")
elseif getMapName() == "Route 4" then
moveToCell(96, 21)
elseif getMapName() == "Pokecenter Cerulean" then
usePokecenter()
end
end
end

function onBattleAction()
if isWildBattle() and isOpponentShiny() then
if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
return
end
end
if getActivePokemonNumber() == 1 then
return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
else
return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
end
end
