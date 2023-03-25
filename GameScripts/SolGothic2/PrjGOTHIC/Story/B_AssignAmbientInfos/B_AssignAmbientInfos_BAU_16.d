
instance DIA_BAU_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_16_EXIT_Condition;
	information = DIA_BAU_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_16_JOIN_Condition;
	information = DIA_BAU_16_JOIN_Info;
	permanent = TRUE;
	description = "Powiedz mi coœ wiêcej o tych najemnikach!";
};


func int DIA_BAU_16_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Powiedz mi coœ wiêcej o tych najemnikach!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Ca³ymi dniami w³ócz¹ siê po farmie, od czasu do czasu dadz¹ sobie po pyskach i najwyraŸniej dobrze siê bawi¹.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kto tu rz¹dzi?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Jeœli chcesz znaæ moje zdanie, najemnicy.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar wprawdzie im p³aci, ale i tak robi¹ przewa¿nie to, co im siê ¿ywnie podoba.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o tym miejscu?";
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Co mo¿esz mi powiedzieæ o tej okolicy?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//W pobli¿u znajduj¹ siê trzy farmy. Farma Onara na wschodzie, zaœ na pó³nocnym krañcu doliny gospodarstwo Sekoba.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Œcie¿ka pn¹ca siê na wy¿ynê, na po³udniowy wschód st¹d, prowadzi na farmê Bengara.
};


instance DIA_BAU_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co s³ychaæ?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Od kiedy okaza³o siê, ¿e potrafimy siê broniæ, oddzia³y z miasta przesta³y rozkradaæ nasze zbiory i inwentarz! Chyba zbytnio siê nas boj¹!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//Ludzie powiadaj¹, ¿e w Górniczej Dolinie gromadzi siê armia. Ponoæ wkrótce tu nadci¹gnie.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Plotka g³osi, ¿e w Górniczej Dolinie zadomowi³y siê smoki, ale jakoœ trudno mi w to uwierzyæ.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Niektórzy z najemników odeszli. W³aœciwie nie wiem, czy to dobrze, czy to Ÿle.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Swoj¹ drog¹ zastanawiam siê, po co w³aœciwie wysy³aj¹ tylu paladynów do Górniczej Doliny, o co w tym wszystkim chodzi?
	};
};

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

