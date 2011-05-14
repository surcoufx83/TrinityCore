-- Fix Quest 'The Dreghood Elders' #10368
SET @Quest      = 10368;
SET @Morod      = 20677;
SET @GMorod     = 8162;    -- gossip_menu_id Morod
SET @Akoru      = 20678;
SET @GAkoru     = 8163;    -- gossip_menu_id Akoru
SET @Aylaan     = 20679;
SET @GAylaan    = 8161;    -- gossip_menu_id Aylaan
-- SAI + Gossip Flag + Quest Requirements
UPDATE `creature_template` SET `AIName`= 'SmartAI', `npcflag` = `npcflag`| 1 WHERE `entry` IN (@Morod,@Akoru,@Aylaan);
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = @Aylaan, `ReqCreatureOrGOId2` = @Morod, `ReqCreatureOrGOId3` = @Akoru, `ReqCreatureOrGOCount1` = 1, `ReqCreatureOrGOCount2` = 1,`ReqCreatureOrGOCount3` = 1 WHERE `entry` = @Quest;
-- gossip_menu
DELETE FROM `gossip_menu` WHERE `entry` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `gossip_menu` VALUES
(8161,10103),
(8162,10104),
(8163,10105);
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id`IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `gossip_menu_option` VALUES
(8161,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,0,''),
(8162,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,0,''),
(8163,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,0,'');
-- Smart AI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Morod,@Akoru,@Aylaan);
INSERT INTO `smart_scripts` VALUES
-- Morod
(@Morod,0,0,1,62,0,100,0,@GMorod,0,0,0,33,@Morod,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - call creature killed'),
(@Morod,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Akoru
(@Akoru,0,0,1,62,0,100,0,@GAkoru,0,0,0,33,@Akoru,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - call creature killed'),
(@Akoru,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Aylaan
(@Aylaan,0,0,1,62,0,100,0,@GAylaan,0,0,0,33,@Aylaan,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - call creature killed'),
(@Aylaan,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip');
-- conditions
DELETE FROM `conditions`WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `conditions`VALUES
(15,8161,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368'),
(15,8162,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368'),
(15,8163,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368');