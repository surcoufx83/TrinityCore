-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32872';
--
-- eventAI for Runic Colossus, ID: 32872
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Charge (62614)
( '3287200', '32872', '0','0','100','5','2000','10000','10000','17500','11','62614','1','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Charge' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Charge (62613)
( '3287201', '32872', '0','0','100','3','7000','15000','10000','17500','11','62613','1','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Charge' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Runic Barrier (62338)
( '3287202', '32872', '0','0','100','1','12000','20000','10000','17500','11','62338','0','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Runic Barrier' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Smash (62339)
( '3287203', '32872', '0','0','100','1','17000','25000','10000','17500','11','62339','0','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Smash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32872';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32873';
--
-- eventAI for Ancient Rune Giant, ID: 32873
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Rune Detonation (62526)
( '3287300', '32873', '0','0','100','1','2000','10000','10000','17500','11','62526','1','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Rune Detonation' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Runic Fortification (62942)
( '3287301', '32873', '0','0','100','1','7000','15000','10000','17500','11','62942','0','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Runic Fortification' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Stomp (62411)
( '3287302', '32873', '0','0','100','3','12000','20000','10000','17500','11','62411','1','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Stomp' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Stomp (62413)
( '3287303', '32873', '0','0','100','5','17000','25000','10000','17500','11','62413','1','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Stomp' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32873';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32874';
--
-- eventAI for Iron Ring Guard, ID: 32874
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Ring Guard(32874) - Casts Impale (62331)
( '3287400', '32874', '0','0','100','3','2000','10000','10000','17500','11','62331','1','1','0','0','0','0','0','0','0','0','Iron Ring Guard - Casts Impale' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Ring Guard(32874) - Casts Impale (62418)
( '3287401', '32874', '0','0','100','5','7000','15000','10000','17500','11','62418','1','1','0','0','0','0','0','0','0','0','Iron Ring Guard - Casts Impale' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Ring Guard(32874) - Casts Whirling Trip (64151)
( '3287402', '32874', '0','0','100','1','12000','20000','10000','17500','11','64151','1','1','0','0','0','0','0','0','0','0','Iron Ring Guard - Casts Whirling Trip' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32874';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32875';
--
-- eventAI for Iron Honor Guard, ID: 32875
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Cleave (42724)
( '3287500', '32875', '0','0','100','1','2000','10000','10000','17500','11','42724','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Cleave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Hamstring (48639)
( '3287501', '32875', '0','0','100','1','7000','15000','10000','17500','11','48639','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Hamstring' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Shield Smash (62420)
( '3287502', '32875', '0','0','100','5','12000','20000','10000','17500','11','62420','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Shield Smash (62332)
( '3287503', '32875', '0','0','100','3','17000','25000','10000','17500','11','62332','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32875';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32876';
--
-- eventAI for Dark Rune Champion, ID: 32876
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Charge (32323)
( '3287600', '32876', '0','0','100','1','2000','10000','10000','17500','11','32323','1','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Charge' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Mortal Strike (35054)
( '3287601', '32876', '0','0','100','1','7000','15000','10000','17500','11','35054','1','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Mortal Strike' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Whirlwind (15578)
( '3287602', '32876', '0','0','100','1','12000','20000','10000','17500','11','15578','0','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Whirlwind' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Whirlwind (33500)
( '3287603', '32876', '0','0','100','1','17000','25000','10000','17500','11','33500','0','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Whirlwind' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32876';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32877';
--
-- eventAI for Dark Rune Warbringer, ID: 32877
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Warbringer(32877) - Casts Aura of Celerity (62320)
( '3287700', '32877', '0','0','100','1','2000','10000','10000','17500','11','62320','0','1','0','0','0','0','0','0','0','0','Dark Rune Warbringer - Casts Aura of Celerity' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Warbringer(32877) - Casts Runic Strike (62322)
( '3287701', '32877', '0','0','100','1','7000','15000','10000','17500','11','62322','1','1','0','0','0','0','0','0','0','0','Dark Rune Warbringer - Casts Runic Strike' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32877';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32878';
--
-- eventAI for Dark Rune Evoker, ID: 32878
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Lightning (62327) - raid10
( '3287800', '32878', '0','0','100','3','2000','10000','10000','17500','11','62327','1','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Lightning (62445) - raid25
( '3287801', '32878', '0','0','100','5','7000','15000','10000','17500','11','62445','1','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Lightning' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Mending (62446) - raid25
( '3287802', '32878', '14','0','100','5','30','3000','10000','17500','11','62446','6','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Mending' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Mending (62328) - raid10
( '3287803', '32878', '14','0','100','3','30','3000','10000','17500','11','62328','6','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Mending' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Shield (62529) - raid25
( '3287804', '32878', '0','0','100','5','22000','30000','10000','17500','11','62529','0','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Shield' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Shield (62321) - raid10
( '3287805', '32878', '0','0','100','3','27000','35000','10000','17500','11','62321','0','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Shield' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32878';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32882';
--
-- eventAI for Jormungar Behemoth, ID: 32882
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Acid Breath (62415)
( '3288200', '32882', '0','0','100','5','2000','10000','10000','17500','11','62415','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Acid Breath' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Acid Breath (62315)
( '3288201', '32882', '0','0','100','3','7000','15000','10000','17500','11','62315','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Acid Breath' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Sweep (62316)
( '3288202', '32882', '0','0','100','3','12000','20000','10000','17500','11','62316','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Sweep' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Sweep (62417)
( '3288203', '32882', '0','0','100','5','17000','25000','10000','17500','11','62417','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Sweep' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32882';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32886';
--
-- eventAI for Dark Rune Acolyte, ID: 32886
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Circle of Healing (61964)
( '3288600', '32886', '0','0','100','1','2000','10000','10000','17500','11','61964','0','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Circle of Healing' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Greater Heal (62334)
( '3288601', '32886', '14','0','100','1','30','15000','10000','17500','11','62334','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Greater Heal (61965)
( '3288602', '32886', '14','0','100','1','30','20000','10000','17500','11','61965','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Holy Smite (62335)
( '3288603', '32886', '0','0','100','1','17000','25000','10000','17500','11','62335','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Renew (61967)
( '3288604', '32886', '14','0','100','1','30','3000','10000','17500','11','61967','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32886';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32893';
--
-- eventAI for Missy Flamecuffs, ID: 32893
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Missy Flamecuffs(32893) - Casts Conjure Toasty Fire (62823)
( '3289300', '32893', '0','0','100','1','2000','10000','10000','17500','11','62823','1','1','0','0','0','0','0','0','0','0','Missy Flamecuffs - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Missy Flamecuffs(32893) - Casts Fireball (61909)
( '3289301', '32893', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Missy Flamecuffs - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Missy Flamecuffs(32893) - Casts Melt Ice (64528)
( '3289302', '32893', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Missy Flamecuffs - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3289303', '32893', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Missy Flamecuffs - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32893';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32897';
--
-- eventAI for Field Medic Penny, ID: 32897
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Field Medic Penny(32897) - Casts Dispel Magic (63499)
( '3289700', '32897', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Field Medic Penny - Casts Dispel Magic' ),
-- Cast timed spell: when Friendly target missing 3000 HP and then every 10000s and 17500s
-- Field Medic Penny(32897) - Casts Great Heal (62809)
( '3289701', '32897', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Field Medic Penny - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Field Medic Penny(32897) - Casts Smite (61923)
( '3289702', '32897', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Field Medic Penny - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3289703', '32897', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Field Medic Penny - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32897';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32900';
--
-- eventAI for Elementalist Avuun, ID: 32900
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Elementalist Avuun(32900) - Casts Lava Burst (61924)
( '3290000', '32900', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Elementalist Avuun - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Elementalist Avuun(32900) - Casts Storm Cloud (65123) - raid10
( '3290001', '32900', '0','0','100','3','7000','15000','10000','17500','11','65123','0','1','0','0','0','0','0','0','0','0','Elementalist Avuun - Casts Storm Cloud' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Elementalist Avuun(32900) - Casts Storm Cloud (65133) - raid25
( '3290002', '32900', '0','0','100','5','12000','20000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Elementalist Avuun - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3290003', '32900', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Elementalist Avuun - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32900';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32901';
--
-- eventAI for Ellie Nightfeather, ID: 32901
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ellie Nightfeather(32901) - Casts Wrath (62793)
( '3290100', '32901', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Ellie Nightfeather - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3290101', '32901', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Ellie Nightfeather - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32901';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32904';
--
-- eventAI for Dark Rune Commoner, ID: 32904
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Commoner(32904) - Casts Low Blow (62326)
( '3290400', '32904', '0','0','100','1','2000','10000','10000','17500','11','62326','1','1','0','0','0','0','0','0','0','0','Dark Rune Commoner - Casts Low Blow' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Commoner(32904) - Casts Pummel (38313)
( '3290401', '32904', '0','0','100','1','7000','15000','10000','17500','11','38313','1','1','0','0','0','0','0','0','0','0','Dark Rune Commoner - Casts Pummel' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32904';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32916';
--
-- eventAI for Snaplasher, ID: 32916
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Snaplasher(32916) - Casts Hardened Bark (62664)
( '3291600', '32916', '0','0','100','3','2000','10000','10000','17500','11','62664','0','1','0','0','0','0','0','0','0','0','Snaplasher - Casts Hardened Bark' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Snaplasher(32916) - Casts Hardened Bark (64191)
( '3291601', '32916', '0','0','100','5','7000','15000','10000','17500','11','64191','0','1','0','0','0','0','0','0','0','0','Snaplasher - Casts Hardened Bark' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32916';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32918';
--
-- eventAI for Detonating Lasher, ID: 32918
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Detonating Lasher(32918) - Casts Detonate (62937)
( '3291800', '32918', '0','0','100','5','2000','10000','10000','17500','11','62937','0','1','0','0','0','0','0','0','0','0','Detonating Lasher - Casts Detonate' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Detonating Lasher(32918) - Casts Detonate (62598)
( '3291801', '32918', '0','0','100','3','7000','15000','10000','17500','11','62598','0','1','0','0','0','0','0','0','0','0','Detonating Lasher - Casts Detonate' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Detonating Lasher(32918) - Casts Flame Lash (62608)
( '3291802', '32918', '0','0','100','1','12000','20000','10000','17500','11','62608','1','1','0','0','0','0','0','0','0','0','Detonating Lasher - Casts Flame Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32918';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32919';
--
-- eventAI for Storm Lasher, ID: 32919
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Lightning Lash (62648)
( '3291900', '32919', '0','0','100','3','2000','10000','10000','17500','11','62648','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Lightning Lash' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Lightning Lash (62939)
( '3291901', '32919', '0','0','100','5','7000','15000','10000','17500','11','62939','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Lightning Lash' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Stormbolt (62649)
( '3291902', '32919', '0','0','100','3','12000','20000','10000','17500','11','62649','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Stormbolt' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Stormbolt (62938)
( '3291903', '32919', '0','0','100','5','17000','25000','10000','17500','11','62938','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Stormbolt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32919';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32941';
--
-- eventAI for Tor Greycloud, ID: 32941
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Tor Greycloud(32941) - Casts Wrath (62793)
( '3294100', '32941', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Tor Greycloud - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3294101', '32941', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Tor Greycloud - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32941';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32946';
--
-- eventAI for Veesha Blazeweaver, ID: 32946
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- which target to cast to? is friendly npc...
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Veesha Blazeweaver(32946) - Casts Conjure Toasty Fire (62823)
( '3294600', '32946', '0','0','100','1','2000','10000','10000','17500','11','62823','0','1','0','0','0','0','0','0','0','0','Veesha Blazeweaver - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Veesha Blazeweaver(32946) - Casts Fireball (61909)
( '3294601', '32946', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Veesha Blazeweaver - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Veesha Blazeweaver(32946) - Casts Melt Ice (64528)
( '3294602', '32946', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Veesha Blazeweaver - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3294603', '32946', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Veesha Blazeweaver - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32946';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32948';
--
-- eventAI for Battle-Priest Eliza, ID: 32948
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Battle-Priest Eliza(32948) - Casts Dispel Magic (63499)
( '3294800', '32948', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Battle-Priest Eliza - Casts Dispel Magic' ),
-- Cast timed spell: when Friendly target missing 3000 HP and then every 10000s and 17500s
-- Battle-Priest Eliza(32948) - Casts Great Heal (62809)
( '3294801', '32948', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Battle-Priest Eliza - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Battle-Priest Eliza(32948) - Casts Smite (61923)
( '3294802', '32948', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Battle-Priest Eliza - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3294803', '32948', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Battle-Priest Eliza - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32948';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32950';
--
-- eventAI for Spiritwalker Yona, ID: 32950
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Spiritwalker Yona(32950) - Casts Lava Burst (61924)
( '3295000', '32950', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Spiritwalker Yona - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Spiritwalker Yona(32950) - Casts Storm Cloud (65133) - raid25
( '3295001', '32950', '0','0','100','5','7000','15000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Spiritwalker Yona - Casts Storm Cloud' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Spiritwalker Yona(32950) - Casts Storm Cloud (65123) - raid10
( '3295002', '32950', '0','0','100','3','12000','20000','10000','17500','11','65123','0','1','0','0','0','0','0','0','0','0','Spiritwalker Yona - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3295003', '32950', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Spiritwalker Yona - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32950';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32957';
--
-- eventAI for Dark Rune Acolyte, ID: 32957
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Greater Heal (62442)
( '3295700', '32957', '14','0','100','5','30','10000','10000','17500','11','62442','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Greater Heal (62334)
( '3295701', '32957', '14','0','100','3','30','15000','10000','17500','11','62334','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Holy Smite (62443)
( '3295702', '32957', '0','0','100','5','12000','20000','10000','17500','11','62443','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Holy Smite (62335)
( '3295703', '32957', '0','0','100','3','17000','25000','10000','17500','11','62335','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Renew (62333)
( '3295704', '32957', '14','0','100','3','30','30000','10000','17500','11','62333','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Renew (62441)
( '3295705', '32957', '14','0','100','5','30','35000','10000','17500','11','62441','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32957';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33052';
--
-- eventAI for Living Constellation, ID: 33052
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Living Constellation(33052) - Casts Arcane Barrage (64599)
( '3305200', '33052', '0','0','100','3','2000','10000','10000','17500','11','64599','1','1','0','0','0','0','0','0','0','0','Living Constellation - Casts Arcane Barrage' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Living Constellation(33052) - Casts Arcane Barrage (64607)
( '3305201', '33052', '0','0','100','5','7000','15000','10000','17500','11','64607','1','1','0','0','0','0','0','0','0','0','Living Constellation - Casts Arcane Barrage' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33052';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33060';
--
-- eventAI for Salvaged Siege Engine, ID: 33060
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Salvaged Siege Engine(33060) - Casts Electroshock (62522)
( '3306000', '33060', '0','0','100','3','2000','10000','10000','17500','11','62522','0','1','0','0','0','0','0','0','0','0','Salvaged Siege Engine - Casts Electroshock' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Salvaged Siege Engine(33060) - Casts Ram (62345)
( '3306001', '33060', '0','0','100','1','7000','15000','10000','17500','11','62345','1','1','0','0','0','0','0','0','0','0','Salvaged Siege Engine - Casts Ram' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Salvaged Siege Engine(33060) - Casts Steam Rush (62346)
( '3306002', '33060', '0','0','100','1','12000','20000','10000','17500','11','62346','1','1','0','0','0','0','0','0','0','0','Salvaged Siege Engine - Casts Steam Rush' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33060';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33062';
--
-- eventAI for Salvaged Chopper, ID: 33062
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Eject Passenger (67393)
( '3306200', '33062', '0','0','100','1','2000','10000','10000','17500','11','67393','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Eject Passenger' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Sonic Horn (62974)
( '3306201', '33062', '0','0','100','1','7000','15000','10000','17500','11','62974','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Sonic Horn' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Speed Boost (62299)
( '3306202', '33062', '0','0','100','1','12000','20000','10000','17500','11','62299','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Speed Boost' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Tar (62286)
( '3306203', '33062', '0','0','100','1','17000','25000','10000','17500','11','62286','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Tar' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33062';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33088';
--
-- eventAI for Iron Roots, ID: 33088
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Roots(33088) - Casts Iron Roots (63598)
( '3308800', '33088', '0','0','100','1','2000','10000','10000','17500','11','63598','1','1','0','0','0','0','0','0','0','0','Iron Roots - Casts Iron Roots' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33088';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33109';
--
-- eventAI for Salvaged Demolisher, ID: 33109
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Salvaged Demolisher(33109) - Casts Hurl Boulder (62306)
( '3310900', '33109', '0','0','100','1','2000','10000','10000','17500','11','62306','1','1','0','0','0','0','0','0','0','0','Salvaged Demolisher - Casts Hurl Boulder' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Salvaged Demolisher(33109) - Casts Hurl Pyrite Barrel (62490)
( '3310901', '33109', '0','0','100','1','7000','15000','10000','17500','11','62490','1','1','0','0','0','0','0','0','0','0','Salvaged Demolisher - Casts Hurl Pyrite Barrel' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Salvaged Demolisher(33109) - Casts Ram (62308)
( '3310902', '33109', '0','0','100','1','12000','20000','10000','17500','11','62308','1','1','0','0','0','0','0','0','0','0','Salvaged Demolisher - Casts Ram' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33109';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33110';
--
-- eventAI for Dark Rune Acolyte, ID: 33110
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Greater Heal (62442)
( '3311000', '33110', '14','0','100','5','30','15000','10000','17500','11','62442','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Greater Heal (62334)
( '3311001', '33110', '14','0','100','3','30','10000','10000','17500','11','62334','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Holy Smite (62335)
( '3311002', '33110', '0','0','100','3','12000','20000','10000','17500','11','62335','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Holy Smite (62443)
( '3311003', '33110', '0','0','100','5','17000','25000','10000','17500','11','62443','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Renew (62333)
( '3311004', '33110', '14','0','100','3','3000','30000','10000','17500','11','62333','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Renew (62441)
( '3311005', '33110', '14','0','100','5','30','35000','10000','17500','11','62441','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33110';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33125';
--
-- eventAI for Iron Honor Guard, ID: 33125
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Cleave (42724)
( '3312500', '33125', '0','0','100','1','2000','10000','10000','17500','11','42724','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Cleave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Hamstring (48639)
( '3312501', '33125', '0','0','100','1','7000','15000','10000','17500','11','48639','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Hamstring' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Shield Smash (62420)
( '3312502', '33125', '0','0','100','5','12000','20000','10000','17500','11','62420','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Shield Smash (62332)
( '3312503', '33125', '0','0','100','3','17000','25000','10000','17500','11','62332','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33125';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33136';
--
-- eventAI for Guardian of Yogg-Saron, ID: 33136
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Dark Volley (63038)
( '3313600', '33136', '0','0','100','1','2000','10000','10000','17500','11','63038','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Dark Volley' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Shadow Nova (65209)
( '3313601', '33136', '0','0','100','5','7000','15000','10000','17500','11','65209','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Shadow Nova' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Shadow Nova (62714)
( '3313602', '33136', '0','0','100','3','12000','20000','10000','17500','11','62714','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Shadow Nova' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Shadow Nova (65719)
( '3313603', '33136', '0','0','100','1','17000','25000','10000','17500','11','65719','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Shadow Nova' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33136';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33142';
--
-- eventAI for Leviathan Defense Turret, ID: 33142
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Leviathan Defense Turret(33142) - Casts Searing Flame (62402)
( '3314200', '33142', '0','0','100','1','2000','10000','10000','17500','11','62402','1','1','0','0','0','0','0','0','0','0','Leviathan Defense Turret - Casts Searing Flame' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33142';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33168';
--
-- eventAI for Strengthened Iron Roots, ID: 33168
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Strengthened Iron Roots(33168) - Casts Strengthened Iron Roots (63601)
( '3316800', '33168', '0','0','100','1','2000','10000','10000','17500','11','63601','1','1','0','0','0','0','0','0','0','0','Strengthened Iron Roots - Casts Strengthened Iron Roots' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33168';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33189';
--
-- eventAI for Liquid Pyrite, ID: 33189
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Liquid Pyrite(33189) - Casts General Trigger 2 to Vehicle (69745)
( '3318900', '33189', '0','0','100','1','2000','10000','10000','17500','11','69745','1','1','0','0','0','0','0','0','0','0','Liquid Pyrite - Casts General Trigger 2 to Vehicle' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Liquid Pyrite(33189) - Casts Liquid Pyrite (62494)
( '3318901', '33189', '0','0','100','1','7000','15000','10000','17500','11','62494','0','1','0','0','0','0','0','0','0','0','Liquid Pyrite - Casts Liquid Pyrite' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Liquid Pyrite(33189) - Casts Liquid Pyrite (62496)
( '3318902', '33189', '0','0','100','1','12000','20000','10000','17500','11','62496','1','1','0','0','0','0','0','0','0','0','Liquid Pyrite - Casts Liquid Pyrite' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33189';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33202';
--
-- eventAI for Ancient Water Spirit, ID: 33202
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ancient Water Spirit(33202) - Casts Tidal Wave (62653)
( '3320200', '33202', '0','0','100','3','2000','10000','10000','17500','11','62653','1','1','0','0','0','0','0','0','0','0','Ancient Water Spirit - Casts Tidal Wave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ancient Water Spirit(33202) - Casts Tidal Wave (62935)
( '3320201', '33202', '0','0','100','5','7000','15000','10000','17500','11','62935','1','1','0','0','0','0','0','0','0','0','Ancient Water Spirit - Casts Tidal Wave' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33202';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33203';
--
-- eventAI for Ancient Conservator, ID: 33203
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ancient Conservator(33203) - Casts Conservator''s Grip (62532)
( '3320300', '33203', '0','0','100','1','2000','10000','10000','17500','11','62532','0','1','0','0','0','0','0','0','0','0','Ancient Conservator - Casts Conservator''s Grip' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ancient Conservator(33203) - Casts Nature''s Fury (63571)
( '3320301', '33203', '0','0','100','5','7000','15000','10000','17500','11','63571','1','1','0','0','0','0','0','0','0','0','Ancient Conservator - Casts Nature''s Fury' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Ancient Conservator(33203) - Casts Nature''s Fury (62589)
( '3320302', '33203', '0','0','100','3','12000','20000','10000','17500','11','62589','1','1','0','0','0','0','0','0','0','0','Ancient Conservator - Casts Nature''s Fury' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33203';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33228';
--
-- eventAI for Eonar ''s Gift, ID: 33228
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Eonar ''s Gift(33228) - Casts Lifebinder''s Gift (64185)
( '3322800', '33228', '0','0','100','5','2000','10000','10000','17500','11','64185','1','1','0','0','0','0','0','0','0','0','Eonar ''s Gift - Casts Lifebinder''s Gift' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Eonar ''s Gift(33228) - Casts Lifebinder''s Gift (62584)
( '3322801', '33228', '0','0','100','3','7000','15000','10000','17500','11','62584','1','1','0','0','0','0','0','0','0','0','Eonar ''s Gift - Casts Lifebinder''s Gift' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Eonar ''s Gift(33228) - Casts Pheromones (62619)
( '3322802', '33228', '0','0','100','1','12000','20000','10000','17500','11','62619','0','1','0','0','0','0','0','0','0','0','Eonar ''s Gift - Casts Pheromones' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33228';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33236';
--
-- eventAI for Steelforged Defender, ID: 33236
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Steelforged Defender(33236) - Casts Hamstring (62845)
( '3323600', '33236', '0','0','100','1','2000','10000','10000','17500','11','62845','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Hamstring' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Steelforged Defender(33236) - Casts Lightning Bolt (57780)
( '3323601', '33236', '0','0','100','1','7000','15000','10000','17500','11','57780','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Lightning Bolt' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Steelforged Defender(33236) - Casts Sunder Armor (50370)
( '3323602', '33236', '0','0','100','1','12000','20000','10000','17500','11','50370','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Sunder Armor' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33236';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33237';
--
-- eventAI for Ulduar Colossus, ID: 33237
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ulduar Colossus(33237) - Casts Ground Slam (62625)
( '3323700', '33237', '0','0','100','1','2000','10000','10000','17500','11','62625','1','1','0','0','0','0','0','0','0','0','Ulduar Colossus - Casts Ground Slam' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33237';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33255';
--
-- eventAI for Titanium Stormlord, ID: 33255
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Titanium Stormlord(33255) - Casts Cyclone (62632)
( '3325500', '33255', '0','0','100','1','2000','10000','10000','17500','11','62632','1','1','0','0','0','0','0','0','0','0','Titanium Stormlord - Casts Cyclone' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Titanium Stormlord(33255) - Casts Cyclone (62633)
( '3325501', '33255', '0','0','100','1','7000','15000','10000','17500','11','62633','0','1','0','0','0','0','0','0','0','0','Titanium Stormlord - Casts Cyclone' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33255';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33325';
--
-- eventAI for Eivi Nightfeather, ID: 33325
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Eivi Nightfeather(33325) - Casts Wrath (62793)
( '3332500', '33325', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Eivi Nightfeather - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3332501', '33325', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Eivi Nightfeather - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33325';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33326';
--
-- eventAI for Field Medic Jessi, ID: 33326
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Field Medic Jessi(33326) - Casts Dispel Magic (63499)
( '3332600', '33326', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Field Medic Jessi - Casts Dispel Magic' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Field Medic Jessi(33326) - Casts Great Heal (62809)
( '3332601', '33326', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Field Medic Jessi - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Field Medic Jessi(33326) - Casts Smite (61923)
( '3332602', '33326', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Field Medic Jessi - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3332603', '33326', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Field Medic Jessi - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33326';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33327';
--
-- eventAI for Sissy Flamecuffs, ID: 33327
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Sissy Flamecuffs(33327) - Casts Conjure Toasty Fire (62823)
( '3332700', '33327', '0','0','100','1','2000','10000','10000','17500','11','62823','1','1','0','0','0','0','0','0','0','0','Sissy Flamecuffs - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Sissy Flamecuffs(33327) - Casts Fireball (61909)
( '3332701', '33327', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Sissy Flamecuffs - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Sissy Flamecuffs(33327) - Casts Melt Ice (64528)
( '3332702', '33327', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Sissy Flamecuffs - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3332703', '33327', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Sissy Flamecuffs - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33327';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33328';
--
-- eventAI for Elementalist Mahfuun, ID: 33328
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Elementalist Mahfuun(33328) - Casts Lava Burst (61924)
( '3332800', '33328', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Elementalist Mahfuun - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Elementalist Mahfuun(33328) - Casts Storm Cloud (65133)
( '3332801', '33328', '0','0','100','1','7000','15000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Elementalist Mahfuun - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3332802', '33328', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Elementalist Mahfuun - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33328';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33330';
--
-- eventAI for Battle-Priest Gina, ID: 33330
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Battle-Priest Gina(33330) - Casts Dispel Magic (63499)
( '3333000', '33330', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Battle-Priest Gina - Casts Dispel Magic' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Battle-Priest Gina(33330) - Casts Great Heal (62809)
( '3333001', '33330', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Battle-Priest Gina - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Battle-Priest Gina(33330) - Casts Smite (61923)
( '3333002', '33330', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Battle-Priest Gina - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3333003', '33330', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Battle-Priest Gina - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33330';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33331';
--
-- eventAI for Amira Blazeweaver, ID: 33331
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- which target to cast to?
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Amira Blazeweaver(33331) - Casts Conjure Toasty Fire (62823)
( '3333100', '33331', '0','0','100','1','2000','10000','10000','17500','11','62823','1','1','0','0','0','0','0','0','0','0','Amira Blazeweaver - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Amira Blazeweaver(33331) - Casts Fireball (61909)
( '3333101', '33331', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Amira Blazeweaver - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Amira Blazeweaver(33331) - Casts Melt Ice (64528)
( '3333102', '33331', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Amira Blazeweaver - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3333103', '33331', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Amira Blazeweaver - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33331';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33332';
--
-- eventAI for Spiritwalker Tara, ID: 33332
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Spiritwalker Tara(33332) - Casts Lava Burst (61924)
( '3333200', '33332', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Spiritwalker Tara - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Spiritwalker Tara(33332) - Casts Storm Cloud (65133)
( '3333201', '33332', '0','0','100','1','7000','15000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Spiritwalker Tara - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3333202', '33332', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Spiritwalker Tara - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33332';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33333';
--
-- eventAI for Kar Greycloud, ID: 33333
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Kar Greycloud(33333) - Casts Wrath (62793)
( '3333300', '33333', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Kar Greycloud - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3333301', '33333', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Kar Greycloud - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33333';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33344';
--
-- eventAI for XM-024 Pummeller, ID: 33344
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XM-024 Pummeller(33344) - Casts Arcing Smash (8374)
( '3334400', '33344', '0','0','100','1','2000','10000','10000','17500','11','8374','1','1','0','0','0','0','0','0','0','0','XM-024 Pummeller - Casts Arcing Smash' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- XM-024 Pummeller(33344) - Casts Trample (5568)
( '3334401', '33344', '0','0','100','1','7000','15000','10000','17500','11','5568','0','1','0','0','0','0','0','0','0','0','XM-024 Pummeller - Casts Trample' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- XM-024 Pummeller(33344) - Casts Uppercut (10966)
( '3334402', '33344', '0','0','100','1','12000','20000','10000','17500','11','10966','1','1','0','0','0','0','0','0','0','0','XM-024 Pummeller - Casts Uppercut' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33344';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33346';
--
-- eventAI for XE-321 Boombot, ID: 33346
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XE-321 Boombot(33346) - Casts Boom (62834)
( '3334600', '33346', '0','0','100','1','2000','10000','10000','17500','11','62834','1','1','0','0','0','0','0','0','0','0','XE-321 Boombot - Casts Boom' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33346';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33354';
--
-- eventAI for Corrupted Servitor, ID: 33354
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Corrupted Servitor(33354) - Casts Petrify Joints (63169)
( '3335400', '33354', '0','0','100','3','2000','10000','10000','17500','11','63169','1','1','0','0','0','0','0','0','0','0','Corrupted Servitor - Casts Petrify Joints' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Corrupted Servitor(33354) - Casts Petrify Joints (63549)
( '3335401', '33354', '0','0','100','5','7000','15000','10000','17500','11','63549','1','1','0','0','0','0','0','0','0','0','Corrupted Servitor - Casts Petrify Joints' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Corrupted Servitor(33354) - Casts Violent Earth (63149)
( '3335402', '33354', '0','0','100','1','12000','20000','10000','17500','11','63149','1','1','0','0','0','0','0','0','0','0','Corrupted Servitor - Casts Violent Earth' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33354';
-- Tue May 24 20:35:35 CEST 2011
-- >> CreatureEAILoot 2011-03-05 by kizura // 2.4.0 <<
-- Infos taken from WoWHead.com
-- Base URL: http://old.wowhead.com/
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33355';
--
-- eventAI for Misguided Nymph, ID: 33355
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Bind Life (63082) - raid10
( '3335500', '33355', '14','0','100','3','30','3000','10000','17500','11','63082','6','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Bind Life' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Bind Life (63559) - raid25
( '3335501', '33355', '14','0','100','5','30','3000','10000','17500','11','63559','6','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Bind Life' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Frost Spear (63111) - raid10
( '3335502', '33355', '0','0','100','3','12000','20000','10000','17500','11','63111','1','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Frost Spear' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Frost Spear (63562) - raid25
( '3335503', '33355', '0','0','100','5','17000','25000','10000','17500','11','63562','1','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Frost Spear' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Winter''s Embrace (63564) - raid25
( '3335504', '33355', '0','0','100','5','22000','30000','10000','17500','11','63564','0','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Winter''s Embrace' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Winter''s Embrace (63136) - raid10
( '3335505', '33355', '0','0','100','3','27000','35000','10000','17500','11','63136','0','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Winter''s Embrace' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33355';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33387';
--
-- eventAI for Writhing Lasher, ID: 33387
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Writhing Lasher(33387) - Casts Lash (65062)
( '3338700', '33387', '0','0','100','1','2000','10000','10000','17500','11','65062','1','1','0','0','0','0','0','0','0','0','Writhing Lasher - Casts Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33387';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33388';
--
-- eventAI for Dark Rune Guardian, ID: 33388
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Guardian(33388) - Casts Stormstrike (64757)
( '3338800', '33388', '0','0','100','1','2000','10000','10000','17500','11','64757','1','1','0','0','0','0','0','0','0','0','Dark Rune Guardian - Casts Stormstrike' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33388';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33430';
--
-- eventAI for Guardian Lasher, ID: 33430
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Guardian Lasher(33430) - Casts Guardian Pheromones (63007)
( '3343000', '33430', '0','0','100','1','2000','10000','10000','17500','11','63007','0','1','0','0','0','0','0','0','0','0','Guardian Lasher - Casts Guardian Pheromones' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Guardian Lasher(33430) - Casts Guardian''s Lash (63047)
( '3343001', '33430', '0','0','100','3','7000','15000','10000','17500','11','63047','1','1','0','0','0','0','0','0','0','0','Guardian Lasher - Casts Guardian''s Lash' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Guardian Lasher(33430) - Casts Guardian''s Lash (63550)
( '3343002', '33430', '0','0','100','5','12000','20000','10000','17500','11','63550','1','1','0','0','0','0','0','0','0','0','Guardian Lasher - Casts Guardian''s Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33430';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33431';
--
-- eventAI for Forest Swarmer, ID: 33431
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Forest Swarmer(33431) - Casts Pollinate (63059)
( '3343100', '33431', '0','0','100','1','2000','10000','10000','17500','11','63059','0','1','0','0','0','0','0','0','0','0','Forest Swarmer - Casts Pollinate' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33431';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33432';
--
-- eventAI for Leviathan Mk II, ID: 33432
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Emergency Mode (64582)
( '3343200', '33432', '0','0','100','1','2000','10000','10000','17500','11','64582','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Emergency Mode' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Flame Suppressant (64570)
( '3343201', '33432', '0','0','100','1','7000','15000','10000','17500','11','64570','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Flame Suppressant' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Proximity Mines (63027)
( '3343202', '33432', '0','0','100','1','12000','20000','10000','17500','11','63027','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Proximity Mines' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Self Repair (64383)
( '3343203', '33432', '0','0','100','1','17000','25000','10000','17500','11','64383','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Self Repair' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Shock Blast (63631)
( '3343204', '33432', '0','0','100','1','22000','30000','10000','17500','11','63631','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Shock Blast' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33432';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33453';
--
-- eventAI for Dark Rune Watcher, ID: 33453
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Chain Lightning (64759)
( '3345300', '33453', '0','0','100','5','2000','10000','10000','17500','11','64759','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Chain Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Chain Lightning (64758)
( '3345301', '33453', '0','0','100','3','7000','15000','10000','17500','11','64758','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Chain Lightning' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Lightning Bolt (63809)
( '3345302', '33453', '0','0','100','3','12000','20000','10000','17500','11','63809','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Lightning Bolt' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Lightning Bolt (64696)
( '3345303', '33453', '0','0','100','5','17000','25000','10000','17500','11','64696','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Lightning Bolt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33453';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33525';
--
-- eventAI for Mangrove Ent, ID: 33525
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Hurricane (63272)
( '3352500', '33525', '0','0','100','1','2000','10000','10000','17500','11','63272','1','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Hurricane' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Nourish (63556)
( '3352501', '33525', '0','0','100','5','7000','15000','10000','17500','11','63556','1','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Nourish' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Nourish (63242)
( '3352502', '33525', '0','0','100','3','12000','20000','10000','17500','11','63242','1','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Nourish' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Tranquility (63554)
( '3352503', '33525', '0','0','100','5','17000','25000','10000','17500','11','63554','0','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Tranquility' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Tranquility (63241)
( '3352504', '33525', '0','0','100','3','22000','30000','10000','17500','11','63241','0','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Tranquility' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33525';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33526';
--
-- eventAI for Ironroot Lasher, ID: 33526
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ironroot Lasher(33526) - Casts Ironroot Thorns (63240)
( '3352600', '33526', '0','0','100','3','2000','10000','10000','17500','11','63240','1','1','0','0','0','0','0','0','0','0','Ironroot Lasher - Casts Ironroot Thorns' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ironroot Lasher(33526) - Casts Ironroot Thorns (63553)
( '3352601', '33526', '0','0','100','5','7000','15000','10000','17500','11','63553','1','1','0','0','0','0','0','0','0','0','Ironroot Lasher - Casts Ironroot Thorns' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33526';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33527';
--
-- eventAI for Nature ''s Blade, ID: 33527
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Nature ''s Blade(33527) - Casts Living Tsunami (63247)
( '3352700', '33527', '0','0','100','3','2000','10000','10000','17500','11','63247','1','1','0','0','0','0','0','0','0','0','Nature ''s Blade - Casts Living Tsunami' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Nature ''s Blade(33527) - Casts Living Tsunami (63568)
( '3352701', '33527', '0','0','100','5','7000','15000','10000','17500','11','63568','1','1','0','0','0','0','0','0','0','0','Nature ''s Blade - Casts Living Tsunami' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33527';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33528';
--
-- eventAI for Guardian of Life, ID: 33528
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Guardian of Life(33528) - Casts Poison Breath (63226)
( '3352800', '33528', '0','0','100','3','2000','10000','10000','17500','11','63226','1','1','0','0','0','0','0','0','0','0','Guardian of Life - Casts Poison Breath' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Guardian of Life(33528) - Casts Poison Breath (63551)
( '3352801', '33528', '0','0','100','5','7000','15000','10000','17500','11','63551','1','1','0','0','0','0','0','0','0','0','Guardian of Life - Casts Poison Breath' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33528';
/* What Spells for ... ? No Spells in WoWHead
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33536';
--
-- eventAI for Alexstrasza, ID: 33536
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Bloodlust (54516)
( '3353600', '33536', '0','0','100','1','2000','10000','10000','17500','11','54516','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Bloodlust' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Break Bonds (59463)
( '3353601', '33536', '0','0','100','1','7000','15000','10000','17500','11','59463','0','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Break Bonds' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Chain Heal (59473)
( '3353602', '33536', '0','0','100','1','12000','20000','10000','17500','11','59473','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Chain Heal' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Cyclone (60236)
( '3353603', '33536', '0','0','100','1','17000','25000','10000','17500','11','60236','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Cyclone' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Devotion Aura (52442)
( '3353604', '33536', '0','0','100','1','22000','30000','10000','17500','11','52442','0','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Devotion Aura' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Earth Shield (59471)
( '3353605', '33536', '0','0','100','1','27000','35000','10000','17500','11','59471','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Earth Shield' ),
-- Cast timed spell: 32000ms to 40000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Earth Shock (54511)
( '3353606', '33536', '0','0','100','1','32000','40000','10000','17500','11','54511','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Earth Shock' ),
-- Cast timed spell: 37000ms to 45000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Exorcism (58822)
( '3353607', '33536', '0','0','100','1','37000','45000','10000','17500','11','58822','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Exorcism' ),
-- Cast timed spell: 42000ms to 50000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Flesh Rip (38056)
( '3353608', '33536', '0','0','100','1','42000','50000','10000','17500','11','38056','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Flesh Rip' ),
-- Cast timed spell: 47000ms to 55000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Holy Light (52444)
( '3353609', '33536', '0','0','100','1','47000','55000','10000','17500','11','52444','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Holy Light' ),
-- Cast timed spell: 52000ms to 60000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Lightning Bolt (59169)
( '3353610', '33536', '0','0','100','1','52000','60000','10000','17500','11','59169','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Lightning Bolt' ),
-- Cast timed spell: 57000ms to 65000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Lightning Bolt (53044)
( '3353611', '33536', '0','0','100','1','57000','65000','10000','17500','11','53044','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Lightning Bolt' ),
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33536';
*/
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33572';
--
-- eventAI for Steelforged Defender, ID: 33572
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Steelforged Defender(33572) - Casts Hamstring (62845)
( '3357200', '33572', '0','0','100','1','2000','10000','10000','17500','11','62845','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Hamstring' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Steelforged Defender(33572) - Casts Sunder Armor (50370)
( '3357201', '33572', '0','0','100','1','7000','15000','10000','17500','11','50370','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Sunder Armor' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33572';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33699';
--
-- eventAI for Storm Tempered Keeper, ID: 33699
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Forked Lightning (63541)
( '3369900', '33699', '0','0','100','1','2000','10000','10000','17500','11','63541','1','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Forked Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Separation Anxiety (63539)
( '3369901', '33699', '0','0','100','1','7000','15000','10000','17500','11','63539','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Separation Anxiety' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Summon Charged Sphere (63527)
( '3369902', '33699', '0','0','100','1','12000','20000','10000','17500','11','63527','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Summon Charged Sphere' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Vengeful Surge (63630)
( '3369903', '33699', '0','0','100','1','17000','25000','10000','17500','11','63630','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Vengeful Surge' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33699';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33715';
--
-- eventAI for Charged Sphere, ID: 33715
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Charged Sphere(33715) - Casts Supercharged (63528)
( '3371500', '33715', '0','0','100','1','2000','10000','10000','17500','11','63528','1','1','0','0','0','0','0','0','0','0','Charged Sphere - Casts Supercharged' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33715';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33722';
--
-- eventAI for Storm Tempered Keeper, ID: 33722
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Forked Lightning (63541)
( '3372200', '33722', '0','0','100','1','2000','10000','10000','17500','11','63541','1','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Forked Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Separation Anxiety (63539)
( '3372201', '33722', '0','0','100','1','7000','15000','10000','17500','11','63539','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Separation Anxiety' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Summon Charged Sphere (63527)
( '3372202', '33722', '0','0','100','1','12000','20000','10000','17500','11','63527','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Summon Charged Sphere' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Vengeful Surge (63630)
( '3372203', '33722', '0','0','100','1','17000','25000','10000','17500','11','63630','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Vengeful Surge' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33722';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33768';
--
-- eventAI for Rubble, ID: 33768
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Rubble(33768) - Casts Rumble (63818)
( '3376800', '33768', '0','0','100','3','2000','10000','10000','17500','11','63818','1','1','0','0','0','0','0','0','0','0','Rubble - Casts Rumble' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Rubble(33768) - Casts Stone Nova (63978)
( '3376801', '33768', '0','0','100','5','7000','15000','10000','17500','11','63978','1','1','0','0','0','0','0','0','0','0','Rubble - Casts Stone Nova' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33768';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33772';
--
-- eventAI for Faceless Horror, ID: 33772
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Death Grip (64429)
( '3377200', '33772', '0','0','100','1','2000','10000','10000','17500','11','64429','1','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Death Grip' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Shadow Crash (63722)
( '3377201', '33772', '0','0','100','1','7000','15000','10000','17500','11','63722','1','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Shadow Crash' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Void Barrier (63710)
( '3377202', '33772', '0','0','100','1','12000','20000','10000','17500','11','63710','0','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Void Barrier' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Void Wave (63703)
( '3377203', '33772', '0','0','100','1','17000','25000','10000','17500','11','63703','0','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Void Wave' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33772';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33806';
--
-- eventAI for Void Beast, ID: 33806
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Void Beast(33806) - Casts Shadow Nova (63723)
( '3380600', '33806', '0','0','100','1','2000','10000','10000','17500','11','63723','0','1','0','0','0','0','0','0','0','0','Void Beast - Casts Shadow Nova' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33806';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33818';
--
-- eventAI for Twilight Adherent, ID: 33818
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Arcane Burst (64663) - don't know which target: 0 - self or 1 - hostile (AoE-Cast)
( '3381800', '33818', '0','0','100','1','2000','10000','10000','17500','11','64663','1','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Arcane Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Blink (64662)
( '3381801', '33818', '0','0','100','1','7000','15000','10000','17500','11','64662','0','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Blink' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Greater Heal (63760)
( '3381802', '33818', '14','0','100','1','30','3000','10000','17500','11','63760','6','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Greater Heal' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Psychic Scream (13704) - don't know which target: 0 - self or 1 - hostile (AoE-Cast)
( '3381803', '33818', '0','0','100','1','17000','25000','10000','17500','11','13704','1','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Psychic Scream' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Renew (37978)
( '3381804', '33818', '14','0','100','1','30','3000','10000','17500','11','37978','6','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Renew' ),
-- Is humanoid: Flee at 15% hp
( '3381805', '33818', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Adherent - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33818';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33819';
--
-- eventAI for Twilight Frost Mage, ID: 33819
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Arcane Burst (64663)
( '3381900', '33819', '0','0','100','1','2000','10000','10000','17500','11','64663','0','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Arcane Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Blink (64662)
( '3381901', '33819', '0','0','100','1','7000','15000','10000','17500','11','64662','1','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Blink' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Frost Bolt Volley (63758)
( '3381902', '33819', '0','0','100','1','12000','20000','10000','17500','11','63758','1','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Frost Bolt Volley' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Frost Nova (63912)
( '3381903', '33819', '0','0','100','1','17000','25000','10000','17500','11','63912','0','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Frost Nova' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Frostbolt (63913)
( '3381904', '33819', '0','0','100','1','22000','30000','10000','17500','11','63913','1','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Frostbolt' ),
-- Is humanoid: Flee at 15% hp
( '3381905', '33819', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Frost Mage - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33819';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33820';
--
-- eventAI for Twilight Pyromancer, ID: 33820
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Arcane Burst (64663)
( '3382000', '33820', '0','0','100','1','2000','10000','10000','17500','11','64663','0','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Arcane Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Blink (64662)
( '3382001', '33820', '0','0','100','1','7000','15000','10000','17500','11','64662','1','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Blink' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Fireball (63789)
( '3382002', '33820', '0','0','100','1','12000','20000','10000','17500','11','63789','1','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Fireball' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Flamestrike (63775)
( '3382003', '33820', '0','0','100','1','17000','25000','10000','17500','11','63775','1','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Flamestrike' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Summon Fire Elemental (63774)
( '3382004', '33820', '0','0','100','1','22000','30000','10000','17500','11','63774','0','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Summon Fire Elemental' ),
-- Is humanoid: Flee at 15% hp
( '3382005', '33820', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Pyromancer - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33820';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33822';
--
-- eventAI for Twilight Guardian, ID: 33822
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Guardian(33822) - Casts Concussion Blow (52719)
( '3382200', '33822', '0','0','100','1','2000','10000','10000','17500','11','52719','1','1','0','0','0','0','0','0','0','0','Twilight Guardian - Casts Concussion Blow' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Guardian(33822) - Casts Devastate (62317)
( '3382201', '33822', '0','0','100','1','7000','15000','10000','17500','11','62317','1','1','0','0','0','0','0','0','0','0','Twilight Guardian - Casts Devastate' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Guardian(33822) - Casts Thunderclap (63757)
( '3382202', '33822', '0','0','100','1','12000','20000','10000','17500','11','63757','1','1','0','0','0','0','0','0','0','0','Twilight Guardian - Casts Thunderclap' ),
-- Is humanoid: Flee at 15% hp
( '3382203', '33822', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Guardian - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33822';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33823';
--
-- eventAI for Twilight Slayer, ID: 33823
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Slayer(33823) - Casts Bladestorm (63785)
( '3382300', '33823', '0','0','100','1','2000','10000','10000','17500','11','63785','0','1','0','0','0','0','0','0','0','0','Twilight Slayer - Casts Bladestorm' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Slayer(33823) - Casts Bladestorm (63784)
( '3382301', '33823', '0','0','100','1','7000','15000','10000','17500','11','63784','0','1','0','0','0','0','0','0','0','0','Twilight Slayer - Casts Bladestorm' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Slayer(33823) - Casts Mortal Strike (35054)
( '3382302', '33823', '0','0','100','1','12000','20000','10000','17500','11','35054','1','1','0','0','0','0','0','0','0','0','Twilight Slayer - Casts Mortal Strike' ),
-- Is humanoid: Flee at 15% hp
( '3382303', '33823', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Slayer - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33823';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33824';
--
-- eventAI for Twilight Shadowblade, ID: 33824
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Shadowblade(33824) - Casts Backstab (63754)
( '3382400', '33824', '0','0','100','1','2000','10000','10000','17500','11','63754','1','1','0','0','0','0','0','0','0','0','Twilight Shadowblade - Casts Backstab' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Shadowblade(33824) - Casts Fan of Knives (63753)
( '3382401', '33824', '0','0','100','1','7000','15000','10000','17500','11','63753','0','1','0','0','0','0','0','0','0','0','Twilight Shadowblade - Casts Fan of Knives' ),
-- Is humanoid: Flee at 15% hp
( '3382402', '33824', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Shadowblade - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33824';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33838';
--
-- eventAI for Enslaved Fire Elemental, ID: 33838
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Enslaved Fire Elemental(33838) - Casts Blast Wave (38064)
( '3383800', '33838', '0','0','100','1','2000','10000','10000','17500','11','38064','0','1','0','0','0','0','0','0','0','0','Enslaved Fire Elemental - Casts Blast Wave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Enslaved Fire Elemental(33838) - Casts Fire Shield (63778)
( '3383801', '33838', '0','0','100','1','7000','15000','10000','17500','11','63778','1','1','0','0','0','0','0','0','0','0','Enslaved Fire Elemental - Casts Fire Shield' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33838';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33846';
--
-- eventAI for Dark Rune Sentinel, ID: 33846
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Battle Shout (64062)
( '3384600', '33846', '0','0','100','5','2000','10000','10000','17500','11','64062','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Battle Shout' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Battle Shout (46763)
( '3384601', '33846', '0','0','100','3','7000','15000','10000','17500','11','46763','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Battle Shout' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Heroic Strike (45026)
( '3384602', '33846', '0','0','100','1','12000','20000','10000','17500','11','45026','1','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Heroic Strike' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Whirlwind (63807)
( '3384603', '33846', '0','0','100','5','17000','25000','10000','17500','11','63807','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Whirlwind' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Whirlwind (63808)
( '3384604', '33846', '0','0','100','5','22000','30000','10000','17500','11','63808','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Whirlwind' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33846';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33855';
--
-- eventAI for Junk Bot, ID: 33855
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Junk Bot(33855) - Casts Emergency Mode (64582)
( '3385500', '33855', '0','0','100','1','2000','10000','10000','17500','11','64582','0','1','0','0','0','0','0','0','0','0','Junk Bot - Casts Emergency Mode' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33855';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33966';
--
-- eventAI for Crusher Tentacle, ID: 33966
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Crusher Tentacle(33966) - Casts Diminish Power (64145)
( '3396600', '33966', '0','0','100','1','2000','10000','10000','17500','11','64145','1','1','0','0','0','0','0','0','0','0','Crusher Tentacle - Casts Diminish Power' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Crusher Tentacle(33966) - Casts Erupt (64144)
( '3396601', '33966', '0','0','100','1','7000','15000','10000','17500','11','64144','0','1','0','0','0','0','0','0','0','0','Crusher Tentacle - Casts Erupt' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Crusher Tentacle(33966) - Casts Focused Anger (57688)
( '3396602', '33966', '0','0','100','1','12000','20000','10000','17500','11','57688','0','1','0','0','0','0','0','0','0','0','Crusher Tentacle - Casts Focused Anger' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33966';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33983';
--
-- eventAI for Constrictor Tentacle, ID: 33983
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Constrictor Tentacle(33983) - Casts Erupt (64144)
( '3398300', '33983', '0','0','100','1','2000','10000','10000','17500','11','64144','0','1','0','0','0','0','0','0','0','0','Constrictor Tentacle - Casts Erupt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33983';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33985';
--
-- eventAI for Corruptor Tentacle, ID: 33985
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Apathy (64156)
( '3398500', '33985', '0','0','100','1','2000','10000','10000','17500','11','64156','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Apathy' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Black Plague (64153)
( '3398501', '33985', '0','0','100','1','7000','15000','10000','17500','11','64153','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Black Plague' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Curse of Doom (64157)
( '3398502', '33985', '0','0','100','1','12000','20000','10000','17500','11','64157','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Curse of Doom' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Draining Poison (64152)
( '3398503', '33985', '0','0','100','1','17000','25000','10000','17500','11','64152','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Draining Poison' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Erupt (64144)
( '3398504', '33985', '0','0','100','1','22000','30000','10000','17500','11','64144','0','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Erupt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33985';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33988';
--
-- eventAI for Immortal Guardian, ID: 33988
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Immortal Guardian(33988) - Casts Drain Life (64159)
( '3398800', '33988', '0','0','100','3','2000','10000','10000','17500','11','64159','1','1','0','0','0','0','0','0','0','0','Immortal Guardian - Casts Drain Life' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Immortal Guardian(33988) - Casts Drain Life (64160)
( '3398801', '33988', '0','0','100','5','7000','15000','10000','17500','11','64160','1','1','0','0','0','0','0','0','0','0','Immortal Guardian - Casts Drain Life' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33988';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34004';
--
-- eventAI for Life Spark, ID: 34004
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Life Spark(34004) - Casts Shock (64230)
( '3400400', '34004', '0','0','100','1','2000','10000','10000','17500','11','64230','1','1','0','0','0','0','0','0','0','0','Life Spark - Casts Shock' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Life Spark(34004) - Casts Static Charged (64236)
( '3400401', '34004', '0','0','100','5','7000','15000','10000','17500','11','64236','0','1','0','0','0','0','0','0','0','0','Life Spark - Casts Static Charged' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Life Spark(34004) - Casts Static Charged (64227)
( '3400402', '34004', '0','0','100','3','12000','20000','10000','17500','11','64227','0','1','0','0','0','0','0','0','0','0','Life Spark - Casts Static Charged' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34004';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34014';
--
-- eventAI for Sanctum Sentry, ID: 34014
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Rip Flesh (64375)
( '3401400', '34014', '0','0','100','3','2000','10000','10000','17500','11','64375','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Rip Flesh' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Rip Flesh (64667)
( '3401401', '34014', '0','0','100','5','7000','15000','10000','17500','11','64667','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Rip Flesh' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Savage Pounce (64666)
( '3401402', '34014', '0','0','100','5','12000','20000','10000','17500','11','64666','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Savage Pounce' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Savage Pounce (64374)
( '3401403', '34014', '0','0','100','3','17000','25000','10000','17500','11','64374','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Savage Pounce' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34014';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34035';
--
-- eventAI for Feral Defender, ID: 34035
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Feral Defender(34035) - Casts Feral Essence (64455)
( '3403500', '34035', '0','0','100','1','2000','10000','10000','17500','11','64455','0','1','0','0','0','0','0','0','0','0','Feral Defender - Casts Feral Essence' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Feral Defender(34035) - Casts Feral Pounce (64669)
( '3403501', '34035', '0','0','100','5','7000','15000','10000','17500','11','64669','1','1','0','0','0','0','0','0','0','0','Feral Defender - Casts Feral Pounce' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Feral Defender(34035) - Casts Feral Pounce (64478)
( '3403502', '34035', '0','0','100','3','12000','20000','10000','17500','11','64478','1','1','0','0','0','0','0','0','0','0','Feral Defender - Casts Feral Pounce' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34035';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34057';
--
-- eventAI for Assault Bot, ID: 34057
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Assault Bot(34057) - Casts Emergency Mode (64582)
( '3405700', '34057', '0','0','100','1','2000','10000','10000','17500','11','64582','0','1','0','0','0','0','0','0','0','0','Assault Bot - Casts Emergency Mode' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Assault Bot(34057) - Casts Magnetic Field (64668)
( '3405701', '34057', '0','0','100','1','7000','15000','10000','17500','11','64668','1','1','0','0','0','0','0','0','0','0','Assault Bot - Casts Magnetic Field' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34057';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34069';
--
-- eventAI for Molten Colossus, ID: 34069
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Molten Colossus(34069) - Casts Earthquake (64697)
( '3406900', '34069', '0','0','100','1','2000','10000','10000','17500','11','64697','0','1','0','0','0','0','0','0','0','0','Molten Colossus - Casts Earthquake' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Molten Colossus(34069) - Casts Pyroblast (64698)
( '3406901', '34069', '0','0','100','1','7000','15000','10000','17500','11','64698','1','1','0','0','0','0','0','0','0','0','Molten Colossus - Casts Pyroblast' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34069';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34085';
--
-- eventAI for Forge Construct, ID: 34085
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Forge Construct(34085) - Casts Charge (64719)
( '3408500', '34085', '0','0','100','1','2000','10000','10000','17500','11','64719','1','1','0','0','0','0','0','0','0','0','Forge Construct - Casts Charge' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Forge Construct(34085) - Casts Flame Emission (64721)
( '3408501', '34085', '0','0','100','5','7000','15000','10000','17500','11','64721','1','1','0','0','0','0','0','0','0','0','Forge Construct - Casts Flame Emission' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Forge Construct(34085) - Casts Flame Emission (64720)
( '3408502', '34085', '0','0','100','3','12000','20000','10000','17500','11','64720','1','1','0','0','0','0','0','0','0','0','Forge Construct - Casts Flame Emission' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34085';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34086';
--
-- eventAI for Magma Rager, ID: 34086
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Magma Rager(34086) - Casts Fire Blast (64773)
( '3408600', '34086', '0','0','100','1','2000','10000','10000','17500','11','64773','1','1','0','0','0','0','0','0','0','0','Magma Rager - Casts Fire Blast' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Magma Rager(34086) - Casts Superheated Winds (64746)
( '3408601', '34086', '0','0','100','1','7000','15000','10000','17500','11','64746','1','1','0','0','0','0','0','0','0','0','Magma Rager - Casts Superheated Winds' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34086';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34133';
--
-- eventAI for Champion of Hodir, ID: 34133
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Champion of Hodir(34133) - Casts Stomp (64639)
( '3413300', '34133', '0','0','100','3','2000','10000','10000','17500','11','64639','0','1','0','0','0','0','0','0','0','0','Champion of Hodir - Casts Stomp' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Champion of Hodir(34133) - Casts Stomp (64652)
( '3413301', '34133', '0','0','100','5','7000','15000','10000','17500','11','64652','0','1','0','0','0','0','0','0','0','0','Champion of Hodir - Casts Stomp' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34133';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34134';
--
-- eventAI for Winter Revenant, ID: 34134
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Blizzard (64642)
( '3413400', '34134', '0','0','100','3','2000','10000','10000','17500','11','64642','1','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Blizzard' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Blizzard (64653)
( '3413401', '34134', '0','0','100','5','7000','15000','10000','17500','11','64653','1','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Blizzard' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Shield of the Winter Revenant (64644)
( '3413402', '34134', '0','0','100','1','12000','20000','10000','17500','11','64644','0','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Shield of the Winter Revenant' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Whirling Strike (64643)
( '3413403', '34134', '0','0','100','1','17000','25000','10000','17500','11','64643','0','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Whirling Strike' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34134';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34135';
--
-- eventAI for Winter Rumbler, ID: 34135
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Cone of Cold (64645)
( '3413500', '34135', '0','0','100','3','2000','10000','10000','17500','11','64645','0','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Cone of Cold' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Cone of Cold (64655)
( '3413501', '34135', '0','0','100','5','7000','15000','10000','17500','11','64655','0','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Cone of Cold' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Snow Blindness (64647)
( '3413502', '34135', '0','0','100','3','12000','20000','10000','17500','11','64647','1','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Snow Blindness' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Snow Blindness (64654)
( '3413503', '34135', '0','0','100','5','17000','25000','10000','17500','11','64654','1','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Snow Blindness' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34135';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34137';
--
-- eventAI for Winter Jormungar, ID: 34137
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Winter Jormungar(34137) - Casts Acidic Bite (64638)
( '3413700', '34137', '0','0','100','1','2000','10000','10000','17500','11','64638','1','1','0','0','0','0','0','0','0','0','Winter Jormungar - Casts Acidic Bite' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34137';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34147';
--
-- eventAI for Emergency Fire Bot, ID: 34147
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Emergency Fire Bot(34147) - Casts Deafening Siren (64616)
( '3414700', '34147', '0','0','100','5','2000','10000','10000','17500','11','64616','0','1','0','0','0','0','0','0','0','0','Emergency Fire Bot - Casts Deafening Siren' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Emergency Fire Bot(34147) - Casts Water Spray (64619)
( '3414701', '34147', '0','0','100','1','7000','15000','10000','17500','11','64619','0','1','0','0','0','0','0','0','0','0','Emergency Fire Bot - Casts Water Spray' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34147';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34161';
--
-- eventAI for Mechanostriker 54-A, ID: 34161
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Mechanostriker 54-A(34161) - Casts Laser Barrage (64766)
( '3416100', '34161', '0','0','100','1','2000','10000','10000','17500','11','64766','1','1','0','0','0','0','0','0','0','0','Mechanostriker 54-A - Casts Laser Barrage' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34161';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34164';
--
-- eventAI for Mechagnome Battletank, ID: 34164
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Mechagnome Battletank(34164) - Casts Flame Cannon (64692)
( '3416400', '34164', '0','0','100','1','2000','10000','10000','17500','11','64692','1','1','0','0','0','0','0','0','0','0','Mechagnome Battletank - Casts Flame Cannon' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Mechagnome Battletank(34164) - Casts Jump Attack (64953)
( '3416401', '34164', '0','0','100','1','7000','15000','10000','17500','11','64953','1','1','0','0','0','0','0','0','0','0','Mechagnome Battletank - Casts Jump Attack' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34164';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34183';
--
-- eventAI for Arachnopod Destroyer, ID: 34183
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Arachnopod Destroyer(34183) - Casts Flame Spray (64717)
( '3418300', '34183', '0','0','100','1','2000','10000','10000','17500','11','64717','0','1','0','0','0','0','0','0','0','0','Arachnopod Destroyer - Casts Flame Spray' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Arachnopod Destroyer(34183) - Casts Machine Gun (64776)
( '3418301', '34183', '0','0','100','1','7000','15000','10000','17500','11','64776','1','1','0','0','0','0','0','0','0','0','Arachnopod Destroyer - Casts Machine Gun' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34183';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34184';
--
-- eventAI for Clockwork Mechanic, ID: 34184
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Clockwork Mechanic(34184) - Casts Ice Turret (64966)
( '3418400', '34184', '0','0','100','1','2000','10000','10000','17500','11','64966','0','1','0','0','0','0','0','0','0','0','Clockwork Mechanic - Casts Ice Turret' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34184';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34190';
--
-- eventAI for Hardened Iron Golem, ID: 34190
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Hardened Iron Golem(34190) - Casts Harden Fists (64877)
( '3419000', '34190', '0','0','100','1','2000','10000','10000','17500','11','64877','0','1','0','0','0','0','0','0','0','0','Hardened Iron Golem - Casts Harden Fists' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Hardened Iron Golem(34190) - Casts Rune Punch (64874)
( '3419001', '34190', '0','0','100','3','7000','15000','10000','17500','11','64874','1','1','0','0','0','0','0','0','0','0','Hardened Iron Golem - Casts Rune Punch' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Hardened Iron Golem(34190) - Casts Rune Punch (64967)
( '3419002', '34190', '0','0','100','5','12000','20000','10000','17500','11','64967','1','1','0','0','0','0','0','0','0','0','Hardened Iron Golem - Casts Rune Punch' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34190';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34193';
--
-- eventAI for Clockwork Sapper, ID: 34193
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Clockwork Sapper(34193) - Casts Energy Sap (64740)
( '3419300', '34193', '0','0','100','1','2000','10000','10000','17500','11','64740','1','1','0','0','0','0','0','0','0','0','Clockwork Sapper - Casts Energy Sap' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34193';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34196';
--
-- eventAI for Rune Etched Sentry, ID: 34196
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Flaming Rune (64852)
( '3419600', '34196', '0','0','100','1','2000','10000','10000','17500','11','64852','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Flaming Rune' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Lava Burst (64991)
( '3419601', '34196', '0','0','100','5','7000','15000','10000','17500','11','64991','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Lava Burst' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Lava Burst (64870)
( '3419602', '34196', '0','0','100','3','12000','20000','10000','17500','11','64870','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Lava Burst' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Runed Flame Jets (64988)
( '3419603', '34196', '0','0','100','5','17000','25000','10000','17500','11','64988','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Runed Flame Jets' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Runed Flame Jets (64847)
( '3419604', '34196', '0','0','100','3','22000','30000','10000','17500','11','64847','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Runed Flame Jets' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34196';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34197';
--
-- eventAI for Chamber Overseer, ID: 34197
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Devastating Leap (64943)
( '3419700', '34197', '0','0','100','5','2000','10000','10000','17500','11','64943','1','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Devastating Leap' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Devastating Leap (64820)
( '3419701', '34197', '0','0','100','3','7000','15000','10000','17500','11','64820','1','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Devastating Leap' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Displacement Device (64783)
( '3419702', '34197', '0','0','100','1','12000','20000','10000','17500','11','64783','1','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Displacement Device' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Staggering Roar (64944)
( '3419703', '34197', '0','0','100','5','17000','25000','10000','17500','11','64944','0','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Staggering Roar' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Staggering Roar (64825)
( '3419704', '34197', '0','0','100','3','22000','30000','10000','17500','11','64825','0','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Staggering Roar' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34197';
-- Tue May 24 20:48:58 CEST 2011
-- >> CreatureEAILoot 2011-03-05 by kizura // 2.4.0 <<
-- Infos taken from WoWHead.com
-- Base URL: http://old.wowhead.com/
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34198';
--
-- eventAI for Iron Mender, ID: 34198
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Electro Shock (64971)
( '3419800', '34198', '0','0','100','5','2000','10000','10000','17500','11','64971','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Electro Shock' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Electro Shock (64918)
( '3419801', '34198', '0','0','100','3','7000','15000','10000','17500','11','64918','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Electro Shock' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Lightning (64970)
( '3419802', '34198', '0','0','100','5','12000','20000','10000','17500','11','64970','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Lightning' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Lightning (64903)
( '3419803', '34198', '0','0','100','3','17000','25000','10000','17500','11','64903','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Lightning' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Metal (64897) - raid10
( '3419804', '34198', '14','0','100','3','20','3000','10000','17500','11','64897','6','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Metal' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Metal (64968) - raid25
( '3419805', '34198', '14','0','100','5','20','3000','10000','17500','11','64968','6','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Metal' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34198';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34199';
--
-- eventAI for Lightning Charged Iron Dwarf, ID: 34199
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Lightning Charged Iron Dwarf(34199) - Casts Lightning Charged (64889)
( '3419900', '34199', '0','0','100','3','2000','10000','10000','17500','11','64889','0','1','0','0','0','0','0','0','0','0','Lightning Charged Iron Dwarf - Casts Lightning Charged' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Lightning Charged Iron Dwarf(34199) - Casts Lightning Charged (64975)
( '3419901', '34199', '0','0','100','5','7000','15000','10000','17500','11','64975','0','1','0','0','0','0','0','0','0','0','Lightning Charged Iron Dwarf - Casts Lightning Charged' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34199';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34234';
--
-- eventAI for Runeforged Sentry, ID: 34234
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Runeforged Sentry(34234) - Casts Flaming Rune (64852)
( '3423400', '34234', '0','0','100','1','2000','10000','10000','17500','11','64852','1','1','0','0','0','0','0','0','0','0','Runeforged Sentry - Casts Flaming Rune' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Runeforged Sentry(34234) - Casts Lava Burst (64870)
( '3423401', '34234', '0','0','100','1','7000','15000','10000','17500','11','64870','1','1','0','0','0','0','0','0','0','0','Runeforged Sentry - Casts Lava Burst' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Runeforged Sentry(34234) - Casts Runed Flame Jets (64847)
( '3423402', '34234', '0','0','100','1','12000','20000','10000','17500','11','64847','1','1','0','0','0','0','0','0','0','0','Runeforged Sentry - Casts Runed Flame Jets' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34234';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34267';
--
-- eventAI for Parts Recovery Technician, ID: 34267
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Parts Recovery Technician(34267) - Casts Defense Matrix (65070)
( '3426700', '34267', '0','0','100','1','2000','10000','10000','17500','11','65070','1','1','0','0','0','0','0','0','0','0','Parts Recovery Technician - Casts Defense Matrix' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Parts Recovery Technician(34267) - Casts Mechano Kick (65071)
( '3426701', '34267', '0','0','100','1','7000','15000','10000','17500','11','65071','1','1','0','0','0','0','0','0','0','0','Parts Recovery Technician - Casts Mechano Kick' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34267';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34269';
--
-- eventAI for XR-949 Salvagebot, ID: 34269
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XR-949 Salvagebot(34269) - Casts Deploy Salvage Saws (65099)
( '3426900', '34269', '0','0','100','1','2000','10000','10000','17500','11','65099','0','1','0','0','0','0','0','0','0','0','XR-949 Salvagebot - Casts Deploy Salvage Saws' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34269';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34271';
--
-- eventAI for XD-175 Compactobot, ID: 34271
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XD-175 Compactobot(34271) - Casts Trash Compactor (65073)
( '3427100', '34271', '0','0','100','3','2000','10000','10000','17500','11','65073','1','1','0','0','0','0','0','0','0','0','XD-175 Compactobot - Casts Trash Compactor' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- XD-175 Compactobot(34271) - Casts Trash Compactor (65106)
( '3427101', '34271', '0','0','100','5','7000','15000','10000','17500','11','65106','1','1','0','0','0','0','0','0','0','0','XD-175 Compactobot - Casts Trash Compactor' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34271';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34273';
--
-- eventAI for XB-488 Disposalbot, ID: 34273
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XB-488 Disposalbot(34273) - Casts Cut Scrap Metal (65104)
( '3427300', '34273', '0','0','100','5','2000','10000','10000','17500','11','65104','1','1','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Casts Cut Scrap Metal' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- XB-488 Disposalbot(34273) - Casts Cut Scrap Metal (65080)
( '3427301', '34273', '0','0','100','3','7000','15000','10000','17500','11','65080','1','1','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Casts Cut Scrap Metal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- XB-488 Disposalbot(34273) - Casts Self Destruct (65084)
( '3427302', '34273', '0','0','100','1','12000','20000','10000','17500','11','65084','0','1','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Casts Self Destruct' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34273';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34275';
--
-- eventAI for Ward of Life, ID: 34275
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ward of Life(34275) - Casts Lash (65062)
( '3427500', '34275', '0','0','100','1','2000','10000','10000','17500','11','65062','1','1','0','0','0','0','0','0','0','0','Ward of Life - Casts Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34275';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34362';
--
-- eventAI for Proximity Mine, ID: 34362
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Proximity Mine(34362) - Casts Explosion (63009)
( '3436200', '34362', '0','0','100','1','2000','10000','10000','17500','11','63009','0','1','0','0','0','0','0','0','0','0','Proximity Mine - Casts Explosion' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Proximity Mine(34362) - Casts Explosion (66351)
( '3436201', '34362', '0','0','100','3','7000','15000','10000','17500','11','66351','0','1','0','0','0','0','0','0','0','0','Proximity Mine - Casts Explosion' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34362';
