
instance DIA_BAU_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_1_EXIT_Condition;
	information = DIA_BAU_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_1_JOIN_Condition;
	information = DIA_BAU_1_JOIN_Info;
	permanent = TRUE;
	description = "Powiedz mi co� wi�cej o tych najemnikach!";
};


func int DIA_BAU_1_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_1_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//Powiedz mi co� wi�cej o tych najemnikach!
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//Najlepiej, �eby� ich omija� szerokim �ukiem. To moja jedyna rada.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//Wystarczy, �e kt�remu� nie spodoba si� twoja g�ba i dostaniesz w nos bez ostrze�enia.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//Jasne, zawsze mo�esz o tym donie�� Lee, ale nos i tak nie b�dzie ju� taki jak kiedy�.
};


instance DIA_BAU_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_1_PEOPLE_Condition;
	information = DIA_BAU_1_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//To farma Onara i on podejmuje tu wszystkie wa�ne decyzje.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Pozw�l, �e dam ci pewn� rad�: nie wdawaj si� w b�jki z jego najemnikami. Ci ch�opcy nie lubi�, kiedy wchodzi im si� w drog�.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Szczeg�lnie ten Sylvio to strasznie wredny �otr. Jednak ich przyw�dca, Lee, jest jak najbardziej w porz�dku.
};


instance DIA_BAU_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_1_LOCATION_Condition;
	information = DIA_BAU_1_LOCATION_Info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o tej okolicy?";
};


func int DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//Co mo�esz mi powiedzie� o tej okolicy?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Na oko�o tylko pola i farmy. I najemnicy, co to w��cz� si� zw�aszcza na wsch�d od farmy Onara.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//Na p�noc st�d le�y farma Sekoba, ale najemnicy pojawiaj� si� tam tylko po to, by zebra� czynsz.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//Na po�udniowym zachodzie le�y farma Bengara.
};


instance DIA_BAU_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_1_STANDARD_Condition;
	information = DIA_BAU_1_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//Co s�ycha�?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Onar wynaj�� najemnik�w, kt�rzy maj� odstrasza� stra�nik�w miejskich. Inaczej rozkradliby nasz dobytek do ostatniej owcy!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Niewiele si� dzieje. Wci�� te same problemy. Stra�, orkowie, polne bestie.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Ostatnio dziej� si� tu dziwne rzeczy. Kilka nocy temu widzia�em czarn� posta�. To nie by� cz�owiek.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//Pojawia si� coraz wi�cej ork�w. Czasem tak sobie my�l�, �e miejsce ka�dego zabitego zajmuj� dwaj nowi.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_05");	//Paladyni wyruszaj� do G�rniczej Doliny. O co w tym wszystkim chodzi? Jak tak dalej p�jdzie, nie b�dzie nikogo, by powstrzyma� stra� miejsk�.
	};
};

func void B_AssignAmbientInfos_BAU_1(var C_Npc slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

