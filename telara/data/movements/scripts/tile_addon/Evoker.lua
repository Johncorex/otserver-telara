local config = {
    message = "Você ganhou Evoker Addon", -- Mensagem para o player
    message_fail = "Você ja ganhou este Addon!", -- Mensagem para o player caso ele jÃ¡ tenha passado pelo piso
    outfits = {male = 725, female = 724}, -- OutfitID do addon que o player vai ganhar
    addons = 3, -- Os addons que o player ganharÃ¡, OBS .: 1 = 1Âº addon, 2 = 2Âº addon, 3 = 1Âº + 2Âº addon
    storage = 13721, -- Storage que o player vai receber
    tileUid = 13721 -- UniqueID que vocÃª vai por no map editor.
}

function onStepIn(creature, item, position, fromPosition)
    if (item:getUniqueId() == config.tileUid) then
        if (creature:getStorageValue(config.storage) == -1) then
            creature:setStorageValue(config.storage, 1)
            creature:addOutfitAddon(config.outfits.male, config.addons)
            creature:addOutfitAddon(config.outfits.female, config.addons)
            creature:say(config.message, TALKTYPE_ORANGE_1)
        else
            creature:say(config.message_fail, TALKTYPE_ORANGE_1)
            creature:teleportTo(fromPosition, true)
            return false
        end
    end
    return true
end