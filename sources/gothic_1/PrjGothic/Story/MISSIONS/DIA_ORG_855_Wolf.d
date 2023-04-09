
instance DIA_ORG_855_Wolf_Exit(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 999;
	condition = DIA_ORG_855_Wolf_Exit_Condition;
	information = DIA_ORG_855_Wolf_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hello(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_Hello_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int DIA_Wolf_Hello_Condition()
{
	return 1;
};

func void DIA_Wolf_Hello_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hello_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Wolf_Hello_09_01");	//Jestem p�atnerzem. M�wi� na mnie Wilk.
	B_LogEntry(GE_TraderNC,"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoj� chat�, w wielkiej jaskini.");
};


instance DIA_Wolf_GreetORG(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_GreetORG_Condition;
	information = DIA_Wolf_GreetORG_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Wolf_GreetORG_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void DIA_Wolf_GreetORG_Info()
{
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00");	//Hej, teraz jeste� jednym z nas!
};


instance Org_855_Wolf_TRADE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 800;
	condition = Org_855_Wolf_TRADE_Condition;
	information = Org_855_Wolf_TRADE_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Org_855_Wolf_TRADE_Condition()
{
	return 1;
};

func void Org_855_Wolf_TRADE_Info()
{
	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00");	//Zajmujesz si� czym� jeszcze?
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01");	//Skupuj� sk�ry i futra od my�liwych. Gdyby� mia� kiedy� taki towar na zbyciu - zg�o� si� do mnie.
};


instance Org_855_Wolf_WhereHunter(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 900;
	condition = Org_855_Wolf_WhereHunter_Condition;
	information = Org_855_Wolf_WhereHunter_Info;
	permanent = 1;
	description = "Jak mog� zdoby� futra albo sk�ry?";
};


func int Org_855_Wolf_WhereHunter_Condition()
{
	return 1;
};

func void Org_855_Wolf_WhereHunter_Info()
{
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00");	//Jak mog� zdoby� futra albo sk�ry?
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01");	//Przy drodze do Nowego Obozu kr�ci si� Aidan. On mo�e ci� nauczy�, jak �ci�ga� sk�r� ze zwierz�t.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_02");	//Ratford i Drax poluj� zwykle na p�noc od Starego Obozu, na drodze do miejsca wymiany.
};


instance DIA_Wolf_SellArmor(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 700;
	condition = DIA_Wolf_SellArmor_Condition;
	information = DIA_Wolf_SellArmor_Info;
	permanent = 1;
	description = "Potrzebuj� lepszej zbroi.";
};


func int DIA_Wolf_SellArmor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello) && !Npc_KnowsInfo(hero,Info_Wolf_ARMORFINISHED))
	{
		return 1;
	};
};

func void DIA_Wolf_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00");	//Potrzebuj� lepszej zbroi.
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01");	//Teraz, kiedy jeste� jednym z nas, mog� ci jak�� sprzeda�.
		Info_ClearChoices(DIA_Wolf_SellArmor);
		Info_AddChoice(DIA_Wolf_SellArmor,DIALOG_BACK,DIA_Wolf_SellArmor_BACK);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H),DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00");	//Nie mog� ci nic sprzeda�. Lares zabi�by mnie, gdyby dowiedzia� si�, �e sprzedaj� zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//Potrzebuj� wzmocnionego pancerza.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_ORG_ARMOR_M)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Nie ma rudy, nie ma zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03");	//To solidny pancerz. Oczywi�cie nie tak dobry jak ten, kt�ry mam na sobie, ale zapewnia niez�� ochron�.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_ORG_ARMOR_M);
		CreateInvItem(hero,org_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01");	//Mo�esz mi sprzeda� ci�ki pancerz?
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_ORG_ARMOR_H)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02");	//Nie ma rudy, nie ma zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03");	//Ta zbroja uchroni ci� przed ka�dym zagro�eniem. Sam tak� nosz�, i jak dot�d nie zosta�em nawet dra�ni�ty. To bardzo solidny pancerz.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_ORG_ARMOR_H);
		CreateInvItem(hero,org_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance ORG_855_Wolf_TRAINOFFER(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_TRAINOFFER_Condition;
	information = ORG_855_Wolf_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Chcia�bym nauczy� si� strzela� z �uku.";
};


func int ORG_855_Wolf_TRAINOFFER_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) != 2)
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01");	//Chcia�bym nauczy� si� strzela� z �uku.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02");	//C�, m�g�bym ci� nauczy�, ale to b�dzie kosztowa�. Ja te� musz� je��, no nie?
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03");	//Ile?
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04");	//50 bry�ek, bez targowania.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Wilk mo�e mnie nauczy� strzelania z �uku.");
};


instance ORG_855_Wolf_TRAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_TRAIN_Condition;
	information = ORG_855_Wolf_TRAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50);
};


func int ORG_855_Wolf_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01");	//Naucz mnie strzela� z �uku.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Twoja celno�� zale�y g��wnie od twojej zr�czno�ci. Im bardziej zwinnie b�d� twoje ruchy, tym pewniej twoje strza�y b�d� trafia�y w cel.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Twoje umiej�tno�ci wp�yn� na odleg�o�� z jakiej b�dziesz m�g� skutecznie razi� wrog�w. Je�li chcesz kiedy� zosta� strzelcem wyborowym, musisz systematycznie rozwija� zar�wno zr�czno�� jak i umiej�tno�ci.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_Wolf_TRAINAGAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_TRAINAGAIN_Condition;
	information = ORG_855_Wolf_TRAINAGAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,50);
};


func int ORG_855_Wolf_TRAINAGAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01");	//Chcia�bym sprawniej pos�ugiwa� si� �ukiem.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02");	//Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03");	//Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04");	//Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05");	//Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_Wolf_Teach(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 100;
	condition = ORG_855_Wolf_Teach_Condition;
	information = ORG_855_Wolf_Teach_Info;
	permanent = 1;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int ORG_855_Wolf_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01");	//Powodzenie podczas polowania zale�y przede wszystkim od twojej zr�czno�ci.
	if(log_wolftrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Wilk mo�e pom�c mi zwi�kszy� moj� zwinno��.");
		log_wolftrain = TRUE;
	};
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	Info_ClearChoices(ORG_855_Wolf_Teach);
};

func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};


instance Info_Wolf_GOOD(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_GOOD_Condition;
	information = Info_Wolf_GOOD_Info;
	important = 0;
	permanent = 0;
	description = "Gorn powiedzia�, �e chcesz ze mn� pilnie porozmawia�.";
};


func int Info_Wolf_GOOD_Condition()
{
	if(Gorn_GotoWolf)
	{
		return TRUE;
	};
};

func void Info_Wolf_GOOD_Info()
{
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01");	//Gorn powiedzia�, �e chcesz ze mn� pilnie porozmawia�?
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02");	//Dobrze, �e zd��y�e� zajrze� do mnie przed wymarszem!
	if(!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03");	//Przed jakim wymarszem?
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04");	//Przed waszym wymarszem do Niezupe�nie-Wolnej-Kopalni.
	};
};


instance Info_Wolf_SPEAK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SPEAK_Condition;
	information = Info_Wolf_SPEAK_Info;
	important = 0;
	permanent = 0;
	description = "O co chodzi?";
};


func int Info_Wolf_SPEAK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_GOOD))
	{
		return TRUE;
	};
};

func void Info_Wolf_SPEAK_Info()
{
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01");	//O co chodzi?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02");	//Mam pomys� na zupe�nie nowy rodzaj pancerza.
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03");	//Czy�by? A c� to za pomys�?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04");	//Pancerze pe�zaczy s� niezwykle twarde. Znacznie trwalsze ni� cho�by stal.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05");	//Oczywi�cie nie mam tu na my�li tych wychudzonych osobnik�w, kt�re nawiedza�y zawalon� kopalni� Gomeza...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06");	//... O nie, one nie wystarcz�. W NASZEJ kopalni �yj� PRAWDZIWE PE�ZACZE. Wi�ksze, silniejsze i jeszcze bardziej wredne.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07");	//Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08");	//Gdyby� m�g� mi przynie�� kilka p�ytek z ich pancerzy, m�g�bym z nich posk�ada� nie lada zbroj�!
};


instance Info_Wolf_SKIN(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SKIN_Condition;
	information = Info_Wolf_SKIN_Info;
	important = 0;
	permanent = 0;
	description = "W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?";
};


func int Info_Wolf_SKIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01");	//W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02");	//To proste. P�ytki na grzbiecie przymocowane s� tylko przy kraw�dziach.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03");	//Wystarczy wzi�� ostry n� i "ci�� wzd�u� przerywanej linii".
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04");	//W porz�dku. Postaram si� przynie�� ci kilka p�ytek z pancerzy pe�zaczy.
	Knows_GetMCPlates = TRUE;
	PrintScreen("Nowa umiej�tno��: Wycinanie p�ytek pancerza",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Log_CreateTopic(CH4_MCPlateArmor,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor,"Wilk, Szkodnik z Nowego Obozu, zaproponowa� mi wykonanie zbroi z pancerzy pe�zaczy. Pokaza� mi jak nale�y je usuwa� z martwych potwor�w.");
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� usuwania pancerzy z martwych pe�zaczy-wojownik�w.");
	AI_StopProcessInfos(self);
};


instance Info_Wolf_PROFIT(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_PROFIT_Condition;
	information = Info_Wolf_PROFIT_Info;
	important = 0;
	permanent = 0;
	description = "I m�wisz mi to wszystko nie ��daj�c niczego w zamian?";
};


func int Info_Wolf_PROFIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_PROFIT_Info()
{
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01");	//I m�wisz mi to wszystko nie ��daj�c niczego w zamian?
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02");	//No niezupe�nie... Je�li uda mi si� skleci� z tych p�ytek porz�dn� zbroj�, b�d�... bardzo szybko... bardzo du�o... Ach, niewa�ne!
};


instance Info_Wolf_MCPLATESFEW(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESFEW_Condition;
	information = Info_Wolf_MCPLATESFEW_Info;
	important = 0;
	permanent = 0;
	description = "Przynios�em ci kilka tych p�ytek, o kt�re prosi�e�!";
};


func int Info_Wolf_MCPLATESFEW_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) > 0) && (Npc_HasItems(hero,ItAt_Crawler_02) < 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01");	//Przynios�em ci kilka tych p�ytek, o kt�re prosi�e�!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02");	//To za ma�o! Nie starczy na ca�� zbroj�!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03");	//Przynie� mi wi�cej p�ytek!
};


instance Info_Wolf_MCPLATESENOUGH(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESENOUGH_Condition;
	information = Info_Wolf_MCPLATESENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy!";
};


func int Info_Wolf_MCPLATESENOUGH_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) >= 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESENOUGH_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01");	//Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02");	//Fantastycznie! Natychmiast zabieram si� do roboty!
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03");	//Jak d�ugo to zajmie?
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04");	//Nie mam poj�cia. To co� zupe�nie nowego. Jeszcze nigdy czego� takiego nie robi�em!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05");	//B�dziesz musia� zagl�da� do mnie od czasu do czasu.
	MCPlatesDelivered = TRUE;
	B_LogEntry(CH4_MCPlateArmor,"Da�em Wilkowi 15 tych p�ytek z pancerzy. Teraz potrzebuje troch� czasu, �eby sporz�dzi� z nich dla mnie now� zbroj�.");
	B_GiveXP(XP_DeliveredMCPlates);
	B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
	AI_StopProcessInfos(self);
};


instance Info_Wolf_ARMORINWORK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORINWORK_Condition;
	information = Info_Wolf_ARMORINWORK_Info;
	important = 0;
	permanent = 1;
	description = "Jak post�puj� prace nad nowym pancerzem?";
};


func int Info_Wolf_ARMORINWORK_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORINWORK_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01");	//Jak post�puj� prace nad nowym pancerzem?
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02");	//To zajmie d�u�ej ni� my�la�em! Te p�ytki s� niezwykle twarde. Nie bardzo wiem jak mam je ze sob� po��czy�!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03");	//Daj mi jeszcze troch� czasu! Dam rad�, zaufaj mi!
	AI_StopProcessInfos(self);
};


instance Info_Wolf_ARMORFINISHED(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORFINISHED_Condition;
	information = Info_Wolf_ARMORFINISHED_Info;
	important = 0;
	permanent = 0;
	description = "Jak post�puj� prace nad nowym pancerzem?";
};


func int Info_Wolf_ARMORFINISHED_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01");	//Jak post�puj� prace nad nowym pancerzem?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02");	//Uda�o mi si� wreszcie znale�� spos�b na po��czenie p�ytek ze sob�!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03");	//Czy to znaczy, �e zbroja jest ju� gotowa!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04");	//Dok�adnie! Oto i ona! Jest twardsza ni� jakikolwiek pancerz jaki widzia�em na oczy!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05");	//Dzi�ki, jestem twoim d�u�nikiem!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06");	//Nie ma o czym m�wi�! Na pewno na tym nie strac�! Co to, to nie! Ha Ha!
	B_LogEntry(CH4_MCPlateArmor,"Wilk sko�czy� ju� moj� now� zbroj�. To najlepszy pancerz, jaki w �yciu widzia�em!");
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
	B_GiveXP(XP_GorMCPlateArmor);
	CreateInvItem(self,crw_armor_h);
	B_GiveInvItems(self,hero,crw_armor_h,1);
};


instance Org_855_Wolf_SELLBOW(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Org_855_Wolf_SELLBOW_Condition;
	information = Org_855_Wolf_SELLBOW_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mog� kupi� jaki� �uk?";
};


func int Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};

func void Org_855_Wolf_SELLBOW_Info()
{
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01");	//Gdzie mog� kupi� jaki� �uk?
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02");	//Trafi�e� pod w�a�ciwy adres. Mam tu dobry towar za bardzo przyst�pne ceny.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Szkodnik imieniem Wilk sprzedaje �uki.");
};

