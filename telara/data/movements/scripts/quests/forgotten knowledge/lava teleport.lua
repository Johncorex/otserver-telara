local destination = {
	[26668] = {position = Position(1944, 1959, 10)}
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
		player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
	else
		local pos = position
		item:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		pos.y = pos.y - 2
		player:teleportTo(pos)
		player:say("You haven't permission to use this teleport.", TALKTYPE_MONSTER_SAY, false, nil, position)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
