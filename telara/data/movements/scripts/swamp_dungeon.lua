function onStepIn(cid, item, pos)
	if isPlayer(cid) then
		local tppos = {x=1037, y=1817, z=7}
		doTeleportThing(cid,tppos)
		return true
	end
end