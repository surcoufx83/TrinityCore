/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
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

/* ScriptData
SDName: Icecrown
SD%Complete: 100
SDComment: Quest support: 12807
SDCategory: Icecrown
EndScriptData */

/* ContentData
npc_arete
EndContentData */

#include "ScriptPCH.h"
#include "Vehicle.h"

/*######
## npc_arete
######*/

#define GOSSIP_ARETE_ITEM1 "Lord-Commander, I would hear your tale."
#define GOSSIP_ARETE_ITEM2 "<You nod slightly but do not complete the motion as the Lord-Commander narrows his eyes before he continues.>"
#define GOSSIP_ARETE_ITEM3 "I thought that they now called themselves the Scarlet Onslaught?"
#define GOSSIP_ARETE_ITEM4 "Where did the grand admiral go?"
#define GOSSIP_ARETE_ITEM5 "That's fine. When do I start?"
#define GOSSIP_ARETE_ITEM6 "Let's finish this!"
#define GOSSIP_ARETE_ITEM7 "That's quite a tale, Lord-Commander."

enum eArete
{
    GOSSIP_TEXTID_ARETE1        = 13525,
    GOSSIP_TEXTID_ARETE2        = 13526,
    GOSSIP_TEXTID_ARETE3        = 13527,
    GOSSIP_TEXTID_ARETE4        = 13528,
    GOSSIP_TEXTID_ARETE5        = 13529,
    GOSSIP_TEXTID_ARETE6        = 13530,
    GOSSIP_TEXTID_ARETE7        = 13531,

    QUEST_THE_STORY_THUS_FAR    = 12807
};

class npc_arete : public CreatureScript
{
public:
    npc_arete() : CreatureScript("npc_arete") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_THE_STORY_THUS_FAR) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE1, creature->GetGUID());
            return true;
        }

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        switch(uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE2, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE3, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE4, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE5, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE6, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE7, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(QUEST_THE_STORY_THUS_FAR);
                break;
        }

        return true;
    }
};

/*######
## npc_dame_evniki_kapsalis
######*/

enum eDameEnvikiKapsalis
{
    TITLE_CRUSADER    = 123
};

class npc_dame_evniki_kapsalis : public CreatureScript
{
public:
    npc_dame_evniki_kapsalis() : CreatureScript("npc_dame_evniki_kapsalis") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->HasTitle(TITLE_CRUSADER))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());
        return true;
    }
};

/*######
## npc_squire_david
######*/

enum eSquireDavid
{
    QUEST_THE_ASPIRANT_S_CHALLENGE_H                    = 13680,
    QUEST_THE_ASPIRANT_S_CHALLENGE_A                    = 13679,

    NPC_ARGENT_VALIANT                                  = 33448,
    SPELL_SUMMON_ARGENT_VALIANT                         = 63028,

    GOSSIP_TEXTID_SQUIRE                                = 14407
};

#define GOSSIP_SQUIRE_ITEM_1 "I am ready to fight!"
#define GOSSIP_SQUIRE_ITEM_2 "How do the Argent Crusader raiders fight?"

class npc_squire_david : public CreatureScript
{
public:
    npc_squire_david() : CreatureScript("npc_squire_david") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_H) == QUEST_STATUS_INCOMPLETE ||
            player->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_A) == QUEST_STATUS_INCOMPLETE)//We need more info about it.
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        }

        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SQUIRE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->CastSpell(player,SPELL_SUMMON_ARGENT_VALIANT,false);
        }
        return true;
    }
};

/*######
## npc_argent_valiant
######*/

enum eArgentValiant
{
    SPELL_CHARGE                = 63010,
    SPELL_SHIELD_BREAKER        = 65147,

    NPC_ARGENT_VALIANT_CREDIT   = 38595,

    SPELL_GIVE_KILL_CREDIT_VALIANT = 63049,
};

class npc_argent_valiant : public CreatureScript
{
public:
    npc_argent_valiant() : CreatureScript("npc_argent_valiant") { }

    struct npc_argent_valiantAI : public ScriptedAI
    {
        npc_argent_valiantAI(Creature* creature) : ScriptedAI(creature)
        {
            creature->GetMotionMaster()->MovePoint(0, 8599.258f, 963.951f, 547.553f);
            creature->setFaction(35); //wrong faction in db?
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
            me->setFaction(14);
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_KILL_CREDIT_VALIANT,true);
                me->setFaction(35);
                me->DespawnOrUnsummon(5000);
                me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                EnterEvadeMode();
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_argent_valiantAI(creature);
    }
};

/*######
## npc_alorah_and_grimmin
######*/

enum ealorah_and_grimmin
{
    SPELL_CHAIN                     = 68341,
    NPC_FJOLA_LIGHTBANE             = 36065,
    NPC_EYDIS_DARKBANE              = 36066,
    NPC_PRIESTESS_ALORAH            = 36101,
    NPC_PRIEST_GRIMMIN              = 36102
};

class npc_alorah_and_grimmin : public CreatureScript
{
public:
    npc_alorah_and_grimmin() : CreatureScript("npc_alorah_and_grimmin") { }

    struct npc_alorah_and_grimminAI : public ScriptedAI
    {
        npc_alorah_and_grimminAI(Creature* creature) : ScriptedAI(creature) {}

        bool uiCast;

        void Reset()
        {
            uiCast = false;
        }

        void UpdateAI(const uint32 /*uiDiff*/)
        {
            if (uiCast)
                return;
            uiCast = true;
            Creature* target = NULL;

            switch(me->GetEntry())
            {
                case NPC_PRIESTESS_ALORAH:
                    target = me->FindNearestCreature(NPC_EYDIS_DARKBANE, 10.0f);
                    break;
                case NPC_PRIEST_GRIMMIN:
                    target = me->FindNearestCreature(NPC_FJOLA_LIGHTBANE, 10.0f);
                    break;
            }
            if (target)
                DoCast(target, SPELL_CHAIN);

            if (!UpdateVictim())
                return;
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_alorah_and_grimminAI(creature);
    }
};

/*######
## npc_guardian_pavilion
######*/

enum eGuardianPavilion
{
    SPELL_TRESPASSER_H                            = 63987,
    AREA_SUNREAVER_PAVILION                       = 4676,

    AREA_SILVER_COVENANT_PAVILION                 = 4677,
    SPELL_TRESPASSER_A                            = 63986,
};

class npc_guardian_pavilion : public CreatureScript
{
public:
    npc_guardian_pavilion() : CreatureScript("npc_guardian_pavilion") { }

    struct npc_guardian_pavilionAI : public Scripted_NoMovementAI
    {
        npc_guardian_pavilionAI(Creature* creature) : Scripted_NoMovementAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            if (me->GetAreaId() != AREA_SUNREAVER_PAVILION && me->GetAreaId() != AREA_SILVER_COVENANT_PAVILION)
                return;

            if (!who || who->GetTypeId() != TYPEID_PLAYER || !me->IsHostileTo(who) || !me->isInBackInMap(who, 5.0f))
                return;

            if (who->HasAura(SPELL_TRESPASSER_H) || who->HasAura(SPELL_TRESPASSER_A))
                return;

            if (who->ToPlayer()->GetTeamId() == TEAM_ALLIANCE)
                who->CastSpell(who, SPELL_TRESPASSER_H, true);
            else
                who->CastSpell(who, SPELL_TRESPASSER_A, true);

        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_guardian_pavilionAI(creature);
    }
};

/*######
## npc_webbed_crusader
######*/

enum eWebbedCrusaderSpells
{
    NPC_FORGOTTEN_DEEPS_AMBUSHER = 30204,
    NPC_FREED_CRUSADER = 30274,
    SPELL_FREED_CRUSADER = 56423
};
// UPDATE creature_template SET scriptname = 'npc_webbed_crusader' WHERE entry in (30273,30268);
class npc_webbed_crusader : public CreatureScript
{
public:
    npc_webbed_crusader() : CreatureScript("npc_webbed_crusader") { }

    struct npc_webbed_crusaderAI : public Scripted_NoMovementAI
    {
        npc_webbed_crusaderAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature) {}

        void JustDied(Unit* killer)
        {
            switch(urand(0,1))
            {
            case 0:
                {
                    Creature* temp = DoSpawnCreature(NPC_FREED_CRUSADER,0,0,0,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,30000);
                    if(Player* pPlayer = killer->GetCharmerOrOwnerPlayerOrPlayerItself())
                        pPlayer->KilledMonsterCredit(NPC_FREED_CRUSADER,temp->GetGUID());
                    //DoCast(me,SPELL_FREED_CRUSADER,true);
                }
                break;
            case 1:
                {
                    if(Creature* temp = DoSpawnCreature(NPC_FORGOTTEN_DEEPS_AMBUSHER,0,0,0,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,30000))
                    {
                        temp->CastSpell(temp,56418,true);
                        temp->SetStandState(UNIT_STAND_STATE_STAND);
                        temp->AI()->AttackStart(killer);
                    }
                }
                break;
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_webbed_crusaderAI(creature);
    }
};

enum ArgentCannonSpells
{
    SPELL_ARGENT_CANNON_SHOOT           = 57385,
    SPELL_ARGENT_CANNON_SHOOT_TRIGGER   = 57387,
    SPELL_RECONING_BOMB                 = 57412,
    SPELL_RECONING_BOMB_TRIGGER         = 57414
};

class spell_argent_cannon : public SpellScriptLoader
{
    public:
        spell_argent_cannon() : SpellScriptLoader("spell_argent_cannon") { }

        class spell_argent_cannon_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_argent_cannon_SpellScript);

            bool Validate(SpellInfo const* /*spellInfo*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_ARGENT_CANNON_SHOOT_TRIGGER))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_RECONING_BOMB_TRIGGER))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex effIndex)
            {
                const WorldLocation* loc = GetTargetDest();

                switch(GetSpellInfo()->Id)
                {
                case SPELL_ARGENT_CANNON_SHOOT:
                    GetCaster()->CastSpell(loc->m_positionX,loc->m_positionY,loc->m_positionZ,SPELL_ARGENT_CANNON_SHOOT_TRIGGER , true);
                    break;
                case SPELL_RECONING_BOMB:
                    GetCaster()->CastSpell(loc->m_positionX,loc->m_positionY,loc->m_positionZ,SPELL_RECONING_BOMB_TRIGGER , true);
                    break;
                }

                PreventHitDefaultEffect(effIndex);
            }

            void Register()
            {
                //OnEffect += SpellEffectFn(spell_argent_cannon_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                OnEffect += SpellEffectFn(spell_argent_cannon_SpellScript::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_argent_cannon_SpellScript();
        }
};

enum BlessedBannerSpells
{
    SPELL_BLESSING_OF_THE_CRUSADE       = 58026,
    SPELL_CRUSADERS_SPIRE_VICTORY       = 58084,
};

enum BlessedBannerSummondNPCs
{
    ENTRY_BLESSED_BANNER                = 30891,

    ENTRY_CRUSADER_LORD_DALFORS         = 31003,
    ENTRY_ARGENT_BATTLE_PRIEST          = 30919,
    ENTRY_ARGENT_MASON                  = 30900,

    ENTRY_REANIMATED_CAPTAIN            = 30986,
    ENTRY_SCOURGE_DRUDGE                = 30984,
    ENTRY_HIDEOUS_PLAGEBRINGER          = 30987,
    ENTRY_HALOF_THE_DEATHBRINGER        = 30989,
};


const Position CrusaderPos[8] =
{
    {6418.31f,  423.00f, 511.2f, 5.945f}, // Banner

    {6424.50f,  420.72f, 511.0f, 5.689f}, // Dalfors
    {6421.05f,  423.37f, 511.0f, 5.579f}, // Priest 1
    {6423.25f,  425.95f, 511.0f, 5.579f}, // Priest 2
    {6417.59f,  419.28f, 511.0f, 5.579f}, // Priest 3

    {6418.36f,  439.71f, 511.28f, 3.757f}, // Matron 1
    {6406.75f,  475.36f, 511.27f, 2.928f}, // Matron 2
    {6386.99f,  440.60f, 511.28f, 2.601f}  // Matron 3
};

const Position ScourgePos =
{
    6460.16f,  403.45f, 490.07f, 2.700f //Scourge Spawn
};

#define SAY_PRE_1               "BY THE LIGHT! Those damned monsters! Look at what they've done to our people!"
#define SAY_PRE_2               "Burn it down, boys. Burn it all down."
#define SAY_START               "Let 'em come. They'll pay for what they've done!"
#define YELL_FINISHED           "We've done it, lads! We've taken the pinnacle from the Scourge! Report to Father Gustav at once and tell him the good news! We're gonna get to buildin' and settin' up! Go!"

/*
-- SQL Changes Needed
UPDATE creature_template SET scriptname = 'npc_blessed_banner' WHERE entry = 30891;
UPDATE creature_template SET faction_A = 2068, faction_H = 2068 WHERE entry IN (30986,30984,30987,30989);
UPDATE creature_template SET faction_A = 2131, faction_H = 2131 WHERE entry IN (31003,30919,30900);
UPDATE creature_template SET faction_A = 35, faction_H = 35 WHERE entry IN (30891);

DELETE FROM event_scripts WHERE id = 20082;
INSERT INTO event_scripts VALUES
(20082,0,10,30891,600000,0,6418.31,423.00,511.2,5.945);

*/

// Script for Battle for Crusaders' Pinnacle Controller
class npc_blessed_banner : public CreatureScript
{
public:
    npc_blessed_banner() : CreatureScript("npc_blessed_banner") { }

    struct npc_blessed_bannerAI : public Scripted_NoMovementAI
    {
        npc_blessed_bannerAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature) , Summons(me)
        {
            EventStarted = false;
            EventFinished = false;
            PhaseCount = 0;
            uiSummon_Timer = 0;
            say_Timer = 0;
            says = 0;
            Summons.DespawnAll();
        }

        bool EventStarted;
        bool EventFinished;

        uint32 PhaseCount;
        uint32 uiSummon_Timer;
        uint32 say_Timer;
        uint32 says;

        SummonList Summons;

        uint64 guidHalof;

        void Reset()
        {
            std::list<Creature*> _banners;
            GetCreatureListWithEntryInGrid(_banners, me, ENTRY_BLESSED_BANNER, 100.0f);
            if (!_banners.empty())
                for (std::list<Creature*>::iterator iter = _banners.begin(); iter != _banners.end(); ++iter)
                {
                    if((*iter)->GetGUID() != me->GetGUID())
                    {
                        EventFinished = true;
                        me->DespawnOrUnsummon(0);
                        Summons.DespawnAll();
                        return;
                    }
                }
        }

        void MoveInLineOfSight(Unit *attacker)
        {
            return;
        }

        void JustSummoned(Creature* pSummoned)
        {
            Summons.Summon(pSummoned);
        }

        void JustDied(Unit *killer)
        {
            Summons.DespawnAll();
        }

        void UpdateAI(const uint32 diff)
        {
            if(EventFinished)
                return;

            if(!EventStarted)
            {
                Creature *tempsum;

                if(tempsum = DoSummon(ENTRY_CRUSADER_LORD_DALFORS,ScourgePos,600000,TEMPSUMMON_TIMED_DESPAWN))
                {
                    tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[1]);
                    tempsum->SetHomePosition(CrusaderPos[1]);
                }

                for(int i = 0; i < 3; i++)
                {
                    if(tempsum = DoSummon(ENTRY_ARGENT_MASON,ScourgePos,600000,TEMPSUMMON_TIMED_DESPAWN))
                    {
                        tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[5+i]);
                        tempsum->SetHomePosition(CrusaderPos[5+i]);
                    }
                }

                for(int i = 0; i < 3; i++)
                {
                    if(tempsum = DoSummon(ENTRY_ARGENT_BATTLE_PRIEST,ScourgePos,600000,TEMPSUMMON_TIMED_DESPAWN))
                    {
                        tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[2+i]);
                        tempsum->SetHomePosition(CrusaderPos[2+i]);
                    }
                }

                DoCast(SPELL_BLESSING_OF_THE_CRUSADE);
                uiSummon_Timer = 30000;
                EventStarted = true;
            }else
            {
                if(says < 3)
                    if(say_Timer <= diff)
                    {
                        switch(says)
                        {
                        case 0:
                            if(Creature* dalfors = GetClosestCreatureWithEntry(me,ENTRY_CRUSADER_LORD_DALFORS,100,true))
                                dalfors->MonsterSay(SAY_PRE_1, LANG_UNIVERSAL, NULL);
                            say_Timer = 10000;
                            break;
                        case 1:
                            if(Creature* dalfors = GetClosestCreatureWithEntry(me,ENTRY_CRUSADER_LORD_DALFORS,100,true))
                                dalfors->MonsterSay(SAY_PRE_2, LANG_UNIVERSAL, NULL);

                            say_Timer = 10000;
                            break;
                        case 2:
                            if(Creature* dalfors = GetClosestCreatureWithEntry(me,ENTRY_CRUSADER_LORD_DALFORS,100,true))
                                dalfors->MonsterSay(SAY_START, LANG_UNIVERSAL, NULL);

                            say_Timer = 10000;
                            break;
                        }
                        says++;

                    }else say_Timer -= diff;


                if(uiSummon_Timer <= diff)
                {
                    if(PhaseCount == 9)
                    {
                        Creature *tempsum;

                        if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                        {
                            tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                            tempsum->SetHomePosition(CrusaderPos[0]);
                        }
                        if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                        {
                            tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                            tempsum->SetHomePosition(CrusaderPos[0]);
                        }
                        if(tempsum = DoSummon(ENTRY_HALOF_THE_DEATHBRINGER,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                        {
                            guidHalof = tempsum->GetGUID();
                            tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0]);
                            tempsum->SetHomePosition(CrusaderPos[0]);
                        }
                    }else
                    {
                        Creature *tempsum;

                        if(urand(0,1) == 0)
                        {
                            if(tempsum = DoSummon(ENTRY_HIDEOUS_PLAGEBRINGER,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_HIDEOUS_PLAGEBRINGER,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                        }
                        else
                        {
                            if(tempsum = DoSummon(ENTRY_REANIMATED_CAPTAIN,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_REANIMATED_CAPTAIN,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE,ScourgePos,10000,TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0,CrusaderPos[0].m_positionX - 10 + urand(0,10),CrusaderPos[0].m_positionY - 10 + urand(0,10),CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                        }

                    }

                    PhaseCount++;
                    uiSummon_Timer = 20000;
                }else uiSummon_Timer -= diff;

                if(PhaseCount > 8)
                {
                    if(Creature* Halof = me->GetCreature(*me,guidHalof))
                    {
                        if(Halof->isDead())
                        {
                            EventFinished = true;
                            DoCast(me,SPELL_CRUSADERS_SPIRE_VICTORY,true);

                            Summons.DespawnEntry(ENTRY_HIDEOUS_PLAGEBRINGER);
                            Summons.DespawnEntry(ENTRY_REANIMATED_CAPTAIN);
                            Summons.DespawnEntry(ENTRY_SCOURGE_DRUDGE);
                            Summons.DespawnEntry(ENTRY_HALOF_THE_DEATHBRINGER);

                            if(Creature* dalfors = GetClosestCreatureWithEntry(me,ENTRY_CRUSADER_LORD_DALFORS,100,true))
                                dalfors->MonsterYell(YELL_FINISHED, LANG_UNIVERSAL, NULL);

                            for(std::list<uint64>::iterator itr = Summons.begin(); itr != Summons.end(); ++itr)
                            {
                                if(Creature* temp = Creature::GetCreature(*me,*itr))
                                {
                                    temp->DespawnOrUnsummon(20000);
                                }
                            }

                            me->DespawnOrUnsummon(20000);
                        }
                    }
                }
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_blessed_bannerAI(creature);
    }
};

enum CapturedCrusader
{
    SPELL_NERUBIAN_WEBS          = 56726,
    SPELL_GRAB_CAPTURED_CRUSADER = 56683,
    SPELL_RIDE_VEHICLE           = 56687
};

// texts not in script
class npc_captured_crusader : public CreatureScript
{
    public:
        npc_captured_crusader() : CreatureScript("npc_captured_crusader") { }

        struct npc_captured_crusaderAI : public ScriptedAI
        {
            npc_captured_crusaderAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                _spellHit = false;
                _vehicleTimer = 5000;
                DoCast(me, SPELL_NERUBIAN_WEBS, true);
            }

            void SpellHit(Unit* caster, SpellInfo const* spell)
            {
                if (spell->Id == SPELL_GRAB_CAPTURED_CRUSADER)
                {
                    _spellHit = true;
                    DoCast(caster, SPELL_RIDE_VEHICLE, true);
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (!_spellHit || _spellHit && me->GetVehicle())
                    return;

                if (_vehicleTimer <= diff)
                {
                    _spellHit = false;
                    me->DespawnOrUnsummon();
                }
                else
                    _vehicleTimer -= diff;
            }

        private:
            bool _spellHit;
            uint32 _vehicleTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_captured_crusaderAI(creature);
        }
};

/*########
## npc_the_ocular
#########*/

enum TheOcularSpells
{
    SPELL_THE_OCULAR_TRANSFORM                              = 55162,
    SPELL_DEATHLY_STARE                                     = 55269,
    SPELL_ITS_ALL_FUN_AND_GAMES_THE_OCULAR_ON_DEATH         = 55288,
    SPELL_ITS_ALL_FUN_AND_GAMES_THE_OCULAR_KILL_CREDIT      = 55289
};

enum ReqCreatures
{
   NPC_THE_OCULAR                                  = 29747,
   NPC_THE_OCULAR_DESTROYED_KILL_CREDIT_BUNNY      = 29803
};

class npc_the_ocular : public CreatureScript
{
public:
    npc_the_ocular() : CreatureScript("npc_the_ocular") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_the_ocularAI (pCreature);
    }

    struct npc_the_ocularAI : public Scripted_NoMovementAI
    {
        npc_the_ocularAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature){ }

        uint32 uiDeathlyStareTimer;

        void Reset()
        {
            uiDeathlyStareTimer = (urand (5000,7000));
        }

        void DamageTaken(Unit* attacker, uint32 &damage)
        {
            me->LowerPlayerDamageReq(damage);
        }

        void JustDied (Unit* killer)
        {
            if(killer && killer->ToPlayer())
                killer->ToPlayer()->CastSpell(killer,SPELL_ITS_ALL_FUN_AND_GAMES_THE_OCULAR_KILL_CREDIT,true);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if(!me->HasAura(SPELL_THE_OCULAR_TRANSFORM))
                DoCast(me,SPELL_THE_OCULAR_TRANSFORM,true);

            if (!UpdateVictim())
                return;

            if (uiDeathlyStareTimer <= uiDiff)
            {
                DoCastVictim(SPELL_DEATHLY_STARE);
                uiDeathlyStareTimer = (urand (7000,9000));
            }
            else uiDeathlyStareTimer -= uiDiff;
        }
    };
};
/*
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=29747;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29747;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|268435456,`AIName`='',`InhabitType`=`InhabitType`|4,`ScriptName`='npc_the_ocular' WHERE `entry`=29747;
UPDATE `creature_model_info` SET `combat_reach`=100 WHERE `modelid`=26533;

DELETE FROM `creature_template_addon` WHERE `entry`=29747;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29747,0,0,0,0,0,'55162'); -- The Ocular: Transform

UPDATE `creature_template` SET `unit_flags`=`unit_flags`|2|33554432 WHERE `entry`=29790;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=30740;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,30740,0,18,1,29747,0,63,'','Eyesore Blaster only target The Oculus');
*/

/*########
## npc_general_lightsbane
#########*/

enum eGeneralLightsbaneSpells
{
    SPELL_CLEAVE                = 15284,
    SPELL_DEATH_AND_DECAY       = 60160,
    SPELL_PLAGUE_STRIKE         = 60186,
};

enum eNpcs
{
    ENTRY_VILE                  = 29860,
    ENTRY_THE_LEAPER            = 29859,
    ENTRY_LADY_NIGHTSWOOD       = 29858,
};

/*
UPDATE `creature_template` SET faction_A = 2050, faction_H = 2050 WHERE `entry` in (29860,29859,29858);
UPDATE `creature_template` SET AIName='', `ScriptName`='npc_general_lightsbane' WHERE `entry` = 29851;
UPDATE `creature_template` SET `dmg_multiplier`=2 WHERE `entry` = 29851;
*/

class npc_general_lightsbane : public CreatureScript
{
public:
    npc_general_lightsbane() : CreatureScript("npc_general_lightsbane") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_general_lightsbaneAI (pCreature);
    }

    struct npc_general_lightsbaneAI : public ScriptedAI
    {
        npc_general_lightsbaneAI(Creature* pCreature) : ScriptedAI(pCreature) { }

        uint32 uiCleave_Timer;
        uint32 uiDeathDecay_Timer;
        uint32 uiPlagueStrike_Timer;
        uint32 uiSummonSupport_Timer;
        bool supportSummoned;

        void Reset()
        {
            uiCleave_Timer = urand (2000,3000);
            uiDeathDecay_Timer = urand (15000,20000);
            uiPlagueStrike_Timer = urand (5000,10000);

            std::list<Creature*> TargetList;
            me->GetCreatureListWithEntryInGrid(TargetList,me->GetEntry(), 100.0f);
            if(TargetList.size() > 1)
            {
                me->DespawnOrUnsummon(1000);
            }

            uiSummonSupport_Timer = 5000;
            supportSummoned = false;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if(!supportSummoned)
                if (uiSummonSupport_Timer <= uiDiff)
                {
                    Creature* temp = DoSummon(ENTRY_VILE,me,5,20000,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
                    temp->AI()->AttackStart(me);

                    temp = DoSummon(ENTRY_THE_LEAPER,me,5,20000,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
                    temp->AI()->AttackStart(me);

                    temp = DoSummon(ENTRY_LADY_NIGHTSWOOD,me,5,20000,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
                    temp->AI()->AttackStart(me);

                    uiSummonSupport_Timer = (urand (4000,5000));
                    supportSummoned = true;
                }
                else uiSummonSupport_Timer -= uiDiff;

            if (uiCleave_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_CLEAVE);
                uiCleave_Timer = (urand (4000,5000));
            }
            else uiCleave_Timer -= uiDiff;

            if (uiDeathDecay_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_DEATH_AND_DECAY);
                uiDeathDecay_Timer = urand (15000,20000);
            }
            else uiDeathDecay_Timer -= uiDiff;

            if (uiPlagueStrike_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_PLAGUE_STRIKE);
                uiPlagueStrike_Timer = urand (5000,10000);
            }
            else uiPlagueStrike_Timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };
};

/*########
## npc_free_your_mind_vile
#########*/

enum eFreeYourMindNPCSpells
{
    SPELL_SOVEREIGN_ROD             = 29070,
    SPELL_SOVEREIGN_ROD_TRIGGERED   = 29071,
    // Vile Abilities
    SPELL_VILE_ENRAGE               = 56646,    // <50% HP ?
    SPELL_VILE_BACKHAND             =  6253,
    // Lady Nightswood Abilities
    SPELL_BANSHEE_CURSE             = 5884,
    SPELL_BANSHEE_SHRIEK            = 16838,
    // The Leaper Abilities
    SPELL_LEAPER_SNISTER_STRIKE     = 60195,
    SPELL_LEAPER_HUNGER_FOR_BLOOD   = 60177,
};

enum eFreeYourMindNPCEntrys
{
    ENTRY_FYM_VILE          = 29769,
    ENTRY_FYM_LADY          = 29770,
    ENTRY_FYM_LEAPER        = 29840
};

#define SAY_VILE_AGGRO              "Crush... maim... DESTROY!"
#define SAY_VILE_FREED              "Vile free? Vile love %n"

#define SAY_LADY_NIGHTSWOOD_AGGRO   "Who intrudes upon my ritual?"
#define SAY_LADY_NIGHTSWOOD_FREED   " You dare? Where is Baron Sliver? I would have words with him!"

#define SAY_THE_LEAPER_AGGRO        "Mrrfrmrfrmrrrrr!"
#define SAY_THE_LEAPER_FREED        "Mrmrmmrmrmrmrm... mrmrmrmr?!"

// UPDATE `creature_template` SET ScriptName = 'npc_free_your_mind' WHERE `entry` IN (29769,29770,29840);

class npc_free_your_mind : public CreatureScript
{
public:
    npc_free_your_mind() : CreatureScript("npc_free_your_mind") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_free_your_mindAI (pCreature);
    }

    struct npc_free_your_mindAI : public ScriptedAI
    {
        npc_free_your_mindAI(Creature* pCreature) : ScriptedAI(pCreature) { }

        bool Enraged;

        uint32 uiSpell1Entry_Timer;
        uint32 uiSpell2Entry_Timer;
        uint32 uiSpell1Entry;
        uint32 uiSpell2Entry;

        void Reset()
        {
            switch(me->GetEntry())
            {
            case ENTRY_FYM_VILE:
                uiSpell1Entry = SPELL_VILE_BACKHAND;
                uiSpell1Entry_Timer = urand (4000,6000);
                uiSpell2Entry = SPELL_VILE_ENRAGE;
                break;
            case ENTRY_FYM_LADY:
                uiSpell1Entry = SPELL_BANSHEE_CURSE;
                uiSpell1Entry_Timer = urand (5000,6000);
                uiSpell2Entry = SPELL_BANSHEE_SHRIEK;
                uiSpell2Entry_Timer = urand (10000,12000);
                break;
            case ENTRY_FYM_LEAPER:
                uiSpell1Entry = SPELL_LEAPER_SNISTER_STRIKE;
                uiSpell1Entry_Timer = urand (4000,6000);
                uiSpell2Entry = SPELL_LEAPER_HUNGER_FOR_BLOOD;
                break;
            }

            me->RestoreFaction();
        }

        void EnterCombat(Unit* who)
        {
            Enraged = false;
            switch(me->GetEntry())
            {
            case ENTRY_FYM_VILE:
                me->MonsterSay(SAY_VILE_AGGRO,LANG_UNIVERSAL,who->GetGUID());
                break;
            case ENTRY_FYM_LEAPER:
                me->MonsterSay(SAY_THE_LEAPER_AGGRO,LANG_UNIVERSAL,who->GetGUID());
                break;
            case ENTRY_FYM_LADY:
                me->MonsterSay(SAY_LADY_NIGHTSWOOD_AGGRO,LANG_UNIVERSAL,who->GetGUID());
                break;
            }
        }

        void SpellHit(Unit* caster, SpellInfo const* spell)
        {
            if (spell->Id == SPELL_SOVEREIGN_ROD_TRIGGERED)
            {
                if(caster && caster->ToPlayer())
                {
                    me->setDeathState(ALIVE);
                    me->setFaction(35);
                    me->DespawnOrUnsummon(4000);

                    switch(me->GetEntry())
                    {
                    case ENTRY_FYM_VILE:
                        me->MonsterSay(SAY_VILE_FREED,LANG_UNIVERSAL,caster->GetGUID());
                        caster->ToPlayer()->KilledMonsterCredit(29845,0);
                        break;
                    case ENTRY_FYM_LEAPER:
                        me->MonsterSay(SAY_THE_LEAPER_FREED,LANG_UNIVERSAL,caster->GetGUID());
                        caster->ToPlayer()->KilledMonsterCredit(29847,0);
                        break;
                    case ENTRY_FYM_LADY:
                        me->MonsterSay(SAY_LADY_NIGHTSWOOD_FREED,LANG_UNIVERSAL,caster->GetGUID());
                        caster->ToPlayer()->KilledMonsterCredit(29846,0);
                        break;
                    }
                }
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiSpell1Entry_Timer <= uiDiff)
            {
                DoCastVictim(uiSpell1Entry);
                switch(me->GetEntry())
                {
                case ENTRY_FYM_VILE:
                case ENTRY_FYM_LEAPER:
                    uiSpell1Entry_Timer = (urand (7000,9000));
                    break;
                case ENTRY_FYM_LADY:
                     uiSpell1Entry_Timer = (urand (10000,15000));
                     break;
                }
            }
            else uiSpell1Entry_Timer -= uiDiff;

            if(me->GetEntry() == ENTRY_FYM_VILE)
            {
                if (!Enraged && HealthBelowPct(30))
                {
                    DoCast(me, uiSpell2Entry, true);
                    Enraged = true;
                }
            }
            else
            {
                if (uiSpell2Entry_Timer <= uiDiff)
                {
                    DoCastVictim(uiSpell2Entry);
                    uiSpell2Entry_Timer = (urand (8000,10000));
                }
                else uiSpell2Entry_Timer -= uiDiff;
            }

            DoMeleeAttackIfReady();
        }
    };
};

/*########
## Saronite Mine Slave
#########*/

enum eEntrysSlaveToSaronite
{
    QUEST_SLAVES_TO_SARONITE_ALLIANCE       = 13300,
    QUEST_SLAVES_TO_SARONITE_HORDE          = 13302,

    ENTRY_SLAVE_QUEST_CREDIT                = 31866,

    SPELL_SLAVE_ENRAGE                      = 8599,
    SPELL_HEAD_CRACK                        = 3148,

    ACTION_ENRAGED                          = 0,
    ACTION_INSANE                           = 1,
    ACTION_FREED                            = 2,
};

const Position FreedPos[2] =
{
    { 7030.0f,  1862.0f, 533.2f, 0.0f },
    { 6947.0f,  2027.0f, 519.7f, 0.0f }
};

#define GOSSIP_OPTION_FREE  "Go on, you're free. Get out of here!"

#define SAY_SLAVE_AGGRO_1 "AHAHAHAHA... you'll join us soon enough!"
#define SAY_SLAVE_AGGRO_2 "I don't want to leave! I want to stay here!"
#define SAY_SLAVE_AGGRO_3 "I won't leave!"
#define SAY_SLAVE_AGGRO_4 "NO! You're wrong! The voices in my head are beautiful!"

#define SAY_SLAVE_INSANE_1 "I must get further underground to where he is. I must jump!"
#define SAY_SLAVE_INSANE_2 "I'll never return. The whole reason for my existence awaits below!"
#define SAY_SLAVE_INSANE_3 "I'm coming, master!"
#define SAY_SLAVE_INSANE_4 "My life for you!"

// UPDATE `creature_template` SET ScriptName = 'npc_saronite_mine_slave' WHERE `entry` = 31397;

class npc_saronite_mine_slave : public CreatureScript
{
public:
    npc_saronite_mine_slave() : CreatureScript("npc_saronite_mine_slave") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if ((player->GetQuestStatus(QUEST_SLAVES_TO_SARONITE_HORDE) == QUEST_STATUS_INCOMPLETE) || (player->GetQuestStatus(QUEST_SLAVES_TO_SARONITE_ALLIANCE) == QUEST_STATUS_INCOMPLETE) )
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_OPTION_FREE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        player->CLOSE_GOSSIP_MENU();

        if (uiAction == (GOSSIP_ACTION_INFO_DEF + 1))
        {
            creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);
            if(urand(0,1) == 0)
            {
                creature->AI()->DoAction(ACTION_FREED);
                player->KilledMonsterCredit(ENTRY_SLAVE_QUEST_CREDIT,0);
            }else
            {
                if(urand(0,1) == 0)
                {
                    creature->AI()->DoAction(ACTION_ENRAGED);
                    creature->setFaction(16);
                    creature->CastSpell(creature,SPELL_SLAVE_ENRAGE);
                    creature->AI()->AttackStart(player);
                }else creature->AI()->DoAction(ACTION_INSANE);
            }
        }
        return true;
    }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_saronite_mine_slaveAI (pCreature);
    }

    struct npc_saronite_mine_slaveAI : public ScriptedAI
    {
        npc_saronite_mine_slaveAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            alreadyFreed = false;
            enraged = false;
        }

        bool enraged;
        bool alreadyFreed;

        uint32 uiHeadCrack_Timer;

        void DoAction(const int32 action)
        {
            switch(action)
            {
            case ACTION_ENRAGED:
                enraged = true;
                alreadyFreed = true;
                switch(urand(0,3))
                {
                case 0:
                    me->MonsterYell(SAY_SLAVE_AGGRO_1,LANG_UNIVERSAL,me->GetGUID());
                    break;
                case 1:
                    me->MonsterYell(SAY_SLAVE_AGGRO_2,LANG_UNIVERSAL,me->GetGUID());
                    break;
                case 2:
                    me->MonsterYell(SAY_SLAVE_AGGRO_3,LANG_UNIVERSAL,me->GetGUID());
                    break;
                case 3:
                    me->MonsterYell(SAY_SLAVE_AGGRO_4,LANG_UNIVERSAL,me->GetGUID());
                    break;
                }
                break;
            case ACTION_FREED:
                alreadyFreed = true;
                me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALKING);
                me->GetMotionMaster()->MovePoint(0,FreedPos[0]);
                me->DespawnOrUnsummon(15000);
                break;
            case ACTION_INSANE:
                alreadyFreed = true;
                switch(urand(0,3))
                {
                case 0:
                    me->MonsterYell(SAY_SLAVE_INSANE_1,LANG_UNIVERSAL,me->GetGUID());
                    break;
                case 1:
                    me->MonsterYell(SAY_SLAVE_INSANE_2,LANG_UNIVERSAL,me->GetGUID());
                    break;
                case 2:
                    me->MonsterYell(SAY_SLAVE_INSANE_3,LANG_UNIVERSAL,me->GetGUID());
                    break;
                case 3:
                    me->MonsterYell(SAY_SLAVE_INSANE_4,LANG_UNIVERSAL,me->GetGUID());
                    break;
                }
                me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALKING);
                me->GetMotionMaster()->MovePoint(0,FreedPos[1]);
                me->DespawnOrUnsummon(15000);
                break;
            }
        }

        void MoveInLineOfSight(Unit* mover)
        {
            if(!enraged)
                return;

            ScriptedAI::MoveInLineOfSight(mover);
        }

        void AttackStart(Unit* attacker)
        {
            if(!enraged)
                return;

            ScriptedAI::AttackStart(attacker);
        }

        void Reset()
        {
            me->RestoreFaction();
            if(alreadyFreed)
            {
                alreadyFreed = false;
                me->DespawnOrUnsummon(10000);
            }else
            {
                me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                alreadyFreed = false;
                enraged = false;
            }
        }

        void EnterCombat(Unit* who)
        {
            uiHeadCrack_Timer = urand(5000,7000);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiHeadCrack_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_HEAD_CRACK);
                uiHeadCrack_Timer = (urand (7000,9000));
            }
            else uiHeadCrack_Timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };
};

/*
DELETE FROM spell_script_names WHERE spell_id = 62552;
INSERT INTO spell_script_names VALUES
(62552,'spell_tournament_defend');
*/

class spell_tournament_defend : public SpellScriptLoader
{
    public:
        spell_tournament_defend() : SpellScriptLoader("spell_tournament_defend") { }

        class spell_tournament_defend_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_tournament_defend_AuraScript);

            void OnStackChange(AuraEffect const* aurEff, AuraEffectHandleModes mode)
            {
                if(Unit* target = GetTarget())
                {
                    target->RemoveAurasDueToSpell(63130);
                    target->RemoveAurasDueToSpell(63131);
                    target->RemoveAurasDueToSpell(63132);

                    switch(GetStackAmount())
                    {
                    case 1:
                        target->CastSpell(target,63130,true,0,aurEff);
                        break;
                    case 2:
                        target->CastSpell(target,63131,true,0,aurEff);
                        break;
                    case 3:
                        target->CastSpell(target,63132,true,0,aurEff);
                        break;
                    }
                }
            }

            void OnAuraRemoved(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if(Unit* target = GetTarget())
                {
                    target->RemoveAurasDueToSpell(63130);
                    target->RemoveAurasDueToSpell(63131);
                    target->RemoveAurasDueToSpell(63132);
                }
            }

            void Register()
            {
                AfterEffectApply += AuraEffectApplyFn(spell_tournament_defend_AuraScript::OnStackChange, EFFECT_2, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, AURA_EFFECT_HANDLE_CHANGE_AMOUNT);
                AfterEffectApply += AuraEffectApplyFn(spell_tournament_defend_AuraScript::OnStackChange, EFFECT_2, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, AURA_EFFECT_HANDLE_REAL);
                AfterEffectRemove += AuraEffectRemoveFn(spell_tournament_defend_AuraScript::OnAuraRemoved, EFFECT_2, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_tournament_defend_AuraScript();
        }
};

/*########
## npc_tournament_dummy
#########*/

enum TournamentDummySpells
{
    SPELL_TOURNAMENT_CHARGE_CREDIT                          = 62658, // Mastery Of The Charge
    SPELL_TOURNAMENT_BLOCK_CREDIT                           = 62672, // Mastery Of Melee
    SPELL_TOURNAMENT_SPECIAL_CREDIT                         = 62673, // Mastery Of The Shield-Breaker

    SPELL_DEFEND_AURA_PERIODIC                              = 64223, // 10sec
};

enum TorunamentDummyEntrys
{
    ENTRY_MELEE_DUMMY                                       = 33229,
    ENTRY_CHARGE_DUMMY                                      = 33272,
    ENTRY_RANGE_DUMMY                                       = 33243,
};

/*
UPDATE creature_template SET scriptname = 'npc_tournament_dummy' WHERE entry IN (33229,33272,33243);
*/

class npc_tournament_dummy : public CreatureScript
{
public:
    npc_tournament_dummy() : CreatureScript("npc_tournament_dummy") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_tournament_dummyAI (pCreature);
    }

    struct npc_tournament_dummyAI : public Scripted_NoMovementAI
    {
        npc_tournament_dummyAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature){ }

                uint32 ResetTimer;

        void Reset()
        {
            ResetTimer = 10000;
        }

        void SpellHit(Unit* caster, const SpellInfo* spell)
        {
            Player* playercaster = NULL;
            if(!caster || !caster->ToPlayer())
            {
                if(caster->IsVehicle() && caster->ToCreature())
                {
                    Creature* creatureVec = caster->ToCreature();
                    if(Unit* passager = creatureVec->GetVehicleKit()->GetPassenger(0))
                    {
                        if(passager->ToPlayer())
                            playercaster = passager->ToPlayer();
                    }
                }
            }else
            {
                playercaster = caster->ToPlayer();
            }

            if(!playercaster)
                return;

            switch(spell->Id)
            {
            case 62544:
                if(me->GetEntry() == ENTRY_MELEE_DUMMY)
                    me->CastSpell(playercaster,SPELL_TOURNAMENT_BLOCK_CREDIT,true);
                break;
            case 62626:
                if(me->GetEntry() == ENTRY_RANGE_DUMMY)
                    if(me->GetAura(62665))
                        me->CastSpell(playercaster,SPELL_TOURNAMENT_SPECIAL_CREDIT,true);
                break;
            case 68321:
                if(me->GetEntry() == ENTRY_CHARGE_DUMMY)
                    me->CastSpell(playercaster,SPELL_TOURNAMENT_CHARGE_CREDIT,true);
                break;
            }
        }

        void DamageTaken(Unit *done_by, uint32 &damage)
        {
            damage = 0;

            if(done_by->GetTypeId() != TYPEID_PLAYER && (done_by->GetTypeId() != TYPEID_UNIT || ( !done_by->isGuardian() && !done_by->isPet())))
                return;

            ResetTimer = 10000;
        }

        void MoveInLineOfSight(Unit *who) { return; }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (ResetTimer <= uiDiff)
            {
                EnterEvadeMode();
                ResetTimer = 10000;
                return;
            }else  ResetTimer -= uiDiff;
        }
    };
};

/*######
## npc_vendor_tournament_fraction_champion
######*/

enum eAchievementsTournamentFactionChampion
{
    ACHIEVEMENT_CHAMPION_OF_DARNASSUS       = 2777,
    ACHIEVEMENT_CHAMPION_OF_EXODAR          = 2778,
    ACHIEVEMENT_CHAMPION_OF_GNOMEREGAN      = 2779,
    ACHIEVEMENT_CHAMPION_OF_IRONFORGE       = 2780,
    ACHIEVEMENT_CHAMPION_OF_STORMWIND       = 2781,
    ACHIEVEMENT_CHAMPION_OF_ORGRIMMAR       = 2783,
    ACHIEVEMENT_CHAMPION_OF_DARKSPEARS      = 2784,
    ACHIEVEMENT_CHAMPION_OF_SILVERMOON      = 2785,
    ACHIEVEMENT_CHAMPION_OF_THUNDERBLUFF    = 2786,
    ACHIEVEMENT_CHAMPION_OF_UNDERCITY       = 2787,

};

enum eNPCVendorEntrys
{
    ENTRY_EXODAR_VENDOR                     = 33657,
    ENTRY_GNOMEREGAN_VENDOR                 = 33650,
    ENTRY_DARNASSUS_VENDOR                  = 33653,
    ENTRY_STORMWIND_VENDOR                  = 33307,
    ENTRY_IRONFORGE_VENDOR                  = 33310,

    ENTRY_ORGRIMMAR_VENDOR                  = 33553,
    ENTRY_DARKSPEARS_VENDOR                 = 33554,
    ENTRY_SILVERMOON_VENDOR                 = 33557,
    ENTRY_THUNDERBLUFF_VENDOR               = 33556,
    ENTRY_UNDERCITY_VENDOR                  = 33555,

};

/*
UPDATE creature_template SET scriptname = 'npc_vendor_tournament_fraction_champion' WHERE entry IN (33657,33650,33653,33307,33310,33553,33554,33557,33556,33555);
*/

class npc_vendor_tournament_fraction_champion : public CreatureScript
{
public:
    npc_vendor_tournament_fraction_champion() : CreatureScript("npc_vendor_tournament_fraction_champion") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        bool showVendor = false;

        switch(creature->GetEntry())
        {
        case ENTRY_EXODAR_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_EXODAR);
            break;
        case ENTRY_GNOMEREGAN_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_GNOMEREGAN);
            break;
        case ENTRY_DARNASSUS_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_DARNASSUS);
            break;
        case ENTRY_STORMWIND_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_STORMWIND);
            break;
        case ENTRY_IRONFORGE_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_IRONFORGE);
            break;
        case ENTRY_ORGRIMMAR_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_ORGRIMMAR);
            break;
        case ENTRY_DARKSPEARS_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_DARKSPEARS);
            break;
        case ENTRY_SILVERMOON_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_SILVERMOON);
            break;
        case ENTRY_THUNDERBLUFF_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_THUNDERBLUFF);
            break;
        case ENTRY_UNDERCITY_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_UNDERCITY);
            break;
        }

        if (showVendor)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        }
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());
        return true;
    }
};

/*######
## npc_faction_valiant
######*/

/*
UPDATE creature_template SET scriptname = 'npc_faction_valiant' WHERE entry IN (33559,33562,33558,33564,33306,33285,33382,33561,33383,33384);
*/

enum eFactionValiant
{
    //SPELL_CHARGE                = 63010,
    //SPELL_SHIELD_BREAKER        = 65147,

    SPELL_GIVE_VALIANT_MARK_1 = 62724,
    SPELL_GIVE_VALIANT_MARK_2 = 62770,
    SPELL_GIVE_VALIANT_MARK_3 = 62771,
    SPELL_GIVE_VALIANT_MARK_4 = 62995,
    SPELL_GIVE_VALIANT_MARK_5 = 62996,

    QUEST_THE_GRAND_MELEE_0     = 13665,
    QUEST_THE_GRAND_MELEE_1     = 13745,
    QUEST_THE_GRAND_MELEE_2     = 13750,
    QUEST_THE_GRAND_MELEE_3     = 13756,
    QUEST_THE_GRAND_MELEE_4     = 13761,
    QUEST_THE_GRAND_MELEE_5     = 13767,
    QUEST_THE_GRAND_MELEE_6     = 13772,
    QUEST_THE_GRAND_MELEE_7     = 13777,
    QUEST_THE_GRAND_MELEE_8     = 13782,
    QUEST_THE_GRAND_MELEE_9     = 13787,
};

#define GOSSIP_MELEE_FIGHT      "I'am ready to fight!"

class npc_faction_valiant : public CreatureScript
{
public:
    npc_faction_valiant() : CreatureScript("npc_faction_valiant") { }

    struct npc_faction_valiantAI : public ScriptedAI
    {
        npc_faction_valiantAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;
        uint64 guidAttacker;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;

            me->setFaction(35);
        }

        void EnterCombat(Unit* attacker)
        {
            guidAttacker = attacker->GetGUID();
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if(pDoneBy && pDoneBy->GetGUID() != guidAttacker)
                uiDamage = 0;

            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_VALIANT_MARK_1,true);
                me->setFaction(35);
                EnterEvadeMode();
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_faction_valiantAI(creature);
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if( player->HasAura(63151) &&
            ((player->GetQuestStatus(QUEST_THE_GRAND_MELEE_0) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_1) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_2) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_3) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_4) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_5) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_6) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_7) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_8) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_9) == QUEST_STATUS_INCOMPLETE)))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MELEE_FIGHT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        player->CLOSE_GOSSIP_MENU();
        if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        {
            creature->setFaction(14);
            creature->AI()->AttackStart(player);
        }
        return true;
    }
};

/*######
## npc_maiden_of_drakmar
######*/

#define SAY_1       "Are those winter hyacinths? For me?"
#define SAY_2       "It\'s been so long since a traveler has come here bearing flowers."
#define SAY_3       "The lake has been too lonely these past years. The travelers stopped coming and evil came to these waters."
#define SAY_4       "Your gift is a rare kindness, traveler. Please take this blade with my gratitude. Long ago, another traveler left it here, but I have little use for it."

enum eEntrys
{
     GO_DRAKMAR_LILY_PAD      = 194239,
     GO_BLADE_OF_DRAKMAR      = 194238,
     ENTRY_MAIDEN_OF_DRAKMAR  =  33273,
};

static Position miscLocations[]=
{
    {4602.08f, -1600.22f, 156.657f, 0.128299f}, //GO_DRAKMAR_LILY_PAD
    {4601.53f, -1600.47f, 156.986f, 1.944937f}  //GO_BLADE_OF_DRAKMAR
};

/*
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(20990,1,10,33273,60000,0,4602.782715,-1600.874146,158,1.387292);

UPDATE creature_template SET scriptname = 'npc_maiden_of_drakmar' WHERE entry = 33273;
*/

class npc_maiden_of_drakmar : public CreatureScript
{
public:
    npc_maiden_of_drakmar() : CreatureScript("npc_maiden_of_drakmar") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_maiden_of_drakmarAI (pCreature);
    }

    struct npc_maiden_of_drakmarAI : public Scripted_NoMovementAI
    {
        npc_maiden_of_drakmarAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
        {
            me->SetFlying(true); // cosmetic workaround
        }

        uint32 uiSayTimer;
        uint8 uiSayStep;

        void Reset ()
        {
            uiSayStep = 0;
            uiSayTimer = 2000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (uiSayTimer <= uiDiff)
            {
                switch (uiSayStep)
                {
                    case 0:
                        me->SummonGameObject(GO_DRAKMAR_LILY_PAD, miscLocations[0].GetPositionX(),miscLocations[0].GetPositionY(),miscLocations[0].GetPositionZ(),miscLocations[0].GetOrientation(),0,0,0,0,30000);
                        me->MonsterSay(SAY_1,LANG_UNIVERSAL,0);
                        uiSayTimer = 3000;
                        ++uiSayStep;
                        break;
                    case 1:
                        me->MonsterSay(SAY_2,LANG_UNIVERSAL,0);
                        uiSayTimer = 5000;
                        ++uiSayStep;
                        break;
                    case 2:
                        me->MonsterSay(SAY_3,LANG_UNIVERSAL,0);
                        uiSayTimer = 7000;
                        ++uiSayStep;
                        break;
                    case 3:
                        me->SummonGameObject(GO_BLADE_OF_DRAKMAR, miscLocations[1].GetPositionX(),miscLocations[1].GetPositionY(),miscLocations[1].GetPositionZ(),miscLocations[1].GetOrientation(),0,0,0,0,30000);
                        me->MonsterSay(SAY_4,LANG_UNIVERSAL,0);
                        uiSayTimer = 99999999;
                        ++uiSayStep;
                        break;
                }
            }
            else uiSayTimer -= uiDiff;
        }
    };
};

/*######
npc_squire_danny
######*/

enum eSquireDanny
{
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_UNDERCITY = 13729,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SENJIN = 13727,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_THUNDERBLUFF = 13728,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SILVERMOON = 13731,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_ORGRIMMAR = 13726,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_DARNASSUS = 13725,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_IRONFORGE = 13713,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_GNOMEREGAN = 13723,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_EXODAR = 13724,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_STORMWIND = 13699,

    NPC_ARGENT_CHAMPION = 33707,
    SPELL_SUMMON_ARGENT_CHAMPION = 63171,

    GOSSIP_TEXTID_SQUIRE_DANNY = 14407
};

/*
UPDATE creature_template SET scriptname = 'npc_squire_danny' WHERE entry = 33518;
*/

class npc_squire_danny : public CreatureScript
{
public:
    npc_squire_danny() : CreatureScript("npc_squire_danny") { }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->CastSpell(pPlayer,SPELL_SUMMON_ARGENT_CHAMPION,false);
        }
        //else
        //pPlayer->SEND_GOSSIP_MENU(???, pCreature->GetGUID()); Missing text
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pPlayer->HasAura(63151)
            && ((pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_UNDERCITY) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SENJIN) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_THUNDERBLUFF) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SILVERMOON) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_ORGRIMMAR) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_DARNASSUS) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_IRONFORGE) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_GNOMEREGAN) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_EXODAR) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_STORMWIND) == QUEST_STATUS_INCOMPLETE)))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        }

    pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SQUIRE_DANNY, pCreature->GetGUID());
    return true;
    }
};

/*######
## npc_argent_champion
######*/
// To Do Argent Valiant, Faction Valiant, Argent Champion and Faction Champion have the same script -> make one

/*
UPDATE creature_template SET scriptname = 'npc_argent_champion' WHERE entry = 33707;
*/

enum eArgentChampion
{
    //SPELL_CHARGE                = 63010,
    //SPELL_SHIELD_BREAKER        = 65147,

    SPELL_ARGENT_CRUSADE_CHAMPION   = 63501,
    SPELL_GIVE_KILL_CREDIT_CHAMPION = 63516,
};

class npc_argent_champion : public CreatureScript
{
public:
    npc_argent_champion() : CreatureScript("npc_argent_champion") { }

    struct npc_argent_championAI : public ScriptedAI
    {
        npc_argent_championAI(Creature* creature) : ScriptedAI(creature)
        {
            creature->GetMotionMaster()->MovePoint(0, 8561.30f, 1113.30f, 556.9f);
            creature->setFaction(35); //wrong faction in db?
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
            me->setFaction(14);
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_KILL_CREDIT_CHAMPION,true);
                me->setFaction(35);
                me->DespawnOrUnsummon(5000);
                me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                EnterEvadeMode();
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_argent_championAI(creature);
    }
};

void AddSC_icecrown()
{
    new npc_arete();
    new npc_dame_evniki_kapsalis();
    new npc_squire_david();
    new npc_argent_valiant();
    new npc_alorah_and_grimmin();
    new npc_guardian_pavilion();
    new npc_webbed_crusader();
    new spell_argent_cannon();
    new npc_blessed_banner();
    new npc_captured_crusader();
    new npc_the_ocular();
    new npc_general_lightsbane();
    new npc_free_your_mind();
    new npc_saronite_mine_slave();
    new spell_tournament_defend();
    new npc_tournament_dummy();
    new npc_vendor_tournament_fraction_champion();
    new npc_faction_valiant();
    new npc_maiden_of_drakmar();
    new npc_squire_danny();
    new npc_argent_champion();
}
