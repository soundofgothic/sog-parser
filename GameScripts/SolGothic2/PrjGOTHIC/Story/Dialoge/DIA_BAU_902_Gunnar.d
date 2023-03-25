
instance DIA_Gunnar_EXIT(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 999;
	condition = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Gunnar_HalloGesagt;

instance DIA_Gunnar_Hallo(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 1;
	condition = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//Co tam?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Odk¹d Onar og³osi³, ¿e zatrudnia najemników, wszêdzie a¿ siê roi od opryszków.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Zlaz³a siê tutaj ca³a ho³ota, która wczeœniej nie mia³a odwagi wyleŸæ z lasu.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Teraz schodz¹ siê ze wszystkich stron.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//A wiêc ty równie¿ jesteœ teraz najemnikiem?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Niech Innos bêdzie z tob¹!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Ludzie z miasta nie s¹ tu mile widziani.
	};
	Gunnar_HalloGesagt = TRUE;
};


instance DIA_Gunnar_Everywhere(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 2;
	condition = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent = TRUE;
	description = "Najemnicy przybywaj¹ ze wszystkich stron?";
};


func int DIA_Gunnar_Everywhere_Condition()
{
	if(Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Everywhere_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Najemnicy przybywaj¹ ze wszystkich stron?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Wiêkszoœæ z nich pochodzi z kolonii karnej.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Inna grupa najemników przyby³a z po³udnia, gdzie pewnie ugania³a siê za orkami.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//Za³o¿ê siê, ¿e paru bandytów opuœci³o góry, ¿eby tutaj przybyæ! Zwabi³o ich darmowe ¿arcie!
};


instance DIA_Gunnar_South(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 3;
	condition = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent = TRUE;
	description = "Co wiesz na temat najemników z po³udnia?";
};


func int DIA_Gunnar_South_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_South_Info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Co wiesz na temat najemników z po³udnia?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Niewiele. Z tego co wiem, polowali tam na orków.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Ich szefem jest Sylvio. Bullko, Sentenza, Raoul i paru innych to jego ludzie.
};


instance DIA_Gunnar_Colony(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 4;
	condition = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent = TRUE;
	description = "Kto pochodzi z Kolonii?";
};


func int DIA_Gunnar_Colony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Colony_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//Kto pochodzi z Kolonii?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Lee i jego ludzie. Torlof, Cord, Jarvis, Wilk i jeszcze paru innych.
};


instance DIA_Gunnar_Bandits(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 5;
	condition = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent = TRUE;
	description = "O jakich bandytów ci chodzi?";
};


func int DIA_Gunnar_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Bandits_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//O jakich bandytów ci chodzi?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Tak tylko gadam. Tak naprawdê nie jestem do koñca pewien.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//Na po³udniu znajduj¹ siê opuszczone kopalnie. W niektórych ukrywaj¹ siê bandyci.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Oni równie¿ s¹ skazañcami z Kolonii, tak jak wiêkszoœæ najemników, których tutaj spotkasz.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Jedyna ró¿nica polega na tym, ¿e to jeszcze gorsze œcierwo. Zabij¹ ka¿dego, kto podejdzie zbyt blisko.
};


instance DIA_Gunnar_PICKPOCKET(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 900;
	condition = DIA_Gunnar_PICKPOCKET_Condition;
	information = DIA_Gunnar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Gunnar_PICKPOCKET_Condition()
{
	return C_Beklauen(45,70);
};

func void DIA_Gunnar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET,Dialog_Back,DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

