
instance DIA_Roscoe_Exit(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 999;
	condition = DIA_Roscoe_Exit_Condition;
	information = DIA_Roscoe_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Roscoe_Exit_Condition()
{
	return 1;
};

func void DIA_Roscoe_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Roscoe_BringList(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_BringList_Condition;
	information = DIA_Roscoe_BringList_Info;
	permanent = 0;
	description = "Mam tu list� z zam�wieniami dla Starej Kopalni.";
};


func int DIA_Roscoe_BringList_Condition()
{
	if(Npc_HasItems(other,TheList) >= 1)
	{
		return 1;
	};
};

func void DIA_Roscoe_BringList_Info()
{
	AI_Output(other,self,"DIA_Roscoe_BringList_15_00");	//Mam tu list� z zam�wieniami dla Starej Kopalni. 
	AI_Output(self,other,"DIA_Roscoe_BringList_10_01");	//Nie�le! Sk�d j� wytrzasn��e�?
	AI_Output(other,self,"DIA_Roscoe_BringList_15_02");	//Dosta�em j� od Iana.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_03");	//Masz tupet! Wys�ali ci�, �eby podda� ci� pr�bie, tak? Za�o�� si�, �e Thorusa trafia teraz jasny szlag!
	AI_Output(other,self,"DIA_Roscoe_BringList_15_04");	//To Diego zleci� mi to zadanie.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_05");	//Diego wype�nia tylko rozkazy Thorusa. Jak go znam, p�k�by ze �miechu na wie��, �e tu jeste�.
	AI_Output(other,self,"DIA_Roscoe_BringList_15_06");	//To jak - mog� wej��, czy nie?
	AI_Output(self,other,"DIA_Roscoe_BringList_10_07");	//Wchod� �mia�o. Laresowi oczy wyjd� na wierzch!
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Roscoe_Mordrag(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_Mordrag_Condition;
	information = DIA_Roscoe_Mordrag_Info;
	important = 0;
	description = "Przysy�a mnie Mordrag.";
};


func int DIA_Roscoe_Mordrag_Condition()
{
	if(Npc_HasItems(hero,MordragsRing))
	{
		return 1;
	};
};

func void DIA_Roscoe_Mordrag_Info()
{
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_00");	//Przysy�a mnie Mordrag.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_01");	//Mordrag ju� dawno tu nie zagl�da�. Pewnie przeszed� na stron� Starego Obozu.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_02");	//To on mnie do was przyprowadzi�.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_03");	//Mordrag wr�ci�?! Jakby� go jeszcze spotka�, powiedz mu, �e Lares chce si� z nim widzie�.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_04");	//Mordrag da� mi co� dla Laresa.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_05");	//Co takiego?
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_06");	//Pier�cie�.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_07");	//Za�o�� si�, �e bardzo cenny... Dobra, mo�esz si� zobaczy� z szefem.
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Roscoe_WannaJoin(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_WannaJoin_Condition;
	information = DIA_Roscoe_WannaJoin_Info;
	permanent = 0;
	description = "Chcia�bym do was do��czy�.";
};


func int DIA_Roscoe_WannaJoin_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Roscoe_Mordrag) && !Npc_KnowsInfo(hero,DIA_Roscoe_BringList) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void DIA_Roscoe_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Roscoe_WannaJoin_15_00");	//Chcia�bym do was do��czy�.
	AI_Output(self,other,"DIA_Roscoe_WannaJoin_10_01");	//Nie ty jeden, ale samo "chcenie" nie wystarczy. Musisz udowodni�, �e b�dzie z ciebie jaki� po�ytek.
};


instance DIA_Roscoe_ComeAgain(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_ComeAgain_Condition;
	information = DIA_Roscoe_ComeAgain_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Roscoe_ComeAgain_Condition()
{
	if(((Npc_HasItems(other,TheList) >= 1) && Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe)) || (Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp) && Npc_KnowsInfo(hero,ORG_801_Lares_BringList)))
	{
		return 1;
	};
};

func void DIA_Roscoe_ComeAgain_Info()
{
	AI_Output(self,other,"DIA_Roscoe_ComeAgain_10_00");	//Znowu ty.
};


const string Roscoe_CHECKPOINT = "NC_HUT22_IN_MOVEMENT";

instance Info_Roscoe_FirstWarn(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = Info_Roscoe_FirstWarn_Condition;
	information = Info_Roscoe_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Roscoe_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Roscoe_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_00");	//Dok�d si� wybierasz?
	AI_Output(hero,self,"Info_Roscoe_FirstWarn_Info_15_01");	//Chc� si� zobaczy� z Laresem.
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_02");	//Szef jest u siebie, ale trzeba mie� niez�y pow�d, �eby mu przeszkodzi�.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
};


instance Info_Roscoe_LastWarn(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 1;
	condition = Info_Roscoe_LastWarn_Condition;
	information = Info_Roscoe_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Roscoe_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Roscoe_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Roscoe_LastWarn_10_00");	//Og�uch�e�?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Roscoe_Attack(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 1;
	condition = Info_Roscoe_Attack_Condition;
	information = Info_Roscoe_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Roscoe_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Roscoe_Attack_Info()
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

