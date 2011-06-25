-- Fix Gold Loot of Ulduar
SET @Gold_10_Trash_min  :=100000;
SET @Gold_10_Trash_max  :=@Gold_10_Trash_min*1.5;
SET @Gold_25_Trash_min  :=250000;
SET @Gold_25_Trash_max  :=@Gold_25_Trash_min*1.5;

UPDATE `creature_template` SET `mingold`=@Gold_10_Trash_min,`maxgold`=@Gold_10_Trash_max WHERE
(SELECT entry FROM `creature_template` WHERE
`entry` IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
`faction_A` IN (14,16) AND
`faction_H` IN (14,16) AND
`rank`=1 AND
`entry` NOT IN (34234,33236,34164,34164,32872)                  -- exclude Fame Leviathane Trash
);
UPDATE `creature_template` SET `mingold`=@Gold_25_Trash_min,`maxgold`=@Gold_25_Trash_max WHERE
(SELECT difficulty_entry_1 FROM `creature_template` WHERE
`entry` IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
`faction_A` IN (14,16) AND
`faction_H` IN (14,16) AND
`rank`=1 AND
`entry` NOT IN (34234,33236,34164,34164,32872)                  -- exclude Fame Leviathane Trash
);