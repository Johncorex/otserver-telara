 
local t = {
    pos = {x=443, y=526, z=8},
    effect = CONST_ME_TUTORIALARROW
}
 
function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
 
    if player:getStorageValue(6661) < 1 then
        player:setStorageValue(6661, 1)
        player:say('It looks like a teleporter..', TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have unlocked Catacomb Teleporter: Zenoya Graveyard.')
        doSendMagicEffect(t.pos, t.effect, cid)
    end
    return true
end