-- set spell_group for spells Bloodlust(Horde) & Heroism(Alliance) in case of peace-weeks
DELETE FROM `spell_group` WHERE `spell_id` IN (2825,32182);
INSERT INTO `spell_group` (`id`,`spell_id`) VALUES
(500000,2825),   -- Bloodlust
(500000,32182);  -- Heroism
DELETE FROM `spell_group_stack_rules` WHERE `group_id` IN (100000);
INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`) VALUES
(500000,2);