
instance DIA_Addon_Miguel_EXIT(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 999;
	condition = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Miguel_PICKPOCKET(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 900;
	condition = DIA_Addon_Miguel_PICKPOCKET_Condition;
	information = DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	return C_Beklauen(40,48);
};

func void DIA_Addon_Miguel_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,Dialog_Back,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};


instance DIA_Addon_Miguel_Hi(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent = FALSE;
	description = "Co tu robisz?";
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu robisz?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Szukasz czego�?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Ro�lin - szukam ro�lin.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Zwykle szukam ro�lin.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Wi�kszo�� tego, co tu ro�nie, mo�na wykorzysta�.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Wiele zi� ma w�a�ciwo�ci lecznicze, a bagienne ziele mo�na pali�.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Zanim umie�cili mnie za barier�, pracowa�em u alchemika.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = "Za co ci� zamkn�li za barier�?";
};


func int DIA_Addon_Miguel_Story_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Za co ci� zamkn�li za barier�?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Eksperymentowa�em z r�nymi miksturami, kt�re wp�ywaj� na umys� i pozwalaj� nim manipulowa�.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, m�j mistrz, wypi� kiedy� jeden z moich "eksperyment�w" zamiast wina.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//No... zacz�� si� zachowywa�... nieco irracjonalnie. Od tamtej pory jest... troszk� niezr�wnowa�ony.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//Magowie zes�ali mnie do kolonii karnej za "prowadzenie bada� w zakazanej dziedzinie".
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o obozowisku?";
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mo�esz mi powiedzie� o obozowisku?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Niewiele. Nigdy tam nie by�em.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Tylko ludzie Kruka byli tam od pocz�tku. Wszyscy pozostali przyszli p�niej albo wci�� czekaj� na przyj�cie. Tak jak ja.
};


instance DIA_Addon_Miguel_WhereFrom(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent = FALSE;
	description = "Jak si� tu dosta�e�?";
};


func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) || Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Jak si� tu dosta�e�?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//My�l�, �e t� sam� drog� co ty. Z piratami przez morze.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//Ta dolina jest niedost�pna z wyspy. Mo�na si� do niej dosta� tylko morzem.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//Dok�adnie.
};


instance DIA_Addon_Miguel_Angefordert(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent = FALSE;
	description = "Kiedy zwykle potrzebuj� nowych ludzi?";
};


func int DIA_Addon_Miguel_Angefordert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kiedy zwykle potrzebuj� nowych ludzi?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//Gdy jest ich za ma�o...
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Gdy kogo� zabije kopalniany pe�zacz, potrzebuj� drugiego na wymian�.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//No i czasem ch�opaki si� pozabijaj�. Ale ostatnio nie jest tak �le.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Kruk zdo�a� to jako� zorganizowa� i pilnuje, �eby w kopalni nie pracowali wszyscy naraz.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nie mam poj�cia, jak to dok�adnie funkcjonuje. Nigdy tam nie by�em.
};


instance DIA_Addon_Miguel_Fortuno(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 6;
	condition = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent = FALSE;
	description = "Fortuno sprawia wra�enie ob��kanego.";
};


func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno sprawia wra�enie ob��kanego. My�l�, �e jaka� mikstura mo�e przywr�ci� mu pami��.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To jeden ze s�u��cych Kruka.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Teraz to tylko wrak. A wszystko z winy Kruka.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Kruk. Nigdy o nim wiele nie my�la�em. Hmm, dobra. Niestety, nie mog� warzy� mikstur tutaj, na bagnach.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//M�g�bym przyrz�dzi� mikstur�. W obozie jest odpowiedni st�. Gdybym tylko mia� przepis...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Lepiej b�d� ostro�ny z tym przepisem. Warzenie mikstur to niebezpieczne zaj�cie.
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Je�eli u�yjesz nieodpowiednich sk�adnik�w albo co� p�jdzie nie tak, mikstura b�dzie �mierteln� trucizn�.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//B�d� uwa�a�.
	B_LogEntry(Topic_Addon_Fortuno,"Miguel da� mi przepis na mikstur�, kt�ra ma pom�c Fortuna w odzyskaniu pami�ci. Powinienem przyrz�dzi� j� dopiero wtedy, gdy dobrze poznam dzia�anie wszystkich sk�adnik�w. Inaczej mo�e by� zab�jcza.");
};


instance DIA_Addon_Miguel_BRAU(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int DIA_Addon_Miguel_BRAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Story))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nie mam na to czasu. Przyszed�em tu zdoby� troch� z�ota. Na razie, dop�ki nie wpuszcz� mnie do obozowiska, zarabiam na handlu zio�ami.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Mog� jednak zaopatrzy� ci� w mikstury.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Od Miguela mog� kupi� ro�liny i mikstury.");
};


instance DIA_Addon_Miguel_trade(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 888;
	condition = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Miguel_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_BRAU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_trade_Info()
{
	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};

