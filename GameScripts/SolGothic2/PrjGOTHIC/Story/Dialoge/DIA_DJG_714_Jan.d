
instance DIA_Jan_EXIT(C_Info)
{
	npc = DJG_714_Jan;
	nr = 999;
	condition = DIA_Jan_EXIT_Condition;
	information = DIA_Jan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_Hello(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Hello_Condition;
	information = DIA_Jan_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jan_Hello_Condition()
{
	if((Kapitel >= 4) && Npc_IsInState(self,ZS_Talk) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Hello_Info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//Przyj�cie tutaj by�o bardzo g�upim pomys�em.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//My�la�em, �e co� tu zdob�d�. Ale w okolicy nie ma nic pr�cz paru aroganckich paladyn�w oraz ork�w.
};


instance DIA_JAN_Dragons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragons_Condition;
	information = DIA_Jan_Dragons_Info;
	permanent = FALSE;
	description = "Zapomnia�e� o smokach!";
};


func int DIA_Jan_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (MIS_JanBecomesSmith == FALSE) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Dragons_Info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomnia�e� o smokach!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//Jak m�g�bym zapomnie�. Powiem ci co�. Jestem kowalem, nie wojownikiem.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Wyrabiam bro�. Walk� zostawiam innym.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Wobec tego dlaczego nie stoisz za kowad�em?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladyni nie wpuszcz� mnie do ku�ni. Nie mog� nic zrobi�, chyba �e chc� sko�czy� w lochu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Te� jeste� jednym z nich. Wi�c mo�e wstawisz si� za mn�?
	};
	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons,"Musz� rusza� w drog�.",DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons,"Co b�d� z tego mia�?",DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons,"Spr�buj� ci pom�c.",DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Spr�buj� ci pom�c.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak tego dokonasz? Parcival rozkaza� nas pilnowa�.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikt nie odwa�y si� tego zlekcewa�y�.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//Zrobi�, co w mojej mocy.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nie s�dz�, �eby zechcia� ci� wys�ucha�.
	Log_CreateTopic(TOPIC_JanBecomesSmith,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith,LOG_Running);
	B_LogEntry(TOPIC_JanBecomesSmith,"Jan, �owca smok�w z zamku w G�rniczej Dolinie, chce pracowa� w ku�ni, jednak Parcival mu tego zabrania.");
	MIS_JanBecomesSmith = LOG_Running;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co b�d� mia� z tego, �e ci pomog�?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nic nie mam. Co najwy�ej b�d� m�g� ci� czego� nauczy�.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Znam metod�, dzi�ki kt�rej ostrza z magicznej rudy s� jeszcze mocniejsze.
	};
	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Musz� rusza� w drog�.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//Wspaniale. Nie mog� opu�ci� teraz zamku ani nic wyku�.
	Info_ClearChoices(DIA_JAN_Dragons);
};


instance DIA_JAN_Home(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Home_Condition;
	information = DIA_Jan_Home_Info;
	permanent = FALSE;
	description = "Sk�d pochodzisz?";
};


func int DIA_Jan_Home_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel >= 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Home_Info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Sk�d pochodzisz?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Do��czy�em do paru ludzi z g�r. Ruszyli�my do Doliny, aby zbi� fortun�, poluj�c na smoki.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Ich przyw�dca zwa� si� Sylvio. Ch�opie, co to by� mu�! Traktowa� mnie, jakbym by� jego w�asno�ci�.
};


instance DIA_JAN_OldCamp(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_OldCamp_Condition;
	information = DIA_Jan_OldCamp_Info;
	permanent = TRUE;
	description = "Co si� wydarzy�o w zamku?";
};


func int DIA_Jan_OldCamp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_OldCamp_Info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co w og�le sta�o si� w zamku?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o czym bym s�ysza�. Oczywi�cie martwi mnie to, co sta�o si� POZA zamkiem.
};


instance DIA_JAN_Parcival(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Parcival_Condition;
	information = DIA_Jan_Parcival_Info;
	permanent = FALSE;
	description = "Rozmawia�em z Parcivalem.";
};


func int DIA_Jan_Parcival_Condition()
{
	if((MIS_JanBecomesSmith != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Parcival_Info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Rozmawia�em z Parcivalem.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//No i?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Nie ufa nam, �owcom smok�w.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Nie ufa wam, �owcom smok�w.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Szlag by to trafi�. Ja chc� jedynie pracowa�.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//No to pozostaje mi si� podda�. Jedynie Garond m�g�by mi teraz pom�c.
};


instance DIA_JAN_JanIsSmith(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_JanIsSmith_Condition;
	information = DIA_Jan_JanIsSmith_Info;
	permanent = FALSE;
	description = "Id� po sw�j m�ot, jest dla ciebie robota.";
};


func int DIA_Jan_JanIsSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_JanIsSmith_Info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Id� po sw�j m�ot, jest dla ciebie robota.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Uda�o ci si�? Jak to zrobi�e�?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Musia�em za ciebie por�czy�, wi�c lepiej mnie nie zawied�.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Nie martw si�. Na pewno ci� nie zawiod�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SellWeapons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellWeapons_Condition;
	information = DIA_Jan_SellWeapons_Info;
	permanent = FALSE;
	description = "Sprzedajesz jak�� bro�?";
};


func int DIA_Jan_SellWeapons_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (Jan_TeachPlayer == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellWeapons_Info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Sprzedajesz jak�� bro�?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//Oczywi�cie, �e nie. Wtedy twoi koledzy wrzuciliby mnie do wi�zienia za nielegalny handel, co? Nie, zapomnij o tym.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Robi�bym to, gdybym m�g�. Ale najpierw musz� dostarczy� bro� paladynom w zamku.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale mog� ci pokaza�, jak samemu wyku� bro�.
	Jan_TeachPlayer = TRUE;
};


instance Jan_Training_Talente(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = Jan_Training_Talente_Condition;
	information = Jan_Training_Talente_Info;
	permanent = TRUE;
	description = "Naucz mnie kowalstwa.";
};


func int Jan_Training_Talente_Condition()
{
	if((Jan_TeachPlayer == TRUE) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void Jan_Training_Talente_Info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Naucz mnie kowalstwa.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co konkretnie planujesz zrobi�?
	Info_ClearChoices(Jan_Training_Talente);
	Info_AddChoice(Jan_Training_Talente,Dialog_Back,Jan_Training_Smith_Back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente,B_BuildLearnString("Nauka kowalstwa",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),Jan_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),Jan_Training_Smith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),Jan_Training_Smith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),Jan_Training_Smith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),Jan_Training_Smith_2hSpecial2);
		};
	};
};

func void Jan_Training_Smith_Back()
{
	Info_ClearChoices(Jan_Training_Talente);
};

func void Jan_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void Jan_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void Jan_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void Jan_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void Jan_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};


var int DIA_JAN_SellArmor_permanent;

instance DIA_JAN_SellArmor(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellArmor_Condition;
	information = DIA_Jan_SellArmor_Info;
	permanent = TRUE;
	description = "Mog� kupi� od ciebie jak�� zbroj�?";
};


func int DIA_Jan_SellArmor_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Mog� kupi� od ciebie jak�� zbroj�?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Nie mam nic, co by�oby lepsze od twojej zbroi. Zapomnijmy o tym.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Mag, kt�ry chce nosi� zbroj�? Zapomnij. Id� do krawca. Nie mog� zrobi� dla ciebie zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Gdybym jak�� mia�, ch�tnie bym ci j� sprzeda�. Niestety, nie mam �adnej zbroi.
		Info_ClearChoices(DIA_JAN_SellArmor);
		Info_AddChoice(DIA_JAN_SellArmor,"No to chyba nic nie mo�na zrobi�.",DIA_JAN_SellArmor_Sorry);
		Info_AddChoice(DIA_JAN_SellArmor,"Mo�e w takim razie zrobisz mi zbroj�?",DIA_JAN_SellArmor_BuildOne);
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//No to chyba nic nie mo�na zrobi�.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Jak ju� co� b�dziesz mia�, to daj mi zna�.
	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//Mo�e w takim razie zrobisz mi zbroj�?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//C�, je�li chcesz czego� lepszego, musisz mi dostarczy� odpowiednie materia�y.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Czego potrzebujesz?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chcesz walczy� ze smokami, prawda? Przynie� mi kilka smoczych �usek. M�g�bym z nich co� dla ciebie zmajstrowa�.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 powinno wystarczy�.
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices(DIA_JAN_SellArmor);
};


var int Jan_Sells_Armor;

instance DIA_JAN_Dragonscales(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragonscales_Condition;
	information = DIA_Jan_Dragonscales_Info;
	permanent = TRUE;
	description = "Mam te smocze �uski dla ciebie.";
};


func int DIA_Jan_Dragonscales_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == TRUE) && (Jan_Sells_Armor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 1))
	{
		return 1;
	};
};


var int DIA_JAN_Dragonscales_OneTime;

func void DIA_Jan_Dragonscales_Info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//Mam te smocze �uski dla ciebie.
	if(Npc_HasItems(other,ItAt_DragonScale) >= 20)
	{
		B_GiveInvItems(other,self,ItAt_DragonScale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobrze, da si� co� z tego zrobi�.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Wr�� jutro. Ta cz�� powinna by� ju� gotowa.
		if(DIA_JAN_Dragonscales_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};
		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Potrzebuj� 20 smoczych �usek. Inaczej nie b�d� w stanie zrobi� ci �adnej zbroi.
	};
};


var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;

instance DIA_JAN_ArmorReady(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_ArmorReady_Condition;
	information = DIA_Jan_ArmorReady_Info;
	permanent = TRUE;
	description = "Zbroja jest gotowa?";
};


func int DIA_Jan_ArmorReady_Condition()
{
	if((MIS_OCGateOpen == FALSE) && (Jan_Sells_Armor != FALSE) && (DIA_JAN_ArmorReady_NoPerm == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Zbroja jest gotowa?
	if(Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Nie, jeszcze nie. Przyjd� jutro.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Tak, to prawdziwy majstersztyk. Mo�esz j� kupi�, je�li chcesz.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Dam ci specjaln� cen� - 12,000 sztuk z�ota.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co? Po tym wszystkim, co dla ciebie zrobi�em?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Musz� jako� zarobi� na �ycie. Bierzesz albo do widzenia.
		DJG_Armor_is_offered = TRUE;
		DIA_JAN_ArmorReady_NoPerm = TRUE;
	};
};


var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;

instance DIA_Jan_DJG_ARMOR_M(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_DJG_ARMOR_M_Condition;
	information = DIA_Jan_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "�redni pancerz �owcy smok�w. Ochrona (bro� i strza�y) 80, 12000 sztuk z�ota.";
};


func int DIA_Jan_DJG_ARMOR_M_Condition()
{
	if((Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (DJG_Armor_is_offered == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jan_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chc� kupi� zbroj�.
	if(Npc_HasItems(other,ItMi_Gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Sam widzisz, �e warta jest ka�dej sztuki z�ota.
		B_GiveInvItems(other,self,ItMi_Gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		B_GiveInvItems(self,other,itar_djg_m,1);
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nie masz do�� z�ota.
	};
};


instance DIA_Jan_DragonPlettBericht(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonPlettBericht_Condition;
	information = DIA_Jan_DragonPlettBericht_Info;
	description = "Co do tych smok�w...";
};


var int DIA_Jan_DragonPlettBericht_NoPerm;

func int DIA_Jan_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_JAN_Dragons) && (DIA_Jan_DragonPlettBericht_NoPerm == FALSE) && (MIS_OCGateOpen == FALSE) && (MIS_KilledDragons != 0))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info()
{
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Zabi�em smoka.
	}
	else if((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabi�em kilka smok�w.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabi�em wszystkie smoki.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//No i co? Jeste� przecie� �owc� smok�w, prawda?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//A czy ty r�wnie� nim nie jeste�?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To �adnie. Ale szczerze powiedziawszy, niewiele mnie to interesuje.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Ju� ci powiedzia�em, �e wol� robi� bro�, ni� bra� udzia� w polowaniu na smoki.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Jest jednak pewna rzecz, kt�ra by mnie interesowa�a.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Gdyby� przyni�s� mi troch� smoczej krwi, zap�aci�bym ci za ni� niez�� sumk�.
		Jan_WantsDragonBlood = TRUE;
	};
};


instance DIA_Jan_DragonBlood(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonBlood_Condition;
	information = DIA_Jan_DragonBlood_Info;
	permanent = TRUE;
	description = "Mam dla ciebie troch� smoczej krwi.";
};


func int DIA_Jan_DragonBlood_Condition()
{
	if((Jan_WantsDragonBlood == TRUE) && (MIS_OCGateOpen == FALSE) && Npc_HasItems(other,ItAt_DragonBlood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonBlood_Info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Mam dla ciebie troch� smoczej krwi.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//�wietnie. Sprzedaj mi wszystko, co masz.
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(wszystko)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(jedna buteleczka)",DIA_Jan_DragonBlood_1);
	};
};

func void DIA_Jan_DragonBlood_BACK()
{
	Info_ClearChoices(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = 1;
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(wszystko)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(jedna buteleczka)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_PrintScreen(BloodText,-1,-1,FONT_ScreenSmall,2);
};

func void DIA_Jan_DragonBlood_all()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = Npc_HasItems(other,ItAt_DragonBlood);
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(wszystko)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(jedna buteleczka)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_PrintScreen(BloodText,-1,-1,FONT_ScreenSmall,2);
};


instance DIA_Jan_NACHOCGATEOPEN(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_NACHOCGATEOPEN_Condition;
	information = DIA_Jan_NACHOCGATEOPEN_Info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int DIA_Jan_NACHOCGATEOPEN_Condition()
{
	if(MIS_OCGateOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jan_NACHOCGATEOPEN_Info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//Absolutnie nic nie jest w porz�dku!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Idioci! Dlaczego otworzyli�cie bram�? Zawsze wiedzia�em, �e paladynom brakuje pi�tej klepki!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak po prostu otwieraj� sobie bram�. T�paki! W g�owie mi si� to nie mie�ci.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jan_PICKPOCKET(C_Info)
{
	npc = DJG_714_Jan;
	nr = 900;
	condition = DIA_Jan_PICKPOCKET_Condition;
	information = DIA_Jan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Jan_PICKPOCKET_Condition()
{
	return C_Beklauen(37,95);
};

func void DIA_Jan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
	Info_AddChoice(DIA_Jan_PICKPOCKET,Dialog_Back,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

