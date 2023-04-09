
var int Brahim_ShowedMaps;

func void B_BrahimNewMaps()
{
	if(Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//PrzyjdŸ do mnie póŸniej. Na pewno bêdê mia³ dla ciebie coœ nowego.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Brahim_PICKPOCKET_Condition()
{
	return C_Beklauen(15,15);
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};


instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Nazywam siê Brahim. Zajmujê siê kreœleniem i sprzeda¿¹ map.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Skoro jesteœ tu od niedawna, to mo¿e potrzebujesz planu miasta.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Nie jest drogi - a na pewno bardzo ci siê przyda, zanim poznasz okolicê.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Brahim sprzedaje mapy w dzielnicy portowej.");
};


instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "To prawda, ¿e mieszkañcy miasta znikaj¹ bez œladu?";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//To prawda, ¿e mieszkañcy miasta znikaj¹ bez œladu?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Taa, obi³o mi siê o uszy. Nie wiem jednak, czy to prawda.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Rozejrzyj siê po okolicy - chcia³byœ tu spêdziæ ca³e ¿ycie?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Nic dziwnego, ¿e ludzie siê wynosz¹.
};


instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje mapy.";
};


func int DIA_Brahim_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Poka¿ mi swoje mapy.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//W tym swoim klasztorze nie znajdziesz lepszych.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Dobre mapy to podstawa, szczególnie dla ludzi, którzy przybyli z kontynentu, panie Paladynie.
	};
	Brahim_ShowedMaps = TRUE;
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_KnowsInfo(other,DIA_Brahim_Kap3_First_EXIT) || (Npc_HasItems(other,ItWr_ShatteredGolem_MIS) == 0)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if(Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_HasItems(other,ItWr_ShatteredGolem_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Wiedzia³em, ¿e to ciê zainteresuje.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Co to jest?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//Có¿, ta stara mapa, któr¹ w³aœnie kupi³eœ?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Znam takich jak ty. Nie przepuœcicie ¿adnej szansy na znalezienie bogactwa.
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Sk¹d siê wzi¹³ ten dokument?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Co to za dokument?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Dlaczego nie zatrzymasz jej dla siebie?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Sk¹d masz tê mapê?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//Znalaz³em j¹ w stercie staroci, które niedawno kupi³em.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Sprzedawca musia³ j¹ przeoczyæ.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Co to za mapa?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Wygl¹da na to, ¿e pokazuje, jak dotrzeæ do skarbu.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//A ty wygl¹dasz mi na osobê, która doœæ powa¿nie traktuje takie rzeczy.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Dlaczego nie zatrzymasz jej dla siebie?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Jestem ju¿ stary i czasy, kiedy wypuszcza³em siê na dalekie wêdrówki, dawno mam ju¿ za sob¹.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Zostawiam to m³odszym.
};

