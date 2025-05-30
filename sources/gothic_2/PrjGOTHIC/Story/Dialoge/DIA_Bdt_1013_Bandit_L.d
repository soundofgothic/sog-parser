
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//Na twoim miejscu trzyma�bym si� z dala od jaskini tam, na g�rze. Moi kumple mog� ci nie�le osmali� ty�ek. A wierz mi, na bitce to oni si� znaj�.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hej - sk�d si� tu wzi��e�, co?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Przybywam z g�r.",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Przysy�a mnie Xardas...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Przybywam z g�r.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//No w�a�nie, przybywasz z g�r. To �le.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Bardzo �le.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Szukaj� ci� - ca�a zgraja naprawd� z�ych ludzi.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Jest tu kto�, z kim musisz natychmiast porozmawia�. Chod� za mn�!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo�e p�niej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Komu tak bardzo na mnie zale�y?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz�dku, prowad�.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Przysy�a mnie Xardas...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//Stary czarodziej? Nazywa si� Xardas... Braga z pewno�ci� to zainteresuje.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//W porz�dku, prowad�.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//No dobra, chod� za mn�. Jaskinia jest niedaleko.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Komu tak bardzo na mnie zale�y?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Po�owa Khorinis si� za tob� ugania, nie powiesz mi chyba, �e nie masz o tym zielonego poj�cia?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Ach! Rozumiem! Nie chcesz o tym gada�, co? W porz�dku - twoja sprawa.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//To jak, idziesz czy nie?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo�e p�niej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Z kim powinienem porozmawia�?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz�dku, prowad�.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//Z kim powinienem porozmawia�?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//Z moim szefem. Nazywa si� Brago. On wyja�ni ci wszystko o wiele lepiej ni� ja.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//No wi�c jak - idziemy?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo�e p�niej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Sk�d mam wiedzie�, �e to nie jest pu�apka?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz�dku, prowad�.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Sk�d mam wiedzie�, �e to nie jest pu�apka?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Wiesz, zaczynasz mnie ju� m�czy�. Je�li nie chcesz pomocy, to id� do miasta, niech ci� zapuszkuj�!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Albo NATYCHMIAST ze mn� p�jdziesz, albo zejd� mi z oczu, �apiesz?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo�e p�niej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Kto� ju� pr�bowa� mnie wyko�owa�...",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz�dku, prowad�.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Spokojnie, przyjacielu! Kto� ju� pr�bowa� mnie wyko�owa�...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Czy�by?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Pewien cz�owiek chcia�, �eby�my odzyskali razem amulet, a zyskami podzielili si� po po�owie.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Kiedy ju� wykonali�my zadanie, on i banda jego kole�k�w zaatakowali mnie.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Wygl�da na to, �e� trafi� na nieuczciwych ludzi - gdzie to si� wydarzy�o?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"To nie ma znaczenia.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"By�em skaza�cem w kolonii g�rniczej.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//By�em skaza�cem w kolonii g�rniczej.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//Ej... Przychodzisz spoza Bariery? Cz�owieku! Byli�my tam razem!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Nie pami�tam ci�...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//By�em kopaczem w Starym Obozie. Trzyma�em si� z dala od k�opot�w.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//Ale teraz najwa�niejsze jest to, �e wpakowa�e� si� w porz�dne tarapaty!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Kto� wyznaczy� za twoj� g�ow� ca�kiem spor� nagrod�. Pojawi�y si� te� listy go�cze z twoj� facjat�!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//Na twoim miejscu bardzo bym na siebie uwa�a�. S� w�r�d nas ludzie, kt�rzy dla z�ota pozabijaliby w�asne matki.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Ale my, ch�opcy z kolonii karnej, powinni�my si� trzyma� razem!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Powinienem ci chyba podzi�kowa�...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Nie ma za co. Pr�buj� po prostu utrzyma� si� przy �yciu.
	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//To nie ma znaczenia.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Jak tam sobie chcesz. To co? Idziemy?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo�e p�niej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz�dku, prowad�.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Mo�e p�niej...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//Nie b�dzie �adnego p�niej, kole�ko!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if(Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//G�upio zrobi�e�, �ledz�c mnie...
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hej, ludzie, patrzcie, kogo tu mamy...
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = "Kto wyznaczy� t� nagrod�?";
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Kto wyznaczy� t� nagrod�?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//Tego nie wiem. Tylko jeden z nas go zna.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//A kto to taki?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hej, stary, no naprawd� nie mog� ci tego powiedzie�. Wiesz, jak jest...
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits,"�cigaj� mnie bandyci. Maj� list go�czy z moj� podobizn�. Zastanawiam si�, kto lub co si� za tym kryje.");
	MIS_Steckbriefe = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = "10 sztuk z�ota za imi� tego go�cia!";
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if((Bdt13_Friend == TRUE) && (Bdt13_Dexter_verraten == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 sztuk z�ota za imi� tego go�cia!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Och, stary, naprawd� nie mog� tego zrobi�...
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//No, wykrztu� to w ko�cu!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//Och, stary! No dobra. Nazywa si� Dexter. Ko�o du�ego gospodarstwa jest stroma ska�a.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//Na niej jest wie�a stra�nicza, a obok kilka kopalni. Gdzie� w pobli�u jest jego kryj�wka.
	B_LogEntry(Topic_Bandits,"Przyw�dc� bandyt�w jest Dexter. Ukrywa si� w kopalni w pobli�u farmy w�a�ciciela ziemskiego.");
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Widzisz, to nie by�o takie trudne. Tu jest twoje z�oto.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//Eee... W�a�nie przypomnia�em sobie, �e nie mam dziesi�ciu sztuk z�ota.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Co?! Ja... Och, niewa�ne. To moja wina. Mog�em nic ci nie m�wi�, zanim nie zobaczy�em z�ota...
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//Tylko nie m�w im, kto ci to powiedzia�.
	Bdt13_Dexter_verraten = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = "Dasz mi ten portret?";
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Dasz mi ten portret?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Jasne. Przecie� to TWOJA g�ba.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	information = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = "Przys�a� mnie jeden z ch�op�w spoza miasta...";
};


func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Przys�a� mnie jeden z ch�op�w spoza miasta...
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Co? Wie�niacy wiedz� o kryj�wce?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//Zauwa�yli brak owiec.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//O cholera! C�, wi�c musz� si� st�d wynie��. Je�li znajd� pust� kryj�wk�, to mo�e przestan� mnie szuka�.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//On chce, �eby�cie wszyscy zgin�li...
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Zaraz - chyba mnie nie wkopiesz? Nie po tym, jak ci pomog�em?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//No to id� i porozbijaj �by pozosta�ym, skoro tak pragniesz rozlewu krwi - ja w to nie wchodz�!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = "Wkr�tce rozp�ta si� tu prawdziwe piek�o!";
};


func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Wkr�tce rozp�ta si� tu prawdziwe piek�o!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Co?!
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Idzie tu po ciebie niejaki Cavalorn!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//Cholera! Musz� si� st�d wynie��.
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_Gossip_Wildnis;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = "Wiesz co� jeszcze, co mog�oby mnie zainteresowa�?";
};


func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Wiesz co� jeszcze, co mog�oby mnie zainteresowa�?
	if(bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Chodzi ci o tutejsz� okolic�? Je�li chcesz prze�y�, trzymaj si� �cie�ek.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//Im dalej zapu�cisz si� w dzicz, tym wi�ksze grozi ci niebezpiecze�stwo.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//Powiedzia�em ci wszystko, co wiem.
	};
};

