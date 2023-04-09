
instance VLK_505_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 2;
	voice = 2;
	id = 505;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_FatBald",0,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_505;
};


func void Rtn_start_505()
{
	TA_Sleep(22,0,7,0,"OCR_HUT_7");
	TA_Smalltalk(7,0,11,0,"OCR_OUTSIDE_HUT_7");
	TA_RoastScavenger(11,0,20,0,"OCR_COOK_AT_HUT_10");
	TA_Smalltalk(20,0,22,0,"OCR_OUTSIDE_HUT_7");
};

