UPDATE `creature` SET `position_x`=2246.921,`position_y`=-99.561,`position_z`=430.341 WHERE `guid`=136606;
UPDATE `creature` SET `position_x`=2403.581,`position_y`=-62.132,`position_z`=434.043 WHERE `guid`=136608;
UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `guid`=136604;
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(136607,33430,603,3,1,19775,0,2322.52, 3.06219,427.529,0.583555,604800,5,0,195495,0,0,1,0,0,0); -- add missing Guardian Lasher
