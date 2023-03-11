
instance Info_Mine_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_2_EXIT_Condition;
	information = Info_Mine_Vlk_2_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Vlk_2_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_2_Mine_Condition;
	information = Info_Mine_Vlk_2_Mine_Info;
	permanent = 1;
	description = "Opowiedz mi o kopalni.";
};


func int Info_Mine_Vlk_2_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00");	//Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01");	//Jest jeszcze wiele jaski�, gdzie zosta�o troch� rudy, ale pe�zacze nie pozwalaj� nam w nich pracowa�.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02");	//Zbyt wiele napad�w, zbyt powa�ne straty.
};


instance Info_Mine_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00");	//Kto mo�e mie� tu co� do powiedzenia?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01");	//W��, jest hutnikiem. Wie wszystko o wytapianiu rudy. Zreszt� chyba sam jest z �elaza - ca�y dzie� sp�dza przed piecem. Nie mam poj�cia jak wytrzymuje ten �ar.
};


instance Info_Mine_Vlk_2_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_2_Minecrawler_Condition;
	information = Info_Mine_Vlk_2_Minecrawler_Info;
	permanent = 1;
	description = "Co mo�esz mi powiedzie� o pe�zaczach?";
};


func int Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00");	//Co mo�esz mi powiedzie� o pe�zaczach?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01");	//Musieli�my zamkn�� wielki szyb na dole. A� roi si� w nim od pe�zaczy.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02");	//Pe�zacze s� tu wsz�dzie. Nie s�yszysz ich? Bo ja s�ysz�.
};


instance Info_Mine_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_2_DieLage_Condition;
	information = Info_Mine_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "Jak si� masz?";
};


func int Info_Mine_Vlk_2_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00");	//Jak si� masz?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01");	//Musz� pracowa�. Jak stra�nicy zobacz�, �e z tob� rozmawiam, obetn� mi racje.
};

func void B_AssignAmbientInfos_Mine_Vlk_2(var C_Npc slf)
{
	Info_Mine_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

