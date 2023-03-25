
instance DIA_Grimes_EXIT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 999;
	condition = DIA_Grimes_EXIT_Condition;
	information = DIA_Grimes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int Grimes_First;

func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimes_Hallo(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Hallo_Condition;
	information = DIA_Grimes_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Grimes_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//To ty? Kto by pomyœla³, ¿e siê jeszcze spotkamy.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Wygl¹da na to, ¿e obaj wiemy, jak utrzymaæ siê przy ¿yciu. Jak widzisz, zajmujê siê teraz górnictwem.
	if(Grimes_First == FALSE)
	{
		Wld_InsertNpc(Snapper,"OW_PATH_148_A");
		Wld_InsertNpc(Snapper,"OW_PATH_146");
		Wld_InsertNpc(Snapper,"OW_PATH_147");
		Wld_InsertNpc(Snapper,"OW_PATH_148");
		Wld_InsertNpc(Snapper,"OW_PATH_264");
		Grimes_First = TRUE;
	};
};


instance DIA_Grimes_Erz(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Erz_Condition;
	information = DIA_Grimes_Erz_Info;
	permanent = FALSE;
	description = "Ile rudy uda³o wam siê wydobyæ?";
};


func int DIA_Grimes_Erz_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Erz_Info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Ile rudy uda³o wam siê wydobyæ?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Kilka skrzyñ. Ale nic ju¿ tutaj nie zosta³o.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladyn Marcos postanowi³ zabraæ rudê do zamku, poniewa¿ bezustannie atakowali nas orkowie.
};


instance DIA_Grimes_Weg(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 3;
	condition = DIA_Grimes_Weg_Condition;
	information = DIA_Grimes_Weg_Info;
	permanent = FALSE;
	description = "Czy wiesz, w któr¹ stronê uda³ siê Marcos?";
};


func int DIA_Grimes_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Erz) && (Npc_KnowsInfo(other,DIA_Marcos_Garond) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Czy wiesz, w któr¹ stronê uda³ siê Marcos?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Nie wybra³ najkrótszej drogi - zamierza³ przekroczyæ rzekê na jej zamarzniêtym odcinku.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Planowa³ zatoczyæ ³uk i dotrzeæ do zamku od zachodniej strony.
};


instance DIA_Grimes_Grimes(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Grimes_Condition;
	information = DIA_Grimes_Grimes_Info;
	permanent = FALSE;
	description = "Czy chcia³byœ opuœciæ dolinê?";
};


func int DIA_Grimes_Grimes_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_Grimes_Info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Czy chcia³byœ opuœciæ dolinê?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Nie, bêdê dalej zajmowa³ siê wydobyciem.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Nie pozwolê, by powstrzyma³o mnie paru zgni³ych orków. Miewa³em ju¿ gorsze problemy.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Kiedyœ na przyk³ad dr¹¿yliœmy tunel w starej kopalni i nagle wdar³a siê tam woda...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//Ale to stare dzieje.
};


instance DIA_Grimes_PERM(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_PERM_Condition;
	information = DIA_Grimes_PERM_Info;
	permanent = TRUE;
	description = "Jak idzie praca?";
};


func int DIA_Grimes_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Jak idzie praca?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Te ska³y s¹ cholernie twarde.
};


instance DIA_Grimes_PICKPOCKET(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 900;
	condition = DIA_Grimes_PICKPOCKET_Condition;
	information = DIA_Grimes_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Grimes_PICKPOCKET_Condition()
{
	return C_Beklauen(43,21);
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,Dialog_Back,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

