-----------------------------------
-- ID: 4365
-- Item: rolanberry
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -4
-- Intelligence 2
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 300, 4365)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(tpz.mod.AGI, -4)
    target:addMod(tpz.mod.INT, 2)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(tpz.mod.AGI, -4)
    target:delMod(tpz.mod.INT, 2)
end

return item_object
