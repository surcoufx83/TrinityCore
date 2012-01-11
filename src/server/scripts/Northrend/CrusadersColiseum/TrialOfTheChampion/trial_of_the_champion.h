/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef DEF_TOC_H
#define DEF_TOC_H

enum Data
{
    BOSS_GRAND_CHAMPIONS,
    BOSS_ARGENT_CHALLENGE_E,
    BOSS_ARGENT_CHALLENGE_P,
    BOSS_BLACK_KNIGHT,
    DATA_MOVEMENT_DONE,
    DATA_LESSER_CHAMPIONS_DEFEATED,
    DATA_GRAND_CHAMPIONS_DEFEATED,
    DATA_START,
    DATA_IN_POSITION,
    DATA_ARGENT_SOLDIER_DEFEATED,
    DATA_TEAM_IN_INSTANCE
};

enum Data64
{
    DATA_ANNOUNCER,
    DATA_MAIN_GATE,
    DATA_PORTCULLIS,

    DATA_GRAND_CHAMPION_1,
    DATA_GRAND_CHAMPION_2,
    DATA_GRAND_CHAMPION_3
};

enum Npcs
{
    // Horde Champions
    NPC_MOKRA                   = 35572,
    NPC_ERESSEA                 = 35569,
    NPC_RUNOK                   = 35571,
    NPC_ZULTORE                 = 35570,
    NPC_VISCERI                 = 35617,

    // Alliance Champions
    NPC_JACOB                   = 34705,
    NPC_AMBROSE                 = 34702,
    NPC_COLOSOS                 = 34701,
    NPC_JAELYNE                 = 34657,
    NPC_LANA                    = 34703,

    // Faction champions horde
    NPC_ORGRIMMAR_CHAMPION      = 35314,
    NPC_SILVERMOON_CHAMPION     = 35326,
    NPC_THUNDER_CHAMPION        = 35325,
    NPC_TROLL_CHAMPION          = 35323,
    NPC_UNDERCITY_CHAMPION      = 35327,

    // Faction champions alliance
    NPC_STORMWIND_CHAMPION      = 35328,
    NPC_GNOMEREGAN_CHAMPION     = 35331,
    NPC_EXODAR_CHAMPION         = 35330,
    NPC_DARNASSUS_CHAMPION      = 35332,
    NPC_IRONFORGE_CHAMPION      = 35329,

    NPC_EADRIC                  = 35119,
    NPC_PALETRESS               = 34928,

    NPC_ARGENT_LIGHWIELDER      = 35309,
    NPC_ARGENT_MONK             = 35305,
    NPC_PRIESTESS               = 35307,

    NPC_BLACK_KNIGHT            = 35451,

    NPC_RISEN_JAEREN            = 35545,
    NPC_RISEN_ARELAS            = 35564,

    // Announcer Start Event
    NPC_JAEREN                  = 35004,
    NPC_ARELAS                  = 35005,

    // Announcer
    NPC_JAEREN_AN               = 35591,
    NPC_ARELAS_AN               = 35592,

    // Memory
    MEMORY_ALGALON              = 35052,
    MEMORY_ARCHIMONDE           = 35041,
    MEMORY_CHROMAGGUS           = 35033,
    MEMORY_CYANIGOSA            = 35046,
    MEMORY_DELRISSA             = 35043,
    MEMORY_ECK                  = 35047,
    MEMORY_ENTROPIUS            = 35044,
    MEMORY_GRUUL                = 35039,
    MEMORY_HAKKAR               = 35034,
    MEMORY_HEIGAN               = 35049,
    MEMORY_HEROD                = 35030,
    MEMORY_HOGGER               = 34942,
    MEMORY_IGNIS                = 35050,
    MEMORY_ILLIDAN              = 35042,
    MEMORY_INGVAR               = 35045,
    MEMORY_KALITHRESH           = 35037,
    MEMORY_LUCIFRON             = 35031,
    MEMORY_MALCHEZAAR           = 35038,
    MEMORY_MUTANUS              = 35029,
    MEMORY_ONYXIA               = 35048,
    MEMORY_THUNDERAAN           = 35032,
    MEMORY_VANCLEEF             = 35028,
    MEMORY_VASHJ                = 35040,
    MEMORY_VEKNILASH            = 35036,
    MEMORY_VEZAX                = 35051
};

enum GameObjects
{
    GO_MAIN_GATE                = 195647,
    GO_NORTH_PORTCULLIS         = 195650,

    GO_CHAMPIONS_LOOT           = 195709,
    GO_CHAMPIONS_LOOT_H         = 195710,

    GO_EADRIC_LOOT              = 195374,
    GO_EADRIC_LOOT_H            = 195375,

    GO_PALETRESS_LOOT           = 195323,
    GO_PALETRESS_LOOT_H         = 195324
};

enum Vehicles
{
    VEHICLE_ARGENT_WARHORSE     = 35644,
    VEHICLE_ARGENT_BATTLEWORG   = 36558,
    VEHICLE_BLACK_KNIGHT        = 35491
};

#endif
