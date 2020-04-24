 
local t = {
    pos = {x=259, y=400, z=7},
    effect = CONST_ME_TUTORIALARROW
}
 
function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
 
    if player:getStorageValue(6663) < 1 then
        player:setStorageValue(6663, 1)
        player:say('It looks like a teleporter..', TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have unlocked Catacomb Teleporter: Azshara North Catacomb.')
        doSendMagicEffect(t.pos, t.effect, cid)
    end
    return true
end