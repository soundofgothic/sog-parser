
instance DIA_Whistler_Exit(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 999;
	condition = DIA_Whistler_Exit_Condition;
	information = DIA_Whistler_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Whistler_Exit_Condition()
{
	return 1;
};

func void DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Whistler_IAmNew(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 1;
	condition = DIA_Whistler_IAmNew_Condition;
	information = DIA_Whistler_IAmNew_Info;
	permanent = 0;
	description = "Cze��! Jestem tu nowy!";
};


func int DIA_Whistler_IAmNew_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void DIA_Whistler_IAmNew_Info()
{
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_00");	//Cze��! Jestem tu nowy!
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_01");	//Czego chcesz?
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_02");	//Chcia�bym zosta� jednym z was - chc� zosta� cz�onkiem Obozu.
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_03");	//Szukasz ludzi, kt�rzy ci� popr�, co?
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_04");	//Je�li chcesz, �ebym zarekomendowa� ci� u Diego, musisz co� dla mnie zrobi�.
};


var int Whistler_BuyMySword;
var int Whistler_BuyMySword_Day;

instance DIA_Whistler_Favour(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 1;
	condition = DIA_Whistler_Favour_Condition;
	information = DIA_Whistler_Favour_Info;
	permanent = 0;
	description = "Co mam dla ciebie zrobi�?";
};


func int DIA_Whistler_Favour_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

func void DIA_Whistler_Favour_Info()
{
	AI_Output(other,self,"DIA_Whistler_Favour_15_00");	//Co mam dla ciebie zrobi�?
	AI_Output(self,other,"DIA_Whistler_Favour_11_01");	//Chc� jedn� z broni, kt�r� ma na sk�adzie Fisk. To jeden z handlarzy na targowisku.
	AI_Output(self,other,"DIA_Whistler_Favour_11_02");	//Ale on nie chce mi jej sprzeda�. To pewien szczeg�lnie pi�knie zdobiony miecz.
	AI_Output(self,other,"DIA_Whistler_Favour_11_03");	//Dam ci 100 bry�ek rudy, za kt�re kupisz dla mnie ten miecz. Tylko nie m�w mu, �e ja ci� przys�a�em.
	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice(DIA_Whistler_Favour,"Dobrze. Daj mi 100 bry�ek, a ja si� wszystkim zajm�.",DIA_Whistler_Favour_Ok);
	Info_AddChoice(DIA_Whistler_Favour,"Przysz�o ci do g�owy, �e m�g�bym po prostu uciec z twoj� rud�?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice(DIA_Whistler_Favour,"Dlaczego Fisk nie chce ci sprzeda� tej broni?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	var C_Npc fisk;
	AI_Output(other,self,"DIA_Whistler_Favour_Ok_15_00");	//Dobrze. Daj mi 100 bry�ek, a ja si� wszystkim zajm�.
	AI_Output(self,other,"DIA_Whistler_Favour_Ok_11_01");	//Masz. Tylko nie marud� za d�ugo!
	Whistler_BuyMySword = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinOC,"�wistak pomo�e mi, je�li porozmawiam z Fiskiem i kupi� od niego miecz dla �wistaka. Da� mi nawet 100 bry�ek rudy.");
	fisk = Hlp_GetNpc(Stt_311_Fisk);
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
	Whistler_BuyMySword_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output(other,self,"DIA_Whistler_Favour_OreAway_15_00");	//Przysz�o ci do g�owy, �e m�g�bym po prostu uciec z twoj� rud�?
	AI_Output(self,other,"DIA_Whistler_Favour_OreAway_11_01");	//Nie zapominaj, �e to jest niewielka kolonia. Pr�dzej czy p�niej bym ci� znalaz�!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_00");	//Dlaczego Fisk nie chce ci sprzeda� tej broni?
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_01");	//Troch� si� posprzeczali�my.
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_02");	//I?
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_03");	//I to wszystko, co powiniene� wiedzie�!
};


instance DIA_Whistler_Running110(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 4;
	condition = DIA_Whistler_Running110_Condition;
	information = DIA_Whistler_Running110_Info;
	permanent = 0;
	description = "Fisk ��da teraz 110 bry�ek rudy za ten miecz.";
};


func int DIA_Whistler_Running110_Condition()
{
	if((Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SCknows110 == TRUE))
	{
		return 1;
	};
};

func void DIA_Whistler_Running110_Info()
{
	AI_Output(other,self,"DIA_Whistler_Running110_15_00");	//Fisk ��da teraz 110 bry�ek rudy za ten miecz.
	AI_Output(self,other,"DIA_Whistler_Running110_11_01");	//I pewnie mam ci teraz da� dodatkowe 10 bry�ek...
	AI_Output(other,self,"DIA_Whistler_Running110_15_02");	//My�la�em, �e zale�y ci na tym mieczu.
	AI_Output(self,other,"DIA_Whistler_Running110_11_03");	//Masz. Tylko si� pospiesz!
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,hero,ItMiNugget,10);
};


instance DIA_Whistler_RunningPayBack(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 5;
	condition = DIA_Whistler_RunningPayBack_Condition;
	information = DIA_Whistler_RunningPayBack_Info;
	permanent = 1;
	description = "Nie mog� zdoby� tego miecza. Zwracam ci twoj� rud�.";
};


func int DIA_Whistler_RunningPayBack_Condition()
{
	if(Whistler_BuyMySword == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Whistler_RunningPayBack_Info()
{
	AI_Output(other,self,"DIA_Whistler_RunningPayBack_15_00");	//Nie mog� zdoby� tego miecza. Zwracam ci twoj� rud�.
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_01");	//Ty idioto! Nie potrzebujemy tu takich jak ty! Zejd� mi z oczu!
		B_GiveInvItems(hero,self,ItMiNugget,100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		B_LogEntry(CH1_JoinOC,"Zawali�em spraw�. �wistak nigdy ju� nie dostanie tego miecza.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_02");	//Ale ja tu nie widz� �adnych 100 bry�ek. Radz� ci, �eby szybko si� znalaz�y, bo inaczej...
		AI_StopProcessInfos(self);
	};
};


instance DIA_Whistler_MySword_TooLate(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 1;
	condition = DIA_Whistler_MySword_TooLate_Condition;
	information = DIA_Whistler_MySword_TooLate_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Whistler_MySword_TooLate_Condition()
{
	if((Whistler_BuyMySword == LOG_RUNNING) && (Whistler_BuyMySword_Day <= (Wld_GetDay() - 2)))
	{
		return 1;
	};
};

func void DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output(self,other,"DIA_Whistler_MySword_TooLate_11_00");	//Tu jeste�! Pr�bowa�e� zwia� z moj� rud�, co? Chod� no tu, ch�opcze!
	Whistler_BuyMySword = LOG_FAILED;
	B_LogEntry(CH1_JoinOC,"Zawali�em spraw�. �wistak nie chce mnie widzie� na oczy.");
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_Whistler_MySword_Success(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 800;
	condition = DIA_Whistler_MySword_Success_Condition;
	information = DIA_Whistler_MySword_Success_Info;
	permanent = 1;
	description = "Mam dla ciebie miecz...";
};


func int DIA_Whistler_MySword_Success_Condition()
{
	if((Whistler_BuyMySword == LOG_RUNNING) && (Whistler_BuyMySword_Day > (Wld_GetDay() - 2)) && (Npc_HasItems(other,Whistlers_Schwert) >= 1))
	{
		return 1;
	};
};

func void DIA_Whistler_MySword_Success_Info()
{
	AI_Output(other,self,"DIA_Whistler_MySword_Success_15_00");	//Mam dla ciebie miecz...
	B_GiveInvItems(other,self,Whistlers_Schwert,1);
	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_01");	//To nie by�o zbyt trudne. Tak, czy inaczej - wy�wiadczy�e� mi przys�ug�, teraz ja wy�wiadcz� przys�ug� tobie.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"DIA_Whistler_MySword_Success_11_02");	//Je�li Diego zapyta mnie o ciebie, opowiem si� za tob�. P�ki co - trzymaj si�!
		B_LogEntry(CH1_JoinOC,"�wistak ucieszy� si�, gdy wr�czy�em mu jego miecz. Mog� liczy� na jego wsparcie u Diego.");
	}
	else
	{
		B_LogEntry(CH1_JoinOC,"�wistak ucieszy� si�, gdy wr�czy�em mu jego miecz. Szkoda tylko, �e nie mog� ju� zosta� Cieniem.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP(XP_Whistlerssword);
	AI_StopProcessInfos(self);
};


instance DIA_Whistler_StandardKap1(C_Info)
{
	npc = Stt_309_Whistler;
	nr = 800;
	condition = DIA_Whistler_StandardKap1_Condition;
	information = DIA_Whistler_StandardKap1_Info;
	permanent = 1;
	description = "Jak leci...";
};


func int DIA_Whistler_StandardKap1_Condition()
{
	if(Whistler_BuyMySword == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Whistler_StandardKap1_Info()
{
	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00");	//Jak leci...
	AI_Output(self,other,"DIA_Whistler_StandardKap1_11_01");	//�wietnie! Wy�wiadczy�e� mi przys�ug�, teraz ja wy�wiadcz� przys�ug� tobie. Powiem Diego, �e mo�na na tobie polega�.
};

