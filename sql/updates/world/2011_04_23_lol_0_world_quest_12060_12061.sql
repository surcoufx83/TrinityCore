-- ----------------------------------------------
-- Fix Quest 'Projection and Plans' #12060 #12061
-- ----------------------------------------------
-- Projections and Plans Kill Bunny
UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 2, `flags_extra` = 0 WHERE entry = 27853;
-- SAI
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27853;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(27853,0,0,0,10,0,100,0,1,30,1000,1000,11,49731,2,0,0,0,0,7,0,0,0,0,0,0,0,'on LOS - give quest credit');