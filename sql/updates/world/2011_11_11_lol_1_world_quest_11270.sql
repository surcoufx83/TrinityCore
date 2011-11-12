-- Item only usable at creature 24009 and 24010
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=33278;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 0, 33278, 0, 24, 1, 24009, 0, 0, '', NULL), -- creature 24009
(18, 0, 33278, 0, 24, 1, 24010, 0, 0, '', NULL); -- creature 24010 

-- had no spell script for kill credit
DELETE FROM `spell_scripts` WHERE `id`=42793;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUE
(42793, 1, 0, 8, 24009, 0, 0, 0, 0, 0, 0);

-- had wrong KillCredit1 
UPDATE `creature_template` SET `KillCredit1`=24010 WHERE `entry`=24009;
UPDATE `creature_template` SET `KillCredit1`=0 WHERE `entry`=24010;

-- had wrong ReqCreatureOrGOId1 
UPDATE `quest_template` SET `ReqCreatureOrGOId1`=24009 WHERE `entry`=11270;