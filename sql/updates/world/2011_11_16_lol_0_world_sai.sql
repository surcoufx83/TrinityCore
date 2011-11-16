UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=34852;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=34852;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34852,0,0,1,8,0,100,0,66390,0,3000,3000,33,34852,0,0,0,0,0,7,0,0,0,0,0,0,0,'Slain Tualiq Villager - On Read Last Rites Hit - Give Kill Credit'),
(34852,0,1,0,61,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Slain Tualiq Villager - On Read Last Rites Hit - Despawn after 3 secs');