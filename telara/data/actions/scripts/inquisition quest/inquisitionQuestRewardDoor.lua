function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9021) then
		local player = Player(cid)
		if(player:getStorageValue(200) == 9) then
			return (player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You forgot to ask Henricus for outfit."))
		end
		if(player:getStorageValue(200) >= 10) then
			if item.itemid == 5132 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 5133 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo(toPosition, true)			
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end