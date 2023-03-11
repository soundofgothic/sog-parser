
instance DIA_Snaf_Exit(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 999;
	condition = DIA_Snaf_Exit_Condition;
	information = DIA_Snaf_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Snaf_Exit_Condition()
{
	return 1;
};

func void DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Snaf_Hello(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Hello_Condition;
	information = DIA_Snaf_Hello_Info;
	permanent = 0;
	description = "Jak leci?";
};


func int DIA_Snaf_Hello_Condition()
{
	return 1;
};

func void DIA_Snaf_Hello_Info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Nienajgorzej! Cz�owiek, kt�ry umie dobrze gotowa�, ma tutaj wielu przyjaci�!
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//Chcesz mo�e troch� mojej ry�owej zupy?
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//Dzi�ki.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//M�g�by� co� dla mnie zrobi�...
	CreateInvItem(self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};


var int Snaf_Zutaten;
var int Snaf_FreeMBRagout;

instance DIA_Snaf_Zutaten(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Zutaten_Condition;
	information = DIA_Snaf_Zutaten_Info;
	permanent = 0;
	description = "Co takiego?";
};


func int DIA_Snaf_Zutaten_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void DIA_Snaf_Zutaten_Info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//Co takiego?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//Za�o�� si�, �e lubisz sobie dobrze podje��. Opracowa�em w�a�nie nowy przepis: potrawka z chrz�szcza a la Snaf z ry�em i grzybami.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//Dostaniesz ile tylko zechcesz, ale potrzebuj� jeszcze 3 chrz�szczy i par� piekielnik�w - 5 powinno wystarczy�.
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice(DIA_Snaf_Zutaten,"Chcesz �ebym si� porzyga�?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice(DIA_Snaf_Zutaten,"Brzmi nie�le.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//Chcesz, �ebym si� porzyga�?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//Nie musisz tego je��, ale powiniene� przynajmniej spr�bowa�! Zreszt�, zawsze mo�esz to komu� odsprzeda�!
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//Wys�a�em ju� kogo� po sk�adniki, ale �lad po nim zagin��. Pewnie uciek� do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kucharz mieszkaj�cy w Zewn�trznym Pier�cieniu, wys�a� mnie po 3 chrz�szcze i 5 grzyb�w zwanych piekielnikami, kt�rych potrzebuje do swojego nowego przepisu.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//Brzmi nie�le.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//Zatem id�, i przynie� mi potrzebne sk�adniki.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//Poprzedni cz�owiek, kt�rego wys�a�em nie wr�ci�. Zapewne uciek� do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kucharz mieszkaj�cy w Zewn�trznym Pier�cieniu, wys�a� mnie po 3 chrz�szcze i 5 grzyb�w zwanych piekielnikami, kt�rych potrzebuje do swojego nowego przepisu. W nagrod� mog� liczy� na darmowe porcje.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};


instance DIA_Snaf_ZutatenSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_ZutatenSuccess_Condition;
	information = DIA_Snaf_ZutatenSuccess_Info;
	permanent = 0;
	description = "Mam przy sobie rzeczy, o kt�re prosi�e�!";
};


func int DIA_Snaf_ZutatenSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_mushroom_01) >= 5) && (Npc_HasItems(other,ItAt_Meatbug_01) >= 3))
	{
		return 1;
	};
};

func void DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Mam przy sobie rzeczy, o kt�re prosi�e�!
	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//�wietnie! Teraz musz� je tylko wrzuci� i za chwil� potrawka b�dzie gotowa. Zaczekaj...
	CreateInvItems(other,ItFo_Plants_mushroom_01,3);
	B_GiveInvItems(other,self,ItFo_Plants_mushroom_01,8);
	Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,8);
	Npc_RemoveInvItems(other,ItAt_Meatbug_01,3);
	CreateInvItems(self,ItFoMeatbugragout,3);
	B_GiveInvItems(self,other,ItFoMeatbugragout,3);
	Snaf_Zutaten = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_SUCCESS);
	B_LogEntry(CH1_SnafsRecipe,"Snaf ucieszy� si�, gdy da�em mu sk�adniki, kt�rych szuka�.");
	if(Snaf_FreeMBRagout == TRUE)
	{
		B_LogEntry(CH1_SnafsRecipe,"Od tej pory b�dzie mi codziennie dawa� darmow� porcj� swojej nowej potrawy.");
	};
	B_GiveXP(100);
	AI_StopProcessInfos(self);
};


var int Snaf_RagoutDay;

instance DIA_Snaf_AfterSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_AfterSuccess_Condition;
	information = DIA_Snaf_AfterSuccess_Info;
	permanent = 1;
	description = "Powiedzia�e�, �e mog� dosta� tyle potrawki ile tylko zapragn�...";
};


func int DIA_Snaf_AfterSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && (Snaf_FreeMBRagout == TRUE))
	{
		return 1;
	};
};

func void DIA_Snaf_AfterSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//Powiedzia�e�, �e mog� dosta� tyle potrawki ile tylko zapragn�...
	if(Snaf_RagoutDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//I dotrzymam s�owa. Prosz�, we� te 3 porcje.
		CreateInvItems(self,ItFoMeatbugragout,3);
		B_GiveInvItems(self,other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//Jasne! Ale nic mi ju� dzisiaj nie zosta�o. Wr�� jutro!
	};
};


instance DIA_Snaf_WhereMeatbugs(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = DIA_Snaf_WhereMeatbugs_Condition;
	information = DIA_Snaf_WhereMeatbugs_Info;
	permanent = 0;
	description = "Gdzie mog� znale�� te chrz�szcze?";
};


func int DIA_Snaf_WhereMeatbugs_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//Gdzie mog� znale�� te chrz�szcze?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//Wsz�dzie, gdzie walaj� si� jakie� odpady. Poszukaj w opuszczonych chatach przy zamkowych murach.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//Tylko niech ci� nie odstraszy ich paskudny wygl�d. Po ugotowaniu s� ca�kiem smaczne.
	B_LogEntry(CH1_SnafsRecipe,"Chrz�szcze znajd� w opuszczonych chatach, przy zamkowych murach.");
};


instance DIA_Snaf_WhereMushrooms(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 4;
	condition = DIA_Snaf_WhereMushrooms_Condition;
	information = DIA_Snaf_WhereMushrooms_Info;
	permanent = 0;
	description = "Gdzie znajd� te piekielniki?";
};


func int DIA_Snaf_WhereMushrooms_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00");	//Gdzie znajd� te piekielniki?
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//Wyjd� z Obozu przez po�udniow� bram�, to ta pod zawalon� wie��. Znajdziesz si� na ��ce, na kt�rej rosn� grzyby.
	B_LogEntry(CH1_SnafsRecipe,"Piekielniki rosn� na ��ce, przy zawalonej wie�y po�udniowej bramy.");
};


instance DIA_Snaf_WhereNek(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = DIA_Snaf_WhereNek_Condition;
	information = DIA_Snaf_WhereNek_Info;
	permanent = 0;
	description = "Kim by� cz�owiek, kt�rego wys�a�e� na poszukiwania przede mn�?";
};


func int DIA_Snaf_WhereNek_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereNek_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//Kim by� cz�owiek, kt�rego wys�a�e� na poszukiwania przede mn�?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//Nazywa� si� Nek. Chyba nie czu� si� tu zbyt dobrze. Podejrzewam, �e uciek� do Nowego Obozu.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//Wys�a�em go po grzyby, ale nigdy nie wr�ci�...
	if((Sly_LostNek != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	};
	B_LogEntry(CH1_LostNek,"Snaf wys�a� Neka na poszukiwanie grzyb�w.");
};

