function onSay(player, words, param)
	local uptime = getWorldUpTime()

	local hours = math.floor(uptime / 3600)
	local minutes = math.floor((uptime - (3600 * hours)) / 60)
	player:sendTextMessage(4, "Uptime: " .. hours .. " hours and " .. minutes .. " minutes.")
	return false
end
