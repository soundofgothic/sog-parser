
instance ORG_840_Roscoe(Npc_Default)
{
	name[0] = "Roscoe";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 11;
	voice = 10;
	id = 840;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",9,1,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_War_01);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_840;
};


func void Rtn_start_840()
{
	TA_GuardPassage(23,0,7,0,"NC_HUT22_OUT_MOVEMENT");
	TA_GuardPassage(7,0,23,0,"NC_HUT22_OUT_MOVEMENT");
};

