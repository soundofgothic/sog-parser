
instance DIA_Egill_EXIT(C_Info)
{
	npc = BAU_945_Egill;
	nr = 999;
	condition = DIA_Egill_EXIT_Condition;
	information = DIA_Egill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Egill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Egill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Egill_HALLO(C_Info)
{
	npc = BAU_945_Egill;
	nr = 3;
	condition = DIA_Egill_HALLO_Condition;
	information = DIA_Egill_HALLO_Info;
	description = "Co s³ychaæ?";
};


func int DIA_Egill_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info()
{
	AI_Output(other,self,"DIA_Egill_HALLO_15_00");	//Co tam?
	AI_Output(self,other,"DIA_Egill_HALLO_08_01");	//Jeœli odwiedzaj¹ nas jacyœ przybysze, to przewa¿nie nie w pokojowych zamiarach.
	AI_Output(self,other,"DIA_Egill_HALLO_08_02");	//Mam nadziejê, ¿e siê nie mylê co do ciebie.
	AI_Output(self,other,"DIA_Egill_HALLO_08_03");	//Jestem Egill.
	if(Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim))
	{
		AI_Output(self,other,"DIA_Egill_HALLO_08_04");	//A ten dziwak, którego tam widzisz, to mój brat Ehnim.
	};
};


instance DIA_Egill_FELDARBEIT(C_Info)
{
	npc = BAU_945_Egill;
	nr = 4;
	condition = DIA_Egill_FELDARBEIT_Condition;
	information = DIA_Egill_FELDARBEIT_Info;
	description = "Jak id¹ prace w polu?";
};


func int DIA_Egill_FELDARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDARBEIT_Info()
{
	AI_Output(other,self,"DIA_Egill_FELDARBEIT_15_00");	//Jak id¹ prace w polu?
	AI_Output(self,other,"DIA_Egill_FELDARBEIT_08_01");	//Wspaniale. Gdyby tylko polne bestie nie niszczy³y naszych plonów...
};


instance DIA_Egill_FELDRAEUBER(C_Info)
{
	npc = BAU_945_Egill;
	nr = 5;
	condition = DIA_Egill_FELDRAEUBER_Condition;
	information = DIA_Egill_FELDRAEUBER_Info;
	description = "Czemu nic z nimi nie zrobicie?";
};


func int DIA_Egill_FELDRAEUBER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDRAEUBER_Info()
{
	AI_Output(other,self,"DIA_Egill_FELDRAEUBER_15_00");	//Czemu nic z nimi nie zrobicie?
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_01");	//¯artujesz chyba. Od kiedy tutaj mieszkam, zabi³em ju¿ ich tyle, ¿e ca³kiem straci³em rachubê.
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_02");	//Niestety, wci¹¿ ich przybywa.
};


instance DIA_Egill_STREIT2(C_Info)
{
	npc = BAU_945_Egill;
	nr = 6;
	condition = DIA_Egill_STREIT2_Condition;
	information = DIA_Egill_STREIT2_Info;
	description = "Twój brat opowiedzia³ podobn¹ historiê.";
};


func int DIA_Egill_STREIT2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDRAEUBER) && Npc_KnowsInfo(other,DIA_Ehnim_FELDRAEUBER) && (Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim)))
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT2_Info()
{
	AI_Output(other,self,"DIA_Egill_STREIT2_15_00");	//Twój brat opowiedzia³ podobn¹ historiê.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_01");	//Taaak? A co dok³adnie powiedzia³?
	AI_Output(other,self,"DIA_Egill_STREIT2_15_02");	//Twierdzi, ¿e on równie¿ zabi³ mnóstwo polnych bestii.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_03");	//Co? Ten dureñ nie trafi³by sam do domu!
	AI_Output(self,other,"DIA_Egill_STREIT2_08_04");	//Powiedz mu, ¿e nie powinien siê tak przechwalaæ.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_STREIT4(C_Info)
{
	npc = BAU_945_Egill;
	nr = 7;
	condition = DIA_Egill_STREIT4_Condition;
	information = DIA_Egill_STREIT4_Info;
	description = "Ehnim jest odrobinê poirytowany z powodu ca³ej tej sprawy.";
};


func int DIA_Egill_STREIT4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_STREIT3) && (Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim)))
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT4_Info()
{
	AI_Output(other,self,"DIA_Egill_STREIT4_15_00");	//Ehnim jest odrobinê poirytowany z powodu ca³ej tej sprawy.
	AI_Output(self,other,"DIA_Egill_STREIT4_08_01");	//Niech siê za bardzo nie nadyma, bo spuszczê mu lanie. Mo¿esz mu to ode mnie przekazaæ.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_PERMKAP1(C_Info)
{
	npc = BAU_945_Egill;
	condition = DIA_Egill_PERMKAP1_Condition;
	information = DIA_Egill_PERMKAP1_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Egill_PERMKAP1_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Egill_PERMKAP1_Info()
{
	AI_Output(self,other,"DIA_Egill_PERMKAP1_08_00");	//Czy nie narobi³eœ ju¿ dosyæ szkód? Lepiej idŸ sobie.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_PICKPOCKET(C_Info)
{
	npc = BAU_945_Egill;
	nr = 900;
	condition = DIA_Egill_PICKPOCKET_Condition;
	information = DIA_Egill_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Egill_PICKPOCKET_Condition()
{
	return C_Beklauen(45,24);
};

func void DIA_Egill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
	Info_AddChoice(DIA_Egill_PICKPOCKET,Dialog_Back,DIA_Egill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Egill_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Egill_PICKPOCKET_DoIt);
};

func void DIA_Egill_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};

func void DIA_Egill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};

