
instance DIA_Caine_Exit(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Caine_Hallo(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	permanent = 0;
	description = "Cze��, jestem tu nowy.";
};


func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Cze��, jestem tu nowy.
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//Ja... Ja jestem Caine, ucze� Cor Kaloma. Zapewne ju� o nim s�ysza�e�, co?
	Info_ClearChoices(DIA_Caine_Hallo);
	Info_AddChoice(DIA_Caine_Hallo,"Nie.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo,"Tak.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//Tak.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Zatem wiesz ju�, �e to najwa�niejszy cz�owiek w tym obozie, zaraz po Ja�nie O�wieconym Y'Berionie.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Nie.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Nie?! Chyba jeste� tu od niedawna, co?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Cor Kalom to najwa�niejszy cz�owiek w Bractwie, po Y'Berionie. To on decyduje, kto zostanie przyj�ty w szeregi Nowicjuszy.
	Info_ClearChoices(DIA_Caine_Hallo);
};


instance DIA_Caine_Job(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	permanent = 0;
	description = "A ty czym si� zajmujesz?";
};


func int DIA_Caine_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//A ty czym si� zajmujesz?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Pomagam mojemu mistrzowi w pracach nad jego magicznymi wywarami.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//G��wnie z ziela bagiennego i wydzieliny pe�zaczy. Swoj� drog�, m�j mistrz pilnie potrzebuje tej wydzieliny.
};


instance DIA_Caine_WoSekret(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	permanent = 0;
	description = "Gdzie mog� zdoby� t�... Wydzielin� pe�zaczy?";
};


func int DIA_Caine_WoSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_WoSekret_Info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Gdzie mog� zdoby� t�... Wydzielin� pe�zaczy?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Stara Kopalnia a� roi si� od pe�zaczy, ale trzeba umie� pozyska� ich wydzielin�.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Je�li powa�nie my�lisz o walce z pe�zaczami, porozmawiaj z kt�rym� ze Stra�nik�w trudni�cych si� polowaniem na nie. Na przyk�ad z Gor Na Drakiem.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//On ka�dego dnia wyrusza z naszego obozu do Starej Kopalni. O �wicie znajdziesz go w pobli�u laboratorium.
};


instance DIA_Caine_AddInfoKalom(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	permanent = 0;
	description = "Co mo�esz mi jeszcze powiedzie� o swoim mistrzu?";
};


func int DIA_Caine_AddInfoKalom_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_AddInfoKalom_Info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Co mo�esz mi jeszcze powiedzie� o swoim mistrzu?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//Jest inny ni� pozostali Guru. Ka�dy mo�e si� do niego odezwa�, ale NIKOMU nie wolno marnowa� jego cennego czasu.
};


instance Nov_1301_Caine_CHEST(C_Info)
{
	npc = NOV_1301_Caine;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Jak mog� zdoby� receptur� Kaloma?";
};


func int Nov_1301_Caine_CHEST_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Nov_1301_Caine_CHEST_Info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Jak mog� zdoby� receptur� Kaloma?
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Nie mo�esz. Wszystkie receptury przechowywane s� w zamkni�tej skrzyni.
};

