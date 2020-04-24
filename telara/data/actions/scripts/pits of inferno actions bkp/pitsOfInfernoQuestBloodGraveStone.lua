function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid ~= 2023 then
		return false
	end

	if not Tile(toPosition):getItemById(1093, 2) then
		return true
	end

	toPosition.z = toPosition.z + 1
	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
