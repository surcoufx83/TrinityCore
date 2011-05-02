/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
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

#include "ScriptPCH.h"
#include "ulduar.h"

#define MODEL_INVISIBLE    11686

//strength of the pack fixen
//sentinel blast channel wird durch erlittenen schaden abgebrochen
//crazy cat lady einbauen

enum Spells
{
    //Auriaya 
    SPELL_TERRIFYING_SCREECH                    = 64386,
    SPELL_SENTINEL_BLAST_10                     = 64389,
    SPELL_SENTINEL_BLAST_25                     = 64678,
    SPELL_SONIC_SCREECH_10                      = 64422,
    SPELL_SONIC_SCREECH_25                      = 64688,
    SPELL_SUMMON_SWARMING_GUARDIAN              = 64396,
    SPELL_FERAL_DEFENDER_TRIGGER                = 64449,
    SPELL_FERAL_DEFENDER_SUMMON                 = 64447,
    SPELL_BERSERK                               = 47008,

    //Feral Defender
    SPELL_FERAL_ESSENCE                         = 64455,
    SPELL_FERAL_RUSH_10                         = 64496,
    SPELL_FERAL_RUSH_25                         = 64674,
    SPELL_FERAL_POUNCE_10                       = 64478,
    SPELL_FERAL_POUNCE_25                       = 64669,
    SPELL_SLEEPING_FERAL_ESSENCE_10             = 64458,
    SPELL_SLEEPING_FERAL_ESSENCE_25             = 64676,

    //Sanctum Sentry
    SPELL_SAVAGE_POUNCE_10                      = 64666,
    SPELL_SAVAGE_POUNCE_25                      = 64374,
    SPELL_RIP_FLESH_10                          = 64375,
    SPELL_RIP_FLESH_25                          = 64667,
    SPELL_STRENGH_OF_THE_PACK                   = 64369,
};

enum Yells
{
    SAY_AGGRO                                    = -1603050,
    SAY_SLAY_1                                   = -1603051,
    SAY_SLAY_2                                   = -1603052,
    SAY_DEATH                                    = -1603053,
    SAY_BERSERK                                  = -1603054,
};

enum Creatures
{
    ENTRY_CREATURE_AURIAYA_SEEPING_ESSENCE_STALKER        = 34098,
    ENTRY_CREATURE_FERAL_DEFENDER                         = 34035,
    ENTRY_CREATURE_AURIAYA                                = 33515,
    ENTRY_CREATURE_SANCTUM_SENTRY                         = 34014
};

enum Achievements
{
    ACHIEV_AURIAYA_KILLS_10                               = 2868,
    ACHIEV_AURIAYA_KILLS_25                               = 2882,
    ACHIEV_CRAZY_CAT_LADY_10                              = 3006,
    ACHIEV_CRAZY_CAT_LADY_25                              = 3007,
    ACHIEV_NINE_LIVES_10                                  = 3076,
    ACHIEV_NINE_LIVES_25                                  = 3077,
};

enum Events
{
    EVENT_TERRIFYING_SCREECH,
    EVENT_SONIC_SCREECH,
    EVENT_GUARDIAN_SWARM,
    EVENT_SENTINEL_BLAST,
    EVENT_FERAL_DEFENDER_SUMMON,
    EVENT_FERAL_DEFENDER_RESURRECTION,
    EVENT_BERSERK
};

class mob_feral_defender: public CreatureScript
{
public:
    mob_feral_defender() : CreatureScript("mob_feral_defender") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_feral_defenderAI(pCreature);
    }

    struct mob_feral_defenderAI : public ScriptedAI
    {
        mob_feral_defenderAI(Creature *pCreature) : ScriptedAI(pCreature) { }

        uint32 Feral_Rush_Timer;
        uint32 Feral_Pounce_Timer;

        void Reset()
        {
            Feral_Rush_Timer = 4000;
            Feral_Pounce_Timer = 6000;
        }

        void UpdateAI(const uint32 diff)
        {
            if(Feral_Rush_Timer <= diff)
            {
                if(Unit *target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, RAID_MODE(SPELL_FERAL_RUSH_10, SPELL_FERAL_RUSH_25));
                Feral_Rush_Timer = 5000;
            }
            else Feral_Rush_Timer -= diff;

            if(Feral_Pounce_Timer <= diff)
            {
                if(Unit *target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, RAID_MODE(SPELL_FERAL_POUNCE_10, SPELL_FERAL_POUNCE_25));
                Feral_Pounce_Timer = 5000;
            }
            else Feral_Pounce_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class boss_auriaya : public CreatureScript
{
public:
    boss_auriaya() : CreatureScript("boss_auriaya") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_auriayaAI(pCreature);
    }

    struct boss_auriayaAI : public BossAI
    {
        boss_auriayaAI(Creature* pCreature) : BossAI(pCreature, TYPE_AURIAYA) { }

        uint8 defenderLifeCount;

        void Reset()
        {
            _Reset();
            defenderLifeCount = 9;

            while (Creature* sentry = me->FindNearestCreature(ENTRY_CREATURE_SANCTUM_SENTRY, 50000, false))
                sentry->Respawn();
        }


        void EnterCombat(Unit * /*who*/)
        {
            DoScriptText(SAY_AGGRO, me);
            _EnterCombat();

            events.ScheduleEvent(EVENT_TERRIFYING_SCREECH, 40000);
            events.ScheduleEvent(EVENT_SONIC_SCREECH, 60000);
            events.ScheduleEvent(EVENT_GUARDIAN_SWARM, 30000);
            events.ScheduleEvent(EVENT_SENTINEL_BLAST, 20000);
            events.ScheduleEvent(EVENT_FERAL_DEFENDER_SUMMON, 60000);
            events.ScheduleEvent(EVENT_BERSERK, 600000);
        }

        void KilledUnit(Unit * /*victim*/)
        {
            DoScriptText(RAND(SAY_SLAY_1, SAY_SLAY_2), me);
        }

        void JustDied(Unit * /*victim*/)
        {
            DoScriptText(SAY_DEATH, me);
            _JustDied();

            if (instance)
            {
                if (defenderLifeCount == 0)
                    instance->DoCompleteAchievement(RAID_MODE(ACHIEV_NINE_LIVES_10, ACHIEV_NINE_LIVES_25));
                instance->DoCompleteAchievement(RAID_MODE(ACHIEV_AURIAYA_KILLS_10, ACHIEV_AURIAYA_KILLS_25));
            }
        }

        void MoveInLineOfSight(Unit * /*who*/) { }

        void SummonedCreatureDies(Creature* summon, Unit * /*killer*/)
        {
            switch (summon->GetEntry())
            {
                case ENTRY_CREATURE_FERAL_DEFENDER:
                    me->SummonCreature(ENTRY_CREATURE_AURIAYA_SEEPING_ESSENCE_STALKER, *summon);
                    events.ScheduleEvent(EVENT_FERAL_DEFENDER_RESURRECTION, 30000);
                    break;
                default:
                    break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            _DoAggroPulse(diff);
            events.Update(diff);

            if (me->HasUnitState(UNIT_STAT_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_TERRIFYING_SCREECH:
                        DoCast(SPELL_TERRIFYING_SCREECH);
                        events.ScheduleEvent(EVENT_TERRIFYING_SCREECH, 35000);
                        return;
                    case EVENT_SONIC_SCREECH:
                        DoCastVictim(RAID_MODE(SPELL_SONIC_SCREECH_10, SPELL_SONIC_SCREECH_25));
                        events.ScheduleEvent(EVENT_SONIC_SCREECH, 27000);
                        return;
                    case EVENT_GUARDIAN_SWARM:
                        DoCastVictim(SPELL_SUMMON_SWARMING_GUARDIAN);
                        events.ScheduleEvent(EVENT_GUARDIAN_SWARM, 35000);
                        return;
                    case EVENT_SENTINEL_BLAST:
                        DoCast(RAID_MODE(SPELL_SENTINEL_BLAST_10, SPELL_SENTINEL_BLAST_25));
                        events.ScheduleEvent(EVENT_SENTINEL_BLAST, 25000);
                        return;
                    case EVENT_FERAL_DEFENDER_SUMMON:
                        DoCast(SPELL_FERAL_DEFENDER_SUMMON);
                        if (Creature* defender = me->FindNearestCreature(ENTRY_CREATURE_FERAL_DEFENDER, 100, true))
                        {
                            defender->AddAura(SPELL_FERAL_ESSENCE, defender);
                            defender->SetAuraStack(SPELL_FERAL_ESSENCE, defender, defenderLifeCount);
                        }
                        return;
                    case EVENT_FERAL_DEFENDER_RESURRECTION:
                        if (Creature* defender = me->FindNearestCreature(ENTRY_CREATURE_FERAL_DEFENDER, 15000, false))
                        {
                            if (defenderLifeCount > 0)
                            {
                                defender->Respawn();
                                defender->SetInCombatWithZone();
                                defenderLifeCount--;
                                defender->AddAura(SPELL_FERAL_ESSENCE, defender);
                                defender->SetAuraStack(SPELL_FERAL_ESSENCE, defender, defenderLifeCount);
                            }
                        }
                        return;
                    case EVENT_BERSERK:
                        DoScriptText(SAY_BERSERK, me);
                        DoCast(me, SPELL_BERSERK, true);
                        return;
                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
};


class mob_sanctum_sentry: public CreatureScript
{
public:
    mob_sanctum_sentry() : CreatureScript("mob_sanctum_sentry") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_sanctum_sentryAI(pCreature);
    }

    struct mob_sanctum_sentryAI : public ScriptedAI
    {
        mob_sanctum_sentryAI(Creature *pCreature) : ScriptedAI(pCreature) { }

        uint32 Rip_Flesh_Timer;

        void Reset()
        {
            Rip_Flesh_Timer = 10000;
        }

        void EnterCombat(Unit * /*who*/)
        {
            me->AddAura(SPELL_STRENGH_OF_THE_PACK, me);
            DoCast(RAID_MODE(SPELL_SAVAGE_POUNCE_10, SPELL_SAVAGE_POUNCE_25));
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if(Rip_Flesh_Timer <= diff)
            {
                DoCast(me->getVictim(), RAID_MODE(SPELL_RIP_FLESH_10, SPELL_RIP_FLESH_25));
                Rip_Flesh_Timer = 10000;
            }
            else Rip_Flesh_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class mob_seeping_essence_stalker: public CreatureScript
{
public:
    mob_seeping_essence_stalker() : CreatureScript("mob_seeping_essence_stalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_seeping_essence_stalkerAI(pCreature);
    }

    struct mob_seeping_essence_stalkerAI : public ScriptedAI
    {
        mob_seeping_essence_stalkerAI(Creature *pCreature) : ScriptedAI(pCreature) { }

        void Reset()
        {
            me->SetDisplayId(MODEL_INVISIBLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            DoCast(RAID_MODE(SPELL_SLEEPING_FERAL_ESSENCE_10, SPELL_SLEEPING_FERAL_ESSENCE_25));
        }

        void UpdateAI(const uint32 diff) { }
    };
};

/*
UPDATE creature_template SET ScriptName = "boss_auriaya" WHERE Entry = 33515;
UPDATE creature_template SET ScriptName = "mob_feral_defender" WHERE Entry = 34035;
UPDATE creature_template SET ScriptName = "mob_sanctum_sentry" WHERE Entry = 34014;
UPDATE creature_template SET ScriptName = "mob_seeping_essence_stalker" WHERE Entry = 34098;
*/

void AddSC_boss_auriaya()
{
    new boss_auriaya();
    new mob_feral_defender();
    new mob_seeping_essence_stalker();
    new mob_sanctum_sentry();
}