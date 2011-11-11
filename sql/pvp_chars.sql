-- Trainingspuppe für Allies: 32667
--
-- Einführung von PvP.Charakteren
-- Introduction of PvP.Characters
--
--> Trinity WotlK <--
--
-- !This file is UTF-8 encoded! --
--
-- > Diverse Anpassungen am Server Code
-- > Anpasssungen an der Datenbank
--
-- --
-- Variablen
-- --
-- Quest, durch den ein Character zu einem PvP.Char wird
-- 100100
SET @QUEST_TEMPLATE = 30000;
-- Ab hier die neuen creature_template Einträge (Händler, etc)
-- 150.000 -> BG Arena Server
SET @CREA_TEMPLATE = 150200;
-- Ab hier die Spawns
-- 150.000 -> BG Arena Server
SET @CREATURE = 150200;
-- Standard Modell für alle Händler - uebernommen von Arena Tournament -- ist der Gnome Arena Meister
SET @MODEL_VENDOR = 23766;
-- http://de.wowhead.com/npc=4429
SET @HAENDLER_KOSTENLOS_MODEL = 7192;
-- Name/Untergruppe für die speziellen LoL-NPCs
-- Hat ein NPC diese Untergruppe (SubName), dann erhalten die PvP Chars
-- alle Gegenstände kostenlos.
-- Andere Chars dürfen nicht mit diesen Händlern handeln.
SET @LOL_TEAM = 'LoL BG Team';
-- Model von Mei Francis
SET @MODEL_MEI_FRANCIS = 27822;
-- Model Runenkriegsgolem // http://loldb.landoflegends.de/?npc=26347
SET @MODEL_RUNE_GOLEM = 23823;
-- Model Obsidian Golem // // http://loldb.landoflegends.de/?npc=4872
SET @MODEL_OBSIDIAN_GOLEM = 2695;
-- Pilot Vic
SET @MODEL_RIDING_TRAINER = 25671;
SET @MODEL_ALANURA_FEUERWOLKE = 26892;

/*
-- Selbst gemachte Gegenstände
SET @ITEM_TEMPLATE = 220000;
-- Model von Dori Volanthius; S5 Verkäufer
SET @MODEL_HAENDLER_SEASON5 = 22602;
-- Model Arena Kampfmeister (Goblin)
SET @MODEL_BATTLEMASTER = 23766;
*/
--
--
-- NPC Flags
SET @NPCFLAG_REPAIRER = 4096;
SET @NPCFLAG_VENDOR_REAGENT = 2048;
SET @NPCFLAG_VENDOR_POISON = 1024;
SET @NPCFLAG_VENDOR = 128;
SET @NPCFLAG_PROFESSIONTRAINER=64;
SET @NPCFLAG_CLASS_TRAINER = 32;
SET @NPCFLAG_TRAINER = 16;
SET @NPCFLAG_GOSSIP = 1;
SET @NPCFLAG_QUEST_GIVER =2;

-- Neue Creature_Template Einträge
-- Notwendig, damit die PvE Welt komplett unangetastet bleibt
SET @SAVAGE_GLADIATOR = @CREA_TEMPLATE+11;
SET @CT_HUNTER_FOOD_VENDOR = @CREA_TEMPLATE+17;
SET @CT_VENDOR_MISC = @CREA_TEMPLATE+18;
SET @PVPCHAR_QUESTGIVER = @CREA_TEMPLATE+19;
SET @CT_HUNTER_PET_TRAINER = @CREA_TEMPLATE+20;
SET @CT_HUNTER_STABLE_MASTER = @CREA_TEMPLATE+21;
-- Hunter Pets: bis @CREA_TEMPLATE+69
SET @CT_HUNTER_PET = @CREA_TEMPLATE + 22;
SET @CT_RIDING_TRAINER = @CREA_TEMPLATE+70;
SET @CT_MOUNT_VENDOR = @CREA_TEMPLATE+71;
SET @CT_TELEPORTER_MAGE = @CREA_TEMPLATE+72;
SET @CT_ENCHANTMENT_SCROLLS = @CREA_TEMPLATE+73;
SET @CT_ENCHANTMENT_HEADSHOULDER = @CREA_TEMPLATE+74;
SET @CT_VENDOR_GEMS = @CREA_TEMPLATE+75;
SET @CT_VENDOR_METAGEMS = @CREA_TEMPLATE+76;
SET @CT_VENDOR_CONSUMABLES = @CREA_TEMPLATE+77;
SET @CT_VENDOR_PVP_STARTINGGEAR = @CREA_TEMPLATE+78;
SET @CT_CLASS_TRAINER = @CREA_TEMPLATE+100;
SET @CT_WEAPON_MASTER = @CREA_TEMPLATE+111;

-- Spawnen der Creature
SET @CREA_SAVAGE_GLADIATOR_01 = @CREATURE;
SET @CREA_SAVAGE_GLADIATOR_02 = @CREATURE+1;
SET @CREA_PVPCHAR_QUESTGIVER_01 = @CREATURE+2;
SET @CREA_PVPCHAR_QUESTGIVER_02 = @CREATURE+3;
SET @CREA_PVPCHAR_QUESTGIVER_03 = @CREATURE+4;
SET @CREA_PVPCHAR_QUESTGIVER_04 = @CREATURE+5;
SET @CREA_PVPCHAR_QUESTGIVER_05 = @CREATURE+6;
SET @CREA_PVPCHAR_QUESTGIVER_06 = @CREATURE+7;
SET @CREA_PVPCHAR_QUESTGIVER_07 = @CREATURE+8;
SET @CREA_PVPCHAR_QUESTGIVER_08 = @CREATURE+9;
SET @CREA_HUNTER_PET = @CREATURE + 100;


-- Spawn: @CREATURE
-- @CREATURE   -> Savaga Gladiator in SW
-- @CREATURE+1 -> Savaga Gladiator in Org

-- Mit diesem Quest wird ein Character zu einem PvP.Char
-- If a character does this quest it will become a PvP.Char
DELETE FROM `quest_template` WHERE `entry` = @QUEST_TEMPLATE;
INSERT INTO `quest_template` ( `entry`,
 `Title`, `OfferRewardText`,
 `MinLevel`, `ZoneOrSort`, `ReqItemId1`,
 `Type`, `Method`, 
 `Details`,
 `EndText`, `Objectives`,
 `RequiredRaces`, `PrevQuestId`,
 `QuestFlags`,
 `RewSpell`, `RewMoneyMaxLevel`,
 `QuestLevel`,
 `SpecialFlags`,
 `RewXPId`, `MaxLevel`,
 `SkillOrClassMask`,
 `CompleteEmote`,
 `RewItemCount1`, `RewItemId1`  )
 VALUES
 ( @QUEST_TEMPLATE,
 'Ich will ein PvP.Char sein', '',
'1', '0', '0',
'0', '2', 
'Seid gegrüßt,$b$b\nwir suchen dringend Mitstreiter, die unseren Gegnern mal zeigen, was eine Harke ist.$b$bHier könnt Ihr sofort auf die Maximalstufe aufsteigen, aber Ihr dürft nur PvP spielen - sonst nichts.$b$bFalls Ihr dies wollt, so erledigt diese Quest und ich heiße Euch willkommen in der Welt des PvP - aber Vorsicht - NUR PvP.',
'Seid Ihr sicher, dass Ihr NUR PvP spielen wollt?\n\nIhr könnt niemals eine Instanz betreten oder einem Raid beiwohnen!',
'Nur wenn Ihr ganz sicher seid solltet Ihr es tun. Danach könnt Ihr niemals mehr PvE spielen - nur noch PvP in Arena oder BG.',
'1791', '0',
'0',
'0', '4650',
'1',
'0',
'0', '1', 
'0',
'1',
4, 41599 -- 4x Froststofftasche
);
-- Creature, that gives the quest
DELETE FROM `creature_template` WHERE `entry` = @PVPCHAR_QUESTGIVER;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`,
`speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES(@PVPCHAR_QUESTGIVER,@MODEL_RUNE_GOLEM,'0','0','0',
'PvP.Char Questgiver',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_QUEST_GIVER,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','768','8','0','0','0','0','0','315','468','69',
'7','0',
'',
'0','0','0','npc_pvpchars_questgiver');
DELETE FROM `locales_creature` WHERE `entry` = @PVPCHAR_QUESTGIVER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@PVPCHAR_QUESTGIVER,'','','PvP.Char Questgeber','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `creature_questrelation` WHERE `quest` = @QUEST_TEMPLATE;
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QUEST_TEMPLATE;
INSERT INTO `creature_questrelation` ( `quest`, `id` )  VALUES ( @QUEST_TEMPLATE, @PVPCHAR_QUESTGIVER );
INSERT INTO `creature_involvedrelation` ( `quest`, `id` )  VALUES ( @QUEST_TEMPLATE, @PVPCHAR_QUESTGIVER );

DELETE FROM `creature` WHERE `guid` IN (
@CREA_PVPCHAR_QUESTGIVER_01, @CREA_PVPCHAR_QUESTGIVER_02, @CREA_PVPCHAR_QUESTGIVER_03,
@CREA_PVPCHAR_QUESTGIVER_04, @CREA_PVPCHAR_QUESTGIVER_05, @CREA_PVPCHAR_QUESTGIVER_06,
@CREA_PVPCHAR_QUESTGIVER_07, @CREA_PVPCHAR_QUESTGIVER_08);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(@CREA_PVPCHAR_QUESTGIVER_01,@PVPCHAR_QUESTGIVER,'530','1','1','0','0','10322.8','-6363.68','31.0299','0.132424','300','0','0','10080','8814','0','0','0','0'), -- Bloodelf
(@CREA_PVPCHAR_QUESTGIVER_02,@PVPCHAR_QUESTGIVER,'1','1','1','0','0','-573.666','-4253.07','38.1184','3.15805','300','0','0','10080','8814','0','0','0','0'), -- Orc and Troll
(@CREA_PVPCHAR_QUESTGIVER_03,@PVPCHAR_QUESTGIVER,'1','1','1','0','0','-2871.62','-252.444','53.9152','3.37486','300','0','0','10080','8814','0','0','0','0'), -- Tauren
(@CREA_PVPCHAR_QUESTGIVER_04,@PVPCHAR_QUESTGIVER,'0','1','1','0','0','1696.67','1672.82','133.862','4.26567','300','0','0','10080','8814','0','0','0','0'), -- Undead
(@CREA_PVPCHAR_QUESTGIVER_05,@PVPCHAR_QUESTGIVER,'0','1','1','0','0','-6231.92','349.142','384.032','4.8195','300','0','0','10080','8814','0','0','0','0'), -- Dwarf and Gnome
(@CREA_PVPCHAR_QUESTGIVER_06,@PVPCHAR_QUESTGIVER,'0','1','1','0','0','-8896.11','-136.168','80.694','1.20672','300','0','0','10080','8814','0','0','0','0'), -- Human
(@CREA_PVPCHAR_QUESTGIVER_07,@PVPCHAR_QUESTGIVER,'1','1','1','0','0','10334.3','821.644','1326.44','2.20771','300','0','0','10080','8814','0','0','0','0'), -- Night Elf
(@CREA_PVPCHAR_QUESTGIVER_08,@PVPCHAR_QUESTGIVER,'530','1','1','0','0','-3978.52','-13914.1','99.3008','5.25116','300','0','0','10080','8814','0','0','0','0'); -- Draenei


-- The new Vendors // Die neuen Händler
-- Basierend auf:
--   Alanura Feuerwolke -- Neue Gegenstände für den Verkauf
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_MISC;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_MISC,@MODEL_ALANURA_FEUERWOLKE,'0','0','0',
'Miscellaneous',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'EventAI',
'897','0','0','','0');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_MISC;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_MISC,'','','Verschiedenes','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_MISC;

DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_MISC;
INSERT INTO npc_vendor(slot, entry, item)
VALUES
(  0, @CT_VENDOR_MISC, 34722 ), -- Schwerer Froststoffverband, Benötigt Erste Hilfe (400)
(  1, @CT_VENDOR_MISC, 3775 ), -- Verkrüppelndes Gift, Klassen: Schurke, Benötigt Stufe 20
(  2, @CT_VENDOR_MISC, 5237 ), -- Gedankenbenebelndes Gift, Klassen: Schurke, Benötigt Stufe 24
(  3, @CT_VENDOR_MISC, 5565 ), -- Höllenstein
(  4, @CT_VENDOR_MISC, 16583 ), -- Dämonenstatuette
(  5, @CT_VENDOR_MISC, 17020 ), -- Arkanes Pulver
(  6, @CT_VENDOR_MISC, 17030 ), -- Ankh
(  7, @CT_VENDOR_MISC, 17033 ), -- Symbol der Offenbarung
(  8, @CT_VENDOR_MISC, 21177 ), -- Symbol der Könige
(  9, @CT_VENDOR_MISC, 37201 ), -- Leichenstaub
( 10, @CT_VENDOR_MISC, 43231 ), -- Sofort wirkendes Gift IX, Klassen: Schurke, Benötigt Stufe 79
( 11, @CT_VENDOR_MISC, 43233 ), -- Tödliches Gift IX, Klassen: Schurke, Benötigt Stufe 80
( 12, @CT_VENDOR_MISC, 43235 ), -- Wundgift VII, Klassen: Schurke, Benötigt Stufe 78
( 13, @CT_VENDOR_MISC, 43237 ), -- Beruhigendes Gift II, Klassen: Schurke, Benötigt Stufe 77
( 14, @CT_VENDOR_MISC, 44605 ), -- Wildes Wirbelkraut (für Gabe der Wildnis)
( 15, @CT_VENDOR_MISC, 44614 ), -- Sternblattsamen (für Wiedergeburt)
( 16, @CT_VENDOR_MISC, 44615 ), -- Andachtskerze (für Gebet der Seelenstärke, etc)
( 17, @CT_VENDOR_MISC, 43523 ), -- Herbeigezauberter Manastrudel (80), Benötigt Stufe 80
( 18, @CT_VENDOR_MISC, 6265 ), -- Seelensplitter
( 19, @CT_VENDOR_MISC, 17058 ), -- Fischöl
( 20, @CT_VENDOR_MISC, 17056 ), -- Leichte Feder
( 21, @CT_VENDOR_MISC, 35948 ), -- Pikante Schneepflaume, Benötigt Stufe 75
( 22, @CT_VENDOR_MISC, 43236 ), -- Sternentrauer, Benötigt Stufe 75
( 23, @CT_VENDOR_MISC, 41165 ), -- Messerscharfe Saronitpfeile; 200 blau
( 24, @CT_VENDOR_MISC, 41164 ), -- Mammutschneider; 200 blau
-- ( 23, @CT_VENDOR_MISC, 52021 ), -- Eisklingenpfeil; 230 epic
-- ( 24, @CT_VENDOR_MISC, 52020 ), -- Splittermunition; 230 epic
( 25, @CT_VENDOR_MISC, 40359 ), -- Frisches Adlerfleisch, Benötigt Stufe 65
( 26, @CT_VENDOR_MISC, 23162 ), -- Forors Kiste der endlosen Widerstandsausstattung, Beim Aufheben gebunden, 36 Platz Tasche
( 27, @CT_VENDOR_MISC, 44447 ), -- Drachenschuppenmunitionsbeutel, Beim Anlegen gebunden, 28 Platz Munitionsbeutel
( 28, @CT_VENDOR_MISC, 44448 ), -- Verstärkter nerubischer Köcher, Beim Anlegen gebunden, 28 Platz Köcher
( 29, @CT_VENDOR_MISC, 5175 ), -- Erdtotem
( 30, @CT_VENDOR_MISC, 5176 ), -- Feuertotem
( 31, @CT_VENDOR_MISC, 5178 ), -- Lufttotem
( 32, @CT_VENDOR_MISC, 5177 ), -- Wassertotem
( 33, @CT_VENDOR_MISC, 21215 ), -- Graccus hausgemachte Früchtepastete, Beim Aufheben gebunden, Benötigt Stufe 40
( 34, @CT_VENDOR_MISC, 44225 ), -- Reins of the Armored Brown Bear
( 35, @CT_VENDOR_MISC, 44226 ); -- Reins of the Armored Brown Bear

/*
-- Stack auf 200, Preis
 UPDATE item_template SET stackable = 200, buycount = 200, sellprice = 0, buyprice = 0 WHERE entry IN (
43237, 17030, 17020, 43523, 37201, 3775, 43233, 16583, 44615, 17058, 40359, 21215, 34722, 52021,
5565, 43231, 17056, 5237, 35948, 52020, 6265, 43236, 44614, 17033, 21177, 44605, 43235);
UPDATE item_template SET sellprice = 0, buyprice = 0 WHERE entry IN ( 44448, 44447 );
-- Erdtotem
UPDATE item_template SET stackable = 1, buycount = 1, sellprice = 0, buyprice = 0 WHERE entry IN (5175);
*/

-- Reitlehrer -- Basierend auf Pilot Vic // 28746 :: ANFANG
DELETE FROM `creature_template` WHERE `entry` = @CT_RIDING_TRAINER;
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3,
 KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4,
 name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp,
 faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower,
 dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family,
 trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower,
 type, type_flags, lootid, pickpocketloot, skinloot,
 resistance1, resistance2, resistance3, resistance4, resistance5, resistance6,
 spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId,
 VehicleId, mingold, maxgold, AIName, MovementType, InhabitType,
 Health_mod, Mana_mod, Armor_mod, RacialLeader,
 questItem1, questItem2, questItem3, questItem4, questItem5, questItem6,
 movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES
(@CT_RIDING_TRAINER, '0', '0', '0', '0', '0', '15759', '0', '0', '0',
 'Ulf', 'Meister des fliegens', NULL,
'10723', '78', '78', '2',
'189', '189', '209', '1.0', '1.38571',
'1.0', '0', '322.0', '466.0', '0', '236', '1.0', '2000', '0', '8', '32768', '8', '0', '1', '0', 
'0', '0', '296.0', '440.0', '58', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '7', '1.0', '1.0', '1.0', '0', '0', '0', '0',
'0', '0', '0', '0', '1', '0', '0', '128', '', '12340');
/*
(@CT_RIDING_TRAINER,@MODEL_RIDING_TRAINER,'0','0','0',
'Riding Trainer',@LOL_TEAM,'',
'0','80','80','2','35','35',209, -- @NPCFLAG_TRAINER | @NPCFLAG_PROFESSIONTRAINER | @NPCFLAG_GOSSIP,
'1','1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69',
'7','4096',
'',
'897','0','0','','12340');
*/
DELETE FROM `locales_creature` WHERE `entry` = @CT_RIDING_TRAINER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_RIDING_TRAINER,'','','Reitlehrer','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `npc_trainer` WHERE `entry` = @CT_RIDING_TRAINER;
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue)
VALUES
(@CT_RIDING_TRAINER, '33388', '0', '0', '0'), -- Unerfahrenes Reiten
(@CT_RIDING_TRAINER, '33391', '0', '0', '0'), -- Geübtes Reiten
(@CT_RIDING_TRAINER, '34090', '0', '0', '0'), -- Erfahrenes Reiten
(@CT_RIDING_TRAINER, '34091', '0', '0', '0'), -- Gekonntes Reiten
(@CT_RIDING_TRAINER, '54197', '0', '0', '0'); -- Kaltwetterflug
-- (@CT_RIDING_TRAINER, '61229', '0', '0', '0'); -- Gepanzerter weißer Greif
-- (@CT_RIDING_TRAINER, '32296', '0', '0', '0'), -- Schneller gelber Windreiter
--
-- Reitlehrer -- Basierend auf Pilot Vic // 28746 :: ENDE

-- Mounts
DELETE FROM `creature_template` WHERE `entry` = (@CT_MOUNT_VENDOR);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2,
 modelid1, modelid2, modelid3, modelid4, name, subname, IconName,
 gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H,
 npcflag,
 speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier,
 baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family,
 trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_MOUNT_VENDOR, '0', '0', '0', '0', '0',
 '27822', '0', '0', '0', 'Mounts', NULL, NULL,
 '0', '80', '80', '2', '189', '189',
 @NPCFLAG_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,
 '1.0', '1.14286', '1.0', '0', '346.0', '499.0', '0', '287', '1.0',
 '2000', '0', '8', '32768', '8', '0',
 '1', '0', '0', '0', '315.0', '468.0', '69', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '897', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_MOUNT_VENDOR+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_MOUNT_VENDOR, '', '', 'Reittiere', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_vendor` WHERE `entry` = @CT_MOUNT_VENDOR;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES 
(@CT_MOUNT_VENDOR, '25531', '501', '0'), -- Swift Green Wind Rider
(@CT_MOUNT_VENDOR, '18788', '501', '1'), -- Swift Blue Raptor
(@CT_MOUNT_VENDOR, '25533', '501', '2'), -- Swift Purple Wind Rider
(@CT_MOUNT_VENDOR, '18795', '501', '3'), -- Great Gray Kodo
(@CT_MOUNT_VENDOR, '18796', '501', '4'), -- Horn of the Swift Brown Wolf
(@CT_MOUNT_VENDOR, '25477', '501', '5'), -- Swift Red Wind Rider
(@CT_MOUNT_VENDOR, '18797', '501', '6'), -- Horn of the Swift Timber Wolf
(@CT_MOUNT_VENDOR, '44690', '501', '7'), -- Armored Blue Wind Rider
(@CT_MOUNT_VENDOR, '25532', '501', '8'), -- Swift Yellow Wind Rider
(@CT_MOUNT_VENDOR, '18794', '501', '9'), -- Great Brown Kodo
(@CT_MOUNT_VENDOR, '28936', '501', '10'), -- Swift Pink Hawkstrider
(@CT_MOUNT_VENDOR, '29224', '501', '11'), -- Swift Purple Hawkstrider
-- (@CT_MOUNT_VENDOR, '44225', '0', '12'), -- Reins of the Armored Brown Bear
-- (@CT_MOUNT_VENDOR, '44226', '0', '13'), -- Reins of the Armored Brown Bear
(@CT_MOUNT_VENDOR, '18798', '501', '14'), -- Horn of the Swift Gray Wolf
(@CT_MOUNT_VENDOR, '13334', '501', '15'), -- Green Skeletal Warhorse
(@CT_MOUNT_VENDOR, '18791', '501', '16'), -- Purple Skeletal Warhorse
(@CT_MOUNT_VENDOR, '18790', '501', '17'), -- Swift Orange Raptor
(@CT_MOUNT_VENDOR, '18789', '501', '18'), -- Swift Olive Raptor
(@CT_MOUNT_VENDOR, '18766', '501', '19'), -- Reins of the Swift Frostsaber
(@CT_MOUNT_VENDOR, '18767', '501', '20'), -- Reins of the Swift Mistsaber
(@CT_MOUNT_VENDOR, '18902', '501', '21'), -- Reins of the Swift Stormsaber
(@CT_MOUNT_VENDOR, '18786', '501', '22'), -- Swift Brown Ram
(@CT_MOUNT_VENDOR, '18787', '501', '23'), -- Swift Gray Ram
(@CT_MOUNT_VENDOR, '18785', '501', '24'), -- Swift White Ram
(@CT_MOUNT_VENDOR, '18772', '501', '25'), -- Swift Green Mechanostrider
(@CT_MOUNT_VENDOR, '18773', '501', '26'), -- Swift White Mechanostrider
(@CT_MOUNT_VENDOR, '18774', '501', '27'), -- Swift Yellow Mechanostrider
(@CT_MOUNT_VENDOR, '18777', '501', '28'), -- Swift Brown Steed
(@CT_MOUNT_VENDOR, '18776', '501', '29'), -- Swift Palomino
(@CT_MOUNT_VENDOR, '18778', '501', '30'), -- Swift White Steed
(@CT_MOUNT_VENDOR, '29745', '501', '31'), -- Great Blue Elekk
(@CT_MOUNT_VENDOR, '29746', '501', '32'), -- Great Green Elekk
(@CT_MOUNT_VENDOR, '29747', '501', '33'), -- Great Purple Elekk
(@CT_MOUNT_VENDOR, '32858', '501', '34'), -- Reins of the Azure Netherwing Drake
(@CT_MOUNT_VENDOR, '32859', '501', '35'), -- Reins of the Cobalt Netherwing Drake
(@CT_MOUNT_VENDOR, '32857', '501', '36'), -- Reins of the Onyx Netherwing Drake
(@CT_MOUNT_VENDOR, '32860', '501', '37'), -- Reins of the Purple Netherwing Drake
(@CT_MOUNT_VENDOR, '32861', '501', '38'), -- Reins of the Veridian Netherwing Drake
(@CT_MOUNT_VENDOR, '32862', '501', '39'); -- Reins of the Violet Netherwing Drake
DELETE FROM `npc_trainer` WHERE `entry` = @CT_MOUNT_VENDOR;
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue)
VALUES
(@CT_MOUNT_VENDOR, '33388', '0', '0', '0'), -- Unerfahrenes Reiten
(@CT_MOUNT_VENDOR, '33391', '0', '0', '0'), -- Geübtes Reiten
(@CT_MOUNT_VENDOR, '34090', '0', '0', '0'), -- Erfahrenes Reiten
(@CT_MOUNT_VENDOR, '34091', '0', '0', '0'), -- Gekonntes Reiten
(@CT_MOUNT_VENDOR, '54197', '0', '0', '0'); -- Kaltwetterflug


-- Savage Gladiator // Grausamer Gladiator -- Item Level 200 Blau
-- Komplett
DELETE FROM `creature_template` WHERE `entry` = @SAVAGE_GLADIATOR;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@SAVAGE_GLADIATOR,@MODEL_OBSIDIAN_GOLEM,'0','0','0',
'Savage Gladiator Complete',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @SAVAGE_GLADIATOR;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@SAVAGE_GLADIATOR,'','','Grausamer Gladiator Alles','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @SAVAGE_GLADIATOR;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`)
VALUES
(@SAVAGE_GLADIATOR,'0','40778'),
(@SAVAGE_GLADIATOR,'0','40779'), (@SAVAGE_GLADIATOR,'0','40780'), (@SAVAGE_GLADIATOR,'0','40797'), 
(@SAVAGE_GLADIATOR,'0','40798'), (@SAVAGE_GLADIATOR,'0','40799'), (@SAVAGE_GLADIATOR,'0','40816'), 
(@SAVAGE_GLADIATOR,'0','40817'), (@SAVAGE_GLADIATOR,'0','40818'), (@SAVAGE_GLADIATOR,'0','40836'), 
(@SAVAGE_GLADIATOR,'0','40837'), (@SAVAGE_GLADIATOR,'0','40838'), (@SAVAGE_GLADIATOR,'0','40856'), 
(@SAVAGE_GLADIATOR,'0','40857'), (@SAVAGE_GLADIATOR,'0','40858'), (@SAVAGE_GLADIATOR,'0','40898'), 
(@SAVAGE_GLADIATOR,'0','40918'), (@SAVAGE_GLADIATOR,'0','40930'), (@SAVAGE_GLADIATOR,'0','40936'), 
(@SAVAGE_GLADIATOR,'0','40960'), (@SAVAGE_GLADIATOR,'0','40986'), (@SAVAGE_GLADIATOR,'0','40987'), 
(@SAVAGE_GLADIATOR,'0','40998'), (@SAVAGE_GLADIATOR,'0','41004'), (@SAVAGE_GLADIATOR,'0','41010'), 
(@SAVAGE_GLADIATOR,'0','41016'), (@SAVAGE_GLADIATOR,'0','41023'), (@SAVAGE_GLADIATOR,'0','41024'), 
(@SAVAGE_GLADIATOR,'0','41030'), (@SAVAGE_GLADIATOR,'0','41041'), (@SAVAGE_GLADIATOR,'0','41078'), 
(@SAVAGE_GLADIATOR,'0','41084'), (@SAVAGE_GLADIATOR,'0','41134'), (@SAVAGE_GLADIATOR,'0','41140'), 
(@SAVAGE_GLADIATOR,'0','41148'), (@SAVAGE_GLADIATOR,'0','41154'), (@SAVAGE_GLADIATOR,'0','41160'), 
(@SAVAGE_GLADIATOR,'0','41202'), (@SAVAGE_GLADIATOR,'0','41208'), (@SAVAGE_GLADIATOR,'0','41214'), 
(@SAVAGE_GLADIATOR,'0','41268'), (@SAVAGE_GLADIATOR,'0','41269'), (@SAVAGE_GLADIATOR,'0','41270'), 
(@SAVAGE_GLADIATOR,'0','41271'), (@SAVAGE_GLADIATOR,'0','41272'), (@SAVAGE_GLADIATOR,'0','41278'), 
(@SAVAGE_GLADIATOR,'0','41290'), (@SAVAGE_GLADIATOR,'0','41301'), (@SAVAGE_GLADIATOR,'0','41313'), 
(@SAVAGE_GLADIATOR,'0','41324'), (@SAVAGE_GLADIATOR,'0','41643'), (@SAVAGE_GLADIATOR,'0','41644'), 
(@SAVAGE_GLADIATOR,'0','41645'), (@SAVAGE_GLADIATOR,'0','41646'), (@SAVAGE_GLADIATOR,'0','41647'), 
(@SAVAGE_GLADIATOR,'0','41658'), (@SAVAGE_GLADIATOR,'0','41664'), (@SAVAGE_GLADIATOR,'0','41675'), 
(@SAVAGE_GLADIATOR,'0','41712'), (@SAVAGE_GLADIATOR,'0','41770'), (@SAVAGE_GLADIATOR,'0','41847'), 
(@SAVAGE_GLADIATOR,'0','41848'), (@SAVAGE_GLADIATOR,'0','41849'), (@SAVAGE_GLADIATOR,'0','41850'), 
(@SAVAGE_GLADIATOR,'0','41851'), (@SAVAGE_GLADIATOR,'0','41912'), (@SAVAGE_GLADIATOR,'0','41918'), 
(@SAVAGE_GLADIATOR,'0','41924'), (@SAVAGE_GLADIATOR,'0','41930'), (@SAVAGE_GLADIATOR,'0','41937'), 
(@SAVAGE_GLADIATOR,'0','41943'), (@SAVAGE_GLADIATOR,'0','41949'), (@SAVAGE_GLADIATOR,'0','41956'), 
(@SAVAGE_GLADIATOR,'0','41962'), (@SAVAGE_GLADIATOR,'0','41968'), (@SAVAGE_GLADIATOR,'0','41990'), 
(@SAVAGE_GLADIATOR,'0','41996'), (@SAVAGE_GLADIATOR,'0','42002'), (@SAVAGE_GLADIATOR,'0','42008'), 
(@SAVAGE_GLADIATOR,'0','42014'), (@SAVAGE_GLADIATOR,'0','42206'), (@SAVAGE_GLADIATOR,'0','42212'), 
(@SAVAGE_GLADIATOR,'0','42213'), (@SAVAGE_GLADIATOR,'0','42214'), (@SAVAGE_GLADIATOR,'0','42215'), 
(@SAVAGE_GLADIATOR,'0','42216'), (@SAVAGE_GLADIATOR,'0','42217'), (@SAVAGE_GLADIATOR,'0','42218'), 
(@SAVAGE_GLADIATOR,'0','42219'), (@SAVAGE_GLADIATOR,'0','42221'), (@SAVAGE_GLADIATOR,'0','42222'), 
(@SAVAGE_GLADIATOR,'0','42224'), (@SAVAGE_GLADIATOR,'0','42294'), (@SAVAGE_GLADIATOR,'0','42295'), 
(@SAVAGE_GLADIATOR,'0','42296'), (@SAVAGE_GLADIATOR,'0','42297'), (@SAVAGE_GLADIATOR,'0','42343'), 
(@SAVAGE_GLADIATOR,'0','42344'), (@SAVAGE_GLADIATOR,'0','42356'), (@SAVAGE_GLADIATOR,'0','42382'), 
(@SAVAGE_GLADIATOR,'0','42388'), (@SAVAGE_GLADIATOR,'0','42444'), (@SAVAGE_GLADIATOR,'0','42445'), 
(@SAVAGE_GLADIATOR,'0','42446'), (@SAVAGE_GLADIATOR,'0','42447'), (@SAVAGE_GLADIATOR,'0','42448'), 
(@SAVAGE_GLADIATOR,'0','42511'), (@SAVAGE_GLADIATOR,'0','42517'), (@SAVAGE_GLADIATOR,'0','42523'), 
(@SAVAGE_GLADIATOR,'0','42529'), (@SAVAGE_GLADIATOR,'0','42535'), (@SAVAGE_GLADIATOR,'0','42556'), 
(@SAVAGE_GLADIATOR,'0','42557'), (@SAVAGE_GLADIATOR,'0','42568'), (@SAVAGE_GLADIATOR,'0','42574'), 
(@SAVAGE_GLADIATOR,'0','42575'), (@SAVAGE_GLADIATOR,'0','42576'), (@SAVAGE_GLADIATOR,'0','42593'), 
(@SAVAGE_GLADIATOR,'0','42594'), (@SAVAGE_GLADIATOR,'0','42595'), (@SAVAGE_GLADIATOR,'0','42611'), 
(@SAVAGE_GLADIATOR,'0','42612'), (@SAVAGE_GLADIATOR,'0','42618'), (@SAVAGE_GLADIATOR,'0','44415'), 
(@SAVAGE_GLADIATOR,'0','44416');
-- Spawn in Stormwind and Orgrimmar
DELETE FROM creature WHERE `guid` IN (@CREA_SAVAGE_GLADIATOR_01, @CREA_SAVAGE_GLADIATOR_02);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES(@CREA_SAVAGE_GLADIATOR_01,@SAVAGE_GLADIATOR,'0','1','1','2695','0','-8848.71','632.012','95.2406','0.233699','300','0','0','10080','8814','0','0','0','0');
-- INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES(@CREA_SAVAGE_GLADIATOR_02,@SAVAGE_GLADIATOR,'1','1','1','2695','0','1666.13','-4367.97','27.3497','3.48948','300','0','0','10080','8814','0','0','0','0');
-- Spawn in Orgrimmar/Ragefire
-- Spawn in Stormwind/Stockade
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
VALUES(@CREA_SAVAGE_GLADIATOR_01,@SAVAGE_GLADIATOR,'34','1','2','0','0','84.954','28.6151','-26.5279','4.81247','300','0','0','10080','8814','0','0','0','0');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_SAVAGE_GLADIATOR_02,@SAVAGE_GLADIATOR,'389','1','2','0','0','-30.6252','-51.5702','-21.5339','1.3057','300','0','0','10080','8814','0','0','0','0');

---
-- Crafted PvP Gear - Item Level 187: START
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_PVP_STARTINGGEAR;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_PVP_STARTINGGEAR,@MODEL_OBSIDIAN_GOLEM,'0','0','0',
'Crafted PvP Gear',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_PVP_STARTINGGEAR;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_PVP_STARTINGGEAR,'','','Selbstgemachte PvP Sachen','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_PVP_STARTINGGEAR;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`) 
VALUES
-- Stoff, Frostgrimmschlachtrüstung :: http://loldb.landoflegends.de/?itemset=819
(@CT_VENDOR_PVP_STARTINGGEAR, '0', '41516'), -- Frostsavage Gloves
(@CT_VENDOR_PVP_STARTINGGEAR, '1', '43969'), -- Frostsavage Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '2', '43970'), -- Frostsavage Boots
(@CT_VENDOR_PVP_STARTINGGEAR, '3', '43971'), -- Frostsavage Cowl
(@CT_VENDOR_PVP_STARTINGGEAR, '4', '43972'), -- Frostsavage Robe
(@CT_VENDOR_PVP_STARTINGGEAR, '5', '43973'), -- Frostsavage Shoulders
(@CT_VENDOR_PVP_STARTINGGEAR, '6', '43974'), -- Frostsavage Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '7', '43975'), -- Frostsavage Leggings
-- Leder, Schlachtrüstung des Ausweiders :: http://loldb.landoflegends.de/?itemset=813
(@CT_VENDOR_PVP_STARTINGGEAR, '8', '43260'), -- Eviscerator''s Facemask
(@CT_VENDOR_PVP_STARTINGGEAR, '9', '43433'), -- Eviscerator''s Shoulderpads
(@CT_VENDOR_PVP_STARTINGGEAR, '10', '43434'), -- Eviscerator''s Chestguard
(@CT_VENDOR_PVP_STARTINGGEAR, '11', '43435'), -- Eviscerator''s Bindings
(@CT_VENDOR_PVP_STARTINGGEAR, '12', '43436'), -- Eviscerator''s Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '13', '43437'), -- Eviscerator''s Waistguard
(@CT_VENDOR_PVP_STARTINGGEAR, '14', '43438'), -- Eviscerator''s Legguards
(@CT_VENDOR_PVP_STARTINGGEAR, '15', '43439'), -- Eviscerator''s Treads
-- Leder, Unwetterschlachtrüstung :: http://loldb.landoflegends.de/?itemset=815
(@CT_VENDOR_PVP_STARTINGGEAR, '16', '43261'), -- Overcast Headguard
(@CT_VENDOR_PVP_STARTINGGEAR, '17', '43262'), -- Overcast Spaulders
(@CT_VENDOR_PVP_STARTINGGEAR, '18', '43263'), -- Overcast Chestguard
(@CT_VENDOR_PVP_STARTINGGEAR, '19', '43264'), -- Overcast Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '20', '43265'), -- Overcast Handwraps
(@CT_VENDOR_PVP_STARTINGGEAR, '21', '43266'), -- Overcast Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '22', '43271'), -- Overcast Leggings
(@CT_VENDOR_PVP_STARTINGGEAR, '23', '43273'), -- Overcast Boots
-- Schwere Rüstung, Sturmbalgschlachtrüstung :: http://loldb.landoflegends.de/?itemset=817
(@CT_VENDOR_PVP_STARTINGGEAR, '24', '43450'), -- Stormhide Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '25', '43451'), -- Stormhide Stompers
(@CT_VENDOR_PVP_STARTINGGEAR, '26', '43452'), -- Stormhide Wristguards
(@CT_VENDOR_PVP_STARTINGGEAR, '27', '43453'), -- Stormhide Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '28', '43454'), -- Stormhide Grips
(@CT_VENDOR_PVP_STARTINGGEAR, '29', '43455'), -- Stormhide Crown
(@CT_VENDOR_PVP_STARTINGGEAR, '30', '43456'), -- Stormhide Legguards
(@CT_VENDOR_PVP_STARTINGGEAR, '31', '43457'), -- Stormhide Shoulders
-- Schwere Rüstung, Flinkpfeilschlachtrüstung :: http://loldb.landoflegends.de/?itemset=818
(@CT_VENDOR_PVP_STARTINGGEAR, '32', '43442'), -- Swiftarrow Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '33', '43443'), -- Swiftarrow Boots
(@CT_VENDOR_PVP_STARTINGGEAR, '34', '43444'), -- Swiftarrow Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '35', '43445'), -- Swiftarrow Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '36', '43446'), -- Swiftarrow Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '37', '43447'), -- Swiftarrow Helm
(@CT_VENDOR_PVP_STARTINGGEAR, '38', '43448'), -- Swiftarrow Leggings
(@CT_VENDOR_PVP_STARTINGGEAR, '39', '43449'), -- Swiftarrow Shoulderguards
-- Platte, Verzierte Saronitschlachtrüstung :: http://loldb.landoflegends.de/?itemset=814
(@CT_VENDOR_PVP_STARTINGGEAR, '40', '42723'), -- Ornate Saronite Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '41', '42724'), -- Ornate Saronite Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '42', '42725'), -- Ornate Saronite Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '43', '42726'), -- Ornate Saronite Legplates
(@CT_VENDOR_PVP_STARTINGGEAR, '44', '42727'), -- Ornate Saronite Pauldrons
(@CT_VENDOR_PVP_STARTINGGEAR, '45', '42728'), -- Ornate Saronite Skullshield
(@CT_VENDOR_PVP_STARTINGGEAR, '46', '42729'), -- Ornate Saronite Waistguard
(@CT_VENDOR_PVP_STARTINGGEAR, '47', '42730'), -- Ornate Saronite Walkers
-- Platte, Wilde Saronitschlachtrüstung :: http://loldb.landoflegends.de/?itemset=816
(@CT_VENDOR_PVP_STARTINGGEAR, '48', '41347'), -- Savage Saronite Legplates
(@CT_VENDOR_PVP_STARTINGGEAR, '49', '41348'), -- Savage Saronite Walkers
(@CT_VENDOR_PVP_STARTINGGEAR, '50', '41349'), -- Savage Saronite Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '51', '41350'), -- Savage Saronite Skullshield
(@CT_VENDOR_PVP_STARTINGGEAR, '52', '41351'), -- Savage Saronite Pauldrons
(@CT_VENDOR_PVP_STARTINGGEAR, '53', '41352'), -- Savage Saronite Waistguard
(@CT_VENDOR_PVP_STARTINGGEAR, '54', '41353'), -- Savage Saronite Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '55', '41354'); -- Savage Saronite Bracers
-- Spawn in Stormwind and Orgrimmar
-- DELETE FROM creature WHERE `guid` IN (@CREA_SAVAGE_GLADIATOR_01, @CREA_SAVAGE_GLADIATOR_02);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES(@CREA_SAVAGE_GLADIATOR_01,@SAVAGE_GLADIATOR,'0','1','1','2695','0','-8848.71','632.012','95.2406','0.233699','300','0','0','10080','8814','0','0','0','0');
-- INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES(@CREA_SAVAGE_GLADIATOR_02,@SAVAGE_GLADIATOR,'1','1','1','2695','0','1666.13','-4367.97','27.3497','3.48948','300','0','0','10080','8814','0','0','0','0');
-- Spawn in Orgrimmar/Ragefire
-- Spawn in Stormwind/Stockade
--INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
--VALUES(@CREA_SAVAGE_GLADIATOR_01,@@CT_VENDOR_PVP_STARTINGGEAR,'34','1','2','0','0','84.954','28.6151','-26.5279','4.81247','300','0','0','10080','8814','0','0','0','0');
--INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
--VALUES(@CREA_SAVAGE_GLADIATOR_02,@SAVAGE_GLADIATOR,'389','1','2','0','0','-30.6252','-51.5702','-21.5339','1.3057','300','0','0','10080','8814','0','0','0','0');
-- Crafted PvP Gear - Item Level 187: END

-- Händler für Fressalien für Hunter Pets: ANFANG
-- Model: Slosh
DELETE FROM `creature_template` WHERE `entry` = @CT_HUNTER_FOOD_VENDOR;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`,
`speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`,
`unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`,
`minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_HUNTER_FOOD_VENDOR,5782,'0','0','0',
'Food and Drink',@LOL_TEAM,NULL,
'0','80','80','2','189','189',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8',
'0','8','0','0',
'0','0','0',
'315','468','69',
'7','4096',
'',
'85','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_HUNTER_FOOD_VENDOR;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_HUNTER_FOOD_VENDOR,'','','Speis & Trank','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_HUNTER_FOOD_VENDOR;
INSERT INTO npc_vendor(entry, item, ExtendedCost, slot)
VALUES
(@CT_HUNTER_FOOD_VENDOR+0, '34722', '0', '0'), -- Heavy Frostweave Bandage
(@CT_HUNTER_FOOD_VENDOR+0, '33445', '0', '1'), -- Honeymint Tea
(@CT_HUNTER_FOOD_VENDOR+0, '35948', '0', '2'), -- Savory Snowplum
(@CT_HUNTER_FOOD_VENDOR+0, '35953', '0', '3'), -- Mead Basted Caribou
(@CT_HUNTER_FOOD_VENDOR+0, '43236', '0', '4'), -- Star's Sorrow
(@CT_HUNTER_FOOD_VENDOR+0, '29453', '0', '5'), -- Sporeggarpilz
(@CT_HUNTER_FOOD_VENDOR+0, '43523', '0', '6'); -- Conjured Mana Strudel
-- Gegenstände kostenlos
-- UPDATE item_template SET buycount = 200, sellprice = 0, buyprice = 0, stackable = 200 WHERE entry IN ( 33445, 35953 );

-- Händler für Fressalien für Hunter Pets: ENDE
-- Model: Slosh

-- Hunter Pet Trainer, basierend auf Creature 10088: ANFANG
-- Model: Xao\'tsu'
DELETE FROM `creature_template` WHERE `entry` = @CT_HUNTER_PET_TRAINER;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`,
`name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`,
`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_HUNTER_PET_TRAINER,'0','0','0','0','0','9336','0','0','0',
'Pet Trainer',@LOL_TEAM,NULL,'4783','40','40','0',
'189','189','19','1.1','1.14286','1','0','56','74','0','136','1','2000','1771','1','512','8','0','3','0','0','0','39','57','14','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1.15','1','1','0','0','0','0','0','0','0','0','1','191','0','2','npc_pet_trainer','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_HUNTER_PET_TRAINER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_HUNTER_PET_TRAINER,'','','Tierausbilder','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
-- Hunter Pet Trainer, basierend auf Creature 10088: ENDE
-- Model: Xao\'tsu'

-- Hunter Stallmeister, basierend auf Creature 28690; Tassia Flüsterschlucht: ANFANG
-- Model: Tassia Flüsterschlucht
DELETE FROM `creature_template` WHERE `entry` = @CT_HUNTER_STABLE_MASTER;
insert into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`,
`name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`,
`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
values(@CT_HUNTER_STABLE_MASTER,'0','0','0','0','0','25607','0','0','0',
'Stable Master',@LOL_TEAM,'','9821','75','75','2',
'189','189','4194305','1','1.14286','1','0','342','485','0','392','1','2000','0','1','32768','8','0','0','0','0','0','295','438','68','7','4096','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_HUNTER_STABLE_MASTER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`,
`subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`, `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_HUNTER_STABLE_MASTER,'','','Stallmeisterin','','','','','',
NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
-- Hunter Stallmeister, basierend auf Creature 28.690; Tassia Flüsterschlucht: ENDE
-- Model: Tassia Flüsterschlucht

--
-- Hunter Pets: ANFANG
--

-- Copy all needed hunter pets
-- This is necessary, since we need to change their faction to "yellow"
-- Young Goretusk 454
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+0);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+0, '0', '0', '0', '0', '0', '8871', '0', '0', '0', 'Young Goretusk', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '48', '1.0', '2000', '0', '1', '0', '8', '5', '0', '0', '0', '0', '12.0', '18.0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '6268', '0', '0', '0', '0', '0', '0', '0', '9088', '0', '0', '0', 'EventAI', '1', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+0, '', '', 'Junger Geiferzahn', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Black Widow Hatchling 930
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+1);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+1, '0', '0', '0', '0', '0', '368', '0', '0', '0', 'Black Widow Hatchling', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '86', '1.0', '2000', '0', '1', '0', '8', '3', '0', '0', '0', '0', '24.0', '36.0', '6', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7367', '744', '0', '0', '0', '0', '0', '0', '10506', '0', '0', '0', 'EventAI', '1', '1', '1.02', '1.0', '1.0', '0', '1130', '7267', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+1);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+1, '', '', 'Junges einer Schwarzen Witwe', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Corrupted Scorpid 3226
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+2);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+2, '0', '0', '0', '0', '0', '2488', '0', '0', '0', 'Corrupted Scorpid', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '44', '1.0', '2000', '0', '1', '0', '8', '20', '0', '0', '0', '0', '9.0', '14.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5413', '0', '0', '0', '0', '0', '0', '0', '8848', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '4886', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+2);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+2, '', '', 'Verderbter Skorpid', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Corrupted Dreadmaw Crocolisk 3231
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+3);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+3, '0', '0', '0', '0', '0', '1034', '0', '0', '0', 'Corrupted Dreadmaw Crocolisk', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '46', '1.0', '2000', '0', '1', '32768', '8', '6', '0', '0', '0', '0', '11.0', '17.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7901', '0', '0', '0', '0', '0', '0', '0', '12928', '0', '0', '0', 'EventAI', '1', '1', '1.0', '1.0', '1.0', '0', '4891', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+3);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+3, '', '', 'Verderbter Schaudermagenkrokilisk', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Savannah Highmane 3243
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+4);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+4, '0', '0', '0', '0', '0', '1973', '0', '0', '0', 'Savannah Highmane', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.42857', '1.0', '0', '5', '5', '0', '48', '1.0', '1500', '0', '1', '0', '8', '2', '0', '0', '0', '0', '12.0', '18.0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13338', '0', '0', '0', '', '1', '1', '1.0', '1.0', '1.0', '0', '4893', '0', '0', '0', '0', '0', '144', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+4);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+4, '', '', 'Savannenhochmähne', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ashenvale Bear 3809
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+5);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+5, '0', '0', '0', '0', '0', '820', '0', '0', '0', 'Ashenvale Bear', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '78', '1.0', '2000', '0', '1', '0', '8', '4', '0', '0', '0', '0', '21.0', '32.0', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5803', '0', '0', '0', '', '1', '1', '1.27', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+5);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+5, '', '', 'Eschentalbär', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bonepaw Hyena 4688
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+6);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+6, '0', '0', '0', '0', '0', '10902', '0', '0', '0', 'Bonepaw Hyena', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '118', '1.0', '2000', '0', '1', '0', '8', '25', '0', '0', '0', '0', '33.0', '49.0', '11', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8280', '0', '0', '0', '', '1', '1', '0.4', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+6);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+6, '', '', 'Skelettpfotenhyäne', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Monstrous Plaguebat 8602
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+7);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+7, '0', '0', '0', '0', '0', '7897', '0', '0', '0', 'Monstrous Plaguebat', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '242', '1.0', '2000', '0', '1', '0', '8', '24', '0', '0', '0', '0', '69.0', '101.0', '25', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8281', '0', '0', '0', '0', '0', '0', '0', '5789', '0', '0', '0', 'EventAI', '1', '3', '1.35', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+7);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+7, '', '', 'Monströse Seuchenfledermaus', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Core Hound 11671
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+8);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+8, '0', '0', '0', '0', '0', '12168', '0', '0', '0', 'Core Hound', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.3', '1.14286', '1.0', '1', '5', '5', '0', '258', '7.5', '2000', '0', '1', '0', '8', '45', '0', '0', '0', '0', '127.0', '188.0', '28', '1', '8', '0', '0', '0', '0', '93', '0', '0', '0', '0', '19771', '19771', '0', '0', '0', '0', '0', '0', '0', '0', '2056', '2689', '', '1', '3', '15.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '164', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+8);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+8, '', '', 'Kernhund', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Vekniss Warrior 15230
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+9);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+9, '0', '0', '0', '0', '0', '15334', '0', '0', '0', 'Vekniss Warrior', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.6', '1.14286', '1.0', '1', '5', '5', '0', '258', '7.5', '2000', '0', '1', '64', '8', '41', '0', '0', '0', '0', '127.0', '188.0', '28', '1', '65545', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '16.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '167', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+9);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+9, '', '', 'Krieger der Vekniss', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Feral Dragonhawk Hatchling 15649
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+10);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+10, '0', '0', '0', '0', '0', '17547', '0', '0', '0', 'Feral Dragonhawk Hatchling', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '0.85714', '1.0', '0', '5', '5', '0', '29', '1.0', '2000', '0', '2', '0', '8', '30', '0', '0', '0', '0', '4.0', '6.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10481', '29117', '0', '0', '0', '0', '0', '0', '0', '10481', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '100', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+10);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+10, '', '', 'Wildes Drachenfalkenjunges', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Razorfang Hatchling 16932
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+11);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+11, '0', '0', '0', '0', '0', '19844', '0', '0', '0', 'Razorfang Hatchling', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '252', '1.0', '2000', '0', '1', '0', '8', '31', '0', '0', '0', '0', '72.0', '106.0', '26', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '33781', '0', '0', '0', '0', '0', '0', '0', '11567', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+11);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+11, '', '', 'Messerklauenjungtier', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Shattered Hand Warhound 17280
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+12);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+12, '18059', '0', '0', '0', '0', '14334', '0', '0', '0', 'Shattered Hand Warhound', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.38571', '1.0', '0', '5', '5', '0', '248', '4.6', '1500', '0', '1', '0', '8', '1', '0', '0', '0', '0', '70.0', '103.0', '25', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '30639', '30636', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+12);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+12, '', '', 'Kriegshund der Zerschmetterten Hand', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blue Flutterer 17349
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+13);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+13, '0', '0', '0', '0', '0', '17709', '0', '0', '0', 'Blue Flutterer', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '44', '1.0', '2000', '0', '1', '0', '8', '37', '0', '0', '0', '0', '9.0', '14.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '36332', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+13);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+13, '', '', 'Blauer Falter', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- The Kurken 17447
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+14);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+14, '0', '0', '0', '0', '0', '17028', '0', '0', '0', 'The Kurken', NULL, NULL, '0', '80', '80', '0', '189', '189', '2', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '46', '1.0', '2000', '0', '1', '32768', '8', '45', '0', '0', '0', '0', '11.0', '17.0', '0', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13', '22', '', '1', '3', '1.0', '1.0', '1.0', '0', '23860', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+14);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+14, '', '', 'Kurken', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Zarakh 17683
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+15);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+15, '0', '0', '0', '0', '0', '17180', '0', '0', '0', 'Zarakh', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '68', '1.0', '1000', '0', '1', '0', '8', '3', '0', '0', '0', '0', '19.0', '27.0', '3', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13118', '0', '0', '0', '', '1', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+15);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+15, '', '', 'Zarakh', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Sporebat 18128
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+16);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+16, '0', '0', '0', '0', '0', '17751', '0', '0', '0', 'Sporebat', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '0.95238', '1.0', '0', '5', '5', '0', '262', '1.0', '2000', '0', '1', '0', '8', '33', '0', '0', '0', '0', '139.0', '207.0', '30', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '35394', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '24426', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+16);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+16, '', '', 'Sporensegler', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Crusty 18241
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+17);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+17, '0', '0', '0', '0', '0', '17625', '0', '0', '0', 'Crusty', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.02', '1.14286', '1.0', '4', '5', '5', '0', '108', '1.0', '1800', '0', '1', '0', '8', '8', '0', '0', '0', '0', '31.0', '46.0', '10', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13024', '0', '40', '205', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+17);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+17, '', '', 'Krusti', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blacksting 18283
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+18);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+18, '0', '0', '0', '0', '0', '18724', '0', '0', '0', 'Blacksting', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '262', '1.0', '2000', '0', '1', '0', '8', '44', '0', '0', '0', '0', '139.0', '207.0', '30', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '35331', '17170', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '24372', '25448', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+18);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+18, '', '', 'Schwarzsichel', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blackfang Tarantula 18983
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+19);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+19, '22162', '0', '0', '0', '0', '1104', '0', '0', '0', 'Blackfang Tarantula', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '292', '4.6', '2000', '1650', '1', '0', '8', '3', '0', '0', '0', '0', '195.0', '289.0', '41', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '34365', '0', '0', '0', '0', '0', '0', '0', '13167', '0', '0', '0', 'EventAI', '1', '1', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+19);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+19, '', '', 'Schwarzfangtarantel', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Coilskar Cobra 19784
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+20);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+20, '0', '0', '0', '0', '0', '14559', '0', '0', '0', 'Coilskar Cobra', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '292', '1.0', '2000', '0', '1', '32768', '8', '35', '0', '0', '0', '0', '195.0', '289.0', '41', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '38030', '0', '0', '0', '0', '0', '0', '0', '10530', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+20);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+20, '', '', 'Kobra der Echsennarbe', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bloodthirsty Marshfang 20196
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+21);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+21, '0', '0', '0', '0', '0', '19405', '0', '0', '0', 'Bloodthirsty Marshfang', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '246', '1.0', '2000', '0', '2', '0', '8', '34', '0', '0', '0', '0', '129.0', '191.0', '26', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12889', '0', '0', '0', 'EventAI', '1', '3', '1.0', '0.5', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+21);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+21, '', '', 'Blutdurstiger Marschenfänger', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bladespire Ravager 20729
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+22);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+22, '0', '0', '0', '0', '0', '20093', '0', '0', '0', 'Bladespire Ravager', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.48', '1.14286', '1.0', '1', '5', '5', '0', '288', '4.6', '2000', '0', '1', '32832', '8', '11', '0', '0', '0', '0', '186.0', '276.0', '39', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '16128', '22911', '0', '0', '0', '0', '0', '0', '13231', '0', '0', '0', '', '1', '1', '3.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+22);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+22, '', '', 'Verheerer der Speerspießer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Tyrantus 20931
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+23);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+23, '0', '0', '0', '0', '0', '5238', '0', '0', '0', 'Tyrantus', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '308', '1.0', '1400', '1900', '1', '0', '8', '39', '0', '0', '0', '0', '262.0', '389.0', '48', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '36629', '35321', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.3', '1.0', '1.0', '0', '32666', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+23);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+23, '', '', 'Tyrantus', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Nuramoc 20932
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+24);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+24, '0', '0', '0', '0', '0', '19913', '0', '0', '0', 'Nuramoc', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.78', '1.14286', '1.0', '2', '5', '5', '0', '304', '4.6', '1400', '0', '1', '0', '8', '38', '0', '0', '0', '0', '215.0', '320.0', '44', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '2.0', '4.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+24);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+24, '', '', 'Nuramoc', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Dire Raven 21042
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+25);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+25, '0', '0', '0', '0', '0', '20013', '0', '0', '0', 'Dire Raven', '', NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '292', '1.0', '2000', '0', '1', '0', '8', '7', '0', '0', '0', '0', '195.0', '289.0', '41', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '31273', '0', '0', '0', '0', '0', '0', '0', '12668', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '147', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+25);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+25, '', '', 'Terrorrabe', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Spawn of Uvuros 21108
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+26);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+26, '0', '0', '0', '0', '0', '20521', '0', '0', '0', 'Spawn of Uvuros', NULL, NULL, '0', '80', '80', '1', '189', '189', '2', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '298', '1.0', '2000', '0', '1', '32768', '8', '45', '0', '0', '0', '0', '206.0', '302.0', '43', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '36405', '36406', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+26);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+26, '', '', 'Brut von Uvuros', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Felboar 21878
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+27);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+27, '0', '0', '0', '21978', '0', '19249', '0', '0', '0', 'Felboar', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.19048', '1.0', '0', '5', '5', '0', '292', '1.0', '2000', '0', '1', '0', '8', '0', '0', '0', '0', '0', '195.0', '289.0', '41', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '32502', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+27);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+27, '', '', 'Teufelseber', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Lost Torranche 22807
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+28);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+28, '0', '0', '0', '0', '0', '21087', '0', '0', '0', 'Lost Torranche', '', NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '304', '1.0', '2000', '0', '1', '0', '8', '12', '0', '0', '0', '0', '215.0', '320.0', '44', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11669', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '184', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+28);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+28, '', '', 'Verirrter Torranche', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blackwind Warp Chaser 23219
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+29);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+29, '0', '0', '0', '0', '0', '19998', '0', '0', '0', 'Blackwind Warp Chaser', '', NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '304', '1.0', '2000', '0', '1', '0', '8', '32', '0', '0', '0', '0', '215.0', '320.0', '44', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '32920', '32739', '32942', '37417', '0', '0', '0', '0', '12933', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+29);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+29, '', '', 'Schattenwindhetzer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Goreclaw the Ravenous 23873
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+30);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+30, '0', '0', '0', '0', '0', '21825', '0', '0', '0', 'Goreclaw the Ravenous', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.6', '1.14286', '1.0', '0', '5', '5', '0', '132', '1.0', '2000', '0', '1', '0', '8', '11', '0', '0', '0', '0', '37.0', '55.0', '13', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13236', '0', '0', '0', '', '1', '3', '1.5', '1.0', '1.0', '0', '33085', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+30);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+30, '', '', 'Schlächterklaue der Gefräßige', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bloodthirsty Worg 24475
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+31);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+31, '0', '0', '0', '0', '0', '22088', '0', '0', '0', 'Bloodthirsty Worg', '', '', '0', '80', '80', '2', '189', '189', '0', '1.2', '1.0', '1.0', '0', '5', '5', '0', '298', '1.0', '2000', '0', '1', '32768', '8', '1', '0', '0', '0', '0', '206.0', '302.0', '43', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13468', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+31);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+31, '', '', 'Blutdurstiger Worg', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Wooly Rhino Calf 25488
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+32);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+32, '0', '0', '0', '0', '0', '26296', '0', '0', '0', 'Wooly Rhino Calf', '', '', '0', '80', '80', '1', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '288', '1.0', '3000', '0', '1', '32768', '8', '43', '0', '0', '0', '0', '186.0', '276.0', '39', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+32);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+32, '', '', 'Wollhornkalb', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ice Heart Jormungar Spawn 26359
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+33);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+33, '0', '0', '0', '0', '0', '24862', '0', '0', '0', 'Ice Heart Jormungar Spawn', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '314', '1.0', '2000', '0', '1', '32768', '8', '42', '0', '0', '0', '0', '270.0', '401.0', '53', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '0.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+33);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+33, '', '', 'Eiskernjormungarbrut', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ice Serpent 26446
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+34);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+34, '0', '0', '0', '0', '0', '16901', '0', '0', '0', 'Ice Serpent', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '302', '1.0', '2000', '0', '2', '0', '8', '27', '0', '0', '0', '0', '276.0', '411.0', '44', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11586', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '35798', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+34);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+34, '', '', 'Eisschlange', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Darkweb Recluse 26625
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+35);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+35, '31336', '0', '0', '0', '0', '16462', '0', '0', '0', 'Darkweb Recluse', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.28571', '1.0', '1', '5', '5', '0', '354', '7.5', '2400', '0', '1', '64', '8', '3', '0', '0', '0', '0', '287.0', '426.0', '63', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13148', '0', '0', '0', '', '0', '3', '4.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+35);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+35, '', '', 'Dunkelnetzeinsiedler', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Hardknuckle Charger 28096
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+36);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+36, '0', '0', '0', '0', '0', '809', '0', '0', '0', 'Hardknuckle Charger', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '478', '1.0', '2000', '0', '1', '32768', '8', '9', '0', '0', '0', '0', '314.0', '466.0', '81', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '38642', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_rejek_first_blood', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+36);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+36, '', '', 'Hartknöchelstürmer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Vargul Blighthound 29452
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+37);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+37, '0', '0', '0', '0', '0', '25785', '0', '0', '0', 'Vargul Blighthound', '', '', '0', '80', '80', '2', '189', '189', '0', '1.6', '1.42857', '1.0', '0', '5', '5', '0', '392', '1.0', '2000', '0', '1', '32768', '8', '1', '0', '0', '0', '0', '295.0', '438.0', '68', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '150', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+37);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+37, '', '', 'Pesthund der Vargul', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ravenous Jormungar 30291
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+38);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+38, '0', '0', '0', '29605', '0', '26262', '0', '0', '0', 'Ravenous Jormungar', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '642', '1.0', '2000', '0', '1', '0', '8', '42', '0', '0', '0', '0', '345.0', '509.0', '103', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '42927', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+38);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+38, '', '', 'Gefräßiger Jormungar', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Aotona 32481
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+39);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+39, '0', '0', '0', '0', '0', '27975', '0', '0', '0', 'Aotona', '', '', '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '24', '7.5', '2000', '0', '1', '0', '8', '26', '0', '0', '0', '0', '1.0', '1.0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+39);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+39, '', '', 'Aotona', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Loque'nahak 32517
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+40);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+40, '0', '0', '0', '0', '0', '28010', '0', '0', '0', 'Loque''nahak', 'Mate of Har''koa', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '432', '4.6', '2000', '0', '1', '0', '8', '46', '0', '0', '0', '0', '305.0', '452.0', '74', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+40);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+40, '', '', 'Loque''nahak', '', '', '', '', '', NULL, NULL, 'Gefährte der Har''koa', NULL, NULL, NULL, NULL, NULL);
-- Lake Snapper 33710
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+41);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+41, '0', '0', '0', '0', '0', '28819', '0', '0', '0', 'Lake Snapper', '', '', '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '38', '1.0', '2000', '0', '1', '0', '8', '21', '0', '0', '0', '0', '7.0', '10.0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+41);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+41, '', '', 'Seeschnapper', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Gondria 33776
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+42);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+42, '0', '0', '0', '0', '0', '28871', '0', '0', '0', 'Gondria', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '478', '15.0', '2000', '0', '1', '0', '8', '46', '0', '0', '0', '0', '314.0', '466.0', '81', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+42);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+42, '', '', 'Gondria', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Skoll 35189
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+43);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+43, '0', '0', '0', '0', '0', '29673', '0', '0', '0', 'Skoll', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '642', '7.5', '1500', '0', '1', '0', '8', '46', '0', '0', '0', '0', '345.0', '509.0', '103', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+43);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+43, '', '', 'Skoll', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Arcturis 38453
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+44);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+44, '0', '0', '0', '0', '0', '31094', '0', '0', '0', 'Arcturis', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '354', '7.5', '2000', '0', '1', '0', '8', '46', '0', '0', '0', '0', '287.0', '426.0', '63', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+44);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+44, '', '', 'Arcturis', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+11;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+11) * 100) +0, @CT_HUNTER_PET+11, '0', '0', '100', '1', '6000', '6000', '10000', '10000', '11', '33781', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Razorfang Hatchling - Cast Ravage');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+42;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+42) * 100) +0, @CT_HUNTER_PET+42, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '61184', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Gondria - Casts Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+9;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+9) * 100) +0, @CT_HUNTER_PET+9, '6', '0', '100', '2', '0', '0', '0', '0', '11', '6122', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', 'Vekniss Warrior - Cast on Death Summon Vekniss Borer');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+37;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+37) * 100) +0, @CT_HUNTER_PET+37, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '50046', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Vargul Blighthound - Casts Gnaw Bone');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+18;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+18) * 100) +0, @CT_HUNTER_PET+18, '0', '0', '75', '1', '1000', '1000', '15000', '15000', '11', '35331', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blacksting - Cast Black Blood');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+39;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+39) * 100) +0, @CT_HUNTER_PET+39, '0', '0', '100', '1', '3000', '6000', '12000', '15000', '11', '49865', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Aotona - Cast Eye Peck');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+39;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+39) * 100) +1, @CT_HUNTER_PET+39, '0', '0', '100', '1', '9000', '13000', '10000', '15000', '11', '51144', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Aotona - Cast Wing Buffet');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+16;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+16) * 100) +0, @CT_HUNTER_PET+16, '6', '0', '75', '0', '0', '0', '0', '0', '11', '35336', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', 'Spore Bat - Cast Energizing Spores on Death');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+16;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+16) * 100) +1, @CT_HUNTER_PET+16, '0', '0', '100', '1', '1000', '1000', '15000', '15000', '11', '35394', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Spore Bat - Cast Spore Cloud');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+21;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+21) * 100) +0, @CT_HUNTER_PET+21, '0', '0', '75', '1', '1000', '1000', '10000', '10000', '11', '17008', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodthirsty Marshfang - Cast Drain Mana');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+0;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+0) * 100) +0, @CT_HUNTER_PET+0, '9', '0', '50', '0', '6', '15', '500', '1000', '11', '6268', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Young Goretusk - Cast Rushing Charge');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+12;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+12) * 100) +0, @CT_HUNTER_PET+12, '11', '0', '100', '0', '0', '0', '0', '0', '11', '18950', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Shattered Hand Warhound - Invisibility and Stealth Detection');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+12;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+12) * 100) +1, @CT_HUNTER_PET+12, '0', '0', '100', '7', '1000', '2300', '13100', '17400', '11', '30636', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Shattered Hand Warhound - Cast Furious Howl');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+12;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+12) * 100) +2, @CT_HUNTER_PET+12, '0', '0', '100', '7', '2300', '8600', '4600', '14300', '11', '30639', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Shattered Hand Warhound - Cast Carnivorous Bite');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+24;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+24) * 100) +0, @CT_HUNTER_PET+24, '0', '0', '100', '1', '2000', '5000', '2500', '7500', '11', '15797', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Nuramoc - Casts Lightning Breath');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+24;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+24) * 100) +1, @CT_HUNTER_PET+24, '0', '0', '100', '1', '7000', '10000', '7500', '12500', '11', '21971', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Nuramoc - Casts Poison Bolt');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+24;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+24) * 100) +2, @CT_HUNTER_PET+24, '0', '0', '100', '1', '12000', '15000', '12500', '17500', '11', '38905', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Nuramoc - Casts Prismatic Shield');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+44;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+44) * 100) +0, @CT_HUNTER_PET+44, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '61184', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Arcturis - Casts Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+34;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+34) * 100) +0, @CT_HUNTER_PET+34, '9', '0', '100', '1', '0', '5', '5000', '7000', '11', '51878', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ice Serpent - Cast Ice Slash');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+28;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+28) * 100) +0, @CT_HUNTER_PET+28, '2', '0', '100', '0', '15', '0', '0', '0', '25', '0', '0', '0', '1', '-47', '0', '0', '0', '0', '0', '0', 'Lost Torranche - Flee at 15% HP');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+40;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+40) * 100) +0, @CT_HUNTER_PET+40, '0', '0', '100', '1', '0', '0', '12000', '15000', '11', '61184', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Loque''nahak - Cast Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+43;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+43) * 100) +0, @CT_HUNTER_PET+43, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '61184', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Skoll - Casts Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+1;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+1) * 100) +0, @CT_HUNTER_PET+1, '0', '0', '100', '1', '3200', '13400', '8300', '14100', '11', '7367', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Black Widow Hatchling - Cast Infected Bite');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+1;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+1) * 100) +1, @CT_HUNTER_PET+1, '0', '0', '100', '1', '9800', '19900', '6500', '26000', '11', '744', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Black Widow Hatchling - Cast Poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+2;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+2) * 100) +0, @CT_HUNTER_PET+2, '0', '0', '100', '1', '3000', '6000', '30000', '35000', '11', '5413', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'c - Cast Noxious Catalyst');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+2;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+2) * 100) +1, @CT_HUNTER_PET+2, '0', '0', '100', '1', '8000', '10000', '8000', '12000', '11', '11918', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Corrupted Scorpid - Cast Poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+33;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+33) * 100) +0, @CT_HUNTER_PET+33, '9', '0', '100', '1', '0', '5', '10000', '15000', '11', '43358', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ice Heart Jormungar Spawn - Cast Gut Rip');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+27;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+27) * 100) +0, @CT_HUNTER_PET+27, '0', '0', '100', '1', '100', '100', '30000', '55000', '11', '35570', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Felboar - Cast Charge');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +0, @CT_HUNTER_PET+29, '11', '0', '100', '0', '0', '0', '0', '0', '11', '32942', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Phasing Invisibility On Spawn');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +1, @CT_HUNTER_PET+29, '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '32942', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Remove Phasing Invisibility On Aggro');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +2, @CT_HUNTER_PET+29, '0', '0', '100', '1', '3000', '6000', '4000', '7000', '11', '32739', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Venomous Bite');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +3, @CT_HUNTER_PET+29, '0', '0', '100', '1', '12000', '15000', '20000', '40000', '11', '32920', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Warp');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +4, @CT_HUNTER_PET+29, '0', '0', '100', '1', '2000', '5000', '7000', '15000', '11', '37417', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Warp Charge');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +5, @CT_HUNTER_PET+29, '7', '0', '100', '0', '0', '0', '0', '0', '11', '32942', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Recast Phasing Invisibility when evading');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+31;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+31) * 100) +0, @CT_HUNTER_PET+31, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '7367', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodthirsty Worg - Casts Infected Bite');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+19;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+19) * 100) +0, @CT_HUNTER_PET+19, '0', '0', '100', '7', '1400', '3000', '29800', '30200', '11', '34366', '4', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackfang Tarantula - Cast Ebon Poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+7;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+7) * 100) +0, @CT_HUNTER_PET+7, '0', '0', '100', '1', '4000', '7000', '16000', '19000', '11', '64140', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Monstrous Plaguebat - Cast Sonic Burst');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+3;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+3) * 100) +0, @CT_HUNTER_PET+3, '0', '0', '100', '1', '1000', '4000', '6000', '12000', '11', '7901', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Corrupted Dreadmaw Crocolisk - Cast Decayed Agility');

SET @PHASEMASK = 2;
-- Spawnen nach Düsterbruch, Das Konservatorium
DELETE FROM `creature` WHERE `id` BETWEEN @CT_HUNTER_PET AND (@CT_HUNTER_PET+45);
DELETE FROM `creature` WHERE `guid` BETWEEN @CREA_HUNTER_PET AND (@CREA_HUNTER_PET+60);
-- Young Goretusk
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`,
 `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`,
 `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES (@CREA_HUNTER_PET+0,@CT_HUNTER_PET+0,'429','1',@PHASEMASK,
'0','0','-35.8506','-309.025','-53.2882','5.16657','300','0',
'0','247','0','0','0','0','0');
-- Black Widow Hatchling 930
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+ 1,@CT_HUNTER_PET+1,'429','1',@PHASEMASK,'0','0','-3.18622','-233.369','-53.8879','1.6811','300','0','0','664','0','0','0','0','0');
-- Corrupted Scorpid 3226
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+ 2,@CT_HUNTER_PET+2,'429','1',@PHASEMASK,'0','0','33.3731','-314.912','-52.0737','2.28652','300','0','0','198','0','0','0','0','0');
-- Corrupted Dreadmaw Crocolisk 3231
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 3,@CT_HUNTER_PET+3,'429','1',@PHASEMASK,'0','0','-11.1443','-319.635','-50.6709','6.20722','300','0','0','222','0','0','0','0','0');
-- Savannah Highmane 3243
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 4,@CT_HUNTER_PET+4,'429','1',@PHASEMASK,'0','0','-82.5652','-258.503','-57.1526','5.51695','300','0','0','273','0','0','0','0','0');
-- Ashenvale Bear 3809
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 5,@CT_HUNTER_PET+5,'429','1',@PHASEMASK,'0','0','-11.2959','-253.086','-55.9866','4.20615','300','0','0','662','0','0','0','0','0');
-- Bonepaw Hyena 4688
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 6,@CT_HUNTER_PET+6,'429','1',@PHASEMASK,'0','0','-91.718','-245.827','-56.4213','5.35201','300','0','0','488','0','0','0','0','0');
-- Monstrous Plaguebat 8602
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 7,@CT_HUNTER_PET+7,'429','1',@PHASEMASK,'0','0','-3.37166','-221.841','-53.9279','4.48497','300','0','0','3876','0','0','0','0','0');
-- Core Hound 11671
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 8,@CT_HUNTER_PET+8,'429','1',@PHASEMASK,'0','0','-53.1069','-328.679','-51.846','3.12845','300','0','0','47160','0','0','0','0','0');
-- Vekniss Warrior 15230
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 9,@CT_HUNTER_PET+9,'429','1',@PHASEMASK,'0','0','110.224','-332.761','-54.9454','1.18303','300','0','0','50304','0','0','0','0','0');
-- Feral Dragonhawk Hatchling 15649
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+10,@CT_HUNTER_PET+10,'429','1',@PHASEMASK,'0','0','-73.1951','-222.676','-57.0928','5.56171','300','0','0','115','126','0','0','0','0');
-- Razorfang Hatchling 16932
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+11,@CT_HUNTER_PET+11,'429','1',@PHASEMASK,'0','0','65.0592','-331','-52.4179','1.30478','300','0','0','4979','0','0','0','0','0');
-- Shattered Hand Warhound 17280
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+12,@CT_HUNTER_PET+12,'429','1',@PHASEMASK,'0','0','15.6406','-266.737','-52.4864','0.59332','300','0','0','4142','0','0','0','0','0');
-- Blue Flutterer 17349
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+13,@CT_HUNTER_PET+12,'429','1',@PHASEMASK,'0','0','-57.4696','-243.558','-57.8698','4.84232','300','0','0','198','0','0','0','0','0');
-- The Kurken 17447
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+14,@CT_HUNTER_PET+14,'429','1',@PHASEMASK,'0','0','-57.5751','-344.089','-54.4313','2.44987','300','0','0','247','0','0','0','0','0');
-- Zarakh 17683
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+15,@CT_HUNTER_PET+15,'429','1',@PHASEMASK,'0','0','-119.593','-243.222','-55.4527','5.68581','300','0','0','449','0','0','0','0','0');
-- Zarakh 17683 XX
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+16,@CT_HUNTER_PET+15,'429','1',@PHASEMASK,'0','0','-66.2943','-318.102','-54.2059','2.1742','300','0','0','449','0','0','0','0','0');
-- Sporebat 18128
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+17,@CT_HUNTER_PET+16,'429','1',@PHASEMASK,'0','0','-73.8813','-345.582','-56.024','2.39097','300','0','0','5158','0','0','0','0','0');
-- Crusty 18241
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+18,@CT_HUNTER_PET+17,'429','1',@PHASEMASK,'0','0','-30.6863','-323.767','-50.8561','2.05247','300','0','0','1006','0','0','0','0','0');
-- Blacksting 18283
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+19,@CT_HUNTER_PET+18,'429','1',@PHASEMASK,'0','0','-48.4916','-236.614','-57.9216','4.9994','300','0','0','5341','0','0','0','0','0');
-- Blackfang Tarantula 18983
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+20,@CT_HUNTER_PET+19,'429','1',@PHASEMASK,'0','0','7.29852','-252.055','-51.7716','3.29509','300','0','0','9813','0','0','0','0','0');
-- Coilskar Cobra 19784
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+21,@CT_HUNTER_PET+20,'429','1',@PHASEMASK,'0','0','-129.878','-279.712','-54.9394','5.77219','300','0','0','6542','0','0','0','0','0');
-- Bloodthirsty Marshfang 20196
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+22,@CT_HUNTER_PET+21,'429','1',@PHASEMASK,'0','0','-107.982','-263.239','-57.0779','0.239065','300','0','0','4274','1284','0','0','0','0');
-- Bladespire Ravager 20729
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+23,@CT_HUNTER_PET+22,'429','1',@PHASEMASK,'0','0','-101.738','-289.562','-57.972','4.18176','300','0','0','18978','0','0','0','0','0');
-- Tyrantus 20931
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+24,@CT_HUNTER_PET+23,'429','1',@PHASEMASK,'0','0','-14.2909','-306.428','-52.506','6.27163','300','0','0','9335','0','0','0','0','0');
-- Nuramoc 20932
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+25,@CT_HUNTER_PET+24,'429','1',@PHASEMASK,'0','0','18.1754','-335.155','-52.3309','6.07214','300','0','0','13972','0','0','0','0','0');
-- Dire Raven 21042
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+26,@CT_HUNTER_PET+25,'429','1',@PHASEMASK,'0','0','-69.5069','-241.954','-57.2405','4.95857','300','0','0','6542','0','0','0','0','0');
-- Spawn of Uvuros 21108
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+27,@CT_HUNTER_PET+26,'429','1',@PHASEMASK,'0','0','-57.6722','-361.206','-55.4931','2.27316','300','0','0','6761','0','0','0','0','0');
-- Felboar 21878
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+28,@CT_HUNTER_PET+27,'429','1',@PHASEMASK,'0','0','-64.2143','-298.558','-57.1919','1.88211','300','0','0','6542','0','0','0','0','0');
-- Lost Torranche 22807
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+29,@CT_HUNTER_PET+28,'429','1',@PHASEMASK,'0','0','-39.5936','-245.963','-58.7358','2.92595','300','0','0','6986','0','0','0','0','0');
-- Blackwind Warp Chaser 23219
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+30,@CT_HUNTER_PET+29,'429','1',@PHASEMASK,'0','0','13.5101','-233.499','-51.4345','3.77811','300','0','0','6761','0','0','0','0','0');
-- Goreclaw the Ravenous 23873
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+31,@CT_HUNTER_PET+30,'429','1',@PHASEMASK,'0','0','-82.1072','-233.048','-56.5128','5.4439','300','0','0','2189','0','0','0','0','0');
-- Bloodthirsty Worg 24475
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+32,@CT_HUNTER_PET+31,'429','1',@PHASEMASK,'0','0','-16.1883','-325.56','-50.5448','3.01458','300','0','0','6986','0','0','0','0','0');
-- Wooly Rhino Calf 25488
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+33,@CT_HUNTER_PET+32,'429','1',@PHASEMASK,'0','0','63.5754','-306.44','-54.3562','0.739284','300','0','0','6326','0','0','0','0','0');
-- Ice Heart Jormungar Spawn 26359
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+34,@CT_HUNTER_PET+33,'429','1',@PHASEMASK,'0','0','46.2449','-302.876','-53.4588','1.98021','300','0','0','4805','0','0','0','0','0');
-- Ice Serpent 26446
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+35,@CT_HUNTER_PET+34,'429','1',@PHASEMASK,'0','0','-84.0209','-353.931','-56.716','3.21956','300','0','0','9610','3309','0','0','0','0');
-- Darkweb Recluse 26625
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+36,@CT_HUNTER_PET+35,'429','1',@PHASEMASK,'0','0','-123.077','-255.948','-54.7062','5.9175','300','0','0','41128','0','0','0','0','0');
-- Hardknuckle Charger 28096
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+37,@CT_HUNTER_PET+36,'429','1',@PHASEMASK,'0','0','16.8375','-312.644','-51.2932','5.78469','300','0','0','11379','0','0','0','0','0');
-- Vargul Blighthound 29452
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+38,@CT_HUNTER_PET+37,'429','1',@PHASEMASK,'0','0','-18.1521','-247.108','-56.8827','5.55311','300','0','0','10635','0','0','0','0','0');
-- Ravenous Jormungar 30291
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+39,@CT_HUNTER_PET+38,'429','1',@PHASEMASK,'0','0','-2.10712','-297.668','-52.9171','1.37468','300','0','0','12175','0','0','0','0','0');
-- Aotona 32481
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+40,@CT_HUNTER_PET+39,'429','1',@PHASEMASK,'0','0','-9.96008','-207.127','-53.4207','4.70488','300','0','0','6978','0','0','0','0','0');
-- Loque'nahak 32517
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+41,@CT_HUNTER_PET+40,'429','1',@PHASEMASK,'0','0','-110.416','-299.639','-57.4157','4.75118','300','0','0','16502','0','0','0','0','0');
-- Lake Snapper 33710
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+42,@CT_HUNTER_PET+41,'429','1',@PHASEMASK,'0','0','13.7471','-302.835','-52.1134','3.39708','300','0','0','156','0','0','0','0','0');
-- Gondria 33776
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+43,@CT_HUNTER_PET+42,'429','1',@PHASEMASK,'0','0','27.2706','-299.631','-52.4969','1.63386','300','0','0','17069','0','0','0','0','0');
-- Skoll 35189
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+44,@CT_HUNTER_PET+43,'429','1',@PHASEMASK,'0','0','-64.6566','-252.867','-57.8737','4.0373','300','0','0','18900','0','0','0','0','0');
-- Arcturis 38453
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+45,@CT_HUNTER_PET+44,'429','1',@PHASEMASK,'0','0','-35.3267','-294.272','-55.17','6.27005','300','0','0','15423','0','0','0','0','0');
--
-- Port back
--INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES(@CREA_HUNTER_PET+46,'900004','429','1','1','0','0','51.7399','-257.364','-53.0248','5.09432','300','0','0','100800','88140','0','0','0','0','0');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+47,@CT_HUNTER_FOOD_VENDOR,'429','1',@PHASEMASK,'0','897','47.3075','-258.475','-52.9096','5.00714','300','0','0','10080','8814','0','0','0','0');
-- Stablemaster
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
 VALUES(@CREA_HUNTER_PET+48,@CT_HUNTER_STABLE_MASTER,'429','1',@PHASEMASK,'0','0','49.9412','-257.581','-52.9192','5.10217','300','0','0','10635','0','0','0','0','0');
-- Hunter Trainer
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,  `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
 VALUES(@CREA_HUNTER_PET+49,(@CT_CLASS_TRAINER+8),'429','1',@PHASEMASK,'0','0','42.1533','-261.419','-52.9894','5.21213','300','0','0','8982','3155','0','0','0','0');
-- Tierausbilder
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,  `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
 VALUES(@CREA_HUNTER_PET+50,@CT_HUNTER_PET_TRAINER,'429','1',@PHASEMASK,'0','191','44.5411','-259.957','-52.949','5.2946','300','0','0','1753','0','0','0','0','0');
-- 
-- Hunter Pets: ENDE
-- 

-- Death Knight Trainer and Runeforge 33251
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+0, '0', '0', '0', '0', '0', '28516', '0', '0', '0', 'Death Knight Trainer and Runeforge', NULL, NULL, '0', '1', '1', '0', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.0', '1.14286', '1.0', '0', '2.0', '2.0', '0', '24', '1.0', '2000', '0', '1', '0', '8', '0', '0', '0', '6', '0', '1.0', '1.0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+0, '', '', 'Todesritterlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+0, '-200019', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES
-- (@CT_CLASS_TRAINER+0, '37301', '501'), -- Deprecated Test Glyph
(@CT_CLASS_TRAINER+0, '43533', '501'), -- Glyph of Anti-Magic Shell
(@CT_CLASS_TRAINER+0, '43826', '501'), -- Glyph of Blood Strike
(@CT_CLASS_TRAINER+0, '43535', '501'), -- Glyph of Blood Tap
(@CT_CLASS_TRAINER+0, '43536', '501'), -- Glyph of Bone Shield
(@CT_CLASS_TRAINER+0, '43537', '501'), -- Glyph of Chains of Ice
(@CT_CLASS_TRAINER+0, '43671', '501'), -- Glyph of Corpse Explosion
(@CT_CLASS_TRAINER+0, '45799', '501'), -- Glyph of Dancing Rune Weapon
(@CT_CLASS_TRAINER+0, '43538', '501'), -- Glyph of Dark Command
(@CT_CLASS_TRAINER+0, '45804', '501'), -- Glyph of Dark Death
(@CT_CLASS_TRAINER+0, '43542', '501'), -- Glyph of Death and Decay
(@CT_CLASS_TRAINER+0, '43541', '501'), -- Glyph of Death Grip
(@CT_CLASS_TRAINER+0, '43827', '501'), -- Glyph of Death Strike
(@CT_CLASS_TRAINER+0, '43539', '501'), -- Glyph of Death's Embrace
(@CT_CLASS_TRAINER+0, '45805', '501'), -- Glyph of Disease
(@CT_CLASS_TRAINER+0, '43543', '501'), -- Glyph of Frost Strike
(@CT_CLASS_TRAINER+0, '43534', '501'), -- Glyph of Heart Strike
(@CT_CLASS_TRAINER+0, '43544', '501'), -- Glyph of Horn of Winter
(@CT_CLASS_TRAINER+0, '45806', '501'), -- Glyph of Howling Blast
(@CT_CLASS_TRAINER+0, '45800', '501'), -- Glyph of Hungering Cold
(@CT_CLASS_TRAINER+0, '43545', '501'), -- Glyph of Icebound Fortitude
(@CT_CLASS_TRAINER+0, '43546', '501'), -- Glyph of Icy Touch
(@CT_CLASS_TRAINER+0, '43547', '501'), -- Glyph of Obliterate
(@CT_CLASS_TRAINER+0, '43672', '501'), -- Glyph of Pestilence
(@CT_CLASS_TRAINER+0, '43548', '501'), -- Glyph of Plague Strike
(@CT_CLASS_TRAINER+0, '43673', '501'), -- Glyph of Raise Dead
(@CT_CLASS_TRAINER+0, '44432', '501'), -- Glyph of Raise Dead
(@CT_CLASS_TRAINER+0, '43550', '501'), -- Glyph of Rune Strike
(@CT_CLASS_TRAINER+0, '43825', '501'), -- Glyph of Rune Tap
(@CT_CLASS_TRAINER+0, '43551', '501'), -- Glyph of Scourge Strike
(@CT_CLASS_TRAINER+0, '43552', '501'), -- Glyph of Strangulate
(@CT_CLASS_TRAINER+0, '43549', '501'), -- Glyph of the Ghoul
(@CT_CLASS_TRAINER+0, '43553', '501'), -- Glyph of Unbreakable Armor
(@CT_CLASS_TRAINER+0, '45803', '501'), -- Glyph of Unholy Blight
(@CT_CLASS_TRAINER+0, '43554', '501'); -- Glyph of Vampiric Blood
-- Warrior Trainer 26332
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+1, '0', '0', '0', '0', '0', '24036', '0', '0', '0', 'Warrior Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '252.0', '357.0', '0', '304', '1.0', '2000', '0', '1', '768', '8', '0', '0', '0', '1', '0', '215.0', '320.0', '44', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+1, '', '', 'Kriegerlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+1, '-200002', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+1, '-200001', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+1, '43420', '501'), -- Glyph of Barbaric Insults
(@CT_CLASS_TRAINER+1, '43395', '501'), -- Glyph of Battle
(@CT_CLASS_TRAINER+1, '45790', '501'), -- Glyph of Bladestorm
(@CT_CLASS_TRAINER+1, '43425', '501'), -- Glyph of Blocking
(@CT_CLASS_TRAINER+1, '43396', '501'), -- Glyph of Bloodrage
(@CT_CLASS_TRAINER+1, '43412', '501'), -- Glyph of Bloodthirst
(@CT_CLASS_TRAINER+1, '43397', '501'), -- Glyph of Charge
(@CT_CLASS_TRAINER+1, '43414', '501'), -- Glyph of Cleaving
(@CT_CLASS_TRAINER+1, '49084', '501'), -- Glyph of Command
(@CT_CLASS_TRAINER+1, '43415', '501'), -- Glyph of Devastate
(@CT_CLASS_TRAINER+1, '43400', '501'), -- Glyph of Enduring Victory
(@CT_CLASS_TRAINER+1, '45794', '501'), -- Glyph of Enraged Regeneration
(@CT_CLASS_TRAINER+1, '43416', '501'), -- Glyph of Execution
(@CT_CLASS_TRAINER+1, '43417', '501'), -- Glyph of Hamstring
(@CT_CLASS_TRAINER+1, '43418', '501'), -- Glyph of Heroic Strike
(@CT_CLASS_TRAINER+1, '43419', '501'), -- Glyph of Intervene
(@CT_CLASS_TRAINER+1, '43426', '501'), -- Glyph of Last Stand
(@CT_CLASS_TRAINER+1, '43398', '501'), -- Glyph of Mocking Blow
(@CT_CLASS_TRAINER+1, '43421', '501'), -- Glyph of Mortal Strike
(@CT_CLASS_TRAINER+1, '43422', '501'), -- Glyph of Overpower
(@CT_CLASS_TRAINER+1, '43413', '501'), -- Glyph of Rapid Charge
(@CT_CLASS_TRAINER+1, '43423', '501'), -- Glyph of Rending
(@CT_CLASS_TRAINER+1, '43430', '501'), -- Glyph of Resonating Power
(@CT_CLASS_TRAINER+1, '43424', '501'), -- Glyph of Revenge
(@CT_CLASS_TRAINER+1, '45797', '501'), -- Glyph of Shield Wall
(@CT_CLASS_TRAINER+1, '45792', '501'), -- Glyph of Shockwave
(@CT_CLASS_TRAINER+1, '45795', '501'), -- Glyph of Spell Reflection
(@CT_CLASS_TRAINER+1, '43427', '501'), -- Glyph of Sunder Armor
(@CT_CLASS_TRAINER+1, '43428', '501'), -- Glyph of Sweeping Strikes
(@CT_CLASS_TRAINER+1, '43429', '501'), -- Glyph of Taunt
(@CT_CLASS_TRAINER+1, '43399', '501'), -- Glyph of Thunder Clap
(@CT_CLASS_TRAINER+1, '43431', '501'), -- Glyph of Victory Rush
(@CT_CLASS_TRAINER+1, '45793', '501'), -- Glyph of Vigilance
(@CT_CLASS_TRAINER+1, '43432', '501'); -- Glyph of Whirlwind
-- Warlock Trainer 26331
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+2, '0', '0', '0', '0', '0', '24035', '0', '0', '0', 'Warlock Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '248.0', '363.0', '0', '135', '1.0', '2000', '0', '8', '768', '8', '0', '0', '0', '9', '0', '233.0', '347.0', '28', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+2, '', '', 'Hexenmeisterlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+2, '-200010', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+2, '-200009', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+2, '45781', '501'), -- Glyph of Chaos Bolt
(@CT_CLASS_TRAINER+2, '42454', '501'), -- Glyph of Conflagrate
(@CT_CLASS_TRAINER+2, '42455', '501'), -- Glyph of Corruption
(@CT_CLASS_TRAINER+2, '42456', '501'), -- Glyph of Curse of Agony
(@CT_CLASS_TRAINER+2, '43392', '501'), -- Glyph of Curse of Exhaustion
(@CT_CLASS_TRAINER+2, '42457', '501'), -- Glyph of Death Coil
(@CT_CLASS_TRAINER+2, '45782', '501'), -- Glyph of Demonic Circle
(@CT_CLASS_TRAINER+2, '43390', '501'), -- Glyph of Drain Soul
(@CT_CLASS_TRAINER+2, '43393', '501'), -- Glyph of Enslave Demon
(@CT_CLASS_TRAINER+2, '42458', '501'), -- Glyph of Fear
(@CT_CLASS_TRAINER+2, '42459', '501'), -- Glyph of Felguard
(@CT_CLASS_TRAINER+2, '42460', '501'), -- Glyph of Felhunter
(@CT_CLASS_TRAINER+2, '45779', '501'), -- Glyph of Haunt
(@CT_CLASS_TRAINER+2, '42461', '501'), -- Glyph of Health Funnel
(@CT_CLASS_TRAINER+2, '42462', '501'), -- Glyph of Healthstone
(@CT_CLASS_TRAINER+2, '42463', '501'), -- Glyph of Howl of Terror
(@CT_CLASS_TRAINER+2, '42464', '501'), -- Glyph of Immolate
(@CT_CLASS_TRAINER+2, '42465', '501'), -- Glyph of Imp
(@CT_CLASS_TRAINER+2, '42453', '501'), -- Glyph of Incinerate
(@CT_CLASS_TRAINER+2, '43391', '501'), -- Glyph of Kilrogg
(@CT_CLASS_TRAINER+2, '45785', '501'), -- Glyph of Life Tap
(@CT_CLASS_TRAINER+2, '45780', '501'), -- Glyph of Metamorphosis
(@CT_CLASS_TRAINER+2, '50077', '501'), -- Glyph of Quick Decay
(@CT_CLASS_TRAINER+2, '42466', '501'), -- Glyph of Searing Pain
(@CT_CLASS_TRAINER+2, '42467', '501'), -- Glyph of Shadow Bolt
(@CT_CLASS_TRAINER+2, '42468', '501'), -- Glyph of Shadowburn
(@CT_CLASS_TRAINER+2, '45783', '501'), -- Glyph of Shadowflame
(@CT_CLASS_TRAINER+2, '42469', '501'), -- Glyph of Siphon Life
(@CT_CLASS_TRAINER+2, '45789', '501'), -- Glyph of Soul Link
(@CT_CLASS_TRAINER+2, '43394', '501'), -- Glyph of Souls
(@CT_CLASS_TRAINER+2, '42470', '501'), -- Glyph of Soulstone
(@CT_CLASS_TRAINER+2, '42471', '501'), -- Glyph of Succubus
(@CT_CLASS_TRAINER+2, '43389', '501'), -- Glyph of Unending Breath
(@CT_CLASS_TRAINER+2, '42472', '501'), -- Glyph of Unstable Affliction
(@CT_CLASS_TRAINER+2, '42473', '501'); -- Glyph of Voidwalker
-- Shaman Trainer 26330
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName,
gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H,
npcflag,
speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+3, '0', '0', '0', '0', '0', '24034', '0', '0', '0', 'Shaman Trainer', NULL, NULL,
'0', '70', '70', '2', '189', '189',
@NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,
'1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '7', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+3, '', '', 'Schamanenlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+3, '-200018', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+3, '-200017', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+3, '43381', '501'), -- Glyph of Astral Recall
(@CT_CLASS_TRAINER+3, '41517', '501'), -- Glyph of Chain Heal
(@CT_CLASS_TRAINER+3, '41518', '501'), -- Glyph of Chain Lightning
(@CT_CLASS_TRAINER+3, '45775', '501'), -- Glyph of Earth Shield
(@CT_CLASS_TRAINER+3, '41527', '501'), -- Glyph of Earthliving Weapon
(@CT_CLASS_TRAINER+3, '41552', '501'), -- Glyph of Elemental Mastery
(@CT_CLASS_TRAINER+3, '45771', '501'), -- Glyph of Feral Spirit
(@CT_CLASS_TRAINER+3, '41529', '501'), -- Glyph of Fire Elemental Totem
(@CT_CLASS_TRAINER+3, '41530', '501'), -- Glyph of Fire Nova
(@CT_CLASS_TRAINER+3, '41531', '501'), -- Glyph of Flame Shock
(@CT_CLASS_TRAINER+3, '41532', '501'), -- Glyph of Flametongue Weapon
(@CT_CLASS_TRAINER+3, '41547', '501'), -- Glyph of Frost Shock
(@CT_CLASS_TRAINER+3, '43725', '501'), -- Glyph of Ghost Wolf
(@CT_CLASS_TRAINER+3, '41533', '501'), -- Glyph of Healing Stream Totem
(@CT_CLASS_TRAINER+3, '41534', '501'), -- Glyph of Healing Wave
(@CT_CLASS_TRAINER+3, '45777', '501'), -- Glyph of Hex
(@CT_CLASS_TRAINER+3, '41524', '501'), -- Glyph of Lava
(@CT_CLASS_TRAINER+3, '41540', '501'), -- Glyph of Lava Lash
(@CT_CLASS_TRAINER+3, '41535', '501'), -- Glyph of Lesser Healing Wave
(@CT_CLASS_TRAINER+3, '41536', '501'), -- Glyph of Lightning Bolt
(@CT_CLASS_TRAINER+3, '41537', '501'), -- Glyph of Lightning Shield
(@CT_CLASS_TRAINER+3, '41538', '501'), -- Glyph of Mana Tide Totem
(@CT_CLASS_TRAINER+3, '43385', '501'), -- Glyph of Renewed Life
(@CT_CLASS_TRAINER+3, '45772', '501'), -- Glyph of Riptide
(@CT_CLASS_TRAINER+3, '41526', '501'), -- Glyph of Shocking
(@CT_CLASS_TRAINER+3, '45778', '501'), -- Glyph of Stoneclaw Totem
(@CT_CLASS_TRAINER+3, '41539', '501'), -- Glyph of Stormstrike
(@CT_CLASS_TRAINER+3, '45770', '501'), -- Glyph of Thunder
(@CT_CLASS_TRAINER+3, '44923', '501'), -- Glyph of Thunderstorm
(@CT_CLASS_TRAINER+3, '45776', '501'), -- Glyph of Totem of Wrath
(@CT_CLASS_TRAINER+3, '43344', '501'), -- Glyph of Water Breathing
(@CT_CLASS_TRAINER+3, '41541', '501'), -- Glyph of Water Mastery
(@CT_CLASS_TRAINER+3, '43386', '501'), -- Glyph of Water Shield
(@CT_CLASS_TRAINER+3, '43388', '501'), -- Glyph of Water Walking
(@CT_CLASS_TRAINER+3, '41542', '501'); -- Glyph of Windfury Weapon
-- Rogue Trainer 26329
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+4, '0', '0', '0', '0', '0', '23777', '0', '0', '0', 'Rogue Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '252.0', '357.0', '0', '304', '1.0', '2000', '0', '1', '768', '8', '0', '0', '0', '4', '0', '215.0', '320.0', '44', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+4, '', '', 'Schurkenlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+4, '-200016', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+4, '-200015', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+4, '42954', '501'), -- Glyph of Adrenaline Rush
(@CT_CLASS_TRAINER+4, '42955', '501'), -- Glyph of Ambush
(@CT_CLASS_TRAINER+4, '42956', '501'), -- Glyph of Backstab
(@CT_CLASS_TRAINER+4, '42957', '501'), -- Glyph of Blade Flurry
(@CT_CLASS_TRAINER+4, '43379', '501'), -- Glyph of Blurred Speed
(@CT_CLASS_TRAINER+4, '45769', '501'), -- Glyph of Cloak of Shadows
(@CT_CLASS_TRAINER+4, '42958', '501'), -- Glyph of Crippling Poison
(@CT_CLASS_TRAINER+4, '42959', '501'), -- Glyph of Deadly Throw
(@CT_CLASS_TRAINER+4, '43376', '501'), -- Glyph of Distract
(@CT_CLASS_TRAINER+4, '45908', '501'), -- Glyph of Envenom
(@CT_CLASS_TRAINER+4, '42960', '501'), -- Glyph of Evasion
(@CT_CLASS_TRAINER+4, '42961', '501'), -- Glyph of Eviscerate
(@CT_CLASS_TRAINER+4, '42962', '501'), -- Glyph of Expose Armor
(@CT_CLASS_TRAINER+4, '45766', '501'), -- Glyph of Fan of Knives
(@CT_CLASS_TRAINER+4, '42963', '501'), -- Glyph of Feint
(@CT_CLASS_TRAINER+4, '42964', '501'), -- Glyph of Garrote
(@CT_CLASS_TRAINER+4, '42965', '501'), -- Glyph of Ghostly Strike
(@CT_CLASS_TRAINER+4, '42966', '501'), -- Glyph of Gouge
(@CT_CLASS_TRAINER+4, '42967', '501'), -- Glyph of Hemorrhage
(@CT_CLASS_TRAINER+4, '45761', '501'), -- Glyph of Hunger for Blood
(@CT_CLASS_TRAINER+4, '45762', '501'), -- Glyph of Killing Spree
(@CT_CLASS_TRAINER+4, '45768', '501'), -- Glyph of Mutilate
(@CT_CLASS_TRAINER+4, '43377', '501'), -- Glyph of Pick Lock
(@CT_CLASS_TRAINER+4, '43343', '501'), -- Glyph of Pick Pocket
(@CT_CLASS_TRAINER+4, '42968', '501'), -- Glyph of Preparation
(@CT_CLASS_TRAINER+4, '42969', '501'), -- Glyph of Rupture
(@CT_CLASS_TRAINER+4, '43378', '501'), -- Glyph of Safe Fall
(@CT_CLASS_TRAINER+4, '42970', '501'), -- Glyph of Sap
(@CT_CLASS_TRAINER+4, '45764', '501'), -- Glyph of Shadow Dance
(@CT_CLASS_TRAINER+4, '42972', '501'), -- Glyph of Sinister Strike
(@CT_CLASS_TRAINER+4, '42973', '501'), -- Glyph of Slice and Dice
(@CT_CLASS_TRAINER+4, '42974', '501'), -- Glyph of Sprint
(@CT_CLASS_TRAINER+4, '45767', '501'), -- Glyph of Tricks of the Trade
(@CT_CLASS_TRAINER+4, '43380', '501'), -- Glyph of Vanish
(@CT_CLASS_TRAINER+4, '42971', '501'); -- Glyph of Vigor
-- Priest Trainer 26328
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+5, '0', '0', '0', '0', '0', '24033', '0', '0', '0', 'Priest Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '248.0', '363.0', '0', '135', '1.0', '2000', '0', '8', '768', '8', '0', '0', '0', '5', '0', '233.0', '347.0', '28', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+5, '', '', 'Priesterlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+5, '-200012', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+5, '-200011', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+5, '42396', '501'), -- Glyph of Circle of Healing
(@CT_CLASS_TRAINER+5, '42397', '501'), -- Glyph of Dispel Magic
(@CT_CLASS_TRAINER+5, '45753', '501'), -- Glyph of Dispersion
(@CT_CLASS_TRAINER+5, '42398', '501'), -- Glyph of Fade
(@CT_CLASS_TRAINER+5, '43342', '501'), -- Glyph of Fading
(@CT_CLASS_TRAINER+5, '42399', '501'), -- Glyph of Fear Ward
(@CT_CLASS_TRAINER+5, '42400', '501'), -- Glyph of Flash Heal
(@CT_CLASS_TRAINER+5, '43371', '501'), -- Glyph of Fortitude
(@CT_CLASS_TRAINER+5, '45755', '501'), -- Glyph of Guardian Spirit
(@CT_CLASS_TRAINER+5, '42401', '501'), -- Glyph of Holy Nova
(@CT_CLASS_TRAINER+5, '45758', '501'), -- Glyph of Hymn of Hope
(@CT_CLASS_TRAINER+5, '42402', '501'), -- Glyph of Inner Fire
(@CT_CLASS_TRAINER+5, '43370', '501'), -- Glyph of Levitate
(@CT_CLASS_TRAINER+5, '42403', '501'), -- Glyph of Lightwell
(@CT_CLASS_TRAINER+5, '42404', '501'), -- Glyph of Mass Dispel
(@CT_CLASS_TRAINER+5, '42405', '501'), -- Glyph of Mind Control
(@CT_CLASS_TRAINER+5, '42415', '501'), -- Glyph of Mind Flay
(@CT_CLASS_TRAINER+5, '45757', '501'), -- Glyph of Mind Sear
(@CT_CLASS_TRAINER+5, '45760', '501'), -- Glyph of Pain Suppression
(@CT_CLASS_TRAINER+5, '45756', '501'), -- Glyph of Penance
(@CT_CLASS_TRAINER+5, '42408', '501'), -- Glyph of Power Word: Shield
(@CT_CLASS_TRAINER+5, '42409', '501'), -- Glyph of Prayer of Healing
(@CT_CLASS_TRAINER+5, '42410', '501'), -- Glyph of Psychic Scream
(@CT_CLASS_TRAINER+5, '42411', '501'), -- Glyph of Renew
(@CT_CLASS_TRAINER+5, '42412', '501'), -- Glyph of Scourge Imprisonment
(@CT_CLASS_TRAINER+5, '43373', '501'), -- Glyph of Shackle Undead
(@CT_CLASS_TRAINER+5, '42407', '501'), -- Glyph of Shadow
(@CT_CLASS_TRAINER+5, '43372', '501'), -- Glyph of Shadow Protection
(@CT_CLASS_TRAINER+5, '42414', '501'), -- Glyph of Shadow Word: Death
(@CT_CLASS_TRAINER+5, '42406', '501'), -- Glyph of Shadow Word: Pain
(@CT_CLASS_TRAINER+5, '43374', '501'), -- Glyph of Shadowfiend
(@CT_CLASS_TRAINER+5, '42416', '501'), -- Glyph of Smite
(@CT_CLASS_TRAINER+5, '42417', '501'); -- Glyph of Spirit of Redemption
-- Paladin Trainer 26327
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+6, '0', '0', '0', '0', '0', '24032', '0', '0', '0', 'Paladin Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '2', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+6, '', '', 'Paladinlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+6, '-200004', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+6, '-200003', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES 
(@CT_CLASS_TRAINER+6, '41101', '501'), -- Glyph of Avenger's Shield
(@CT_CLASS_TRAINER+6, '41107', '501'), -- Glyph of Avenging Wrath
(@CT_CLASS_TRAINER+6, '45741', '501'), -- Glyph of Beacon of Light
(@CT_CLASS_TRAINER+6, '43365', '501'), -- Glyph of Blessing of Kings
(@CT_CLASS_TRAINER+6, '43340', '501'), -- Glyph of Blessing of Might
(@CT_CLASS_TRAINER+6, '43366', '501'), -- Glyph of Blessing of Wisdom
(@CT_CLASS_TRAINER+6, '41104', '501'), -- Glyph of Cleansing
(@CT_CLASS_TRAINER+6, '41099', '501'), -- Glyph of Consecration
(@CT_CLASS_TRAINER+6, '41098', '501'), -- Glyph of Crusader Strike
(@CT_CLASS_TRAINER+6, '45745', '501'), -- Glyph of Divine Plea
(@CT_CLASS_TRAINER+6, '45743', '501'), -- Glyph of Divine Storm
(@CT_CLASS_TRAINER+6, '41108', '501'), -- Glyph of Divinity
(@CT_CLASS_TRAINER+6, '41103', '501'), -- Glyph of Exorcism
(@CT_CLASS_TRAINER+6, '41105', '501'), -- Glyph of Flash of Light
(@CT_CLASS_TRAINER+6, '41095', '501'), -- Glyph of Hammer of Justice
(@CT_CLASS_TRAINER+6, '45742', '501'), -- Glyph of Hammer of the Righteous
(@CT_CLASS_TRAINER+6, '41097', '501'), -- Glyph of Hammer of Wrath
(@CT_CLASS_TRAINER+6, '41106', '501'), -- Glyph of Holy Light
(@CT_CLASS_TRAINER+6, '45746', '501'), -- Glyph of Holy Shock
(@CT_CLASS_TRAINER+6, '43867', '501'), -- Glyph of Holy Wrath
(@CT_CLASS_TRAINER+6, '41092', '501'), -- Glyph of Judgement
(@CT_CLASS_TRAINER+6, '43367', '501'), -- Glyph of Lay on Hands
(@CT_CLASS_TRAINER+6, '41100', '501'), -- Glyph of Righteous Defense
(@CT_CLASS_TRAINER+6, '45747', '501'), -- Glyph of Salvation
(@CT_CLASS_TRAINER+6, '41094', '501'), -- Glyph of Seal of Command
(@CT_CLASS_TRAINER+6, '41110', '501'), -- Glyph of Seal of Light
(@CT_CLASS_TRAINER+6, '43868', '501'), -- Glyph of Seal of Righteousness
(@CT_CLASS_TRAINER+6, '43869', '501'), -- Glyph of Seal of Vengeance
(@CT_CLASS_TRAINER+6, '41109', '501'), -- Glyph of Seal of Wisdom
(@CT_CLASS_TRAINER+6, '43368', '501'), -- Glyph of Sense Undead
(@CT_CLASS_TRAINER+6, '45744', '501'), -- Glyph of Shield of Righteousness
(@CT_CLASS_TRAINER+6, '41096', '501'), -- Glyph of Spiritual Attunement
(@CT_CLASS_TRAINER+6, '43369', '501'), -- Glyph of the Wise
(@CT_CLASS_TRAINER+6, '41102', '501'); -- Glyph of Turn Evil
-- Mage Trainer 26326
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+7, '0', '0', '0', '0', '0', '24031', '0', '0', '0', 'Mage Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '248.0', '363.0', '0', '135', '1.0', '2000', '0', '8', '768', '8', '0', '0', '0', '8', '0', '233.0', '347.0', '28', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+7, '', '', 'Magierlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+7, '-200008', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+7, '-200007', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+7, '45738', '501'), -- Glyph of Arcane Barrage
(@CT_CLASS_TRAINER+7, '44955', '501'), -- Glyph of Arcane Blast
(@CT_CLASS_TRAINER+7, '42734', '501'), -- Glyph of Arcane Explosion
(@CT_CLASS_TRAINER+7, '43339', '501'), -- Glyph of Arcane Intellect
(@CT_CLASS_TRAINER+7, '42735', '501'), -- Glyph of Arcane Missiles
(@CT_CLASS_TRAINER+7, '42736', '501'), -- Glyph of Arcane Power
(@CT_CLASS_TRAINER+7, '44920', '501'), -- Glyph of Blast Wave
(@CT_CLASS_TRAINER+7, '42737', '501'), -- Glyph of Blink
(@CT_CLASS_TRAINER+7, '45736', '501'), -- Glyph of Deep Freeze
(@CT_CLASS_TRAINER+7, '50045', '501'), -- Glyph of Eternal Water
(@CT_CLASS_TRAINER+7, '42738', '501'), -- Glyph of Evocation
(@CT_CLASS_TRAINER+7, '42740', '501'), -- Glyph of Fire Blast
(@CT_CLASS_TRAINER+7, '43357', '501'), -- Glyph of Fire Ward
(@CT_CLASS_TRAINER+7, '42739', '501'), -- Glyph of Fireball
(@CT_CLASS_TRAINER+7, '43359', '501'), -- Glyph of Frost Armor
(@CT_CLASS_TRAINER+7, '42741', '501'), -- Glyph of Frost Nova
(@CT_CLASS_TRAINER+7, '43360', '501'), -- Glyph of Frost Ward
(@CT_CLASS_TRAINER+7, '42742', '501'), -- Glyph of Frostbolt
(@CT_CLASS_TRAINER+7, '44684', '501'), -- Glyph of Frostfire
(@CT_CLASS_TRAINER+7, '42743', '501'), -- Glyph of Ice Armor
(@CT_CLASS_TRAINER+7, '45740', '501'), -- Glyph of Ice Barrier
(@CT_CLASS_TRAINER+7, '42744', '501'), -- Glyph of Ice Block
(@CT_CLASS_TRAINER+7, '42745', '501'), -- Glyph of Ice Lance
(@CT_CLASS_TRAINER+7, '42746', '501'), -- Glyph of Icy Veins
(@CT_CLASS_TRAINER+7, '42748', '501'), -- Glyph of Invisibility
(@CT_CLASS_TRAINER+7, '45737', '501'), -- Glyph of Living Bomb
(@CT_CLASS_TRAINER+7, '42749', '501'), -- Glyph of Mage Armor
(@CT_CLASS_TRAINER+7, '42750', '501'), -- Glyph of Mana Gem
(@CT_CLASS_TRAINER+7, '45739', '501'), -- Glyph of Mirror Image
(@CT_CLASS_TRAINER+7, '42751', '501'), -- Glyph of Molten Armor
(@CT_CLASS_TRAINER+7, '42752', '501'), -- Glyph of Polymorph
(@CT_CLASS_TRAINER+7, '42753', '501'), -- Glyph of Remove Curse
(@CT_CLASS_TRAINER+7, '42747', '501'), -- Glyph of Scorch
(@CT_CLASS_TRAINER+7, '43364', '501'), -- Glyph of Slow Fall
(@CT_CLASS_TRAINER+7, '43362', '501'), -- Glyph of the Bear Cub
(@CT_CLASS_TRAINER+7, '43361', '501'), -- Glyph of the Penguin
(@CT_CLASS_TRAINER+7, '42754', '501'); -- Glyph of Water Elemental
-- Hunter Trainer 26325
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+8, '0', '0', '0', '0', '0', '24030', '0', '0', '0', 'Hunter Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '3', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+8, '', '', 'Jägerlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+8, '-200014', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+8, '-200013', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+8, '42897', '501'), -- Glyph of Aimed Shot
(@CT_CLASS_TRAINER+8, '42898', '501'), -- Glyph of Arcane Shot
(@CT_CLASS_TRAINER+8, '42901', '501'), -- Glyph of Aspect of the Viper
(@CT_CLASS_TRAINER+8, '42902', '501'), -- Glyph of Bestial Wrath
(@CT_CLASS_TRAINER+8, '45625', '501'), -- Glyph of Chimera Shot
(@CT_CLASS_TRAINER+8, '42903', '501'), -- Glyph of Deterrence
(@CT_CLASS_TRAINER+8, '42904', '501'), -- Glyph of Disengage
(@CT_CLASS_TRAINER+8, '45731', '501'), -- Glyph of Explosive Shot
(@CT_CLASS_TRAINER+8, '45733', '501'), -- Glyph of Explosive Trap
(@CT_CLASS_TRAINER+8, '43351', '501'), -- Glyph of Feign Death
(@CT_CLASS_TRAINER+8, '42905', '501'), -- Glyph of Freezing Trap
(@CT_CLASS_TRAINER+8, '42906', '501'), -- Glyph of Frost Trap
(@CT_CLASS_TRAINER+8, '42907', '501'), -- Glyph of Hunter's Mark
(@CT_CLASS_TRAINER+8, '42908', '501'), -- Glyph of Immolation Trap
(@CT_CLASS_TRAINER+8, '45732', '501'), -- Glyph of Kill Shot
(@CT_CLASS_TRAINER+8, '43350', '501'), -- Glyph of Mend Pet
(@CT_CLASS_TRAINER+8, '42900', '501'), -- Glyph of Mending
(@CT_CLASS_TRAINER+8, '42910', '501'), -- Glyph of Multi-Shot
(@CT_CLASS_TRAINER+8, '43354', '501'), -- Glyph of Possessed Strength
(@CT_CLASS_TRAINER+8, '42911', '501'), -- Glyph of Rapid Fire
(@CT_CLASS_TRAINER+8, '45735', '501'), -- Glyph of Raptor Strike
(@CT_CLASS_TRAINER+8, '43338', '501'), -- Glyph of Revive Pet
(@CT_CLASS_TRAINER+8, '43356', '501'), -- Glyph of Scare Beast
(@CT_CLASS_TRAINER+8, '45734', '501'), -- Glyph of Scatter Shot
(@CT_CLASS_TRAINER+8, '42912', '501'), -- Glyph of Serpent Sting
(@CT_CLASS_TRAINER+8, '42913', '501'), -- Glyph of Snake Trap
(@CT_CLASS_TRAINER+8, '42914', '501'), -- Glyph of Steady Shot
(@CT_CLASS_TRAINER+8, '42899', '501'), -- Glyph of the Beast
(@CT_CLASS_TRAINER+8, '42909', '501'), -- Glyph of the Hawk
(@CT_CLASS_TRAINER+8, '43355', '501'), -- Glyph of the Pack
(@CT_CLASS_TRAINER+8, '42915', '501'), -- Glyph of Trueshot Aura
(@CT_CLASS_TRAINER+8, '42916', '501'), -- Glyph of Volley
(@CT_CLASS_TRAINER+8, '42917', '501'); -- Glyph of Wyvern Sting
-- Druid Trainer 26324
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+9, '0', '0', '0', '0', '0', '24029', '0', '0', '0', 'Druid Trainer', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '11', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+9, '', '', 'Druidenlehrer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+9, '-200006', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+9, '-200005', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES 
-- (@CT_CLASS_TRAINER+9, '43336', '501'), -- Deprecated Glyph of the Black Bear
-- (@CT_CLASS_TRAINER+9, '40948', '501'), -- Deprecated Glyph of the Red Lynx
-- (@CT_CLASS_TRAINER+9, '40484', '501'), -- Deprecated Glyph of the White Bear
(@CT_CLASS_TRAINER+9, '43316', '501'), -- Glyph of Aquatic Form
(@CT_CLASS_TRAINER+9, '45623', '501'), -- Glyph of Barkskin
(@CT_CLASS_TRAINER+9, '45601', '501'), -- Glyph of Berserk
(@CT_CLASS_TRAINER+9, '43334', '501'), -- Glyph of Challenging Roar
(@CT_CLASS_TRAINER+9, '48720', '501'), -- Glyph of Claw
(@CT_CLASS_TRAINER+9, '43674', '501'), -- Glyph of Dash
(@CT_CLASS_TRAINER+9, '40924', '501'), -- Glyph of Entangling Roots
(@CT_CLASS_TRAINER+9, '44928', '501'), -- Glyph of Focus
(@CT_CLASS_TRAINER+9, '40896', '501'), -- Glyph of Frenzied Regeneration
(@CT_CLASS_TRAINER+9, '40899', '501'), -- Glyph of Growl
(@CT_CLASS_TRAINER+9, '40914', '501'), -- Glyph of Healing Touch
(@CT_CLASS_TRAINER+9, '40920', '501'), -- Glyph of Hurricane
(@CT_CLASS_TRAINER+9, '40908', '501'), -- Glyph of Innervate
(@CT_CLASS_TRAINER+9, '40919', '501'), -- Glyph of Insect Swarm
(@CT_CLASS_TRAINER+9, '40915', '501'), -- Glyph of Lifebloom
(@CT_CLASS_TRAINER+9, '40900', '501'), -- Glyph of Mangle
(@CT_CLASS_TRAINER+9, '40897', '501'), -- Glyph of Maul
(@CT_CLASS_TRAINER+9, '45622', '501'), -- Glyph of Monsoon
(@CT_CLASS_TRAINER+9, '40923', '501'), -- Glyph of Moonfire
(@CT_CLASS_TRAINER+9, '45603', '501'), -- Glyph of Nourish
(@CT_CLASS_TRAINER+9, '40903', '501'), -- Glyph of Rake
(@CT_CLASS_TRAINER+9, '50125', '501'), -- Glyph of Rapid Rejuvenation
(@CT_CLASS_TRAINER+9, '40909', '501'), -- Glyph of Rebirth
(@CT_CLASS_TRAINER+9, '40912', '501'), -- Glyph of Regrowth
(@CT_CLASS_TRAINER+9, '40913', '501'), -- Glyph of Rejuvenation
(@CT_CLASS_TRAINER+9, '40902', '501'), -- Glyph of Rip
(@CT_CLASS_TRAINER+9, '45604', '501'), -- Glyph of Savage Roar
(@CT_CLASS_TRAINER+9, '40901', '501'), -- Glyph of Shred
(@CT_CLASS_TRAINER+9, '40921', '501'), -- Glyph of Starfall
(@CT_CLASS_TRAINER+9, '40916', '501'), -- Glyph of Starfire
(@CT_CLASS_TRAINER+9, '46372', '501'), -- Glyph of Survival Instincts
(@CT_CLASS_TRAINER+9, '40906', '501'), -- Glyph of Swiftmend
(@CT_CLASS_TRAINER+9, '43335', '501'), -- Glyph of the Wild
(@CT_CLASS_TRAINER+9, '43332', '501'), -- Glyph of Thorns
(@CT_CLASS_TRAINER+9, '44922', '501'), -- Glyph of Typhoon
(@CT_CLASS_TRAINER+9, '43331', '501'), -- Glyph of Unburdened Rebirth
(@CT_CLASS_TRAINER+9, '45602', '501'), -- Glyph of Wild Growth
(@CT_CLASS_TRAINER+9, '40922', '501'); -- Glyph of Wrath
-- Beastmaster 26307
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+10);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+10, '0', '0', '0', '0', '0', '24028', '0', '0', '0', 'Beastmaster', NULL, NULL, '0', '70', '70', '2', '189', '189', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '0', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+10);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+10, '', '', 'Bestienmeister', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- Waffenmeister
-- Weapon master
-- Handiir 16773
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+0);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+0, '0', '0', '0', '0', '0', '17216', '0', '0', '0', 'Handiir', 'Weapon Master', NULL, '8591', '30', '30', '0', '189', '189', '81', '1.0', '1.14286', '1.0', '0', '42.0', '56.0', '0', '102', '1.0', '1500', '0', '1', '512', '8', '0', '2', '0', '0', '0', '29.0', '42.0', '9', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+0, '', '', 'Handiir', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+0);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '198', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '199', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '5011', '1000', '0', '0', '0');
-- Ileda 16621
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+1);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+1, '0', '0', '0', '0', '0', '16775', '0', '0', '0', 'Ileda', 'Weapon Master', NULL, '8612', '30', '30', '0', '189', '189', '81', '1.0', '1.14286', '1.0', '0', '30.0', '42.0', '0', '44', '1.0', '1500', '0', '8', '4608', '8', '0', '2', '0', '0', '0', '26.0', '38.0', '16', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+1);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+1, '', '', 'Ileda', '', '', '', '', '', NULL, NULL, 'Waffenmeisterin', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+1);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '200', '10000', '0', '0', '20');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '2567', '1000', '0', '0', '0');
-- Bixi Wobblebonk 13084
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+2);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+2, '0', '0', '0', '0', '0', '12992', '0', '0', '0', 'Bixi Wobblebonk', 'Weapon Master', NULL, '5277', '50', '50', '0', '189', '189', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '1500', '0', '1', '0', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '210', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+2);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+2, '', '', 'Bixi Wobbelbonk', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+2);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+2, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+2, '2567', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+2, '5011', '1000', '0', '0', '0');
-- Archibald 11870
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+3);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+3, '0', '0', '0', '0', '0', '11805', '0', '0', '0', 'Archibald', 'Weapon Master', NULL, '5269', '50', '50', '0', '189', '189', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '37376', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '264', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+3);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+3, '', '', 'Archibald', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+3);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '200', '10000', '0', '0', '20');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '5011', '1000', '0', '0', '0');
-- Ansekhwa 11869
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+4);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+4, '0', '0', '0', '0', '0', '11803', '0', '0', '0', 'Ansekhwa', 'Weapon Master', NULL, '5266', '50', '50', '0', '189', '189', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '473', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+4);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+4, '', '', 'Ansekhwa', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+4);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '198', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '199', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '266', '1000', '0', '0', '0');
-- Sayoc 11868
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+5);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+5, '0', '0', '0', '0', '0', '11801', '0', '0', '0', 'Sayoc', 'Weapon Master', NULL, '5221', '50', '50', '0', '189', '189', '83', '1.1', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1331', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+5);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+5, '', '', 'Sayoc', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+5);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '196', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '197', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '2567', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '15590', '1000', '0', '0', '0');
-- Woo Ping 11867
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+6);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+6, '0', '0', '0', '0', '0', '11804', '0', '0', '0', 'Woo Ping', 'Weapon Master', NULL, '5271', '50', '50', '0', '189', '189', '81', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '1500', '0', '1', '0', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '202', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+6);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+6, '', '', 'Woo Ping', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+6);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '200', '10000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '5011', '1000', '0', '0', '0');
-- Ilyenia Moonfire 11866
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+7);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+7, '0', '0', '0', '0', '0', '11802', '0', '0', '0', 'Ilyenia Moonfire', 'Weapon Master', NULL, '5273', '50', '50', '0', '189', '189', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '109', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+7);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+7, '', '', 'Ilyenia Mondfeuer', '', '', '', '', '', NULL, NULL, 'Waffenmeisterin', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+7);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '2567', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '15590', '1000', '0', '0', '0');
-- Buliwyf Stonehand 11865
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+8);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+8, '0', '0', '0', '0', '0', '11806', '0', '0', '0', 'Buliwyf Stonehand', 'Weapon Master', NULL, '5275', '50', '50', '0', '189', '189', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '1500', '0', '1', '0', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '201', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+8);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+8, '', '', 'Buliwyf Steinhand', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+8);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '196', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '197', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '198', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '199', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '266', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '15590', '1000', '0', '0', '0');
-- Hanashi 2704
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+9);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+9, '0', '0', '0', '0', '0', '12989', '0', '0', '0', 'Hanashi', 'Weapon Master', NULL, '5263', '50', '50', '0', '189', '189', '81', '1.1', '1.14286', '1.0', '0', '85.0', '112.0', '0', '206', '1.0', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '835', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+9);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+9, '', '', 'Hanashi', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+9);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '196', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '197', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '2567', '1000', '0', '0', '0');
 
 
-- -------------------------------------------------------------------------
-- ---- IMPORTANT: ONLY SET THESE VARIABLES, DO NOT TOUCH THE REST!!!! -----
-- -------------------------------------------------------------------------
-- Set all the important variables for the database
-- Replace xxx with a value (number)
-- NPC
-- NPC Teleporter:: ANFANG
SET @Entry = @CT_TELEPORTER_MAGE;  -- Creature Entry (need 1)
SET @Text = 100000; -- Gossip Texts (need 6)
SET @Main = 50050; -- Main gossip entry on creature (need 13)
SET @Scripts = 90000 ; 
-- Smart_script
SET @Script := 90000 ; -- scriptid iterator (need 84)
-- Conditional values
SET @Money_C := 0 ; -- How much users have to pay to travel to MAIN CITIES (in copper, set 0 for free usage)
SET @Money_T1 := 0 ; -- How much users have to pay to travel to TOWNS_TBC (in copper, set 0 for free usage)
SET @Money_T2 := 0 ; -- How much users have to pay to travel to TOWNS_WOTLK (in copper, set 0 for free usage)
SET @Money_A := 0 ; -- How much users have to pay to travel to ARENAS (in copper, set 0 for free usage)
SET @Money_I1 := 0 ; -- How much users have to pay to travel to DUNGEONS<60 (in copper, set 0 for free usage)
SET @Money_I2 := 0 ; -- How much users have to pay to travel to DUNGEONS_TBC (in copper, set 0 for free usage)
SET @Money_I3 := 0 ; -- How much users have to pay to travel to DUNGEONS_WOLTK (in copper, set 0 for free usage)
SET @Money_R1 := 0 ; -- How much users have to pay to travel to RAIDS<60 (in copper, set 0 for free usage)
SET @Money_R2 := 0 ; -- How much users have to pay to travel to RAIDS_TBC (in copper, set 0 for free usage)
SET @Money_R3 := 0 ; -- How much users have to pay to travel to RAIDS_WOLTK (in copper, set 0 for free usage)
-- --------------------------------------------------------------------------
-- ------- STOP HERE -- STOP HERE -- STOP HERE -- STOP HERE -- STOP HERE ----
-- --------------------------------------------------------------------------
 
-- ---------------------------------------------------------------------------
-- ------- DONT TOUCH THESE ----- DONT TOUCH THESE ----- DONT TOUCH THESE ----
-- ---------------------------------------------------------------------------
SET @Sub_Cities := @Main+1; -- Submenu: Cities
SET @Sub_Towns_BC := @Main+2; -- Submenu: Burning Crusade Towns
SET @Sub_Towns_WOTLK := @Main+3; -- Submenu: Wrath of Lich King Towns
SET @Sub_Arenas := @Main+4; -- Submenu: Arenas
SET @Sub_Instance1 := @Main+5; -- Submenu: Instances level 1-60
SET @Sub_Instance1_EK := @Main+6; -- Submenu: Instances level 1-60 Eastern Kingdoms
SET @Sub_Instance1_K := @Main+7; -- Submenu: Instances level 1-60 Kalimdor
SET @Sub_Instance2 := @Main+8; -- Submenu: Instances level 60-70
SET @Sub_Instance3 := @Main+9; -- Submenu: Instances level 70+
SET @Sub_Raid60 := @Main+10; -- Submenu: Raids level 60
SET @Sub_Raid70 := @Main+11; -- Submenu: Raids level 70
SET @Sub_Raid80 := @Main+12; -- Submenu: Raids level 80
SET @Script_Cities := @Scripts ; -- Submenu Scripts: Cities (need 10)
SET @Script_Towns := @Scripts+10 ; -- Submenu Scripts: Towns (need 21)
SET @Script_Arenas := @Scripts+32 ; -- Submenu Scripts: Arenas (need 4)
SET @Script_Instances := @Scripts+36 ; -- Submenu Scripts: Instances (need 31)
SET @Script_Raids := @Scripts+68 ; -- Submenu Scripts: Raids (need 16)
SET @ID := 0; -- iterator for script-subid
SET @opt := 0; -- Iterator for gossip_menu.option_id
-- Creature Definition
DELETE FROM `creature_template` WHERE `entry`=@Entry;
INSERT INTO creature_template (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(@Entry,0,0,0,0,0,29984,0,0,0, 'Teleporter Mage', 'Teleporting your PvP.Char', '',@Main,80,80,2,35,35,1,1,1.14286,1,0,346,499,0,287,1,0,0,8,512,8,0,0,0,0,0,315,468,69,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',0);
-- Text in Menus
DELETE FROM `npc_text` WHERE `ID` BETWEEN @Text AND @Text+5 ;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@Text, 'Select a Category.'),
(@Text+1, 'Select a City'),
(@Text+2, 'Hunterarea (Pets)');
/*
(@Text+3, 'Select an Arena'),
(@Text+4, 'Select an Instance'),
(@Text+5, 'Select a Raid Location');
*/
-- Gossip Menu Definition
DELETE FROM `gossip_menu` WHERE `entry` BETWEEN @Main AND @Main+12;
INSERT INTO gossip_menu (`entry`, `text_id`) VALUES
(@Main,@Text), -- "Select a Category"
(@Sub_Cities,@Text+1), -- "Select a City"
(@Sub_Towns_BC,@Text+2); -- "Select a Town"

-- ----------------------------------------
-- ---- Gossip Menu Options Definition ----
-- ----------------------------------------
DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @Main AND @Main+12 ;
INSERT INTO gossip_menu_option (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
-- -----------------
-- -- Main Window --
-- -----------------
(@Main,0,0, 'Azeroth Cities',1,1,@Sub_Cities,0,0,0, ''),
(@Main,1,0, 'Hunterarea (Pets)',1,1,@Sub_Towns_BC,0,0,0, ''),
/*
(@Main,2,0, 'Northrend Towns',1,1,@Sub_Towns_WOTLK,0,0,0, ''),
(@Main,3,0, 'Arenas',1,1,@Sub_Arenas,0,0,0, ''),
(@Main,4,0, 'Azeroth Instances',1,1,@Sub_Instance1,0,0,0, ''),
(@Main,5,0, 'Outland Instances',1,1,@Sub_Instance2,0,0,0, ''),
(@Main,6,0, 'Northrend Instances',1,1,@Sub_Instance3,0,0,0, ''),
(@Main,7,0, 'Azeroth Raids',1,1,@Sub_Raid60,0,0,0, ''),
(@Main,8,0, 'Outland Raids',1,1,@Sub_Raid70,0,0,0, ''),
(@Main,9,0, 'Northrend Raids',1,1,@Sub_Raid80,0,0,0, ''),
*/
-- --------------------
-- -- Cities Submenu --
-- --------------------
(@Sub_Cities,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- (@Sub_Cities,1,2, 'Teleport me to Dalaran please',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Dalaran?'),
(@Sub_Cities,2,2, 'Teleport me to Stormwind',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Stormwind?'),
-- (@Sub_Cities,3,2, 'Teleport me to Ironforge',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Ironforge'),
-- (@Sub_Cities,4,2, 'Teleport me to Darnassus',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Darnassus?'),
-- (@Sub_Cities,5,2, 'Teleport me to Exodar',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Exodar?'),
(@Sub_Cities,6,2, 'Teleport me to Orgrimmar',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Orgrimmar?'),
-- (@Sub_Cities,7,2, 'Teleport me to Undercity',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Undercity?'),
-- (@Sub_Cities,8,2, 'Teleport me to ThunderBluff',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Thunder Bluff?'),
-- (@Sub_Cities,9,2, 'Teleport me to Silvermoon',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Silvermoon City?'),
-- (@Sub_Cities,10,2, 'Teleport me to Shattrath',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Shattrath?'),
-- -----------------------------------
-- -- Burning Crusade Towns Submenu --
-- -----------------------------------
(@Sub_Towns_BC,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Ally
-- (@Sub_Towns_BC,1,2, 'Teleport me to Honor Hold please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Honor Hold?'),
-- (@Sub_Towns_BC,2,2, 'Teleport me to Telaar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Telaar?'),
-- (@Sub_Towns_BC,3,2, 'Teleport me to Sylvanaar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Sylvanaar?'),
-- (@Sub_Towns_BC,4,2, 'Teleport me to Wildhammer Stronghold please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Wildhammer Stronghold?'),
-- Horde
-- (@Sub_Towns_BC,5,2, 'Teleport me to Thunderlord Stronghold please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Thunderlord Stronghold?'),
-- (@Sub_Towns_BC,6,2, 'Teleport me to Thrallmar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Thrallmar?'),
-- (@Sub_Towns_BC,7,2, 'Teleport me to Garadar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Garadar?'),
-- (@Sub_Towns_BC,8,2, 'Teleport me to Shadowmoon Village please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Shadowmoon Village?'),
-- Neutral
-- WAS: Cenarion Refuge
(@Sub_Towns_BC,9,2, 'Teleport me to the Hunterarea please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit the Hunterarea?'),
-- (@Sub_Towns_BC,10,2, 'Teleport me to Ruuan Weald please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Ruuan Weald?'),
-- (@Sub_Towns_BC,11,2, 'Teleport me to Area52 please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Area52?'),
-- --------------------------------------
-- -- Wrath of Lich King Towns Submenu --
-- --------------------------------------
(@Sub_Towns_WOTLK,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Ally
(@Sub_Towns_WOTLK,1,2, 'Teleport me to Valiance Keep please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Valiance Keep?'),
(@Sub_Towns_WOTLK,2,2, 'Teleport me to Westguard Keep please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Westguard Keep?'),
(@Sub_Towns_WOTLK,3,2, 'Teleport me to Wintergarde Keep please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Wintergarde Keep?'),
(@Sub_Towns_WOTLK,4,2, 'Teleport me to Amberpine Lodge please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Amberpine Lodge?'),
-- Horde
(@Sub_Towns_WOTLK,5,2, 'Teleport me to Warsong Hold please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Warsong Hold?'),
(@Sub_Towns_WOTLK,6,2, 'Teleport me to Vengeance Landing please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Vengeance Landing?'),
(@Sub_Towns_WOTLK,7,2, 'Teleport me to Agmars Hammer please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Agmars Hammer?'),
(@Sub_Towns_WOTLK,8,2, 'Teleport me to Conquest Hold please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Conquest Hold?'),
-- Neutral
(@Sub_Towns_WOTLK,9,2, 'Teleport me to Wyrmrest Temple please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Wyrmrest Temple?'),
(@Sub_Towns_WOTLK,10,2, 'Teleport me to The Argent Stand please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit The Argent Stand?'),
(@Sub_Towns_WOTLK,11,2, 'Teleport me to The Argent Tournament please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit The Argent Tournament?'),
-- -------------------
-- -- Arena Submenu --
-- -------------------
(@Sub_Arenas,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Arenas
(@Sub_Arenas,1,2, 'Teleport me to Dire Maul Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Dire Maul Arena?'),
(@Sub_Arenas,2,2, 'Teleport me to Gurubashi Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Gurubashi Arena?'),
(@Sub_Arenas,3,2, 'Teleport me to the Circle of Blood Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Circle of Blood Arena?'),
(@Sub_Arenas,4,2, 'Teleport me to the Ring of Trials Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Ring of Trials Arena?'),
-- ----------------------------
-- -- Dungeons 1-60 Submenu --
-- ----------------------------
(@Sub_Instance1,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
(@Sub_Instance1,1,2, 'I want to go to Eastern Kingdoms Instances',1,1,@Sub_Instance1_EK,0,0,0, ''),
(@Sub_Instance1,2,2, 'I want to go to Kalimdor Instances',1,1,@Sub_Instance1_K,0,0,0, ''),
-- Eastern Kingdoms
(@Sub_Instance1_EK,0,2, 'What other locations can you teleport me to?',1,1,@Sub_Instance1,0,0,0, ''),
-- Dungeons_Eastern Kingdoms
(@Sub_Instance1_EK,1,2, 'Teleport me to Deadmines please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Deadmines?'),
(@Sub_Instance1_EK,2,2, 'Teleport me to Stormwind Stockades please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Stormwind Stockades?'),
(@Sub_Instance1_EK,3,2, 'Teleport me to Gnomeregan please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Gnomeregan?'),
(@Sub_Instance1_EK,4,2, 'Teleport me to Scarlet Monestry please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Scarlet Monestry?'),
(@Sub_Instance1_EK,5,2, 'Teleport me to Uldaman please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Uldaman?'),
(@Sub_Instance1_EK,6,2, 'Teleport me to Scholomance please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Scholomance?'),
(@Sub_Instance1_EK,7,2, 'Teleport me to Stratholme please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Stratholme?'),
(@Sub_Instance1_EK,8,2, 'Teleport me to Blackrock Mountain please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Blackrock Mountain?'),
(@Sub_Instance1_EK,9,2, 'Teleport me to Sunken Temple please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Sunken Temple?'),
-- Kalimdor
(@Sub_Instance1_K,0,2, 'What other locations can you teleport me to?',1,1,@Sub_Instance1,0,0,0, ''),
-- Dungeons_Kalimdor
(@Sub_Instance1_K,1,2, 'Teleport me to Ragefire Chasm please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Ragefire Chasm?'),
(@Sub_Instance1_K,2,2, 'Teleport me to Wailing Caverns please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Wailing Caverns?'),
(@Sub_Instance1_K,3,2, 'Teleport me to Blackfathom Deeps please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Blackfathom Deeps?'),
(@Sub_Instance1_K,4,2, 'Teleport me to Shadowfang Keep please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Shadowfang Keep?'),
(@Sub_Instance1_K,5,2, 'Teleport me to Razorfen Kraul please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Razorfen Kraul?'),
(@Sub_Instance1_K,6,2, 'Teleport me to Maraudon please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Maraudon?'),
(@Sub_Instance1_K,7,2, 'Teleport me to Dire Maul please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Dire Maul?'),
(@Sub_Instance1_K,8,2, 'Teleport me to Razorfen Downs please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Razorfen Downs?'),
(@Sub_Instance1_K,9,2, 'Teleport me to Zul Farrak please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Zul Farrak?'),
-- ----------------------------
-- -- Dungeons 60-70 Submenu --
-- ----------------------------
(@Sub_Instance2,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Dungeons
(@Sub_Instance2,1,2, 'Teleport me to Hellfire Citadel please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit Hellfire Citadel?'),
(@Sub_Instance2,2,2, 'Teleport me to Coilfang Reservoir please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit the Coilfang Reservoir?'),
(@Sub_Instance2,3,2, 'Teleport me to Auchindoun please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit Auchindoun?'),
(@Sub_Instance2,4,2, 'Teleport me to The Tempest Keep please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit the Tempest Keep?'),
(@Sub_Instance2,5,2, 'Teleport me to Caverns of Time please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit the Caverns of Time?'),
(@Sub_Instance2,6,2, 'Teleport me to Magisters Terrace please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit Magisters Terrace?'),
-- ----------------------------
-- -- Dungeons 70-80 Submenu --
-- ----------------------------
(@Sub_Instance3,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Dungeons
(@Sub_Instance3,1,2, 'Teleport me to Utguarde please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Utguarde?'),
(@Sub_Instance3,2,2, 'Teleport me to The Nexus please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit the Nexus?'),
(@Sub_Instance3,3,2, 'Teleport me to Pit of Narjun please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Pit of Narjun?'),
(@Sub_Instance3,4,2, 'Teleport me to Drak tharon please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Drak tharon?'),
(@Sub_Instance3,5,2, 'Teleport me to Gundrak please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Gundrak?'),
(@Sub_Instance3,6,2, 'Teleport me to Halls of Lightning and Stone please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Halls of Lightning/Stone?'),
(@Sub_Instance3,7,2, 'Teleport me to Culling of Stratholme please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Culling of Stratholme?'),
(@Sub_Instance3,8,2, 'Teleport me to Upper Icecrown Citadel please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Upper Icecrown Citadel?'),
-- -------------------
-- -- Azeroth Raids --
-- -------------------
(@Sub_Raid60,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Raids
(@Sub_Raid60,1,2, 'Teleport me to the Molten Core please' ,1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Molten Core?'),
(@Sub_Raid60,2,2, 'Teleport me to Ahn Qiraj 20 please',1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Ahn Qiraj 20?'),
(@Sub_Raid60,3,2, 'Teleport me to Ahn Qiraj 40 please',1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Ahn Qiraj 40?'),
(@Sub_Raid60,4,2, 'Teleport me to Zul Gurub please',1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Zul Gurub?'),
-- -------------------
-- -- Outland Raids --
-- -------------------
(@Sub_Raid70,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Raids
(@Sub_Raid70,1,2, 'Teleport me to the Black Temple please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Black Temple?'),
(@Sub_Raid70,2,2, 'Teleport me to Zul Aman please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Zul Aman?'),
(@Sub_Raid70,3,2, 'Teleport me to Karazhan please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Karazhan?'),
(@Sub_Raid70,4,2, 'Teleport me to the Tempest Keep please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Tempest Keep?'),
(@Sub_Raid70,5,2, 'Teleport me to Gruuls Lair please' ,1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Gruuls Lair?'),
-- ---------------------
-- -- Northrend Raids --
-- ---------------------
(@Sub_Raid80,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Raids
(@Sub_Raid80,1,2, 'Teleport me to Naxxramas please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit Naxxramas?'),
(@Sub_Raid80,2,2, 'Teleport me to the Eye of Eternity please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Eye of Eternity?'),
(@Sub_Raid80,3,2, 'Teleport me to the Obsidian Sanctuary please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Obsidian Sanctuary?'),
(@Sub_Raid80,4,2, 'Teleport me to Onyxias Lair please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit Onyxias Lair?'),
(@Sub_Raid80,5,2, 'Teleport me to Ulduar please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit Ulduar?'),
(@Sub_Raid80,6,2, 'Teleport me to the Ruby Sanctorum please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Ruby Sanctorum?'),
(@Sub_Raid80,7,2, 'Teleport me to the Icecrown Citadel please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Icecrown Citadel?');
-- -------------
-- -- Scripts --
-- -------------
-- IMPORTANT FOR SAI:
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @Entry;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN @Script AND @Script+83 AND`source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Entry AND `source_type` IN (0,9);
INSERT INTO `smart_scripts`
(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
-- ------------------
-- -- Initialising --
-- -------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+0,0,62,0,100,0,@Sub_Cities,@opt+1 ,0,0,80,@Script ,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+1,0,62,0,100,0,@Sub_Cities,@opt+2 ,0,0,80,@Script+1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+2,0,62,0,100,0,@Sub_Cities,@opt+3 ,0,0,80,@Script+2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+3,0,62,0,100,0,@Sub_Cities,@opt+4 ,0,0,80,@Script+3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+4,0,62,0,100,0,@Sub_Cities,@opt+5 ,0,0,80,@Script+4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+5,0,62,0,100,0,@Sub_Cities,@opt+6 ,0,0,80,@Script+5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+6,0,62,0,100,0,@Sub_Cities,@opt+7 ,0,0,80,@Script+6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+7,0,62,0,100,0,@Sub_Cities,@opt+8 ,0,0,80,@Script+7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+8,0,62,0,100,0,@Sub_Cities,@opt+9 ,0,0,80,@Script+8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+9,0,62,0,100,0,@Sub_Cities,@opt+10,0,0,80,@Script+9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+10,0,62,0,100,0,@Sub_Towns_BC,@opt+1 ,0,0,80,@Script+10,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+11,0,62,0,100,0,@Sub_Towns_BC,@opt+2 ,0,0,80,@Script+11,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+12,0,62,0,100,0,@Sub_Towns_BC,@opt+3 ,0,0,80,@Script+12,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+13,0,62,0,100,0,@Sub_Towns_BC,@opt+4 ,0,0,80,@Script+13,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+14,0,62,0,100,0,@Sub_Towns_BC,@opt+5 ,0,0,80,@Script+14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+15,0,62,0,100,0,@Sub_Towns_BC,@opt+6 ,0,0,80,@Script+15,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+16,0,62,0,100,0,@Sub_Towns_BC,@opt+7 ,0,0,80,@Script+16,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+17,0,62,0,100,0,@Sub_Towns_BC,@opt+8 ,0,0,80,@Script+17,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+18,0,62,0,100,0,@Sub_Towns_BC,@opt+9 ,0,0,80,@Script+18,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+19,0,62,0,100,0,@Sub_Towns_BC,@opt+10,0,0,80,@Script+19,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+20,0,62,0,100,0,@Sub_Towns_BC,@opt+11,0,0,80,@Script+20,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+21,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+1 ,0,0,80,@Script+21,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+22,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+2 ,0,0,80,@Script+22,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+23,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+3 ,0,0,80,@Script+23,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+24,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+4 ,0,0,80,@Script+24,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+25,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+5 ,0,0,80,@Script+25,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+26,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+6 ,0,0,80,@Script+26,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+27,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+7 ,0,0,80,@Script+27,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+28,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+8 ,0,0,80,@Script+28,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+29,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+9 ,0,0,80,@Script+29,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+30,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+10,0,0,80,@Script+30,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+31,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+11,0,0,80,@Script+31,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+32,0,62,0,100,0,@Sub_Arenas,@opt+1,0,0,80,@Script+32,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+33,0,62,0,100,0,@Sub_Arenas,@opt+2,0,0,80,@Script+33,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+34,0,62,0,100,0,@Sub_Arenas,@opt+3,0,0,80,@Script+34,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+35,0,62,0,100,0,@Sub_Arenas,@opt+4,0,0,80,@Script+35,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+36,0,62,0,100,0,@Sub_Instance1_EK,@opt+1 ,0,0,80,@Script+36,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+37,0,62,0,100,0,@Sub_Instance1_EK,@opt+2 ,0,0,80,@Script+37,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+38,0,62,0,100,0,@Sub_Instance1_EK,@opt+3 ,0,0,80,@Script+38,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+39,0,62,0,100,0,@Sub_Instance1_EK,@opt+4 ,0,0,80,@Script+39,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+40,0,62,0,100,0,@Sub_Instance1_EK,@opt+5 ,0,0,80,@Script+40,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+41,0,62,0,100,0,@Sub_Instance1_EK,@opt+6 ,0,0,80,@Script+41,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+42,0,62,0,100,0,@Sub_Instance1_EK,@opt+7 ,0,0,80,@Script+42,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+43,0,62,0,100,0,@Sub_Instance1_EK,@opt+8 ,0,0,80,@Script+43,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+44,0,62,0,100,0,@Sub_Instance1_EK,@opt+9 ,0,0,80,@Script+44,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+45,0,62,0,100,0,@Sub_Instance1_K,@opt+1,0,0,80,@Script+45,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+46,0,62,0,100,0,@Sub_Instance1_K,@opt+2,0,0,80,@Script+46,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+47,0,62,0,100,0,@Sub_Instance1_K,@opt+3,0,0,80,@Script+47,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+48,0,62,0,100,0,@Sub_Instance1_K,@opt+4,0,0,80,@Script+48,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+49,0,62,0,100,0,@Sub_Instance1_K,@opt+5,0,0,80,@Script+49,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+50,0,62,0,100,0,@Sub_Instance1_K,@opt+6,0,0,80,@Script+50,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+51,0,62,0,100,0,@Sub_Instance1_K,@opt+7,0,0,80,@Script+51,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+52,0,62,0,100,0,@Sub_Instance1_K,@opt+8,0,0,80,@Script+52,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+53,0,62,0,100,0,@Sub_Instance1_K,@opt+9,0,0,80,@Script+53,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+54,0,62,0,100,0,@Sub_Instance2,@opt+1,0,0,80,@Script+54,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+55,0,62,0,100,0,@Sub_Instance2,@opt+2,0,0,80,@Script+55,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+56,0,62,0,100,0,@Sub_Instance2,@opt+3,0,0,80,@Script+56,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+57,0,62,0,100,0,@Sub_Instance2,@opt+4,0,0,80,@Script+57,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+58,0,62,0,100,0,@Sub_Instance2,@opt+5,0,0,80,@Script+58,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+59,0,62,0,100,0,@Sub_Instance2,@opt+6,0,0,80,@Script+59,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+60,0,62,0,100,0,@Sub_Instance3,@opt+1,0,0,80,@Script+60,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+61,0,62,0,100,0,@Sub_Instance3,@opt+2,0,0,80,@Script+61,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+62,0,62,0,100,0,@Sub_Instance3,@opt+3,0,0,80,@Script+62,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+63,0,62,0,100,0,@Sub_Instance3,@opt+4,0,0,80,@Script+63,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+64,0,62,0,100,0,@Sub_Instance3,@opt+5,0,0,80,@Script+64,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+65,0,62,0,100,0,@Sub_Instance3,@opt+6,0,0,80,@Script+65,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+66,0,62,0,100,0,@Sub_Instance3,@opt+7,0,0,80,@Script+66,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+67,0,62,0,100,0,@Sub_Instance3,@opt+8,0,0,80,@Script+67,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+68,0,62,0,100,0,@Sub_Raid60,@opt+1,0,0,80,@Script+68,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+69,0,62,0,100,0,@Sub_Raid60,@opt+2,0,0,80,@Script+69,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+70,0,62,0,100,0,@Sub_Raid60,@opt+3,0,0,80,@Script+70,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+71,0,62,0,100,0,@Sub_Raid60,@opt+4,0,0,80,@Script+71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+72,0,62,0,100,0,@Sub_Raid70,@opt+1,0,0,80,@Script+72,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+73,0,62,0,100,0,@Sub_Raid70,@opt+2,0,0,80,@Script+73,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+74,0,62,0,100,0,@Sub_Raid70,@opt+3,0,0,80,@Script+74,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+75,0,62,0,100,0,@Sub_Raid70,@opt+4,0,0,80,@Script+75,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+76,0,62,0,100,0,@Sub_Raid70,@opt+5,0,0,80,@Script+76,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+77,0,62,0,100,0,@Sub_Raid80,@opt+1,0,0,80,@Script+77,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+78,0,62,0,100,0,@Sub_Raid80,@opt+2,0,0,80,@Script+78,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+79,0,62,0,100,0,@Sub_Raid80,@opt+3,0,0,80,@Script+79,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+80,0,62,0,100,0,@Sub_Raid80,@opt+4,0,0,80,@Script+80,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+81,0,62,0,100,0,@Sub_Raid80,@opt+5,0,0,80,@Script+81,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+82,0,62,0,100,0,@Sub_Raid80,@opt+6,0,0,80,@Script+82,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+83,0,62,0,100,0,@Sub_Raid80,@opt+7,0,0,80,@Script+83,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -- ActionScripts --
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Cities
(@Script+00,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+00,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5804,625,647.768,1.64, 'script - teleport to Dalaran'),
(@Script+01,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+01,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-9004,870,29.621,2.25, 'script - teleport to Stormwind'),
(@Script+02,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+02,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-4918.88,-940.406,501.564,5.42347, 'script - teleport to Ironforge'),
(@Script+03,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+03,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,9660.810,2513.640,1331.66,3.06, 'script - teleport to Darnassus'),
(@Script+04,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+04,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-4030.000,-11572.000,-138.296,2.43, 'script - teleport to Exodar'),
(@Script+05,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+05,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,1629.36,-4373.39,31.4828,5.98, 'script - teleport to Orgrimmar'),
/*
(@Script+06,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+06,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,1773.470,61.121,-46.32,2.32443, 'script - teleport to Undercity'),
(@Script+07,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+07,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-964.980,283.433,111.187,3.02, 'script - teleport to ThunderBluff'),
(@Script+08,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+08,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,9998.490,-7106.780,47.7055,2.44, 'script - teleport to SilvermoonCity'),
(@Script+09,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+09,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-1838.160,5301.790,-12.428,5.95, 'script - teleport to Shattrath'),
-- Towns TBC
(@Script+10,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+10,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-748.211,2681.52,100.35,5.7479, 'script - teleport to Honor Hold'),
(@Script+11,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+11,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-2560.76,7300.72,13.9485,2.18422, 'script - teleport to Telaar'),
(@Script+12,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+12,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2018.91,6854.47,171.409,0.087216, 'script - teleport to Sylvanaar'),
(@Script+13,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+13,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-3989.47,2168.39,105.35,3.08422, 'script - teleport to Wildhammer Stronghold'),
(@Script+14,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+14,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2314.75,6041.96,142.417,6.24317, 'script - teleport to Thunderlord Stronghold'),
(@Script+15,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+15,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,156.251,2673.45,85.1587,0.382074, 'script - teleport to Thrallmar'),
(@Script+16,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+16,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-1321.34,7239.12,32.7371,4.04169, 'script - teleport to Garadar'),
(@Script+17,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+17,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-2998.66,2568.9,76.6306,0.551303, 'script - teleport to Shadowmoon Village'),
*/
(@Script+18,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
-- WAS: Cenarion refugee (@Script+18,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-223.541,5487.99,23.2281,0.886755, 'script - teleport to Hunterarea'),
(@Script+18,9,1,0,0,0,100,0,1500,1500,0,0,62,429,0,0,0,0,0,0,8,0,0,48.5721,-268.792,-52.7521,0.886755, 'script - teleport to Hunterarea'),
(@Script+19,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+19,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2964.84,5663.43,146.879,5.89082, 'script - teleport to Ruuan Weald'),
(@Script+20,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+20,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,3043.33,3681.33,143.065,5.07464, 'script - teleport to Area52'),
-- Towns WOTLK
(@Script+21,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+21,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,2213.95,5273.15,11.2565,5.89294, 'script - teleport to Valliance Keep'),
(@Script+22,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+22,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,1391.04,-3284.63,163.929,1.59391, 'script - teleport to Westguard Keep'),
(@Script+23,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+23,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3682.71,-722.635,212.729,5.7991, 'script - teleport to Wintergarde Keep'),
(@Script+24,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+24,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3412.88,-2791.17,201.521,2.2458, 'script - teleport to Amberpine Lodge'),
(@Script+25,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+25,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,2741.29,6097.16,76.9055,0.731543, 'script - teleport to Warsong Hold'),
(@Script+26,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+26,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,1942.86,-6167.11,23.724,2.64258, 'script - teleport to Vengeance Landing'),
(@Script+27,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+27,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3834.80,1544.01,89.73,0.25, 'script - teleport to Agmars Hammer'),
(@Script+28,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+28,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3249.58,-2254.53,114.65,1.21, 'script - teleport to Conquest Hold'),
(@Script+29,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+29,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3546.02,278.09,45.60,4.85, 'script - teleport to Wyrmrest Temple'),
(@Script+30,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+30,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5451.05,-2597.77,306.622,4.67, 'script - teleport to The Argent Stand'),
(@Script+31,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+31,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,8515.89,629.25,547.396,1.5747, 'script - teleport to The Argent Tournament'),
-- Arenas
(@Script+32,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+32,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-3761.49,1133.43,132.083,4.57259, 'script - teleport to Dire Maul Arena'),
(@Script+33,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+33,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-13277.4,127.372,26.1418,1.11878, 'script - teleport to Gurubashi Arena'),
(@Script+34,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+34,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2839.44,5930.17,11.1002,3.16284, 'script - teleport to Circle of Blood Arena'),
(@Script+35,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+35,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-1999.94,6581.71,11.32,2.3, 'script - teleport to Ring of Trials Arena'),
-- Dungeons Eastern Kingdoms
(@Script+36,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+36,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-11208.7,1673.52,24.6361,1.51067, 'script - teleport to Deadmines'),
(@Script+37,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+37,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-8779.10,834.91,94.315,0.66, 'script - teleport to Stormwind Stockades'),
(@Script+38,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+38,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-5163.54,925.423,257.181,1.57423, 'script - teleport to Gnomeregan'),
(@Script+39,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+39,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,2872.6,-764.398,160.332,5.05735, 'script - teleport to Scarlet Monestry'),
(@Script+40,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+40,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-6071.37,-2955.16,209.782,0.015708, 'script - teleport to Uldaman'),
(@Script+41,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+41,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,1269.64,-2556.21,93.6088,0.620623, 'script - teleport to Scholomance'),
(@Script+42,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+42,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,3352.92,-3379.03,144.782,6.25978, 'script - teleport to Stratholme'),
(@Script+43,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+43,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-7494.94,-1123.49,265.547,3.3092, 'script - teleport to Blackrock Mountain'),
(@Script+44,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+44,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-10177.9,-3994.9,-111.239,6.01885, 'script - teleport to Sunken Temple'),
-- Dungeons Kalimdor
(@Script+45,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+45,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,1811.78,-4410.5,-18.4704,5.20165, 'script - teleport to Ragefire Chasm'),
(@Script+46,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+46,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-731.607,-2218.39,17.0281,2.78486, 'script - teleport to Wailing Caverns'),
(@Script+47,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+47,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,4249.99,740.102,-25.671,1.34, 'script - teleport to Blackfathom Deeps'),
(@Script+48,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+48,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-234.675,1561.63,76.8921,1.24031, 'script - teleport to Shadowfang Keep'),
(@Script+49,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+49,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-4470.28,-1677.77,81.3925,1.16302, 'script - teleport to Razorfen Kraul'),
(@Script+50,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+50,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-1419.13,2908.14,137.464,1.57366, 'script - teleport to Maraudon'),
(@Script+51,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+51,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-3981.01,1129.61,161.03,0.05, 'script - teleport to Dire Maul'),
(@Script+52,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+52,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-4657.3,-2519.35,81.0529,4.54808, 'script - teleport to Razorfen Downs'),
(@Script+53,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+53,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-6801.19,-2893.02,9.00388,0.158639, 'script - teleport to Zul Farrak'),
-- Dungeons TBC
(@Script+54,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+54,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-390.863,3130.64,4.51327,0.218692, 'script - teleport to Hellfire Citadel'),
(@Script+55,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+55,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,735.066,6883.45,-66.2913,5.89172, 'script - teleport to Coilfang Reservoir'),
(@Script+56,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+56,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-3324.49,4943.45,-101.239,4.63901, 'script - teleport to Auchindoun'),
(@Script+57,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+57,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2988.21,1806.9,139.071,3.8591, 'script - teleport to Tempest Keep'),
(@Script+58,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+58,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-8167.25,-4766.05,33.86,4.96, 'script - teleport to Caverns of Time'),
(@Script+59,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+59,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,12884.6,-7317.69,65.5023,4.799, 'script - teleport to Magister Terrace'),
-- Dungeons WOTLK
(@Script+60,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+60,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,1259.33,-4852.02,215.763,3.48293, 'script - teleport to Utgarde'),
(@Script+61,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+61,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3781.81,6953.65,104.82,0.467432, 'script - teleport to The Nexus'),
(@Script+62,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+62,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3707.86,2150.23,36.76,3.22, 'script - teleport to Pit of Narjun'),
(@Script+63,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+63,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,4774.6,-2032.92,229.15,1.59, 'script - teleport to DrakTharon Keep'),
(@Script+64,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+64,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,6898.72,-4584.94,451.12,2.34455, 'script - teleport to Gundrak'),
(@Script+65,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+65,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,9049.37,-1282.35,1060.19,5.8395, 'script - teleport to Halls of Stone/Lightning'),
(@Script+66,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+66,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,-8671.37,-4398.26,-207.01,3.44, 'script - teleport to Culling of Stratholme'),
(@Script+67,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+67,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5635.06,2052.08,798.05,4.68, 'script - teleport to Halls of Reflection'),
-- Raids lvl 60
(@Script+68,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+68,9,1,0,0,0,100,0,1500,1500,0,0,62,230,0,0,0,0,0,0,8,0,0,1121.45,-454.317,-101.33,3.5, 'script - teleport to Molten Core'),
(@Script+69,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+69,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-8409.03,1498.83,27.3615,2.49757, 'script - teleport to AQ20'),
(@Script+70,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+70,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-8245.84,1983.74,129.072,0.936195, 'script - teleport to AQ40'),
(@Script+71,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+71,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-11916.7,-1212.82,92.2868,4.6095, 'script - teleport to Zul Gurub'),
-- Raids lvl 70
(@Script+72,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+72,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-3610.72,324.988,37.4,3.28298, 'script - teleport to Black Temple'),
(@Script+73,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+73,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,6846.95,-7954.5,170.028,4.61501, 'script - teleport to Zul Aman'),
(@Script+74,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+74,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-11118.8,-2010.84,47.0807,0, 'script - teleport to Karazhan'),
(@Script+75,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+75,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,3089.58,1399.05,187.653,4.79407, 'script - teleport to Tempest Keep'),
(@Script+76,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+76,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,3539.01,5082.36,1.69107,0, 'script - teleport to Gruuls Lair'),
-- Raids lvl 80
(@Script+77,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+77,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3668.72,-1262.46,243.622,4.785, 'script - teleport to Naxxramas'),
(@Script+78,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+78,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3857.17,6990.71,152.10,5.87, 'script - teleport to Eye of Eternity'),
(@Script+79,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+79,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3516.08,269.89,-114.035,3.23, 'script - teleport to The Obsidian Sanctuary'),
(@Script+80,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+80,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-4708.27,-3727.64,54.5589,3.72786, 'script - teleport to Onyxias Lair'),
(@Script+81,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+81,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,9049.37,-1282.35,1060.19,5.8395, 'script - teleport to Ulduar'),
(@Script+82,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+82,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3598.44,198.52,-110.85,2.22, 'script - teleport to Ruby Sanctum'),
(@Script+83,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+83,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5873.82,2110.98,636.011,3.5523, 'script - teleport to Icecrown Citadel');
-- ----------------
-- -- Conditions --
-- ----------------
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` BETWEEN @Main AND @Main+12;
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Main Menu:
(15,@Main,1,0,27,55,3,0,0, '', 'Level 55+ Outland Towns'),
(15,@Main,2,0,27,70,3,0,0, '', 'Level 70+ Northrend Towns'),
(15,@Main,5,0,27,55,3,0,0, '', 'Level 55+ Outland Dungeons'),
(15,@Main,6,0,27,55,3,0,0, '', 'Level 70+ Northrend Dungeons'),
(15,@Main,7,0,27,60,3,0,0, '', 'Level 60+ Azeroth Raids'),
(15,@Main,8,0,27,70,3,0,0, '', 'Level 70+ Outland Raids'),
(15,@Main,9,0,27,80,3,0,0, '', 'Level 80+ Northrend Raids'),
-- Submenu: Cities
(15,@Sub_Cities,1,0,27,70,3,0,0, '', 'Level 70+ Dalaran'),
(15,@Sub_Cities,2,0,6,469,0,0,0, '', 'Ally: Stormwind'),
(15,@Sub_Cities,3,0,6,469,0,0,0, '', 'Ally: Ironforge'),
(15,@Sub_Cities,4,0,6,469,0,0,0, '', 'Ally: Darnassus'),
(15,@Sub_Cities,5,0,6,469,0,0,0, '', 'Ally: Exodar'),
(15,@Sub_Cities,6,0,6,67,0,0,0, '', 'Horde: Orgrimmar'),
(15,@Sub_Cities,7,0,6,67,0,0,0, '', 'Horde: Undercity'),
(15,@Sub_Cities,8,0,6,67,0,0,0, '', 'Horde: ThunderBluff'),
(15,@Sub_Cities,9,0,6,67,0,0,0, '', 'Horde: Silvermoon'),
(15,@Sub_Cities,10,0,27,60,3,0,0, '', 'Level 60+ Shattrath'),
-- Submenu: Towns BC
(15,@Sub_Towns_BC,1,0,6,469,0,0,0, '', 'Ally: Honor Hold'),
(15,@Sub_Towns_BC,2,0,6,469,0,0,0, '', 'Ally: Telaar'),
(15,@Sub_Towns_BC,3,0,6,469,0,0,0, '', 'Ally: Sylvanaar'),
(15,@Sub_Towns_BC,4,0,6,469,0,0,0, '', 'Ally: Wildhammer Stronghold'),
(15,@Sub_Towns_BC,5,0,6,67,0,0,0, '', 'Horde: Thunderlord Stronghold'),
(15,@Sub_Towns_BC,6,0,6,67,0,0,0, '', 'Horde: Thrallmar'),
(15,@Sub_Towns_BC,7,0,6,67,0,0,0, '', 'Horde: Garadar'),
(15,@Sub_Towns_BC,8,0,6,67,0,0,0, '', 'Horde: Shadowmoon Village'),
-- Submenu: Towns WOTLK
(15,@Sub_Towns_WOTLK,1,0,6,469,0,0,0, '', 'Ally: Valiance Keep'),
(15,@Sub_Towns_WOTLK,2,0,6,469,0,0,0, '', 'Ally: Westguard Keep'),
(15,@Sub_Towns_WOTLK,3,0,6,469,0,0,0, '', 'Ally: Wintergarde Keep'),
(15,@Sub_Towns_WOTLK,4,0,6,469,0,0,0, '', 'Ally: Amberpine Lodge'),
(15,@Sub_Towns_WOTLK,5,0,6,67,0,0,0, '', 'Horde: Warsong Hold'),
(15,@Sub_Towns_WOTLK,6,0,6,67,0,0,0, '', 'Horde: Vengeance Landing'),
(15,@Sub_Towns_WOTLK,7,0,6,67,0,0,0, '', 'Horde: Agmars Hammer'),
(15,@Sub_Towns_WOTLK,8,0,6,67,0,0,0, '', 'Horde: Conquest Hold');
/*
worldconfig
###################################################################################################################
#    PvP.Character.QuestId
#        This quest must be completed to make the character a PvP only char.
#        Default: 0 - Disable
#
#    PvP.Character.Vendor
#        Subname for PvP Vendors - if an NPC has this subtitle, then a PvP char gets everything for free
#        Default: empty
#
#    PvP.Character.AllowTrade
#        If you want to allow trade between PvP.Chars and PvE.Chars, then set this to 1
#        Default: 0 - PvE and PvP Chars are not allowed to trade
#
#    PvP.Character.AllowAuctionHouse
#        If you want that PvP.Chars can also use the auction house, then set this to 1
#        Default: 0 - PvP Chars are not allowed to use the auction house
#
###################################################################################################################
PvP.Character.QuestId = 32
PvP.Character.Vendor = LoL BG Team
PvP.Character.AllowTrade = 0
PvP.Character.AllowAuctionHouse = 0
*/