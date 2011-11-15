SET @FELREAVER      :=22293; -- Inactive Fel Reaver
SET @Q_FELREAVER    :=10855; -- Quest: Fel Reavers, No Thanks!
SET @Q_NETHERGAS    :=10850; -- Quest: Nether Gas In a Fel Fire Engine

-- revert old custom spell from spell_dbc
UPDATE `quest_template` SET `RewSpellCast`=0 WHERE `entry`=@Q_NETHERGAS;
DELETE FROM `spell_dbc` WHERE `id`=38758;

-- update wrong value which causes that you can not turn in Quest
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `entry`=@Q_FELREAVER;
-- give Quest Credit by SAI
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@FELREAVER ;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@FELREAVER ;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@FELREAVER ,0,0,0,20,0,100,0,@Q_NETHERGAS,0,0,0,33,@FELREAVER ,0,0,0,0,0,7,0,0,0,0,0,0,0,'Inactive Fel Reaver - On Quest Reward: Fel Reavers, No Thanks! - Give Quest Credit');
