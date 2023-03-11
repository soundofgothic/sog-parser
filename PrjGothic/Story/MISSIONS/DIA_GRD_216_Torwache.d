
instance DIA_Grd_216_Exit(C_Info)
{
	npc = GRD_216_Torwache;
	nr = 999;
	condition = DIA_Grd_216_Exit_Condition;
	information = DIA_Grd_216_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grd_216_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_216_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grd_216_First(C_Info)
{
	npc = GRD_216_Torwache;
	nr = 1;
	condition = DIA_Grd_216_First_Condition;
	information = DIA_Grd_216_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grd_216_First_Condition()
{
	var C_Npc Dusty;
	if(Npc_GetDistToWP(other,"OCR_NORTHGATE_ADVANCE") > 400)
	{
		Npc_SetRefuseTalk(self,30);
	};
	if(Npc_RefuseTalk(self) == FALSE)
	{
		Dusty = Hlp_GetNpc(VLK_524_Dusty);
		if((Dusty.aivar[AIV_PARTYMEMBER] == FALSE) && (Kapitel < 2))
		{
			return 1;
		};
	};
};

func void DIA_Grd_216_First_Info()
{
	AI_Output(self,other,"DIA_Grd_216_First_13_00");	//Hej, ty! Chyba ci� tu wcze�niej nie widzia�em!
	AI_Output(other,self,"DIA_Grd_216_First_15_01");	//Nic dziwnego. Dopiero co tutaj trafi�em.
	AI_Output(self,other,"DIA_Grd_216_First_13_02");	//To lepiej uwa�aj! Poza murami jest bardzo niebezpiecznie. Tylko w obozie mo�esz spa� spokojnie.
};


instance DIA_Grd_216_DustyZoll(C_Info)
{
	npc = GRD_216_Torwache;
	nr = 1;
	condition = DIA_Grd_216_DustyZoll_Condition;
	information = DIA_Grd_216_DustyZoll_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Grd_216_DustyZoll_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if((Dusty.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToNpc(hero,Dusty) < 2000))
	{
		return 1;
	};
};

func void DIA_Grd_216_DustyZoll_Info()
{
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_13_00");	//St�j! Dok�d zabierasz naszego drogiego przyjaciela?
	Info_ClearChoices(DIA_Grd_216_DustyZoll);
	Info_AddChoice(DIA_Grd_216_DustyZoll,"Nie tw�j interes!",DIA_Grd_216_DustyZoll_PissOff);
	Info_AddChoice(DIA_Grd_216_DustyZoll,"Udajemy si� do obozu Bractwa.",DIA_Grd_216_DustyZoll_ToPSI);
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		Info_AddChoice(DIA_Grd_216_DustyZoll,"Idziemy si� przespacerowa�. A oto 100 bry�ek rudy.",DIA_Grd_216_DustyZoll_LittleWalk);
	};
};

func void DIA_Grd_216_DustyZoll_PissOff()
{
	var C_Npc Dusty;
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00");	//Nie tw�j interes!
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00");	//Mam na ten temat nieco inne zdanie!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	B_ExchangeRoutine(VLK_524_Dusty,"start");
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Dusty.flags = 0;
};

func void DIA_Grd_216_DustyZoll_ToPSI()
{
	var C_Npc Dusty;
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00");	//Udajemy si� do obozu Bractwa.
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00");	//Gdzie nigdy nie dotrzecie...
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	B_ExchangeRoutine(VLK_524_Dusty,"start");
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Dusty.flags = 0;
};

func void DIA_Grd_216_DustyZoll_LittleWalk()
{
	var C_Npc Dusty;
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00");	//Idziemy si� przespacerowa�. A oto 100 bry�ek rudy.
	if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00");	//Nic nie widzia�em.
		B_GiveInvItems(hero,self,ItMiNugget,100);
		DIA_Grd_216_DustyZoll.permanent = 0;
		B_LogEntry(CH1_RecruitDusty,"Uda�o mi si� przekupi� stra�nik�w przy po�udniowej bramie!");
		B_GiveXP(XP_BribedDustyGuard);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02");	//My�lisz, �e jestem taki g�upi? Tak �atwo ci nie p�jdzie, ma�y!
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
		B_ExchangeRoutine(VLK_524_Dusty,"start");
		Dusty = Hlp_GetNpc(VLK_524_Dusty);
		Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
		Dusty.flags = 0;
	};
};


instance GRD_216_Torwache_SEETHORUS(C_Info)
{
	npc = GRD_216_Torwache;
	condition = GRD_216_Torwache_SEETHORUS_Condition;
	information = GRD_216_Torwache_SEETHORUS_Info;
	important = 1;
	permanent = 0;
};


func int GRD_216_Torwache_SEETHORUS_Condition()
{
	if(!Npc_KnowsInfo(hero,Grd_214_Torwache_SEETHORUS) && ((CorKalom_BringMCQBalls == LOG_SUCCESS) || (Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)) && !Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void GRD_216_Torwache_SEETHORUS_Info()
{
	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_01");	//Ciesz� si�, �e ci� widz�. Thorus chce z tob� porozmawia�.
	AI_Output(other,self,"Grd_216_Torwache_SEETHORUS_Info_15_02");	//A czego ode mnie chce?
	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_03");	//Porozmawiaj z nim, to si� dowiesz.
};

