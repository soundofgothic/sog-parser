
instance DIA_Grd_218_Exit(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 999;
	condition = DIA_Grd_218_Exit_Condition;
	information = DIA_Grd_218_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grd_218_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_218_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grd_218_FirstIn(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 1;
	condition = DIA_Grd_218_FirstIn_Condition;
	information = DIA_Grd_218_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grd_218_FirstIn_Condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Grd_218_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_00");	//Czekaj! Czego tu szukasz?
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_01");	//Chc� wej�� do �rodka.
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_02");	//Kpisz sobie ze mnie, czy co?
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_03");	//Mo�e zapytasz Thorusa?
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_04");	//Zapytam. Je�li ��esz, ju� po tobie!
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_05");	//Czy to znaczy, �e mog� wej��?
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_06");	//Tak! Rusz si� wreszcie!
	AI_StopProcessInfos(self);
};


const string Grd_218_CHECKPOINT = "OCC_BARONS_HALLWAY_FRONT";

instance Info_Grd_218_FirstWarn(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 1;
	condition = Info_Grd_218_FirstWarn_Condition;
	information = Info_Grd_218_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_218_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Grd_218_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_218_FirstWarn_Info_07_01");	//ST�J! Ani kroku dalej!
	AI_Output(hero,self,"Info_Grd_218_FirstWarn_Info_15_02");	//Dlaczego?
	AI_Output(self,hero,"Info_Grd_218_FirstWarn_Info_07_03");	//Takie �achudry jak ty nie maj� wst�pu do siedziby Magnat�w!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_218_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_218_Attack(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 1;
	condition = Info_Grd_218_Attack_Condition;
	information = Info_Grd_218_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_218_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Grd_218_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Grd_218_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

