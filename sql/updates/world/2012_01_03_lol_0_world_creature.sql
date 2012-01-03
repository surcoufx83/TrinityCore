INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES (738741,25453,571,1,1,23941,0,2704.636963,6030.293457,31.513306,4.410034,300,0,0,106000,0,0,0,0,0);
UPDATE `creature_template` SET `faction_A` = 188, `faction_H` = 188 WHERE `entry` = 25453;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES(2000000,25453,6,0,100,0,0,0,0,0,11,45593,0,7,0,0,0,0,0,0,0,0,'Summon Ithrix Chest on Death'); 


