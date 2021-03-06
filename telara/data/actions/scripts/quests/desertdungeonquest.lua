local config = {
	{fromPosition = Position(485, 716, 8), toPosition = Position(485, 696, 8), sacrificePosition = Position(487, 716, 8), sacrificeId = 2175, vocationId = 1},
	{fromPosition = Position(479, 716, 8), toPosition = Position(485, 695, 8), sacrificePosition = Position(477, 716, 8), sacrificeId = 2674, vocationId = 2},
	{fromPosition = Position(482, 713, 8), toPosition = Position(484, 695, 8), sacrificePosition = Position(482, 711, 8), sacrificeId = 2455, vocationId = 3},
	{fromPosition = Position(482, 719, 8), toPosition = Position(484, 696, 8), sacrificePosition = Position(482, 720, 8), sacrificeId = 2376, vocationId = 4}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item.itemid == 1945 and 1946 or 1945)

	if item.itemid ~= 1945 then
		return true
	end

	local position = player:getPosition()

	local players = {}
	for i = 1, #config do
		local creature = Tile(config[i].fromPosition):getTopCreature()
		if not creature or not creature:isPlayer() then
			player:sendCancelMessage('You need one player of each vocation for this quest.')
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		local vocationId = creature:getVocation():getBase():getId()
		if vocationId ~= config[i].vocationId then
			player:sendCancelMessage('You need one player of each vocation for this quest.')
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		local sacrificeItem = Tile(config[i].sacrificePosition):getItemById(config[i].sacrificeId)
		if not sacrificeItem then
			player:sendCancelMessage(creature:getName() .. ' is missing ' .. (creature:getSex() == PLAYERSEX_FEMALE and 'her' or 'his') .. ' sacrifice on the altar.')
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		players[#players + 1] = creature
	end

	for i = 1, #players do
		local sacrificeItem = Tile(config[i].sacrificePosition):getItemById(config[i].sacrificeId)
		if sacrificeItem then
			sacrificeItem:remove()
		end

		players[i]:getPosition():sendMagicEffect(CONST_ME_POFF)
		players[i]:teleportTo(config[i].toPosition)
		config[i].toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end