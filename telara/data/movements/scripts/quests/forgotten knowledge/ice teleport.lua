local destination = {
	[26667] = {position = Position(2109, 1606, 11)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = destination[item.actionid]
	if not teleport then
		return
	end

	if player:getStorageValue(teleport.storage) >= 1 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(teleport.position)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		local pos = position
		item:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		pos.x = pos.x + 1
		player:teleportTo(pos)
		player:say("You haven't permission to use this teleport.", TALKTYPE_MONSTER_SAY, false, nil, position)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
