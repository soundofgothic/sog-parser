
instance GRD_226_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 226;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Fighter",16,0,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_226;
};


func void Rtn_start_226()
{
	TA_Sleep(0,25,7,25,"OCC_MERCS_UPPER_LEFT_ROOM_BED2");
	TA_Smalltalk(7,25,21,25,"OCC_MAINGATE_TALK");
	TA_Smalltalk(21,25,0,25,"OCC_SHADOWS_CORNER_MOVEMENT4");
};

