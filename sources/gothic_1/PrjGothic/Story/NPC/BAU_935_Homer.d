
instance BAU_935_Homer(Npc_Default)
{
	name[0] = "Homer";
	npcType = npctype_main;
	guild = GIL_BAU;
	level = 6;
	flags = 0;
	voice = 2;
	id = 935;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",5,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBooze);
	EquipItem(self,ItMw_1H_Mace_01);
	CreateInvItem(self,ItMi_Stuff_Pipe_01);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Mug_01);
	CreateInvItem(self,ItMi_Alchemy_Quicksilver_01);
	daily_routine = Rtn_PreStart_935;
};


func void Rtn_PreStart_935()
{
	TA_Boss(7,30,21,30,"NC_DAM");
	TA_Boss(21,30,7,30,"NC_DAM");
};

func void Rtn_Start_935()
{
	TA_SitAround(7,30,21,30,"NC_HUT13_OUT");
	TA_Sleep(21,30,7,30,"NC_HUT13_IN");
};

func void Rtn_Damnpast_935()
{
	TA_SitAround(7,30,21,30,"NC_HUT13_OUT");
	TA_Sleep(21,30,7,30,"NC_HUT13_IN");
};

