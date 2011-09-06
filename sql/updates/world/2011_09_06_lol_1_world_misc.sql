UPDATE `creature_template` SET `InhabityType`=7,`flags_extra`=`flags_extra`|0x10000000 WHERE `entry`=33687;
UPDATE `creature` SET `spawntimesecs`=180 WHERE `entry`=33687;
