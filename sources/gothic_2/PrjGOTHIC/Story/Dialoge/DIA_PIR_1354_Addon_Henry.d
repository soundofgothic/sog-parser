
instance DIA_Addon_Henry_EXIT(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 999;
	condition = DIA_Addon_Henry_EXIT_Condition;
	information = DIA_Addon_Henry_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Henry_Gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 sztuk z這ta.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 sztuk z這ta.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 sztuk z這ta.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 sztuk z這ta.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 sztuk z這ta.
	}
	else
	{
		B_Say_Gold(self,other,gold);
	};
};


instance DIA_Addon_Henry_PICKPOCKET(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 900;
	condition = DIA_Addon_Henry_PICKPOCKET_Condition;
	information = DIA_Addon_Henry_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Henry_PICKPOCKET_Condition()
{
	return C_Beklauen(40,60);
};

func void DIA_Addon_Henry_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,Dialog_Back,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};


const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";

instance DIA_Addon_Henry_Hello(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Hello_Condition;
	information = DIA_Addon_Henry_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Hello_Condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//St鎩, kto idzie?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//Sw鎩 czy wr鏬?
	Info_ClearChoices(DIA_Addon_Henry_Hello);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Wr鏬!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Sw鎩!",DIA_Addon_Henry_Hello_Freund);
};


var int Henry_SC_Frech;

func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Wr鏬!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Spryciarz... Chcesz, 瞠bym ci porachowa� ko�ci?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//M闚, co masz do powiedzenia, albo odejd�.
	Henry_SC_Frech = TRUE;
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Sw鎩!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//Ka盥y tak mo瞠 powiedzie�. Nie znam ci�. Czego tutaj szukasz?
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};


instance DIA_Addon_Henry_SecondWarn(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_SecondWarn_Condition;
	information = DIA_Addon_Henry_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//Jeszcze jeden krok i rzuc� ci� rekinom na po瘸rcie!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Henry_Attack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Attack_Condition;
	information = DIA_Addon_Henry_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Sam tego chcia貫�.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


var int Henry_Zoll_WhatFor;

instance DIA_Addon_Henry_WantEnter(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_WantEnter_Condition;
	information = DIA_Addon_Henry_WantEnter_Info;
	permanent = FALSE;
	description = "Chc� wej��!";
};


func int DIA_Addon_Henry_WantEnter_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chc� wej��!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Naprawd�? To ci� b璠zie kosztowa�...
	B_Henry_Gold(500);
	if(Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Niby czemu?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Musisz wszystko komplikowa�?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//W tym obozie jest wiele rzeczy, kt鏎e mog� ci� zainteresowa�.
		Henry_Zoll_WhatFor = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ItAr_KDF_L) == TRUE) || (Hlp_IsItem(itm,ItAr_KDF_H) == TRUE) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(itm,ItAr_MIL_M) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//A ty wygl鉅asz na kogo�, kto ma pieni鉅ze.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//Nie zedr� przecie� z ciebie ostatniej koszuli. Zobaczysz, op豉ci ci si�.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//No, chyba 瞠 ten str鎩 ukrad貫�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//Masz przy sobie pieni鉅ze, prawda?
	};
};

func void B_Henry_NoJoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Je�li chcesz do nas do章czy�, to mam dla ciebie z章 wiadomo��, ch這pcze.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapitan wyp造n像 w rejs, a tylko on decyduje, kogo przyjmie si� do za這gi.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale mo瞠sz tu zosta� do jego powrotu.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Je�li nie b璠ziesz sprawia� k這pot闚, rzecz jasna.
};


instance DIA_Addon_Henry_Einigen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_Einigen2_Condition;
	information = DIA_Addon_Henry_Einigen2_Info;
	description = "Oto twoje 500 sztuk z這ta.";
};


func int DIA_Addon_Henry_Einigen2_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter) && !Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (Npc_HasItems(other,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Oto twoje 500 sztuk z這ta.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//Wspaniale. Witamy w naszym skromnym obozie.
	B_Henry_NoJoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Addon_Henry_Einigen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Einigen_Condition;
	information = DIA_Addon_Henry_Einigen_Info;
	description = "Mo瞠 si� potargujemy?";
};


func int DIA_Addon_Henry_Einigen_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Mo瞠 si� potargujemy?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//C騜, daj mi jaki� pow鏚, dla kt鏎ego mia豚ym opu�ci� cen�.
};


instance DIA_Addon_Henry_MeatForMorgan(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 4;
	condition = DIA_Addon_Henry_MeatForMorgan_Condition;
	information = DIA_Addon_Henry_MeatForMorgan_Info;
	permanent = FALSE;
	description = "Mam mi瘰o dla Morgana.";
};


func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//Mam mi瘰o dla Morgana.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//Aha. A kto ci� przysy豉?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Jack Aligator. M闚i, 瞠 Morgan czeka na dostaw�.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Tak, tak.. Jakby sam nie m鏬� si� ruszy�...
};


instance DIA_Addon_Henry_Malcom(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Malcom_Condition;
	information = DIA_Addon_Henry_Malcom_Info;
	description = "Malcolm mnie przysy豉. ";
};


func int DIA_Addon_Henry_Malcom_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MalcomBotschaft == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Malcolm mnie przysy豉. M闚i�, 瞠 na drewno przyjdzie troch� poczeka�.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//Tak, tak... Powinienem by� wiedzie�. Jak zwykle, b璠ziemy czeka� ca貫 wieki.
	B_MalcomExident();
};


instance DIA_Addon_Henry_BaltramPack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_BaltramPack_Condition;
	information = DIA_Addon_Henry_BaltramPack_Info;
	description = "Mam przesy趾� dla Skipa.";
};


func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//Mam przesy趾� dla Skipa. Jest w �rodku?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Tak, jest w �rodku. Co� jeszcze?
};


var int Henry_Amount;

instance DIA_Addon_Henry_Tribut(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 7;
	condition = DIA_Addon_Henry_Tribut_Condition;
	information = DIA_Addon_Henry_Tribut_Info;
	permanent = TRUE;
	description = "Wpu�� mnie.";
};


func int DIA_Addon_Henry_Tribut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Wpu�� mnie.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm...
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//Przynios貫� mi wiadomo�� od drwali.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Jeste� pomocnikiem Jacka Aligatora i masz mi瘰o dla Morgana.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//Masz paczk� dla Skipa.
		Henry_Amount = Henry_Amount - 100;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if(Henry_Amount < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A co najciekawsze...
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Uda這 ci si� pokona� tych bandzior闚 z wie篡.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nie my�la貫m, 瞠 uda ci si� tego dokona�!
		Henry_Amount = Henry_Amount - 200;
	};
	if(Henry_Amount <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//Wiesz, co ci powiem? Wchod� za darmo...
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//...albo odejd�.
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut,"To zbyt wiele.",DIA_Addon_Henry_Tribut_nein);
		if(Npc_HasItems(other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut,"Dobrze. Tu jest twoje z這to.",DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobrze. Tu jest twoje z這to.
	B_GiveInvItems(other,self,ItMi_Gold,Henry_Amount);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//Dzi瘯i. Witamy w naszych skromnych progach.
	B_Henry_NoJoin();
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To zbyt wiele.
	if(Henry_Amount < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No co ty? I tak ju� spu�ci貫m z ceny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Daj mi spok鎩, co?
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};


instance DIA_Addon_Henry_Palisade(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Condition;
	information = DIA_Addon_Henry_Palisade_Info;
	permanent = FALSE;
	description = "Co robisz?";
};


func int DIA_Addon_Henry_Palisade_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co robisz?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//A na co to wygl鉅a? Nadzoruj� budow� palisady, 瞠by te lenie zrobi造 to na czas.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Je�li tego nie doko鎍zymy, to kapitan Greg da nam popali�.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Pilnuj� te�, aby nikt niepowo豉ny tu nie wszed�.
};


instance DIA_Addon_Henry_Palisade_WhatFor(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 12;
	condition = DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information = DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent = FALSE;
	description = "Po co stawiacie t� palisad�?";
};


func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Po co stawiacie t� palisad�?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Cho熲y po to, 瞠by utrudni� 篡cie bandytom!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Te sukinkoty podchodz� coraz bli瞠j. Zupe軟ie jak rekiny okr嘀aj鉍e rozbitka na pe軟ym morzu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//Kilku z nich zaszy這 si� w wie篡 na po逝dniu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale s鉅z�, 瞠 to tylko zwiad.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Tak wi璚, je�li w ko鎍u zaatakuj�, b璠ziemy przygotowani.
	Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
	B_LogEntry(TOPIC_Addon_BanditsTower,"W wie篡 na po逝dniu od obozu pirat闚 siedzi grupa bandyt闚.");
};

func void B_Henry_WhereIsTower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Gdzie jest ta wie瘸?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Je�li wyruszysz st鉅 i b璠ziesz trzyma� si� prawej strony...
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//...to po pewnym czasie powiniene� zobaczy� wie輳 na ma造m klifie.
};


instance DIA_Addon_Henry_Turmbanditen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 13;
	condition = DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information = DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent = TRUE;
	description = "Je�li chodzi o tych bandyt闚 z wie篡...";
};


func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor) && (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Je�li chodzi o tych bandyt闚 z wie篡...
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Tak?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Ju� nie b璠� sprawia� k這pot闚.
		if(MIS_Henry_FreeBDTTower == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Wspaniale! Jeden problem z g這wy.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Pokona貫� ich w pojedynk�? Panowie, czapki z g堯w!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kto wie, mo瞠 kiedy� b璠ziesz prawdziwym piratem!
		};
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(HammerPirate,"START");
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_LogEntry(TOPIC_Addon_BanditsTower,"Bandyci w wie篡 nie 篡j�.");
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co teraz?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Tylko nie my�l, 瞠by p鎩�� tam samemu!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//P��niej wy�l� tam dw鏂h ch這pak闚 z mojej grupy aborda穎wej. Oni poradz� sobie z bandytami.
		Knows_HenrysEntertrupp = TRUE;
	};
};


instance DIA_Addon_Henry_Palisade_Bandits(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 14;
	condition = DIA_Addon_Henry_Palisade_Bandits_Condition;
	information = DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent = FALSE;
	description = "Dlaczego zostali�cie zaatakowani przez bandyt闚?";
};


func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Dlaczego zostali�cie zaatakowani przez bandyt闚?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//A jak s鉅zisz? Wojujemy z nimi od jakiego� czasu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na pocz靖ku wszystko by這 w porz鉅ku. Przywie�li�my ich tutaj, a oni odeszli w g章b bagien i nie niepokoili nas wi璚ej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Niestety, p��niej zacz瘭i napada� na ka盥ego, kto nie nale瘸� do ich bandy.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Nie mam poj璚ia, co za demony ich op皻a造!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//My�l�, 瞠 chc� zabra� nasze 這dzie, bo to chyba jedyny spos鏏, by si� st鉅 wyrwa�.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Porozmawiaj ze Skipem. By� w ich obozie i omal nie przyp豉ci� tego 篡ciem.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//To bardzo ciekawa historia!
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//Niestety, nie b璠ziesz m鏬� jej wys逝cha�, bo nie zap豉ci貫� myta.
		Henry_Zoll_WhatFor = TRUE;
	};
};


var int Henry_EnterCrewMember;

instance DIA_Addon_Henry_Entercrew(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 31;
	condition = DIA_Addon_Henry_Entercrew_Condition;
	information = DIA_Addon_Henry_Entercrew_Info;
	permanent = TRUE;
	description = "Chc� do章czy� do waszej grupy aborda穎wej.";
};


func int DIA_Addon_Henry_Entercrew_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chc� do章czy� do waszej grupy aborda穎wej.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//Tym si� nie wykpisz, ch這pcze!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Najpierw musimy ustali�, czy w og鏊e zas逝gujesz na wpuszczenie ci� do obozu!
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//Witam w mojej grupie!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//Przyda nam si� dodatkowe rami�, kiedy b璠ziemy walczy� z bandytami.
		if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm... Jak powiedzia貫m, we� jednego z ch這pc闚 i wykurz bandzior闚 z wie篡.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ju� to zrobi貫�.
		}
		else
		{
			if(Npc_IsDead(SawPirate) && Npc_IsDead(HammerPirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Obaj moi ludzie nie 篡j�. Wygl鉅a na to, 瞠 b璠ziesz musia� p鎩�� tam sam.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Pozb鉅� si� bandyt闚 z wie篡!
				B_LogEntry(TOPIC_Addon_BanditsTower,"Henry chce, 瞠bym usun像 bandyt闚 z wie篡. Nie mo瞠 jednak da� mi 瘸dnego wsparcia.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//We� jednego z moich ch這pc闚 i pozb鉅� si� bandyt闚 z wie篡.
				Henry_GetPartyMember = TRUE;
				B_LogEntry(TOPIC_Addon_BanditsTower,"Henry chce, 瞠bym usun像 bandyt闚 z wie篡. Mog� zabra� ze sob� jednego z jego ch這pak闚.");
			};
			B_Henry_WhereIsTower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Tak jest!
			MIS_Henry_FreeBDTTower = LOG_Running;
		};
		Henry_EnterCrewMember = TRUE;
	};
};


instance DIA_Addon_Henry_Owen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 32;
	condition = DIA_Addon_Henry_Owen_Condition;
	information = DIA_Addon_Henry_Owen_Info;
	description = "Mog� wam jeszcze jako� pom鏂?";
};


func int DIA_Addon_Henry_Owen_Condition()
{
	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE) && !Npc_IsDead(Malcom))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Mog� wam jeszcze jako� pom鏂?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//Od wielu dni czekamy na drewno potrzebne do budowy palisady.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcolm i Owen powinni byli dostarczy� je ju� dawno temu.
	if(!Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//Ob霩 drwali nie jest zbyt daleko - nad jeziorem le蕨cym w kotlinie na po逝dniowym wschodzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcolm powiedzia�, 瞠 dostawa si� op��ni, ale my ju� czekamy ca貫 wieki!
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//Powiedz im, 瞠 czekamy na drewno!
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nie, czekaj... Powiedz to Owenowi. Malcolm jest ma這 wiarygodny.
	B_MalcomExident();
	MIS_Henry_HolOwen = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_Running);
	B_LogEntry(TOPIC_Addon_HolOwen,"Henry czeka przy palisadzie na drewno. Mam powiadomi� o tym Owena, kt鏎y razem z Malcolmem przebywa w kotlinie.");
};

func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Co si� dzieje z Malcolmem?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Nie 篡je.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Mia� nielichego pecha, co?
};


instance DIA_Addon_Henry_Owen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 33;
	condition = DIA_Addon_Henry_Owen2_Condition;
	information = DIA_Addon_Henry_Owen2_Info;
	permanent = TRUE;
	description = "Je�li chodzi o drwala Owena...";
};


func int DIA_Addon_Henry_Owen2_Condition()
{
	if(MIS_Henry_HolOwen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//Je�li chodzi o drwala Owena...
	if(Npc_IsDead(PIR_1367_Addon_Owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Nie 篡je...
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Szlag by to trafi�! Teraz b璠� musia� wys豉� kogo� innego.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//Chyba ju� pora, 瞠by Morgan ruszy� ty貫k i pozby� si� tych stwor闚.
		B_Addon_Henry_MalcomsDead();
		MIS_Henry_HolOwen = LOG_OBSOLETE;
		B_LogEntry(TOPIC_Addon_HolOwen,"Owen i Malcom nie 篡j�.");
		Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	}
	else if(Owen_ComesToHenry == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen dostarczy drewno.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//Doskonale. Czas ju� najwy窺zy.
		B_Addon_Henry_MalcomsDead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Oto twoja nagroda.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		B_StartOtherRoutine(PIR_1367_Addon_Owen,"PostStart");
		B_LogEntry(TOPIC_Addon_HolOwen,"Owen dostarczy drewno Henry'emu.");
		MIS_Henry_HolOwen = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Gdzie jest ten ob霩?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Kawa貫k na po逝dniowy wsch鏚, nieopodal kotliny.
	};
};


var int Henry_PERM_Once;

instance DIA_Addon_Henry_Palisade_CanHelp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 34;
	condition = DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information = DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent = TRUE;
	description = "Potrzebujesz pomocy?";
};


func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if((MIS_Henry_HolOwen == LOG_SUCCESS) || (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Potrzebujesz pomocy?
	if(Henry_PERM_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//Masz jakie� do�wiadczenie w stawianiu palisad?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Niezbyt du瞠.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//W takim razie nie mam dla ciebie 瘸dnej pracy. Poszukaj sobie innego zaj璚ia.
		Henry_PERM_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//R鏏, co chcesz, tylko nie przeszkadzaj mi w pracy, jasne?
};


instance DIA_Addon_Henry_WhatTeach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 21;
	condition = DIA_Addon_Henry_WhatTeach_Condition;
	information = DIA_Addon_Henry_WhatTeach_Info;
	permanent = TRUE;
	description = "Mo瞠sz mnie podszkoli� w walce?";
};


func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//Mo瞠sz mnie podszkoli� w walce?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//Najpierw obowi頊ek, potem przyjemno��. Zr鏏 co� po篡tecznego, to ci� naucz� walczy�.
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//Wszystko jest wliczone w cen�.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Pewnie, czemu nie?
		Henry_Addon_TeachPlayer = TRUE;
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};


var int Henry_merke2h;
var int Henry_Labercount;

func void B_Henry_CommentFightSkill()
{
	if(Henry_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//Szybko si� uczysz, zupe軟ie jak prawdziwy pirat.
		Henry_Labercount = 1;
	}
	else if(Henry_Labercount == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Je�li tak dalej p鎩dzie, to sam b璠ziesz si� rwa� do aborda篡.
		Henry_Labercount = 2;
	}
	else if(Henry_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//Pami皻aj, 瞠 najd逝瞠j 篡j� ci, kt鏎zy opanowali sztuk� parowania.
		Henry_Labercount = 0;
	};
};


instance DIA_Addon_Henry_Teach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_Teach_Condition;
	information = DIA_Addon_Henry_Teach_Info;
	permanent = TRUE;
	description = "Ucz mnie.";
};


func int DIA_Addon_Henry_Teach_Condition()
{
	if(Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Ucz mnie.
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] > Henry_merke2h)
	{
		B_Henry_CommentFightSkill();
	}
	else if(other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Masz przed sob� du穎 nauki.
	};
	Info_ClearChoices(DIA_Addon_Henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};


instance DIA_Addon_Henry_Palisade_Train(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Train_Condition;
	information = DIA_Addon_Henry_Palisade_Train_Info;
	permanent = FALSE;
	description = "Greg jest twoim szefem?";
};


func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg jest twoim szefem?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//Zgadza si�. Ale dla ciebie to jest Kapitan Greg. Rozumiemy si�?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//To wielki cz這wiek. Kiedy go spotkasz, nawet nie my�l, by zrobi� co� g逝piego. Nie spodoba ci si� jego reakcja na takie zachowanie.
	if(PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ju� z nim rozmawia貫m.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//W takim razie wiesz, o czym m闚i�.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Niestety, nie ma go w tej chwili w obozie.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jego zast瘼c� jest Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Ca造mi dniami siedzi przed chat� Grega i gapi si� na nas jak sroka w gnat.
};


instance DIA_Addon_Henry_YourOwnTrupp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_YourOwnTrupp_Condition;
	information = DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapitan powierzy� ci dow鏚ztwo nad grup� uderzeniow�?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ch這pakom przyda si� troch� pracy!
	AI_StopProcessInfos(self);
};

