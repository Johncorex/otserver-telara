function onUse(cid, frompos, topos)
local message = "You have found a pair of steel boots!"
if getPlayerStorageValue(cid,66666) == 1 then
doPlayerSendTextMessage(cid,25,"Gamemasters are not able to collect rewards from the quests.")
else
    if getPlayerStorageValue(cid,13612) == -1 then
        doPlayerAddItem(cid, 2645, 1)
        doPlayerSendTextMessage(cid,25,message)
        doSendMagicEffect(frompos, 12)
        setPlayerStorageValue(cid,13612,1)

    elseif getPlayerStorageValue(cid,13612) == 1 then
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
end
end
        
end
