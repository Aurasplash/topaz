-----------------------------------
-- Area: Jade Sepulcher
-- BCNM: TOAU-29 Puppet in Peril
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedMission(TOAU, tpz.mission.id.toau.PUPPET_IN_PERIL)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and player:getCurrentMission(TOAU) == tpz.mission.id.toau.PUPPET_IN_PERIL then
        player:completeMission(tpz.mission.log_id.TOAU, tpz.mission.id.toau.PUPPET_IN_PERIL)
        player:addMission(tpz.mission.log_id.TOAU, tpz.mission.id.toau.PREVALENCE_OF_PIRATES)
        player:setCharVar("AhtUrganStatus", 0)
    end
end
