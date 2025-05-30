
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = "Prosz� o Pr�b� Ognia.";
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Prosz� o Pr�b� Ognia.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Pr�ba Ognia nie by�a stosowana od zamierzch�ych czas�w.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//To zbyt niebezpieczne. Nawet o tym nie my�l.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jestem Mistrz Hyglas, Stra�nik Ognia i Wiedzy.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//A wi�c Mistrz Parlan wyda� ci pozwolenie na dost�p do pism.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Zatem prosz�, masz woln� r�k�. Czytaj, a znajdziesz w pismach o�wiecenie, kt�rego szukasz.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = "Co studiujesz, Mistrzu?";
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Co studiujesz, Mistrzu?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Moje badania koncentruj� si� na ogniu - �ywiole Innosa.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//To wielki dar, a zarazem pot�na bro�. Zajmuj� si� tworzeniem run zawieraj�cych moc ognia Innosa.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//To bardzo m�dre. Nauczysz mnie?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Tylko Innos mo�e zes�a� dar magii. I jedynie jego s�udzy, Magowie Ognia, mog� z niego korzysta�.
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = "Za��da�em Pr�by Ognia.";
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if(MIS_RUNE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Za��da�em pr�by ognia. Ulthar kaza� mi stworzy� run� ognistej strza�y.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A teraz pewnie chcesz, abym nauczy� ci� odpowiedniej formu�y?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Nie za bardzo wiem, co jeszcze m�g�bym zrobi�.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Dobrze, naucz� ci� tej formu�y. Ale najpierw musisz znale�� niezb�dne sk�adniki.
	B_LogEntry(TOPIC_Rune,"Hyglas ma mnie nauczy� formu�y runy ognistej strza�y, kiedy tylko zdob�d� wszystkie sk�adniki.");
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = FALSE;
	description = "Jakie sk�adniki potrzebne s� do stworzenia runy ognistej strza�y?";
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (MIS_RUNE == LOG_Running) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jakie sk�adniki potrzebne s� do stworzenia runy ognistej strza�y?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Wszystkie odpowiedzi znajdziesz w ksi�gach.
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 990;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = "Naucz mnie, jak stworzy� run� OGNISTEJ STRZA�Y.";
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE) && (Npc_HasItems(other,ItMi_RuneBlank) >= 1) && (Npc_HasItems(other,ItSc_Firebolt) >= 1) && (Npc_HasItems(other,ItMi_Sulfur) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Naucz mnie, jak stworzy� run� OGNISTEJ STRZA�Y.
	if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Aby stworzy� run� ognistej strza�y, musisz po��czy� na stole runicznym siark� z kamieniem runicznym.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Moc zakl�cia ognistej strza�y wniknie w run�, a ty dostaniesz narz�dzie Innosa.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Skoro ju� masz wszystkie materia�y, mo�esz przyst�pi� do tworzenia runy.
	};
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = "Gdzie znajd� kamie� runiczny?";
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_FIREBOLT) && (MIS_RUNE == LOG_Running) && (Npc_HasItems(other,ItMi_RuneBlank) < 1) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Gdzie znajd� kamie� runiczny?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hej hej, to twoja pr�ba, nie moja. Znalezienie kamienia jest cz�ci� zadania.
};


instance DIA_Hyglas_GOTRUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = "Stworzy�em run�.";
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Ulthar_SUCCESS) == FALSE) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Stworzy�em run�.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//No prosz�. Zdaje si�, �e przeszed�e� pr�b�. Nie by�o to chyba a� takie trudne.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Id� do Ulthara i poka� mu swoje dzie�o.
	B_LogEntry(TOPIC_Rune,"Stworzy�em run� Ognistej Strza�y.");
};


instance DIA_Hyglas_TEACH(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 15;
	condition = DIA_Hyglas_TEACH_Condition;
	information = DIA_Hyglas_TEACH_Info;
	permanent = TRUE;
	description = "Naucz mnie.";
};


func int DIA_Hyglas_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Zosta� moim nauczycielem.
	Info_ClearChoices(DIA_Hyglas_TEACH);
	Info_AddChoice(DIA_Hyglas_TEACH,Dialog_Back,DIA_Hyglas_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Hyglas_TEACH_Firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Hyglas_TEACH_Firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		B_Say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(DIA_Hyglas_TEACH);
	};
};

func void DIA_Hyglas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Hyglas_TEACH);
};

func void DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Hyglas_TEACH_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};


instance DIA_Hyglas_Kap2_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap3_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = "Jakie� wie�ci?";
};


func int DIA_Hyglas_BringBook_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Jakie� wie�ci?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, tak. No c�, prawdopodobnie zauwa�y�e� te odziane na czarno postacie.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Spotka�em je.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//I tu dochodzimy do sedna problemu. Aktualny uk�ad gwiazd jest bardzo nietypowy.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//M�wi�c konkretniej, konstelacja Wo�a wesz�a w koniunkcj� z konstelacj� Wojownika. Nie musz� chyba t�umaczy�, co to oznacza.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmmm. No c�, szczerze m�wi�c...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Jasne, rozumiem. Nie b�d� si� teraz wdawa� w szczeg�owe rozwa�ania na temat takiej konfiguracji. Powiem tylko tyle, �e oznacza ona wielkie zmiany. A ja nie lubi� zmian.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Dlatego chc�, aby� przyni�s� mi z miasta pewn� ksi�g�, zatytu�owan� 'Boska moc gwiazd'. Zdobycie jej mo�e wymaga� nieco wysi�ku, ale jestem pewien, �e sobie poradzisz.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook,"Sam sobie znajd� t� ksi�g�.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook,"A co JA b�d� z tego mia�?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook,"Zobacz�, czy uda mi si� j� znale��.",DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Sam sobie znajd� t� ksi�g�.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Jak �miesz odzywa� si� do mnie w ten spos�b? Takim zachowaniem okazujesz brak nale�nego mi szacunku.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Zejd� mi z oczu i zastan�w si� dobrze nad swoim post�powaniem.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//A co z tego b�d� mia�?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Nie ca�kiem rozumiem...
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Chcia�bym wiedzie�, co zyskam, je�li przynios� ci ksi�g�.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. A czego oczekiwa�e�? Je�li masz czas na wycieczk� do miasta, twoim obowi�zkiem jest mi pom�c.
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Zobacz�, czy uda mi si� j� znale��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//Dobrze - dzi�ki temu b�d� mia� wi�cej czasu na inne sprawy.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Spr�buj za�atwi� to jak najszybciej. Obawiam si�, �e czas jest w tej chwili do�� cennym towarem.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook,"Hyglas chce, abym przyni�s� mu ksi�g� zatytu�owan� 'Boska moc gwiazd'. Mo�e ma j� kt�ry� z handlarzy w mie�cie.");
};


instance DIA_Hyglas_HaveBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = "Przynios�em ci ksi�g�.";
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && (Npc_HasItems(other,ItWr_Astronomy_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Przynios�em ci ksi�g�.
	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Bardzo dobrze, daj mi j�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//A wi�c jednak zmieni�e� zdanie. Bardzo dobrze. Gdzie jest ksi�ga?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_Mis,1);
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Mo�esz odej��. A ja zajm� si� badaniami.
};


instance DIA_Hyglas_Kap4_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Dowiedzia�e� si� czego� nowego?";
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Dowiedzia�e� si� czego� nowego?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Nie jestem do ko�ca pewien, ale wygl�da na to, �e aktualny uk�ad gwiazd zwiastuje k�opoty.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Jakie problemy?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Materia rozdzielaj�ca dwa �wiaty sta�a si� bardzo cienka. Gdyby kto� chcia� otworzy� przej�cie, m�g�by to zrobi�, u�ywaj�c zaledwie cz�stki mocy potrzebnej do tego w innych okoliczno�ciach.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Demony mog� u�ywa� takich przej��, aby przenika� do naszego �wiata.
		Hyglas_SendsToKarras = TRUE;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Nie, wci�� czekam na t� ksi�g�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Oczywi�cie wci�� prowadz� swoje badania, jednak potrwaj� one znacznie d�u�ej, je�li nie b�d� mia� niezb�dnych materia��w.
	};
};


instance DIA_Hyglas_Kap5_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_PICKPOCKET(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 900;
	condition = DIA_Hyglas_PICKPOCKET_Condition;
	information = DIA_Hyglas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Hyglas_PICKPOCKET_Condition()
{
	return C_Beklauen(73,200);
};

func void DIA_Hyglas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,Dialog_Back,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

