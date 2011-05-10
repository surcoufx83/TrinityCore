-- change some data of Ability: Death and Decay (Deathknight)
-- source: http://old.wowhead.com/spell=43265
DELETE FROM `spell_bonus_data` WHERE `entry`=52212;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(52212,0,-1,0,0.064,'Death Knight - Death and Decay');
-- (52212,0,-1,0.0475,-1,'Death Knight - Death and Decay'); -- old 