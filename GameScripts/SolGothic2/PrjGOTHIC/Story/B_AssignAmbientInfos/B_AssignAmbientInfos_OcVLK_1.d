
instance DIA_OCVLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_1_EXIT_Condition;
	information = DIA_OCVLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_1_PEOPLE_Condition;
	information = DIA_OCVLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_OCVLK_1_PEOPLE_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Kapitan Garond. Odk¹d jednak walki uleg³y zaostrzeniu, nie rusza siê z sali tronowej na krok. Obawiam siê, ¿e ca³a sprawa Ÿle siê skoñczy.
};


instance DIA_OCVLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_1_LOCATION_Condition;
	information = DIA_OCVLK_1_LOCATION_Info;
	permanent = TRUE;
	description = "Co wiesz o Górniczej Dolinie?";
};


func int DIA_OCVLK_1_LOCATION_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//Co wiesz o Górniczej Dolinie?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//Wydaje mi siê, ¿e kilku naszych ch³opaków wci¹¿ pracuje w kopalniach.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//Jednak nie zdecydowa³bym siê na handel z nimi. Ca³a dolina zajêta jest przez orków. Nie wspomnê ju¿ o smokach.
};


instance DIA_OCVLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_1_STANDARD_Condition;
	information = DIA_OCVLK_1_STANDARD_Info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//Jak siê maj¹ sprawy?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//Orkowie zapêdzili nas w kozi róg! Bez posi³ków d³ugo nie wytrzymamy, wszyscy zgin¹! Zreszt¹ dziwi mnie fakt, ¿e smoki nas nie wykoñczy³y.
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//Przynajmniej posi³ki dotar³y na czas.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//S³ysza³em, ¿e smoki zosta³y zabite? Innosowi niech bêd¹ dziêki!
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//Przeklêta ruda. Powinniœmy zrzuciæ ca³y jej zapas z barykad. Mo¿e wtedy orkowie zostawiliby nas w spokoju.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Ta sterta skrzyñ porozrzucana bez³adnie przed bram¹ na pewno nie zatrzyma orków!
		};
	};
};

func void B_AssignAmbientInfos_OCVLK_1(var C_Npc slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

