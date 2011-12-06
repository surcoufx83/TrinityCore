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
#include "oculus.h"

enum Events
{
    EVENT_ARCANE_BARRAGE = 1,
    EVENT_ARCANE_VOLLEY,
    EVENT_ENRAGED_ASSAULT,
    EVENT_SUMMON_LEY_WHELP
};

enum Says
{
    SAY_AGGRO     =  0,
    SAY_ENRAGE    =  1,
    SAY_DEATH     =  2,
    SAY_KILL_1    = -1578022,
    SAY_KILL_2    = -1578023,
    SAY_KILL_3    = -1578024
};

enum Spells
{
    SPELL_ARCANE_BARRAGE            = 50804,
    SPELL_ARCANE_BARRAGE_H          = 59381,
    SPELL_ARCANE_VOLLEY             = 51153,
    SPELL_ARCANE_VOLLEY_H           = 59382,
    SPELL_ENRAGED_ASSAULT           = 51170,
    SPELL_PLANAR_ANOMALIES          = 57959,
    SPELL_PLANAR_SHIFT              = 51162,
    SPELL_SUMMON_LEY_WHELP          = 51175,
    SPELL_SUMMON_PLANAR_ANOMALIES   = 57963,
    SPELL_PLANAR_BLAST              = 57976,

    SPELL_RUBY_DRAKE_SADDLE         = 49464,
    SPELL_EMERALD_DRAKE_SADDLE      = 49346,
    SPELL_AMBER_DRAKE_SADDLE        = 49460
};

enum Npcs
{
    NPC_PLANAR_ANOMALY    = 30879
};

enum Phases
{
    PHASE_NORMAL          = 1,
    PHASE_FIRST_PLANAR    = 2,
    PHASE_SECOND_PLANAR   = 3
};

enum AchievementData
{
    DATA_RUBY_VOID = 1,
    DATA_EMERALD_VOID,
    DATA_AMBER_VOID
};

enum Actions
{
    ACTION_SET_NORMAL_EVENTS = 1
};

class boss_eregos : public CreatureScript
{
    public:
        boss_eregos() : CreatureScript("boss_eregos") { }

        struct boss_eregosAI : public BossAI
        {
            boss_eregosAI(Creature* creature) : BossAI(creature, DATA_EREGOS_EVENT) { }

            void Reset()
            {
                _Reset();

                _rubyVoid = true;
                _emeraldVoid = true;
                _amberVoid = true;

                _phase = PHASE_NORMAL;
                DoAction(ACTION_SET_NORMAL_EVENTS);
            }

            void KilledUnit(Unit* /*victim*/)
            {
                DoScriptText(RAND(SAY_KILL_1, SAY_KILL_2, SAY_KILL_3), me);
            }

            void CheckVoids()
            {
                Map* map = me->GetMap();
                if (map && map->IsDungeon())
                {
                    Map::PlayerList const& Players = map->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = Players.begin(); itr != Players.end(); ++itr)
                    {
                        if (Player* player = itr->getSource())
                        {
                            if (player->isGameMaster())
                                continue;

                            if (player->HasAura(SPELL_RUBY_DRAKE_SADDLE))
                                _rubyVoid = false;
                            if (player->HasAura(SPELL_EMERALD_DRAKE_SADDLE))
                                _emeraldVoid = false;
                            if (player->HasAura(SPELL_AMBER_DRAKE_SADDLE))
                                _amberVoid = false;
                        }
                    }
                }
            }

            void EnterCombat(Unit* /*who*/)
            {
                CheckVoids();
                _EnterCombat();
                Talk(SAY_AGGRO);
            }

            uint32 GetData(uint32 type)
            {
                switch (type)
                {
                    case DATA_RUBY_VOID:
                        return _rubyVoid ? 1 : 0;
                    case DATA_EMERALD_VOID:
                        return _emeraldVoid ? 1 : 0;
                    case DATA_AMBER_VOID:
                        return _amberVoid ? 1 : 0;
                }

                return 0;
            }

            void DoAction(int32 const action)
            {
                if (action != ACTION_SET_NORMAL_EVENTS)
                    return;

                events.ScheduleEvent(EVENT_ARCANE_BARRAGE, urand(3, 10) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                events.ScheduleEvent(EVENT_ARCANE_VOLLEY, urand(10, 25) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                events.ScheduleEvent(EVENT_ENRAGED_ASSAULT, urand(35, 50) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                events.ScheduleEvent(EVENT_SUMMON_LEY_WHELP, urand(15, 30) * IN_MILLISECONDS, 0, PHASE_NORMAL);
            }

            void JustSummoned(Creature* summon)
            {
                BossAI::JustSummoned(summon);

                if (summon->GetEntry() != NPC_PLANAR_ANOMALY)
                    return;

                /* //! TODO: TEST
                summon->CombatStop(true);
                summon->SetReactState(REACT_PASSIVE);
                summon->GetMotionMaster()->MoveRandom(100.0f);
                */
            }

            void SummonedCreatureDespawn(Creature* summon)
            {
                if (summon->GetEntry() != NPC_PLANAR_ANOMALY)
                    return;

                //! TODO: TEST
                summon->CastSpell(summon, SPELL_PLANAR_BLAST, true);
            }

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/)
            {
                if (!IsHeroic())
                    return;

                if ((me->GetHealthPct() < 60.0f && me->GetHealthPct() > 20.0f && _phase < PHASE_FIRST_PLANAR)
                    || (me->GetHealthPct() < 20.0f && _phase < PHASE_SECOND_PLANAR))
                {
                    events.Reset();
                    _phase = (me->GetHealthPct() < 60.0f && me->GetHealthPct() > 20.0f) ? PHASE_FIRST_PLANAR : PHASE_SECOND_PLANAR;

                    DoCast(SPELL_PLANAR_SHIFT);

                    // not sure about the amount, and if we should despawn previous spawns (dragon trashs)
                    summons.DespawnAll();

                    //! TODO: TEST
                    for (uint8 i = 0; i < 6; ++i)
                    {
                        Creature* summoned = me->SummonCreature(NPC_PLANAR_ANOMALY, *me, TEMPSUMMON_TIMED_DESPAWN, 15000);
                        Unit* target = summoned->AI()->SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
                        if (target && target->GetVehicleBase())
                        {
                            summoned->CombatStart(target->GetVehicleBase(), true);
                            summoned->AddThreat(target->GetVehicleBase(), 50000.0f);
                        }
                        summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
                        summoned->SetDisplayId(11686);
                    }
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);
                _DoAggroPulse(diff);

                if (me->HasUnitState(UNIT_STAT_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_ARCANE_BARRAGE:
                            DoCastVictim(DUNGEON_MODE(SPELL_ARCANE_BARRAGE, SPELL_ARCANE_BARRAGE_H));
                            events.ScheduleEvent(EVENT_ARCANE_BARRAGE, urand(3, 10) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                            break;
                        case EVENT_ARCANE_VOLLEY:
                            DoCastAOE(DUNGEON_MODE(SPELL_ARCANE_VOLLEY, SPELL_ARCANE_VOLLEY_H));
                            events.ScheduleEvent(EVENT_ARCANE_VOLLEY, urand(10, 25) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                            break;
                        case EVENT_ENRAGED_ASSAULT:
                            Talk(SAY_ENRAGE);
                            DoCast(SPELL_ENRAGED_ASSAULT);
                            events.ScheduleEvent(EVENT_ENRAGED_ASSAULT, urand(35, 50) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                            break;
                        case EVENT_SUMMON_LEY_WHELP:
                            for (uint8 i = 0; i < 3; ++i)
                                DoCast(SPELL_SUMMON_LEY_WHELP);
                            events.ScheduleEvent(EVENT_SUMMON_LEY_WHELP, urand(15, 30) * IN_MILLISECONDS, 0, PHASE_NORMAL);
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            void JustDied(Unit* /*killer*/)
            {
                Talk(SAY_DEATH);
                _JustDied();
            }

        private:
            uint8 _phase;
            bool _rubyVoid;
            bool _emeraldVoid;
            bool _amberVoid;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_eregosAI(creature);
        }
};

class spell_eregos_planar_shift : public SpellScriptLoader
{
    public:
        spell_eregos_planar_shift() : SpellScriptLoader("spell_eregos_planar_shift") { }

        class spell_eregos_planar_shift_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_eregos_planar_shift_AuraScript);

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* caster = GetCaster())
                    if (Creature* creatureCaster = caster->ToCreature())
                        creatureCaster->AI()->DoAction(ACTION_SET_NORMAL_EVENTS);
            }

            void Register()
            {
                AfterEffectRemove += AuraEffectRemoveFn(spell_eregos_planar_shift_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_SCHOOL_IMMUNITY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_eregos_planar_shift_AuraScript();
        }
};

class achievement_ruby_void : public AchievementCriteriaScript
{
    public:
        achievement_ruby_void() : AchievementCriteriaScript("achievement_ruby_void") { }

        bool OnCheck(Player* /*source*/, Unit* target)
        {
            if (target && target->IsAIEnabled)
                return target->GetAI()->GetData(DATA_RUBY_VOID);

            return false;
        }
};

class achievement_emerald_void : public AchievementCriteriaScript
{
    public:
        achievement_emerald_void() : AchievementCriteriaScript("achievement_emerald_void") { }

        bool OnCheck(Player* /*source*/, Unit* target)
        {
            if (target && target->IsAIEnabled)
                return target->GetAI()->GetData(DATA_EMERALD_VOID);

            return false;
        }
};

class achievement_amber_void : public AchievementCriteriaScript
{
    public:
        achievement_amber_void() : AchievementCriteriaScript("achievement_amber_void") { }

        bool OnCheck(Player* /*source*/, Unit* target)
        {
            if (target && target->IsAIEnabled)
                return target->GetAI()->GetData(DATA_AMBER_VOID);

            return false;
        }
};

void AddSC_boss_eregos()
{
    new boss_eregos();
    new spell_eregos_planar_shift();
    new achievement_ruby_void();
    new achievement_emerald_void();
    new achievement_amber_void();
}
