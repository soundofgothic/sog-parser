
instance Info_SFB_5_Pre(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_Pre_Condition;
	information = Info_SFB_5_Pre_Info;
	permanent = 0;
	important = 1;
};


func int Info_SFB_5_Pre_Condition()
{
	return 1;
};

func void Info_SFB_5_Pre_Info()
{
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00");	//Witaj!
};


instance Info_SFB_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_SFB_5_EXIT_Condition;
	information = Info_SFB_5_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_SFB_5_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_SFB_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_SFB_5_EinerVonEuchWerden_Condition;
	information = Info_SFB_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "A gdybym chcia� do was do��czy�?";
};


func int Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00");	//A gdybym chcia� do was do��czy�?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01");	//Do nas? Jako kto? Nosiwoda?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02");	//Nie, jako Kret.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03");	//Pos�uchaj mnie uwa�nie: nikt nie zostaje Kretem NA OCHOTNIKA!
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04");	//No, ale je�li si� upierasz... Porozmawiaj ze Swineyem. Mo�e... ulituje si� nad tob� i da ci jaki� Kilof.
};


instance Info_SFB_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_SFB_5_WichtigePersonen_Condition;
	information = Info_SFB_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu jest wa�ny?";
};


func int Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00");	//Kto tu jest szych�?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01");	//Kto jest szych�? Ja, oczywi�cie.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02");	//Ale pewnie chcesz wiedzie� kto tu rozkazuje.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03");	//Powiniene� porozmawia� w Najemnikami albo Szkodnikami. W pobli�e Mag�w Wody raczej si� nie dostaniesz.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04");	//Ten wieprz, Swiney, stanowczo za wysoko zadziera nosa. Nic, tylko rozdziela kilofy i ca�uje ty�ek Okyla.
};


instance Info_SFB_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_SFB_5_DasLager_Condition;
	information = Info_SFB_5_DasLager_Info;
	permanent = 1;
	description = "Co ten Ob�z ma do zaoferowania?";
};


func int Info_SFB_5_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00");	//Co ten Ob�z ma do zaoferowania?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01");	//To zale�y, co ci si� uda wyrwa� dla siebie. Dla niekt�rych jest tu tylko har�wa bez ko�ca, ale inni potrafi� si� nie�le bawi�.
};


instance Info_SFB_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_DieLage_Condition;
	information = Info_SFB_5_DieLage_Info;
	permanent = 1;
	description = "Jak wygl�da �ycie tutaj?";
};


func int Info_SFB_5_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00");	//Jak wygl�da �ycie tutaj?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01");	//Wspaniale!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02");	//Tak wspaniale, �e mamy ju� do�� tej wiecznej szcz�liwo�ci i pr�bujemy st�d zwia�.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03");	//A co sobie my�la�e�?! To jest wi�zienie! Nikt nie lubi siedzie� w wi�zieniu!
};

func void B_AssignAmbientInfos_SFB_5(var C_Npc slf)
{
	Info_SFB_5_Pre.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

