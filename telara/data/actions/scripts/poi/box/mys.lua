-----------Config-----------
local message = "You have found a mystic blade!"
----------End Config---------

function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,66666) == 1 then
doPlayerSendTextMessage(cid,25,"Gamemasters are not able to collect rewards from the quests.")
else
    if getPlayerStorageValue(cid,35010) == -1 then
        doPlayerAddItem(cid, 7384, 1)
        doPlayerSendTextMessage(cid,25,message)
        doSendMagicEffect(frompos, 12)
        setPlayerStorageValue(cid,35010,1)

    elseif getPlayerStorageValue(cid,35010) == 1 then
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
        end
end
end
