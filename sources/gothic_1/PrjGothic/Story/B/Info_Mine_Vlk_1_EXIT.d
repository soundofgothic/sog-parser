
instance Info_Mine_Vlk_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_1_EXIT_Condition;
	information = Info_Mine_Vlk_1_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Mine_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Vlk_1_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_1_Mine_Condition;
	information = Info_Mine_Vlk_1_Mine_Info;
	permanent = 1;
	description = "Opowiedz mi o kopalni.";
};


func int Info_Mine_Vlk_1_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00");	//Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01");	//W jaskiniach rosn� r�ne grzyby i zio�a. Da si� to prze�kn��, ale nie ma to jak soczysty kawa� mi�sa.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02");	//Pe�zacze te� nie nale�� do przysmak�w. Cholerna nora!
};


instance Info_Mine_Vlk_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_1_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto wami dowodzi?";
};


func int Info_Mine_Vlk_1_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00");	//Kto wami dowodzi?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01");	//Ian organizuje si�� robocz� i wymian� d�br z obozem. Je�li szukasz czego� konkretnego, najlepiej pogadaj z nim.
};


instance Info_Mine_Vlk_1_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_1_Minecrawler_Condition;
	information = Info_Mine_Vlk_1_Minecrawler_Info;
	permanent = 1;
	description = "Co mo�esz mi powiedzie� o pe�zaczach?";
};


func int Info_Mine_Vlk_1_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00");	//Co mo�esz mi powiedzie� o pe�zaczach?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01");	//Stra�nicy �wi�tynni zawarli uk�ad z Gomezem. Zabijaj� pe�zacze, w zamian za co mog� zatrzyma� ich wn�trzno�ci.
};


instance Info_Mine_Vlk_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_1_DieLage_Condition;
	information = Info_Mine_Vlk_1_DieLage_Info;
	permanent = 1;
	description = "Jak leci?";
};


func int Info_Mine_Vlk_1_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01");	//Mn�stwo pracy, niewiele odpoczynku. Dlatego je�li chcesz czego� ode mnie, lepiej si� streszczaj.
};

func void B_AssignAmbientInfos_Mine_Vlk_1(var C_Npc slf)
{
	Info_Mine_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};

