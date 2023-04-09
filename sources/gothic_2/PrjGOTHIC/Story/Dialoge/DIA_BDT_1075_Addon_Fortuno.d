
instance DIA_Addon_Fortuno_EXIT(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 999;
	condition = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fortuno_PICKPOCKET(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 900;
	condition = DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information = DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Addon_Fortuno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,Dialog_Back,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};

func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};


instance DIA_Addon_Fortuno_Hi(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Fortuno_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Fortuno_Geheilt_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Hi_Info()
{
	if(Fortuno_Einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//Czarna chmura nad domem... ON nadchodzi....
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//Krwi�... Przyzywa�em go... ON, kt�ry mnie obserwuje... Och, nie, odejd�, zostaw mnie...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Dobrze si� czujesz?
		Fortuno_Einmal = TRUE;
		Log_CreateTopic(Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_Running);
		B_LogEntry(Topic_Addon_Fortuno,"Fortuno postrada� zmys�y. Szuka 'zielonego nowicjusza'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zielony... Zielony nowicjusz... Nie mog� go znale��...
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Wr�c� p�niej... (KONIEC)",DIA_Addon_Fortuno_Hi_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Jak mog� ci pom�c?",DIA_Addon_Fortuno_Hi_HILFE);
	if(Npc_HasItems(other,ItMi_Joint) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Masz, we� to bagienne ziele.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if(Npc_HasItems(other,ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Dobrze, spr�buj tego zielonego nowicjusza.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//Jak mog� ci pom�c?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//Zielony... Zielony nowicjusz pomaga nowicjuszowi...
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Masz, we� to bagienne ziele.
	if(B_GiveInvItems(other,self,ItMi_Joint,1))
	{
		AI_UseItem(self,ItMi_Joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Nie zielony ani nie silny, nie zielony, nie silny...
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Dobrze, spr�buj tego zielonego nowicjusza.
	if(B_GiveInvItems(other,self,ItMi_Addon_Joint_01,1))
	{
		AI_UseItem(self,ItMi_Addon_Joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//AAACH...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moja g�owa... Kim... Jestem... Fortuno... Co... Co si� dzieje?
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	B_GivePlayerXP(XP_Addon_Fortuno_01);
	B_LogEntry(Topic_Addon_Fortuno,"Zielony nowicjusz przywr�ci� zmys�y Fortuna.");
};


instance DIA_Addon_Fortuno_wer(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent = FALSE;
	description = "Dobrze, a teraz powiedz mi, co z tob�.";
};


func int DIA_Addon_Fortuno_wer_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Dobrze, a teraz powiedz mi, co z tob�.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//By�em kiedy� cz�onkiem Bractwa �ni�cego. Wtedy wszystko by�o jeszcze w porz�dku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Tak, wszyscy byli�my skazanymi przest�pcami, ale �ycie dla nas - nowicjuszy - nie by�o takie z�e...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, ja te� by�em wi�niem w G�rniczej Dolinie. Powiedz mi co�, czego nie wiem.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//Ja... Nic nie pami�tam. Ciemno�� przes�ania m�j umys�.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//Spr�buj si� skoncentrowa�. Co si� sta�o? Jak odzyska�e� �wiadomo��?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Kruk... Pami�tam tylko Kruka i... ciemne pomieszczenia.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//O co chodzi z Krukiem? Co on ci zrobi�?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//Przepraszam. Czuj� si�, jakby m�j umys� nie by� wolny... Sam tego nie rozumiem...
};


instance DIA_Addon_Fortuno_FREE(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 5;
	condition = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent = FALSE;
	description = "Musi by� jaki� spos�b, �eby przywr�ci� ci wspomnienia.";
};


func int DIA_Addon_Fortuno_FREE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Musi by� jaki� spos�b, �eby przywr�ci� ci wspomnienia.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm... Mo�e jest spos�b.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali sztuk� koncentracji i manipulacji umys�em.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY wiesz co� o tych rzeczach?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Nie, obawiam si�, �e ta wiedza zagin�a...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Cholera. Je�eli jest jaki� spos�b na uwolnienie twojego umys�u, to go znajd�.
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	B_LogEntry(Topic_Addon_Fortuno,"Fortuno wr�ci� do zmys��w, ale niczego nie pami�ta.");
};


instance DIA_Addon_Fortuno_Herb(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 99;
	condition = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent = FALSE;
	description = "Potrzebujesz wi�cej bagiennego ziela?";
};


func int DIA_Addon_Fortuno_Herb_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Potrzebujesz wi�cej bagiennego ziela?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//Taaak, potrzebuj� tyle ziela, ile tylko zdo�asz przynie��.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Zap�ac� ci lepiej ni� Fisk.
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade,Dialog_Back,DIA_Addon_Fortuno_Trade_BACK);
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(Oddaj ca�e bagienne ziele)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(Oddaj 1 bagienne ziele)",DIA_Addon_Fortuno_Trade_1);
	};
};


instance DIA_Addon_Fortuno_Trade(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 100;
	condition = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent = TRUE;
	description = "Mam dla ciebie bagienne ziele...";
};


func int DIA_Addon_Fortuno_Trade_Condition()
{
	if((Npc_HasItems(other,ItPl_SwampHerb) >= 1) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Herb))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//Mam dla ciebie bagienne ziele...
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,ItPl_SwampHerb);
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,amount))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,amount * Value_SwampHerb);
	B_GivePlayerXP(amount * 10);
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_1()
{
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,1))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb);
	B_GivePlayerXP(10);
	B_Fortuno_InfoManager();
};


instance DIA_Addon_Fortuno_Trank(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 3;
	condition = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent = FALSE;
	description = "Mam dla ciebie mikstur�. Powinna pom�c ci odzyska� pami��.";
};


func int DIA_Addon_Fortuno_Trank_Condition()
{
	if((Fortuno_Geheilt_01 == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE) && ((Npc_HasItems(other,ItPo_Addon_Geist_01) >= 1) || (Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//Mam dla ciebie mikstur�. Powinna pom�c ci odzyska� pami��.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Ufam ci.
	if(Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)
	{
		if(B_GiveInvItems(other,self,ItPo_Addon_Geist_02,1))
		{
			AI_UseItem(self,ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP(XP_Addon_Fortuno_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Addon_Geist_01,1))
	{
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,ItPo_Addon_Geist_01);
	};
};


instance DIA_Addon_Fortuno_more(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent = FALSE;
	description = "No i jak?";
};


func int DIA_Addon_Fortuno_more_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_more_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//No i jak?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//Ach! Teraz... Teraz pami�tam... Adanosie, pom�... Co ja uczyni�em?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Tak, co zrobi�e�? A co wa�niejsze, co zrobi� Kruk?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomog�em mu... nawi�za� kontakt. Z NIM. Potrzebowa� wielu eliksir�w... Uwarzy�em je dla niego.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Pr�bowa� otworzy� portal, aby dosta� si� do �wi�tyni.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Po co? Czego on chce ze �wi�tyni?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Jest tam pot�ny artefakt... Pogrzebany wraz ze swym ostatnim w�a�cicielem. Pot�nym wojownikiem, kt�ry wykonywa� JEGO wol�...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//Co dalej?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nie uda�o nam si� otworzy� portalu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Kruk jednak dowiedzia� si�, �e ZDO�A go otworzy�, je�li odkopie krypt� kap�ana.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//Dlatego �ci�gn�� tu tych wszystkich niewolnik�w. Ofiary, kt�re zmusi� do kopania w miejscu, gdzie odpoczywaj� si�y czasu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Krypt� kap�ana?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Grobowiec kap�ana Adanosa znajduje si� w kopalni.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Przypominam sobie te� kamienne tabliczki. Kruk wierzy�, �e wska�� mu drog�.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Gdy tylko zdo�a� odcyfrowa� inskrypcje, sta�em si� zb�dny.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Rzuci� na mnie zakl�cie, kt�re sprawi�o, �e wszystko zapomnia�em. A ty mnie uwolni�e�.
	SC_KnowsFortunoInfos = TRUE;
	B_LogEntry(TOPIC_Addon_RavenKDW,"Kruk chce wydoby� pot�ny artefakt ze �wi�tyni Adanosa.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Z jakiego� powodu Kruk rozkopa� w kopalni z�ota gr�b jednego z kap�an�w prastarej kultury.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Kruk s�dzi, �e w realizacji jego planu pomog� jakie� kamienne tablice.");
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Addon_Fortuno_03);
};


instance DIA_Addon_Fortuno_Attentat(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 9;
	condition = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fortuno_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Pr�ba zab�jstwa? Wybacz, przez jaki� czas mnie... nie by�o. Nie wiem nic na ten temat.
};

