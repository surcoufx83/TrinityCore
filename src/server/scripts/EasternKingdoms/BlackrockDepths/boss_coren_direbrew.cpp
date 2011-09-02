/*######
## coren direbrew
######*/

enum CorenDirebrew
{
    SPELL_DISARM                                      = 47310,
    SPELL_DISARM_PRECAST                              = 47407,
    SPELL_MOLE_MACHINE_EMERGE                         = 50313,  // wrong spell
    QUEST_INSULT_COREN_DIREBREW                       = 12062,
    NPC_ILSA_DIREBREW                                 = 26764,
    NPC_URSULA_DIREBREW                               = 26822,
    NPC_DIREBREW_MINION                               = 26776
};

static Position Loc[]=
{
  {890.87f, -133.95f, -48.0f, 0.0f},
  {892.47f, -133.26f, -48.0f, 0.0f},
  {893.54f, -131.81f, -48.0f, 0.0f}
};

class npc_coren_direbrew : public CreatureScript
{
public:
    npc_coren_direbrew() : CreatureScript("npc_coren_direbrew") { }

    struct npc_coren_direbrewAI : public ScriptedAI
    {
        npc_coren_direbrewAI(Creature* c) : ScriptedAI(c), _summons(me) { }

        SummonList _summons;
        
        uint32 Add_Timer;
        uint32 Disarm_Timer;

        bool SpawnedIlsa;
        bool SpawnedUrsula;

        uint64 AddGUID[3];

        void Reset()
        {
            me->setFaction(35);

            Add_Timer = 20000;
            Disarm_Timer = urand(10000, 15000);

            SpawnedIlsa = false;
            SpawnedUrsula = false; 

            _summons.DespawnAll();
            me->SetCorpseDelay(90); // 1.5 minutes
  
            for (uint8 i = 0; i < 3; ++i)
            {
                if (Creature* creature = me->SummonCreature(NPC_DIREBREW_MINION, Loc[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000))
                {
                    AddGUID[i] = creature->GetGUID();

                    creature->setFaction(35);
                    creature->SetInFront(me);
                    creature->SetReactState(REACT_PASSIVE);
                    creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                }
            }
        }

        void StartEvent(Player* player)
        {
            if (!player)
                return;

            me->RestoreFaction();
            AttackStart(player);

            for (uint8 i = 0; i < 3; ++i)
            {
                if (AddGUID[i])
                {
                    Creature* creature = Unit::GetCreature((*me), AddGUID[i]);
                    if (creature && creature->isAlive())
                    {
                        creature->RestoreFaction();
                        creature->SetReactState(REACT_AGGRESSIVE);
                        creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        creature->AI()->AttackStart(player);
                    }
                    AddGUID[i] = 0;
                }
            }
        }

        void SetInCombat()
        {
            Map* map = me->GetMap();
            if (!map->IsDungeon())
                return;

            Map::PlayerList const &PlayerList = map->GetPlayers();
            for(Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            {
                if (Player* i_pl = i->getSource())
                    if (!i_pl->isGameMaster() && i_pl->isAlive() && me->GetDistance(i_pl) <= 100)
                    {
                        me->SetInCombatWith(i_pl);
                        i_pl->SetInCombatWith(me);
                        me->AddThreat(i_pl, 1.0f);
                    }
            }
        }

        void EnterCombat(Unit* who)
        {
            SetInCombat();
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            // disarm
            if (Disarm_Timer <= diff)
            {
                DoCast(SPELL_DISARM_PRECAST);
                DoCastVictim(SPELL_DISARM, false);
                Disarm_Timer = urand(20000, 25000);
            }
            else
                Disarm_Timer -= diff;

            // spawn non-elite adds
            if (Add_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                {
                    float posX, posY, posZ;
                    target->GetPosition(posX, posY, posZ);
                    target->CastSpell(target, SPELL_MOLE_MACHINE_EMERGE, true, 0, 0, me->GetGUID());
                    me->SummonCreature(NPC_DIREBREW_MINION, posX, posY, posZ, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);

                    Add_Timer = 20000;
                    if (SpawnedIlsa)
                        Add_Timer -= 4000;
                    if (SpawnedUrsula)
                        Add_Timer -= 4000;
                }
            }
            else
                Add_Timer -= diff;

            if (!SpawnedIlsa && HealthBelowPct(66))
            {
                DoSpawnCreature(NPC_ILSA_DIREBREW, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                SpawnedIlsa = true;
            }

            if (!SpawnedUrsula && HealthBelowPct(33))
            {
                DoSpawnCreature(NPC_URSULA_DIREBREW, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                SpawnedUrsula = true;
            }

            DoMeleeAttackIfReady();
        }

        void JustSummoned(Creature* summon)
        {
            summon->setFaction(736);

            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                summon->AI()->AttackStart(target);
            
            _summons.Summon(summon);
        }

        void JustDied(Unit* /*killer*/)
        {
            _summons.DespawnAll();
        }
    };

    CreatureAI* GetAI(Creature* c) const
    {
        return new npc_coren_direbrewAI(c);
    }

    bool OnQuestReward(Player* player, Creature* creature, const Quest* quest, uint32 /*item*/)
    {
        if (quest->GetQuestId() == QUEST_INSULT_COREN_DIREBREW)
        {
            CAST_AI(npc_coren_direbrew::npc_coren_direbrewAI, creature->AI())->StartEvent(player);
        }
        return true;
    }
};

/*######
## dark iron brewmaiden
######*/

enum eBrewmaiden
{
    SPELL_SEND_FIRST_MUG                              = 47333,
    SPELL_SEND_SECOND_MUG                             = 47339,
    SPELL_CREATE_BREW                                 = 47345,
    SPELL_HAS_BREW_BUFF                               = 47376,
    SPELL_HAS_BREW                                    = 47331,
    SPELL_DARK_BREWMAIDENS_STUN                       = 47340,
    SPELL_CONSUME_BREW                                = 47377,
    SPELL_BARRELED                                    = 47442,
    SPELL_CHUCK_MUG                                   = 50276
};

class npc_brewmaiden : public CreatureScript
{
public:
    npc_brewmaiden() : CreatureScript("npc_brewmaiden") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_brewmaidenAI(pCreature);
    }

    struct npc_brewmaidenAI : public ScriptedAI
    {
        npc_brewmaidenAI(Creature *c) : ScriptedAI(c) 
        {
            /*/some workarounds
            SpellEntry* TempSpell = (SpellEntry*)sSpellStore.LookupEntry(SPELL_HAS_BREW);
            if (TempSpell)
                TempSpell->DurationIndex = 18; //20 seconds due to item aura issues when item is not equipped
            TempSpell = (SpellEntry*)sSpellStore.LookupEntry(SPELL_SEND_FIRST_MUG);
            if (TempSpell)
                TempSpell->EffectTriggerSpell[0] = 0; //disable, triggers on main target only
            TempSpell = (SpellEntry*)sSpellStore.LookupEntry(SPELL_SEND_SECOND_MUG);
            if (TempSpell)
                TempSpell->EffectTriggerSpell[0] = 0; //disable, triggers on main target only
            */
        }
        
        uint32 Brew_Timer;
        uint32 Barrel_Timer;
        uint32 Chuck_Mug_Timer;

        void Reset()
        {
            Brew_Timer = 2000;
            Barrel_Timer = 5000;
            Chuck_Mug_Timer = 10000;
        }

        void SetInCombat()
        {
            Map *map = me->GetMap();
            if (!map->IsDungeon())
                return;

            Map::PlayerList const &PlayerList = map->GetPlayers();
            for(Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            {
                if (Player* i_pl = i->getSource())
                    if (!i_pl->isGameMaster() && i_pl->isAlive() && me->GetDistance(i_pl) <= 100)
                    {
                        me->SetInCombatWith(i_pl);
                        i_pl->SetInCombatWith(me);
                        me->AddThreat(i_pl, 1.0f);
                    }
            }
        }

        void EnterCombat(Unit* who)
        {
            SetInCombat();
        }

        void AttackStart(Unit* pWho)
        {
            if (!pWho)
                return;

            if (me->Attack(pWho, true))
            {
                me->AddThreat(pWho, 1.0f);
                me->SetInCombatWith(pWho);
                pWho->SetInCombatWith(me);

                if (me->GetEntry() == NPC_URSULA_DIREBREW)
                    me->GetMotionMaster()->MoveFollow(pWho, 10.0f, 0.0f);
                else
                    me->GetMotionMaster()->MoveChase(pWho);
            }
        }

        void SpellHitTarget(Unit *pTarget, const SpellInfo *spell) 
        {
            if (spell->Id == SPELL_SEND_FIRST_MUG)
            {
                pTarget->CastSpell(pTarget, SPELL_CREATE_BREW, true);
                pTarget->CastSpell(pTarget, SPELL_HAS_BREW, true);
                pTarget->CastSpell(pTarget, SPELL_HAS_BREW_BUFF, true);
            }

            if (spell->Id == SPELL_SEND_SECOND_MUG)
            {
                pTarget->CastSpell(pTarget, SPELL_DARK_BREWMAIDENS_STUN, true);
                pTarget->CastSpell(pTarget, SPELL_CONSUME_BREW, true);
                pTarget->RemoveAurasDueToSpell(SPELL_HAS_BREW);
            }
        } 

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (Brew_Timer <= diff)
            {
                if(!me->IsNonMeleeSpellCasted(false))
                {
                    Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);

                    if (pTarget && me->GetDistance(pTarget) > 5.0f)
                    {
                        DoCast(pTarget, SPELL_SEND_FIRST_MUG);
                        Brew_Timer = 12000;
                    }
                }
            } else Brew_Timer -= diff;

            if (Chuck_Mug_Timer <= diff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    DoCast(pTarget, SPELL_CHUCK_MUG);

                Chuck_Mug_Timer = 15000;
            } else Chuck_Mug_Timer -= diff;

            if (me->GetEntry() == NPC_URSULA_DIREBREW)
            {
                if (Barrel_Timer <= diff)
                {
                    if(!me->IsNonMeleeSpellCasted(false))
                    {
                        DoCast(me->getVictim(), SPELL_BARRELED);
                        Barrel_Timer = 18000;
                    }
                } else Barrel_Timer -= diff;
            } else
                DoMeleeAttackIfReady();
        }
    };
};

/*######
## go_mole_machine_console
######*/

enum eMoleMachineConsole
{
    SPELL_TELEPORT           = 49466 //wrong spell
};

#define GOSSIP_ITEM_MOLE_CONSOLE  "[PH] Please teleport me."

class go_mole_machine_console : public GameObjectScript
{
public:
    go_mole_machine_console() : GameObjectScript("go_mole_machine_console") { }

    bool OnGossipHello (Player* pPlayer, GameObject* pGO)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MOLE_CONSOLE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(12709, pGO->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, GameObject* pGO, uint32 /*uiSender*/, uint32 uiAction)
    {
        if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
            pPlayer->CastSpell(pPlayer, SPELL_TELEPORT, true);
        return true;
    }
};


void AddSC_boss_coren_direbrew()
{
    new npc_coren_direbrew();
    new npc_brewmaiden();
    new go_mole_machine_console();
}
