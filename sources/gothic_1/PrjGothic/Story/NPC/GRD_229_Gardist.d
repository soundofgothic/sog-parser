
instance GRD_229_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 20;
	voice = 13;
	id = 229;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",2,1,grd_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoMutton);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_229;
};


func void Rtn_start_229()
{
	TA_GuardPalisade(8,0,22,0,"OCR_PALISADE_ABOVE_MARKETPLACE_01");
	TA_Sleep(22,0,8,0,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
};

func void Rtn_FMTaken_229()
{
	TA_StayNeutral(7,0,20,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
	TA_StayNeutral(20,0,7,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
};

func void Rtn_FMTaken2_229()
{
	TA_Stay(7,0,20,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
	TA_Stay(20,0,7,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
};

