
instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_7_JOIN_Condition;
	information = DIA_BAU_7_JOIN_Info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o najemnikach?";
};


func int DIA_BAU_7_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_7_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_7_JOIN_15_00");	//Co mo¿esz mi powiedzieæ o najemnikach?
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//Onar wynaj¹³ ich, by bronili jego farmy.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//Wiêkszoœæ z nich zachowuje siê tak, jakby farma by³a ich w³asnoœci¹. Ale to prawda, ¿e nas ochraniaj¹.
};


instance DIA_BAU_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_7_PEOPLE_Condition;
	information = DIA_BAU_7_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//Kto tu rz¹dzi?
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//Du¿a farma nale¿y do Onara. Mniejsze tak¿e, ale te wynajmuje okolicznym mieszkañcom.
};


instance DIA_BAU_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_7_LOCATION_Condition;
	information = DIA_BAU_7_LOCATION_Info;
	permanent = TRUE;
	description = "Powiedz mi coœ na temat okolicy.";
};


func int DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//Powiedz mi coœ na temat okolicy.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//Du¿a farma po wschodniej stronie doliny nale¿y do Onara. Na pó³noc st¹d le¿y farma Sekoba.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//Jest jeszcze farma Bengara, która le¿y na wzniesieniu, na po³udniowy zachód st¹d. Mo¿esz siê tam przedostaæ z doliny - musisz jedynie wejœæ po kamiennych schodach.
};


instance DIA_BAU_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Co s³ychaæ?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Og³osiliœmy niepodleg³oœæ - nie p³acimy ju¿ podatków na rzecz miasta. Król nic nigdy dla nas nie zrobi³ - mieliœmy tego doœæ!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//W tej chwili niewiele siê tu dzieje.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Ostatnio ludzie zaczêli opowiadaæ coœ o smokach. A król robi wszystko, ¿eby tylko wycisn¹æ z poddanych jak najwiêcej pieniêdzy.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Uwa¿aj na siebie, wzd³u¿ prze³êczy pa³êta siê wiele podejrzanych typków i dzikich bestii.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//Teraz, po œmierci smoków, paladyni zechcieli ³askawie opuœciæ mury miasta. Czas najwy¿szy, by na ulicach znów zapanowa³ porz¹dek.
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

