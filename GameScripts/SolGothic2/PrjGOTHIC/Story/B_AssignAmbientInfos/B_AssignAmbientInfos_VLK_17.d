
instance DIA_VLK_17_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_17_EXIT_Condition;
	information = DIA_VLK_17_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_17_JOIN_Condition;
	information = DIA_VLK_17_JOIN_Info;
	permanent = TRUE;
	description = "Co powinienem zrobiæ, by zostaæ obywatelem miasta?";
};


func int DIA_VLK_17_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_17_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Co powinienem zrobiæ, by zostaæ obywatelem miasta?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Mistrzowie rzemios³a z dolnej czêœci miasta posiadaj¹ bardzo du¿e wp³ywy. Powinieneœ porozmawiaæ z którymœ z nich.
};


instance DIA_VLK_17_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_17_PEOPLE_Condition;
	information = DIA_VLK_17_PEOPLE_Info;
	permanent = TRUE;
	description = "Kim s¹ najwa¿niejsze osoby w mieœcie?";
};


func int DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//Kim s¹ najwa¿niejsze osoby w mieœcie?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//Od swojego przybycia paladyni kontroluj¹ w³aœciwie ca³e Khorinis.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Przedstawicielem prawa w mieœcie jest Lord Andre, znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//S¹ tylko dwa sposoby na spotkanie siê z nim - mo¿na z³amaæ prawo albo przy³¹czyæ siê do stra¿y miejskiej.
};


instance DIA_VLK_17_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_17_LOCATION_Condition;
	information = DIA_VLK_17_LOCATION_Info;
	permanent = TRUE;
	description = "Które z miejsc w Khorinis warto odwiedziæ?";
};


func int DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//Które z miejsc w Khorinis warto odwiedziæ?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//Mo¿e powinieneœ zapytaæ o to jakiegoœ mê¿czyznê. Jeœli szukasz rozrywki, udaj siê do dzielnicy portowej.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Jeœli jednak chcesz coœ kupiæ, udaj siê na targowisko niedaleko wschodniej bramy, lub do dolnej czêœci miasta.
};


instance DIA_VLK_17_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_17_STANDARD_Condition;
	information = DIA_VLK_17_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Co s³ychaæ?
	if((Kapitel == 1) || (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Zastanawiam siê, po co paladyni pojawili siê w mieœcie. Niby przejêli kontrolê nad ratuszem, koszarami i portem, ale, jak dot¹d, nic nie robi¹.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Gdyby przyjechali tu zaj¹æ siê orkami lub bandytami, ju¿ dawno powinni coœ z tym zrobiæ. Musi byæ inny powód...
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Chyba ju¿ wiem, co sprowadzi³o tu paladynów. Chodzi o rudê. Zajêliby siê lepiej ochron¹ miasta.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Mam nadziejê, ¿e w opowieœciach o smokach jest trochê prawdy. Lord Hagen bêdzie musia³ coœ zrobiæ, nie narazi nas przecie¿ na atak bestii.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Teraz, kiedy smoki zosta³y pokonane, paladyni nie powinni mieæ problemu ze st³umieniem pozosta³ych niepokojów.
	};
};

func void B_AssignAmbientInfos_VLK_17(var C_Npc slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

