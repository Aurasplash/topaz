-----------------------------------
-- ID: 5746
-- Item: serving_of_cherry_bavarois_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP 30
-- Intelligence 4
-- MP 15
-- HP Recovered While Healing 4
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 14400, 5746)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(tpz.mod.HP, 30)
    target:addMod(tpz.mod.INT, 4)
    target:addMod(tpz.mod.MP, 15)
    target:addMod(tpz.mod.HPHEAL, 4)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(tpz.mod.HP, 30)
    target:delMod(tpz.mod.INT, 4)
    target:delMod(tpz.mod.MP, 15)
    target:delMod(tpz.mod.HPHEAL, 4)
end

return item_object
