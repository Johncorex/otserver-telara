function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	position.z = position.z + 1
	player:teleportTo(position)
	position:sendMagicEffect(CONST_ME_FIREATTACK)
	return true
end