--edit by Banco dla tnp --
function onStepIn(cid, item, pos)
if item.uid == 60004 and getPlayerStorageValue(cid, 60003) == 1 then
local pos = getPlayerPosition(cid)
local tppos = {x=877, y=1129, z=13}

doTeleportThing(cid,tppos)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid,20,"You have arleady chosen fire.")
else
setPlayerStorageValue(cid, 60004, 1)
end
end