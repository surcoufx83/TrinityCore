-- ########################## Argent Tournament #########################
-- ############# Questlinking and Fixes #################################
-- ###### By BroodWyrm ############ source wowhead Comments #############

-- The Argent Tournament ... No Prevs ... NextQuestInLine: Mastery Of Melee
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13828 WHERE entry = 13667;
-- The Argent Tournament ... No Prevs ... NextQuestInLine: Mastery Of Melee
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13829 WHERE entry = 13668;

-- ##### Aspirant Level

-- Mastery Of Melee - A - Prev: The Argent Tournament
UPDATE quest_template SET PrevQuestId = 13667, NextQuestId = 0, ExclusiveGroup = -13828, NextQuestInChain = 0 WHERE entry = 13828;
-- Mastery Of Melee - H - Prev: The Argent Tournament
UPDATE quest_template SET PrevQuestId = 13668, NextQuestId = 0, ExclusiveGroup = -13829, NextQuestInChain = 0 WHERE entry = 13829;

-- Mastery Of The Shield-Breaker - A - Prev: The Argent Tournament
UPDATE quest_template SET PrevQuestId = 13667, NextQuestId = 0, ExclusiveGroup = -13828, NextQuestInChain = 0 WHERE entry = 13835;
-- Mastery Of The Shield-Breaker - H - Prev: The Argent Tournament
UPDATE quest_template SET PrevQuestId = 13668, NextQuestId = 0, ExclusiveGroup = -13829, NextQuestInChain = 0 WHERE entry = 13838;

-- Mastery Of The Charge - A - Prev: The Argent Tournament
UPDATE quest_template SET PrevQuestId = 13667, NextQuestId = 0, ExclusiveGroup = -13828, NextQuestInChain = 0 WHERE entry = 13837;
-- Mastery Of The Charge - H - Prev: The Argent Tournament
UPDATE quest_template SET PrevQuestId = 13668, NextQuestId = 0, ExclusiveGroup = -13829, NextQuestInChain = 0 WHERE entry = 13839;

-- Up To The Challenge - A - Prev: Mastery Of Melee AND Shield-Breaker AND Charge ... NextQuestInChain: The Aspirant's Challenge
UPDATE quest_template SET PrevQuestId = 13828, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13679 WHERE entry = 13672;
-- Up To The Challenge - H - Prev: Mastery Of Melee AND Shield-Breaker AND Charge ... NextQuestInChain: The Aspirant's Challenge
UPDATE quest_template SET PrevQuestId = 13829, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13680 WHERE entry = 13678;

-- The Aspirant's Challenge - A - Prev: Up To The Challenge
UPDATE quest_template SET PrevQuestId = 13672, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13679;
-- The Aspirant's Challenge - H - Prev: Up To The Challenge
UPDATE quest_template SET PrevQuestId = 13678, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13680;

-- ## Dailys
-- Req: Up To The Challenge active and not rewarded
DELETE FROM conditions WHERE SourceTypeOrReferenceId = -13672; 
INSERT INTO conditions VALUES
(-13672,0,0,0,9,13672,0,0,0,'',''),
(-13672,0,0,0,14,13679,0,0,0,'',''),
(-13672,0,0,1,9,13678,0,0,0,'',''),
(-13672,0,0,1,14,13680,0,0,0,'','');

-- Learning the Reins - A 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13625;
DELETE FROM conditions WHERE SourceEntry = 13625 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13625,0,-13672,0,0,0,0,'',''),
(19,0,13625,0,-13672,0,0,0,0,'','');
-- Learning the Reins - H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13677;
DELETE FROM conditions WHERE SourceEntry = 13677 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13677,0,-13672,0,0,0,0,'',''),
(19,0,13677,0,-13672,0,0,0,0,'','');

-- Training In The Field - A
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13671;
DELETE FROM conditions WHERE SourceEntry = 13671 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13671,0,-13672,0,0,0,0,'',''),
(19,0,13671,0,-13672,0,0,0,0,'','');
-- Training In The Field - H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13676;
DELETE FROM conditions WHERE SourceEntry = 13676 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13676,0,-13672,0,0,0,0,'',''),
(19,0,13676,0,-13672,0,0,0,0,'','');

-- A Worthy Weapon - A
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13669;
DELETE FROM conditions WHERE SourceEntry = 13669 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13669,0,-13672,0,0,0,0,'',''),
(19,0,13669,0,-13672,0,0,0,0,'','');
-- A Worthy Weapon - H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13674;
DELETE FROM conditions WHERE SourceEntry = 13674 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13674,0,-13672,0,0,0,0,'',''),
(19,0,13674,0,-13672,0,0,0,0,'','');

-- A Blade Fit For A Champion - A
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13666;
DELETE FROM conditions WHERE SourceEntry = 13666 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13666,0,-13672,0,0,0,0,'',''),
(19,0,13666,0,-13672,0,0,0,0,'','');
-- A Blade Fit For A Champion - H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13673;
DELETE FROM conditions WHERE SourceEntry = 13673 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13673,0,-13672,0,0,0,0,'',''),
(19,0,13673,0,-13672,0,0,0,0,'','');

-- The Edge Of Winter - A
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13670;
DELETE FROM conditions WHERE SourceEntry = 13670 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13670,0,-13672,0,0,0,0,'',''),
(19,0,13670,0,-13672,0,0,0,0,'','');
-- The Edge Of Winter - H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13675;
DELETE FROM conditions WHERE SourceEntry = 13675 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13675,0,-13672,0,0,0,0,'',''),
(19,0,13675,0,-13672,0,0,0,0,'','');

-- Questpooling -- not needed
/*
DELETE FROM pool_template WHERE entry IN (13674,13669);
INSERT INTO pool_template VALUES
(13669,1,'Tournament - Aspirant - Weapon Quest'),
(13674,1,'Tournament - Aspirant - Weapon Quest');

DELETE FROM pool_quest WHERE pool_entry IN (13674,13669);
INSERT INTO pool_quest VALUES 
(13669,13669,'Tournament - Aspirant - Weapon Quest - A - A Worthy Weapon'),
(13666,13669,'Tournament - Aspirant - Weapon Quest - A - A Blade Fit For A Champion'),
(13670,13669,'Tournament - Aspirant - Weapon Quest - A - The Edge Of Winter'),
(13674,13674,'Tournament - Aspirant - Weapon Quest - H - A Worthy Weapon'),
(13673,13674,'Tournament - Aspirant - Weapon Quest - H - A Blade Fit For A Champion'),
(13675,13674,'Tournament - Aspirant - Weapon Quest - H - The Edge Of Winter');
*/

-- A Valiant of ... Prev: The Aspirant's Challenge
-- A Valiant Of Darnassus
UPDATE quest_template SET PrevQuestId = 13679, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13689;
-- A Valiant Of Gnomeregan
UPDATE quest_template SET PrevQuestId = 13679, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13688;
-- A Valiant Of Ironforge
UPDATE quest_template SET PrevQuestId = 13679, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13685;
-- A Valiant Of Stormwind
UPDATE quest_template SET PrevQuestId = 13679, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13684;
-- A Valiant Of The Exodar
UPDATE quest_template SET PrevQuestId = 13679, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13690;

-- A Valiant Of Orgrimmar
UPDATE quest_template SET PrevQuestId = 13680, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13691;
-- A Valiant Of Sen'jin
UPDATE quest_template SET PrevQuestId = 13680, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13693;
-- A Valiant Of Silvermoon
UPDATE quest_template SET PrevQuestId = 13680, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13696;
-- A Valiant Of Thunder Bluff
UPDATE quest_template SET PrevQuestId = 13680, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13694;
-- A Valiant Of Undercity
UPDATE quest_template SET PrevQuestId = 13680, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13695;

-- ##### Valiant Level

-- The Valiant's Charge ... Prev: A Valiant Of ...
-- The Valiant's Charge - Sen'jin ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13693, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13727 WHERE entry = 13719;
-- The Valiant's Charge - Thunder Bluff ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13694, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13728 WHERE entry = 13720;
-- The Valiant's Charge - Undercity ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13695, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13729 WHERE entry = 13721;
-- The Valiant's Charge - Silvermoon City ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13696, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13731 WHERE entry = 13722;
-- The Valiant's Charge - Orgrimmar ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13691, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13726 WHERE entry = 13697;
-- The Valiant's Charge - Stormwind ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13684, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13699 WHERE entry = 13718;
-- The Valiant's Charge - Gnomeregan ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13688, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13723 WHERE entry = 13715;
-- The Valiant's Charge - The Exodar ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13690, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13724 WHERE entry = 13716;
-- The Valiant's Charge - Darnassus ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13689, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13725 WHERE entry = 13717;
-- The Valiant's Charge - Ironforge ... NextQuestInLine: The Valiant's Challenge
UPDATE quest_template SET PrevQuestId = 13685, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13713 WHERE entry = 13714;

-- Daily:
-- Req: The Valiant's Charge and not The Valiant's Challenge
DELETE FROM conditions WHERE SourceTypeOrReferenceId = -13719; 
INSERT INTO conditions VALUES
(-13719,0,0,0,9,13719,0,0,0,'',''),
(-13719,0,0,0,14,13727,0,0,0,'',''),
(-13719,0,0,1,9,13720,0,0,0,'',''),
(-13719,0,0,1,14,13728,0,0,0,'',''),
(-13719,0,0,2,9,13721,0,0,0,'',''),
(-13719,0,0,2,14,13729,0,0,0,'',''),
(-13719,0,0,3,9,13722,0,0,0,'',''),
(-13719,0,0,3,14,13731,0,0,0,'',''),
(-13719,0,0,4,9,13697,0,0,0,'',''),
(-13719,0,0,4,14,13726,0,0,0,'',''),
(-13719,0,0,5,9,13718,0,0,0,'',''),
(-13719,0,0,5,14,13699,0,0,0,'',''),
(-13719,0,0,6,9,13715,0,0,0,'',''),
(-13719,0,0,6,14,13723,0,0,0,'',''),
(-13719,0,0,7,9,13716,0,0,0,'',''),
(-13719,0,0,7,14,13724,0,0,0,'',''),
(-13719,0,0,8,9,13717,0,0,0,'',''),
(-13719,0,0,8,14,13725,0,0,0,'',''),
(-13719,0,0,9,9,13714,0,0,0,'',''),
(-13719,0,0,9,14,13713,0,0,0,'','');

-- A Blade Fit For A Champion - Senjin
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13768;
DELETE FROM conditions WHERE SourceEntry = 13768 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13768,0,-13719,0,0,0,0,'',''),
(19,0,13768,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Thunder Bluff
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13773;
DELETE FROM conditions WHERE SourceEntry = 13773 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13773,0,-13719,0,0,0,0,'',''),
(19,0,13773,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Undercity
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13778;
DELETE FROM conditions WHERE SourceEntry = 13778 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13778,0,-13719,0,0,0,0,'',''),
(19,0,13778,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Silvermoon City
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13783;
DELETE FROM conditions WHERE SourceEntry = 13783 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13783,0,-13719,0,0,0,0,'',''),
(19,0,13783,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Orgrimmar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13762;
DELETE FROM conditions WHERE SourceEntry = 13762 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13762,0,-13719,0,0,0,0,'',''),
(19,0,13762,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Stormwind
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13603;
DELETE FROM conditions WHERE SourceEntry = 13603 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13603,0,-13719,0,0,0,0,'',''),
(19,0,13603,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Gnomeregan
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13746;
DELETE FROM conditions WHERE SourceEntry = 13746 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13746,0,-13719,0,0,0,0,'',''),
(19,0,13746,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - The Exodar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13752;
DELETE FROM conditions WHERE SourceEntry = 13752 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13752,0,-13719,0,0,0,0,'',''),
(19,0,13752,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Darnassus
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13757;
DELETE FROM conditions WHERE SourceEntry = 13757 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13757,0,-13719,0,0,0,0,'',''),
(19,0,13757,0,-13719,0,0,0,0,'','');

-- A Blade Fit For A Champion - Ironforge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13741;
DELETE FROM conditions WHERE SourceEntry = 13741 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13741,0,-13719,0,0,0,0,'',''),
(19,0,13741,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Senjin
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13769;
DELETE FROM conditions WHERE SourceEntry = 13769 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13769,0,-13719,0,0,0,0,'',''),
(19,0,13769,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Thunder Bluff
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13774;
DELETE FROM conditions WHERE SourceEntry = 13774 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13774,0,-13719,0,0,0,0,'',''),
(19,0,13774,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Undercity
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13779;
DELETE FROM conditions WHERE SourceEntry = 13779 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13779,0,-13719,0,0,0,0,'',''),
(19,0,13779,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Silvermoon City
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13784;
DELETE FROM conditions WHERE SourceEntry = 13784 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13784,0,-13719,0,0,0,0,'',''),
(19,0,13784,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Orgrimmar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13763;
DELETE FROM conditions WHERE SourceEntry = 13763 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13763,0,-13719,0,0,0,0,'',''),
(19,0,13763,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Stormwind
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13600;
DELETE FROM conditions WHERE SourceEntry = 13600 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13600,0,-13719,0,0,0,0,'',''),
(19,0,13600,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Gnomeregan
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13747;
DELETE FROM conditions WHERE SourceEntry = 13747 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13747,0,-13719,0,0,0,0,'',''),
(19,0,13747,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - The Exodar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13753;
DELETE FROM conditions WHERE SourceEntry = 13753 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13753,0,-13719,0,0,0,0,'',''),
(19,0,13753,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Darnassus
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13758;
DELETE FROM conditions WHERE SourceEntry = 13758 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13758,0,-13719,0,0,0,0,'',''),
(19,0,13758,0,-13719,0,0,0,0,'','');

-- A Worthy Weapon - Ironforge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13742;
DELETE FROM conditions WHERE SourceEntry = 13742 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13742,0,-13719,0,0,0,0,'',''),
(19,0,13742,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Senjin
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13770;
DELETE FROM conditions WHERE SourceEntry = 13770 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13770,0,-13719,0,0,0,0,'',''),
(19,0,13770,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Thunder Bluff
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13775;
DELETE FROM conditions WHERE SourceEntry = 13775 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13775,0,-13719,0,0,0,0,'',''),
(19,0,13775,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Undercity
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13780;
DELETE FROM conditions WHERE SourceEntry = 13780 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13780,0,-13719,0,0,0,0,'',''),
(19,0,13780,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Silvermoon City
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13785;
DELETE FROM conditions WHERE SourceEntry = 13785 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13785,0,-13719,0,0,0,0,'',''),
(19,0,13785,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Orgrimmar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13764;
DELETE FROM conditions WHERE SourceEntry = 13764 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13764,0,-13719,0,0,0,0,'',''),
(19,0,13764,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Stormwind
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13616;
DELETE FROM conditions WHERE SourceEntry = 13616 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13616,0,-13719,0,0,0,0,'',''),
(19,0,13616,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Gnomeregan
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13748;
DELETE FROM conditions WHERE SourceEntry = 13748 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13748,0,-13719,0,0,0,0,'',''),
(19,0,13748,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - The Exodar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13754;
DELETE FROM conditions WHERE SourceEntry = 13754 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13754,0,-13719,0,0,0,0,'',''),
(19,0,13754,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Darnassus
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13759;
DELETE FROM conditions WHERE SourceEntry = 13759 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13759,0,-13719,0,0,0,0,'',''),
(19,0,13759,0,-13719,0,0,0,0,'','');

-- The Edge Of Winter - Ironforge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13743;
DELETE FROM conditions WHERE SourceEntry = 13743 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13743,0,-13719,0,0,0,0,'',''),
(19,0,13743,0,-13719,0,0,0,0,'','');

-- A Valiant's Field Training - Senjin
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13771;
DELETE FROM conditions WHERE SourceEntry = 13771 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13771,0,-13719,0,0,0,0,'',''),
(19,0,13771,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Thunder Bluff
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13776;
DELETE FROM conditions WHERE SourceEntry = 13776 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13776,0,-13719,0,0,0,0,'',''),
(19,0,13776,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Undercity
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13781;
DELETE FROM conditions WHERE SourceEntry = 13781 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13781,0,-13719,0,0,0,0,'',''),
(19,0,13781,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Silvermoon City
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13786;
DELETE FROM conditions WHERE SourceEntry = 13786 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13786,0,-13719,0,0,0,0,'',''),
(19,0,13786,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Orgrimmar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13765;
DELETE FROM conditions WHERE SourceEntry = 13765 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13765,0,-13719,0,0,0,0,'',''),
(19,0,13765,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Stormwind
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13592;
DELETE FROM conditions WHERE SourceEntry = 13592 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13592,0,-13719,0,0,0,0,'',''),
(19,0,13592,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Gnomeregan
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13749;
DELETE FROM conditions WHERE SourceEntry = 13749 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13749,0,-13719,0,0,0,0,'',''),
(19,0,13749,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - The Exodar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13755;
DELETE FROM conditions WHERE SourceEntry = 13755 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13755,0,-13719,0,0,0,0,'',''),
(19,0,13755,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Darnassus
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13760;
DELETE FROM conditions WHERE SourceEntry = 13760 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13760,0,-13719,0,0,0,0,'',''),
(19,0,13760,0,-13719,0,0,0,0,'','');
-- A Valiant's Field Training - Ironforge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13744;
DELETE FROM conditions WHERE SourceEntry = 13744 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13744,0,-13719,0,0,0,0,'',''),
(19,0,13744,0,-13719,0,0,0,0,'','');

-- At Enemy's Gates - Senjin
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13857;
DELETE FROM conditions WHERE SourceEntry = 13857 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13857,0,-13719,0,0,0,0,'',''),
(19,0,13857,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Thunder Bluff
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13858;
DELETE FROM conditions WHERE SourceEntry = 13858 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13858,0,-13719,0,0,0,0,'',''),
(19,0,13858,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Undercity
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13859;
DELETE FROM conditions WHERE SourceEntry = 13859 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13859,0,-13719,0,0,0,0,'',''),
(19,0,13859,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Silvermoon City
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13860;
DELETE FROM conditions WHERE SourceEntry = 13860 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13860,0,-13719,0,0,0,0,'',''),
(19,0,13860,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Orgrimmar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13856;
DELETE FROM conditions WHERE SourceEntry = 13856 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13856,0,-13719,0,0,0,0,'',''),
(19,0,13856,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Stormwind
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13847;
DELETE FROM conditions WHERE SourceEntry = 13847 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13847,0,-13719,0,0,0,0,'',''),
(19,0,13847,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Gnomeregan
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13852;
DELETE FROM conditions WHERE SourceEntry = 13852 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13852,0,-13719,0,0,0,0,'',''),
(19,0,13852,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - The Exodar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13854;
DELETE FROM conditions WHERE SourceEntry = 13854 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13854,0,-13719,0,0,0,0,'',''),
(19,0,13854,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Darnassus
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13855;
DELETE FROM conditions WHERE SourceEntry = 13855 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13855,0,-13719,0,0,0,0,'',''),
(19,0,13855,0,-13719,0,0,0,0,'','');
-- At Enemy's Gates - Ironforge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13851;
DELETE FROM conditions WHERE SourceEntry = 13851 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13851,0,-13719,0,0,0,0,'',''),
(19,0,13851,0,-13719,0,0,0,0,'','');

-- The Grand Melee - Senjin
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13772;
DELETE FROM conditions WHERE SourceEntry = 13772 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13772,0,-13719,0,0,0,0,'',''),
(19,0,13772,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Thunder Bluff
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13777;
DELETE FROM conditions WHERE SourceEntry = 13777 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13777,0,-13719,0,0,0,0,'',''),
(19,0,13777,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Undercity
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13782;
DELETE FROM conditions WHERE SourceEntry = 13782 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13782,0,-13719,0,0,0,0,'',''),
(19,0,13782,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Silvermoon City
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13787;
DELETE FROM conditions WHERE SourceEntry = 13787 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13787,0,-13719,0,0,0,0,'',''),
(19,0,13787,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Orgrimmar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13767;
DELETE FROM conditions WHERE SourceEntry = 13767 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13767,0,-13719,0,0,0,0,'',''),
(19,0,13767,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Stormwind
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13665;
DELETE FROM conditions WHERE SourceEntry = 13665 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13665,0,-13719,0,0,0,0,'',''),
(19,0,13665,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Gnomeregan
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13750;
DELETE FROM conditions WHERE SourceEntry = 13750 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13750,0,-13719,0,0,0,0,'',''),
(19,0,13750,0,-13719,0,0,0,0,'','');
-- The Grand Melee - The Exodar
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13756;
DELETE FROM conditions WHERE SourceEntry = 13756 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13756,0,-13719,0,0,0,0,'',''),
(19,0,13756,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Darnassus
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13761;
DELETE FROM conditions WHERE SourceEntry = 13761 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13761,0,-13719,0,0,0,0,'',''),
(19,0,13761,0,-13719,0,0,0,0,'','');
-- The Grand Melee - Ironforge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13745;
DELETE FROM conditions WHERE SourceEntry = 13745 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13745,0,-13719,0,0,0,0,'',''),
(19,0,13745,0,-13719,0,0,0,0,'','');

-- Questpooling
/*
DELETE FROM pool_template WHERE entry IN (13768,13773,13778,13783,13762,13603,13746,13752,13757,13741);
INSERT INTO pool_template VALUES
(13768,1,'Tournament - Aspirant - Weapon Quest - Senjin'),
(13773,1,'Tournament - Aspirant - Weapon Quest - Thunder Bluff'),
(13778,1,'Tournament - Aspirant - Weapon Quest - Undercity'),
(13783,1,'Tournament - Aspirant - Weapon Quest - Silvermoon City'),
(13762,1,'Tournament - Aspirant - Weapon Quest - Orgrimmar'),
(13603,1,'Tournament - Aspirant - Weapon Quest - Stormwind'),
(13746,1,'Tournament - Aspirant - Weapon Quest - Gnomeregan'),
(13752,1,'Tournament - Aspirant - Weapon Quest - The Exodar'),
(13757,1,'Tournament - Aspirant - Weapon Quest - Darnassus'),
(13741,1,'Tournament - Aspirant - Weapon Quest - Ironforge');

DELETE FROM pool_quest WHERE pool_entry IN (13768,13773,13778,13783,13762,13603,13746,13752,13757,13741);
INSERT INTO pool_quest VALUES 
(13769,13768,'Tournament - Aspirant - Weapon Quest - Senjin - A Worthy Weapon'),
(13768,13768,'Tournament - Aspirant - Weapon Quest - Senjin - A Blade Fit For A Champion'),
(13770,13768,'Tournament - Aspirant - Weapon Quest - Senjin - The Edge Of Winter'),
(13774,13773,'Tournament - Aspirant - Weapon Quest - Thunder Bluff - A Worthy Weapon'),
(13773,13773,'Tournament - Aspirant - Weapon Quest - Thunder Bluff - A Blade Fit For A Champion'),
(13775,13773,'Tournament - Aspirant - Weapon Quest - Thunder Bluff - The Edge Of Winter'),
(13779,13778,'Tournament - Aspirant - Weapon Quest - Undercity - A Worthy Weapon'),
(13778,13778,'Tournament - Aspirant - Weapon Quest - Undercity - A Blade Fit For A Champion'),
(13780,13778,'Tournament - Aspirant - Weapon Quest - Undercity - The Edge Of Winter'),
(13784,13783,'Tournament - Aspirant - Weapon Quest - Silvermoon City - A Worthy Weapon'),
(13783,13783,'Tournament - Aspirant - Weapon Quest - Silvermoon City - A Blade Fit For A Champion'),
(13785,13783,'Tournament - Aspirant - Weapon Quest - Silvermoon City - The Edge Of Winter'),
(13763,13762,'Tournament - Aspirant - Weapon Quest - Orgrimmar - A Worthy Weapon'),
(13762,13762,'Tournament - Aspirant - Weapon Quest - Orgrimmar - A Blade Fit For A Champion'),
(13764,13762,'Tournament - Aspirant - Weapon Quest - Orgrimmar - The Edge Of Winter'),
(13600,13603,'Tournament - Aspirant - Weapon Quest - Stormwind - A Worthy Weapon'),
(13603,13603,'Tournament - Aspirant - Weapon Quest - Stormwind - A Blade Fit For A Champion'),
(13616,13603,'Tournament - Aspirant - Weapon Quest - Stormwind - The Edge Of Winter'),
(13747,13746,'Tournament - Aspirant - Weapon Quest - Gnomeregan - A Worthy Weapon'),
(13746,13746,'Tournament - Aspirant - Weapon Quest - Gnomeregan - A Blade Fit For A Champion'),
(13748,13746,'Tournament - Aspirant - Weapon Quest - Gnomeregan - The Edge Of Winter'),
(13753,13752,'Tournament - Aspirant - Weapon Quest - The Exodar - A Worthy Weapon'),
(13752,13752,'Tournament - Aspirant - Weapon Quest - The Exodar - A Blade Fit For A Champion'),
(13754,13752,'Tournament - Aspirant - Weapon Quest - The Exodar - The Edge Of Winter'),
(13758,13757,'Tournament - Aspirant - Weapon Quest - Darnassus - A Worthy Weapon'),
(13757,13757,'Tournament - Aspirant - Weapon Quest - Darnassus - A Blade Fit For A Champion'),
(13759,13757,'Tournament - Aspirant - Weapon Quest - Darnassus - The Edge Of Winter'),
(13742,13741,'Tournament - Aspirant - Weapon Quest - Ironforge - A Worthy Weapon'),
(13741,13741,'Tournament - Aspirant - Weapon Quest - Ironforge - A Blade Fit For A Champion'),
(13743,13741,'Tournament - Aspirant - Weapon Quest - Ironforge - The Edge Of Winter');
*/

-- ##### Champion

-- Taking Battle To The Enemy ... Prev: Eadric the Pure / The Scourgebane
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13810;
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13789;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13791;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13813;
-- Battle Before The Citadel ... Prev: Eadric the Pure / The Scourgebane
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13862;
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13861;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13863;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13864;
-- Among the Champions ... Prev: Eadric the Pure
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13811;
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13790;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13814;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13793;

-- Threat From Above ... Prev: Eadric the Pure
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13809;
UPDATE quest_template SET PrevQuestId = 13794, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13682;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13812;
UPDATE quest_template SET PrevQuestId = 13795, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13788;

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN (-2782,-2788,-2817,-2816,-3676,-3677);
DELETE FROM conditions WHERE 
SourceTypeOrReferenceId IN (19,20) AND SourceEntry IN
(13846,14101,14102,14104,14105,13810,13862,13811,13794,14140,14143,14144,14096,14136,14092,14107,14108,14141,14145,13707,13708,13709,13710,13711,13795,14080,14074,14077,14142,14152,14076,14090,14112,13684,13688,13685,13690,13689);
INSERT INTO conditions
VALUES 
(-2782,0,0,0,17,2782,0,0,0,"","needs Champion"),
(-2788,0,0,0,17,2788,0,0,0,"","needs Champion"),

(-2817,0,0,0,17,2817,0,0,0,"","needs Exalted Champion"), -- Allianz
(-2816,0,0,0,17,2816,0,0,0,"","needs Exalted Champion"), -- Horde

(-3676,0,0,0,17,3676,0,0,0,"","needs Silver Confidant"),
(-3677,0,0,0,17,3677,0,0,0,"","needs The Sunreaver"),

(19,0,13846,0,-2782,0,0,0,0,"","Contributin To The Cause - Daily needs Champion"),
(20,0,13846,0,-2782,0,0,0,0,"","Contributin To The Cause - Daily needs Champion"),
(19,0,13846,1,-2788,0,0,0,0,"","Contributin To The Cause - Daily needs Champion"),
(20,0,13846,1,-2788,0,0,0,0,"","Contributin To The Cause - Daily needs Champion"),

(19,0,14101,0,-2817,0,0,0,0,"","Drottinn Hrothgar - Daily needs Exalted Champion"),
(20,0,14101,0,-2817,0,0,0,0,"","Drottinn Hrothgar - Daily needs Exalted Champion"),
(19,0,14101,1,-2816,0,0,0,0,"","Drottinn Hrothgar - Daily needs Exalted Champion"),
(20,0,14101,1,-2816,0,0,0,0,"","Drottinn Hrothgar - Daily needs Exalted Champion"),
(19,0,14102,0,-2817,0,0,0,0,"","Mistcaller Yngvar - Daily needs Exalted Champion"),
(20,0,14102,0,-2817,0,0,0,0,"","Mistcaller Yngvar - Daily needs Exalted Champion"),
(19,0,14102,1,-2816,0,0,0,0,"","Mistcaller Yngvar - Daily needs Exalted Champion"),
(20,0,14102,1,-2816,0,0,0,0,"","Mistcaller Yngvar - Daily needs Exalted Champion"),
(19,0,14104,0,-2817,0,0,0,0,"","Ornolf The Scarred - Daily needs Exalted Champion"),
(20,0,14104,0,-2817,0,0,0,0,"","Ornolf The Scarred - Daily needs Exalted Champion"),
(19,0,14104,1,-2816,0,0,0,0,"","Ornolf The Scarred - Daily needs Exalted Champion"),
(20,0,14104,1,-2816,0,0,0,0,"","Ornolf The Scarred - Daily needs Exalted Champion"),
(19,0,14105,0,-2817,0,0,0,0,"","Deathspeaker Kharos - Daily needs Exalted Champion"),
(20,0,14105,0,-2817,0,0,0,0,"","Deathspeaker Kharos - Daily needs Exalted Champion"),
(19,0,14105,1,-2816,0,0,0,0,"","Deathspeaker Kharos - Daily needs Exalted Champion"),
(20,0,14105,1,-2816,0,0,0,0,"","Deathspeaker Kharos - Daily needs Exalted Champion"),

(19,0,14107,0,-2817,0,0,0,0,"","The Fate Of The Fallen - Daily needs Champion"),
(20,0,14107,0,-2817,0,0,0,0,"","The Fate Of The Fallen - Daily needs Champion"),
(19,0,14107,1,-2816,0,0,0,0,"","The Fate Of The Fallen - Daily needs Champion"),
(20,0,14107,1,-2816,0,0,0,0,"","The Fate Of The Fallen - Daily needs Champion"),
(19,0,14108,0,-2817,0,0,0,0,"","Get Kraken! - Daily needs Champion"),
(20,0,14108,0,-2817,0,0,0,0,"","Get Kraken! - Daily needs Champion"),
(19,0,14108,1,-2816,0,0,0,0,"","Get Kraken! - Daily needs Champion"),
(20,0,14108,1,-2816,0,0,0,0,"","Get Kraken! - Daily needs Champion"),

-- (19,0,13810,0,-2782,0,0,0,0,"","Taking Battle To The Enemy - Daily needs Champion"),
-- (20,0,13810,0,-2782,0,0,0,0,"","Taking Battle To The Enemy - Daily needs Champion"),
-- (19,0,13810,1,-2788,0,0,0,0,"","Taking Battle To The Enemy - Daily needs Champion"),
-- (20,0,13810,1,-2788,0,0,0,0,"","Taking Battle To The Enemy - Daily needs Champion"),

-- (19,0,13862,0,-2782,0,0,0,0,"","Battle Before The Citadel - Daily needs Champion"),
-- (20,0,13862,0,-2782,0,0,0,0,"","Battle Before The Citadel - Daily needs Champion"),
-- (19,0,13862,1,-2788,0,0,0,0,"","Battle Before The Citadel - Daily needs Champion"),
-- (20,0,13862,1,-2788,0,0,0,0,"","Battle Before The Citadel - Daily needs Champion"),

-- (19,0,13811,0,-2782,0,0,0,0,"","Among the Champions - Daily needs Champion"),
-- (20,0,13811,0,-2782,0,0,0,0,"","Among the Champions - Daily needs Champion"),
-- (19,0,13811,1,-2788,0,0,0,0,"","Among the Champions - Daily needs Champion"),
-- (20,0,13811,1,-2788,0,0,0,0,"","Among the Champions - Daily needs Champion"),

(19,0,13794,0,-2782,0,0,0,0,"","Eadric the Pure - Daily needs Champion"),
(20,0,13794,0,-2782,0,0,0,0,"","Eadric the Pure - Daily needs Champion"),
(19,0,13794,1,-2788,0,0,0,0,"","Eadric the Pure - Daily needs Champion"),
(20,0,13794,1,-2788,0,0,0,0,"","Eadric the Pure - Daily needs Champion"),

(19,0,13795,0,-2782,0,0,0,0,"","The Scourgebane - Daily needs Champion"),
(20,0,13795,0,-2782,0,0,0,0,"","The Scourgebane - Daily needs Champion"),
(19,0,13795,1,-2788,0,0,0,0,"","The Scourgebane - Daily needs Champion"),
(20,0,13795,1,-2788,0,0,0,0,"","The Scourgebane - Daily needs Champion"),

-- Horde Only
(19,0,14140,0,-2816,0,0,0,0,"","Stop The Aggressors - Daily needs Exalted Champion"),
(20,0,14140,0,-2816,0,0,0,0,"","Stop The Aggressors - Daily needs Exalted Champion"),
(19,0,14143,0,-2816,0,0,0,0,"","A Leg Up - Daily needs ExaltedChampion"),
(20,0,14143,0,-2816,0,0,0,0,"","A Leg Up - Daily needs Exalted Champion"),
(19,0,14144,0,-2816,0,0,0,0,"","The Light's Mercy - Daily needs Exalted Champion"),
(20,0,14144,0,-2816,0,0,0,0,"","The Light's Mercy - Daily needs Exalted Champion"),
(19,0,14136,0,-2816,0,0,0,0,"","Rescue at Sea - Daily needs Exalted Champion"),
(20,0,14136,0,-2816,0,0,0,0,"","Rescue at Sea - Daily needs Exalted Champion"),
(19,0,14142,0,-2816,0,0,0,0,"","Youve Really Done It This Time, Kul - Daily needs Exalted Champion"),
(20,0,14142,0,-2816,0,0,0,0,"","Youve Really Done It This Time, Kul - Daily needs Exalted Champion"),

(19,0,14092,0,-2816,0,0,0,0,"","Breakfast Of Champions - Daily needs Exalted Champion"),
(20,0,14092,0,-2816,0,0,0,0,"","Breakfast Of Champions - Daily needs Exalted Champion"),
(19,0,14141,0,-2816,0,0,0,0,"","Gormok Wants His Snobolds - Daily needs Exalted Champion"),
(20,0,14141,0,-2816,0,0,0,0,"","Gormok Wants His Snobolds - Daily needs Exalted Champion"),
(19,0,14145,0,-2816,0,0,0,0,"","What Do You Feed a Yeti, Anyway? - Daily needs Exalted Champion"),
(20,0,14145,0,-2816,0,0,0,0,"","What Do You Feed a Yeti, Anyway? - Daily needs Exalted Champion"),

(19,0,13707,0,-2788,0,0,0,0,"","Valiant Of Orgrimmar - Quest needs Champion"),
(20,0,13707,0,-2788,0,0,0,0,"","Valiant Of Orgrimmar - Quest needs Champion"),
(19,0,13708,0,-2788,0,0,0,0,"","Valiant Of Sen'jin - Quest needs Champion"),
(20,0,13708,0,-2788,0,0,0,0,"","Valiant Of Sen'jin - Quest needs Champion"),
(19,0,13711,0,-2788,0,0,0,0,"","Valiant Of Silvermoon - Quest needs Champion"),
(20,0,13711,0,-2788,0,0,0,0,"","Valiant Of Silvermoon - Quest needs Champion"),
(19,0,13709,0,-2788,0,0,0,0,"","Valiant Of Thunder Bluff - Quest needs Champion"),
(20,0,13709,0,-2788,0,0,0,0,"","Valiant Of Thunder Bluff - Quest needs Champion"),
(19,0,13710,0,-2788,0,0,0,0,"","Valiant Of Undercity - Quest needs Champion"),
(20,0,13710,0,-2788,0,0,0,0,"","Valiant Of Undercity - Quest needs Champion"),

-- Alliance Only
(19,0,14080,0,-2817,0,0,0,0,"","Stop The Aggressors - Daily needs Exalted Champion"),
(20,0,14080,0,-2817,0,0,0,0,"","Stop The Aggressors - Daily needs Exalted Champion"),
(19,0,14074,0,-2817,0,0,0,0,"","A Leg Up - Daily needs Exalted Champion"),
(20,0,14074,0,-2817,0,0,0,0,"","A Leg Up - Daily needs Exalted Champion"),
(19,0,14077,0,-2817,0,0,0,0,"","The Light's Mercy - Daily needs Exalted Champion"),
(20,0,14077,0,-2817,0,0,0,0,"","The Light's Mercy - Daily needs Exalted Champion"),
(19,0,14152,0,-2817,0,0,0,0,"","Rescue at Sea - Daily needs Exalted Champion"),
(20,0,14152,0,-2817,0,0,0,0,"","Rescue at Sea - Daily needs Exalted Champion"),
(19,0,14096,0,-2817,0,0,0,0,"","Youve Really Done It This Time, Kul - Daily needs Exalted Champion"),
(20,0,14096,0,-2817,0,0,0,0,"","Youve Really Done It This Time, Kul - Daily needs Exalted Champion"),

(19,0,14076,0,-2817,0,0,0,0,"","Breakfast Of Champions - Daily needs Exalted Champion"),
(20,0,14076,0,-2817,0,0,0,0,"","Breakfast Of Champions - Daily needs Exalted Champion"),
(19,0,14090,0,-2817,0,0,0,0,"","Gormok Wants His Snobolds - Daily needs Exalted Champion"),
(20,0,14090,0,-2817,0,0,0,0,"","Gormok Wants His Snobolds - Daily needs Exalted Champion"),
(19,0,14112,0,-2817,0,0,0,0,"","What Do You Feed a Yeti, Anyway? - Daily needs Exalted Champion"),
(20,0,14112,0,-2817,0,0,0,0,"","What Do You Feed a Yeti, Anyway? - Daily needs Exalted Champion"),

(19,0,13684,0,-2782,0,0,0,0,"","Valiant Of Stormwind - Quest needs Champion"),
(20,0,13684,0,-2782,0,0,0,0,"","Valiant Of Stormwind - Quest needs Champion"),
(19,0,13688,0,-2782,0,0,0,0,"","Valiant Of Gnomeregan - Quest needs Champion"),
(20,0,13688,0,-2782,0,0,0,0,"","Valiant Of Gnomeregan - Quest needs Champion"),
(19,0,13685,0,-2782,0,0,0,0,"","Valiant Of Ironforge - Quest needs Champion"),
(20,0,13685,0,-2782,0,0,0,0,"","Valiant Of Ironforge - Quest needs Champion"),
(19,0,13690,0,-2782,0,0,0,0,"","Valiant Of Exodar - Quest needs Champion"),
(20,0,13690,0,-2782,0,0,0,0,"","Valiant Of Exodar - Quest needs Champion"),
(19,0,13689,0,-2782,0,0,0,0,"","Valiant Of Darnassus - Quest needs Champion"),
(20,0,13689,0,-2782,0,0,0,0,"","Valiant Of Darnassus - Quest needs Champion");

-- The Sunreavers * The Silver Covenant Quests
DELETE FROM pool_template WHERE entry IN (34880,34771);
INSERT INTO pool_template VALUES
(34880,2,'Tournament - Champion - The Silver Covenant - Sea'),
(34771,2,'Tournament - Champion - The Sunreavers - Sea');

DELETE FROM pool_quest WHERE pool_entry IN (34880,34771);
INSERT INTO pool_quest VALUES 
(14074,34880,'Tournament - Champion - The Silver Covenant - Sea - A Leg Up'),
(14152,34880,'Tournament - Champion - The Silver Covenant - Sea - Rescue At Sea'),
(14077,34880,'Tournament - Champion - The Silver Covenant - Sea - The Lights Mercy'),
(14080,34880,'Tournament - Champion - The Silver Covenant - Sea - Stop the Aggression'),
(14096,34880,'Tournament - Champion - The Silver Covenant - Sea - Youve Really Done It This Time, Kul'),
(14143,34771,'Tournament - Champion - The Sunreavers - Sea - A Leg Up'),
(14136,34771,'Tournament - Champion - The Sunreavers - Sea - Rescue At Sea'),
(14144,34771,'Tournament - Champion - The Sunreavers - Sea - The Lights Mercy'),
(14140,34771,'Tournament - Champion - The Sunreavers - Sea - Stop the Aggression'),
(14142,34771,'Tournament - Champion - The Sunreavers - Sea - Youve Really Done It This Time, Kul');

DELETE FROM pool_template WHERE entry IN (34912,34914);
INSERT INTO pool_template VALUES
(34912,1,'Tournament - Champion - The Silver Covenant - Tournament'),
(34914,1,'Tournament - Champion - The Sunreavers - Tournament');

DELETE FROM pool_quest WHERE pool_entry IN (34912,34914);
INSERT INTO pool_quest VALUES 
(14092,34912,'Tournament - Champion - The Silver Covenant - Tournament - Breakfast Of Champions'),
(14141,34912,'Tournament - Champion - The Silver Covenant - Tournament - Gormok Wants His Snobolds'),
(14145,34912,'Tournament - Champion - The Silver Covenant - Tournament - What Do You Feed a Yeti, Anyway?'),
(14076,34914,'Tournament - Champion - The Sunreavers - Tournament - Breakfast Of Champions'),
(14090,34914,'Tournament - Champion - The Sunreavers - Tournament - Gormok Wants His Snobolds'),
(14112,34914,'Tournament - Champion - The Sunreavers - Tournament - What Do You Feed a Yeti, Anyway?');

DELETE FROM pool_template WHERE entry IN (34882);
INSERT INTO pool_template VALUES
(34882,1,'Tournament - Champion - The Argent Crusade - Defeat');

DELETE FROM pool_quest WHERE pool_entry IN (34882);
INSERT INTO pool_quest VALUES 
(14101,34882,'Tournament - Champion - The Argent Crusade - Defeat - Drottinn Hrothgar'),
(14102,34882,'Tournament - Champion - The Argent Crusade - Defeat - Mistcaller Yngvar'),
(14104,34882,'Tournament - Champion - The Argent Crusade - Defeat - Ornolf The Scarred'),
(14105,34882,'Tournament - Champion - The Argent Crusade - Defeat - Deathspeaker Kharos');

DELETE FROM pool_template WHERE entry IN (35094);
INSERT INTO pool_template VALUES
(35094,1,'Tournament - Champion - The Argent Crusade - Kraken');

DELETE FROM pool_quest WHERE pool_entry IN (34882);
INSERT INTO pool_quest VALUES 
(14107,35094,'Tournament - Champion - The Argent Crusade - Kraken - The Fate Of The Fallen'),
(14108,35094,'Tournament - Champion - The Argent Crusade - Kraken - Get Kraken!');
