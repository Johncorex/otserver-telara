function onStepIn(cid, item, pos)
if item.uid == 60411 then
local pos = getPlayerPosition(cid)
local tppos = {x=1095, y=657, z=7}
doTeleportThing(cid,tppos)
end
return 1
end