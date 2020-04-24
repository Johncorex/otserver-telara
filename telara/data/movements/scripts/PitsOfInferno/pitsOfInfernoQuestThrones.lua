local thrones = {
	[2080] = {text = "You have touched Infernatil's throne and absorbed some of his spirit.", animation = 16},
	[2081] = {text = "You have touched Tafariel's throne and absorbed some of his spirit.'", animation = 18},
	[2082] = {text = "You have touched Verminor's throne and absorbed some of his spirit.", animation = 9},
	[2083] = {text = "You have touched Apocalypse's throne and absorbed some of his spirit.", animation = 7},
	[2084] = {text = "You have touched Bazir's throne and absorbed some of his spirit.", animation = 15},
	[2085] = {text = "You have touched Ashfalor's throne and absorbed some of his spirit.", animation = 16},
	[2086] = {text = "You have touched Pumin's throne and absorbed some of his spirit.", animation = 18}
}

function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, item.uid) < 1) then
		setPlayerStorageValue(cid, item.uid, 1)
		doSendMagicEffect(position, thrones[item.uid].animation)
		doCreatureSay(cid, thrones[item.uid].text, TALKTYPE_ORANGE_1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You've already absorbed energy from this throne.")
	end
	return true
end