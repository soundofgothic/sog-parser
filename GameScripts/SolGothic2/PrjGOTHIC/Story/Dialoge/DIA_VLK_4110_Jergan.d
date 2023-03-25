
instance DIA_Jergan_EXIT(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 999;
	condition = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jergan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jergan_Hallo(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent = FALSE;
	description = "Czemu tu tak stoisz?";
};


func int DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jergan_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Czemu tu tak stoisz?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Przychodz� z zamku. Przys�ali mnie, �ebym poszuka� zaginionych i sprawdzi� teren.
};


instance DIA_Jergan_Vermisste(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent = FALSE;
	description = "Zaginionych?";
};


func int DIA_Jergan_Vermisste_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Vermisste_Info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Zaginionych?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Niekt�rzy uciekli, kiedy zaatakowa�y smoki. Wi�kszo�ci si� nie uda�o - no i nic dziwnego!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Je�li jednak komu� uda�o si� prze�y�, mam go sprowadzi� z powrotem.
};


instance DIA_Jergan_Burg(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent = FALSE;
	description = "Mo�esz mi pom�c dosta� si� do zamku?";
};


func int DIA_Jergan_Burg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Burg_Info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Mo�esz mi pom�c dosta� si� do zamku?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Pewnie, ale musisz co� dla mnie zrobi�.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Je�eli uda ci si� dotrze� do zamku, porozmawiaj z paladynem Orikiem. Powiedz mu, �e jego brat poleg� na prze��czy.
	Log_CreateTopic(Topic_OricBruder,LOG_MISSION);
	Log_SetTopicStatus(Topic_OricBruder,LOG_Running);
	B_LogEntry(Topic_OricBruder,"Kiedy znajd� si� w zamku, mam powiedzie� Orikowi, �e jego brat poleg� na prze��czy.");
};


instance DIA_Jergan_Gegend(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent = TRUE;
	description = "Co powinienem wiedzie� o tej okolicy?";
};


func int DIA_Jergan_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};


var int Jergan_Tell;

func void DIA_Jergan_Gegend_Info()
{
	if(Jergan_Tell == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Co powinienem wiedzie� o tej okolicy?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Wracaj, sk�d przyszed�e�, je�li ci �ycie mi�e.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Zielonosk�rzy ju� od kilku tygodni oblegaj� zamek. A smoki gdzie� si� ukrywaj�.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Ca�a G�rnicza Dolina a� roi si� od ork�w. Niezale�nie od tego dok�d zmierzasz, to nie b�dzie maj�wka.
	Jergan_Tell = TRUE;
};


instance DIA_Jergan_Hilfe(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent = FALSE;
	description = "Jak mog� dosta� si� do zamku?";
};


func int DIA_Jergan_Hilfe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Jak mog� dosta� si� do zamku?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Po pierwsze zapomnij o drodze na wprost. Je�li jednak obejdziesz zamek dooko�a, mo�e b�dziesz mie� jakie� szanse na powr�t.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Trzymaj si� z dala od �cie�ek i skorzystaj z rzeki. Najlepiej b�dzie, jak pop�yniesz kawa�ek w d� strumienia. Stamt�d powinno by� �atwiej.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Orkowie ustawili za zamkiem taran. W ten spos�b mo�esz si� dosta� do �rodka. Podkradnij si� do ork�w, tak blisko jak zdo�asz, a potem biegnij ile si� w nogach.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//Je�eli jeste� dostatecznie szybki, to mo�e ci si� uda�.
};


instance DIA_Jergan_Mine(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Jergan_Mine_Condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Jergan_Mine_Info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Jestem zwiadowc�. Przemierzam kraj. Z�bacze nie u�atwiaj� mi jednak zadania.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//To dobry czas, �eby zdoby� kilka trofe�w - zak�adaj�c, �e wiesz, co robi�.
};


instance DIA_Jergan_Claw(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent = FALSE;
	description = "Mo�esz mnie tego nauczy�?";
};


func int DIA_Jergan_Claw_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Claw_Info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Mo�esz mnie tego nauczy�?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Mog� ci pokaza�, jak zdj�� z tych stwor�w pazury, kiedy ju� b�d� martwe.
};


instance DIA_Jergan_Teach(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent = TRUE;
	description = "(Nauka usuwania pazur�w)";
};


func int DIA_Jergan_Teach_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Teach_Info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Poka� mi, jak usuwa� pazury.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Najwa�niejsze jest to, �eby usun�� pazur jednym szarpni�ciem. Nie wolno si� waha� ani d�uba� no�em.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Tym sposobem mo�na zdoby� pazury nie tylko z�baczy, ale tak�e jaszczurek i cieniostwor�w.
	};
};


instance DIA_Jergan_Diego(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent = FALSE;
	description = "Wiesz, gdzie si� podzia� Diego?";
};


func int DIA_Jergan_Diego_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,DIA_DiegoOw_Hallo) == FALSE) && Npc_KnowsInfo(other,DIA_Parcival_Diego))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Diego_Info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Wiesz, gdzie si� podzia� Diego?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? To by� jeden z kret�w Silvestra. Ale si� ulotni�.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Widzia�em go z dwoma rycerzami i jak�� skrzyni�, niedaleko st�d.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Widzisz st�d star� wie�� stra�nicz�, tak? Id� tam, a potem w stron� zamku.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Po prawej stronie jest �cie�ka przez ska�y. Tamt�dy w�a�nie poszli.
};


instance DIA_Jergan_Leader(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jergan_Leader_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(NewMine_LeadSnapper) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Leader_Info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Wi�c zabi�e� przyw�dc� stada. Zabra�e� pazury tej bestii?
	if(Npc_HasItems(other,ItAt_ClawLeader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Tak.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Na pewno s� du�� warte. S� tacy, co zbieraj� takie rzeczy.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Je�eli znajdziesz dobrego kupca, to dostaniesz za to niez�� sumk� w z�ocie.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Nie.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Powiniene� tak zrobi�. Jestem pewien, �e s� warte fortun�.
	};
};


instance DIA_Jergan_PICKPOCKET(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 900;
	condition = DIA_Jergan_PICKPOCKET_Condition;
	information = DIA_Jergan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Jergan_PICKPOCKET_Condition()
{
	return C_Beklauen(84,110);
};

func void DIA_Jergan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,Dialog_Back,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

