
instance DIA_Niclas_EXIT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 999;
	condition = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Niclas_Hello(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Niclas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//Ty te� uciek�e�?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//Dlaczego tak uwa�asz?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Inaczej po co by� tu przychodzi�? Przecie� tu nic si� nie dzieje.
};


instance DIA_Niclas_HaveALook(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent = FALSE;
	description = "Chc� si� tylko troch� rozejrze�.";
};


func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Chc� si� tylko troch� rozejrze�.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Prosz� bardzo. Mo�e kawa�ek pieczystego?
	CreateInvItems(self,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook,"Nie, dzi�kuj�.",DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook,"Ch�tnie.",DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Nie, dzi�kuj�.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Czuj si� jak u siebie. Mam nadzieje, �e nie b�dzie ci przeszkadza�, je�li co� zjem.
	B_UseItem(self,ItFoMutton);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//Ch�tnie.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Prosz�, najprzedniejszy udziec kretoszczura. Wed�ug mojego w�asnego przepisu.
	B_GiveInvItems(self,other,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};


instance DIA_Niclas_WhyHere(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent = FALSE;
	description = "Wi�c co tu w�a�ciwie robisz?";
};


func int DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Wi�c co tu w�a�ciwie robisz?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//Jedynie tutaj odnajduj� spok�j. W mie�cie czuj� si� zniewolony i zaszczuty.
};


instance DIA_Niclas_ShouldntWork(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent = FALSE;
	description = "Nie musisz pracowa�?";
};


func int DIA_Niclas_ShouldntWork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//Nie musisz pracowa�?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//Wszystko, czego potrzebuj�, zdobywam sam. Robi� strza�y, a natura dostarcza mi po�ywienia.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//A wi�c jeste� my�liwym?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//Mo�na tak to uj��. Zabijam jednak tylko po to, by mie� co je��, nie dla pieni�dzy.
};


instance DIA_Niclas_CanTeachMe(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent = FALSE;
	description = "Mo�e m�g�by� mnie czego� nauczy�.";
};


func int DIA_Niclas_CanTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//Mo�e m�g�by� mnie czego� nauczy�.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//W�a�ciwie, czemu nie. Mog� ci pokaza�, jak si� pos�ugiwa� �ukiem.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"Niclas mo�e mi pokaza�, jak skuteczniej pos�ugiwa� si� �ukiem.");
};


instance DIA_Niclas_Teach(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent = TRUE;
	description = "Poka� mi prosz�, jak si� pos�ugiwa� �ukiem.";
};


func int DIA_Niclas_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Poka� mi prosz�, jak si� pos�ugiwa� �ukiem.
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//Nauczy�em ci� ju� wszystkiego, co sam umia�em. Musisz sobie poszuka� innego nauczyciela.
	}
	else
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
	};
};

func void DIA_Niclas_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//Niczego wi�cej nie mog� ci� ju� nauczy�.
	};
	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};

func void DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};


instance DIA_Niclas_PICKPOCKET(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 900;
	condition = DIA_Niclas_PICKPOCKET_Condition;
	information = DIA_Niclas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Niclas_PICKPOCKET_Condition()
{
	return C_Beklauen(27,20);
};

func void DIA_Niclas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,Dialog_Back,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

