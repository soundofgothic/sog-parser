
instance DIA_BAU_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_13_EXIT_Condition;
	information = DIA_BAU_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_13_JOIN_Condition;
	information = DIA_BAU_13_JOIN_Info;
	permanent = TRUE;
	description = "Powiedz mi co� wi�cej o tych najemnikach!";
};


func int DIA_BAU_13_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_13_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Powiedz mi co� wi�cej o tych najemnikach.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Je�li dadz� ci si� we znaki, to porozmawiaj z Lee. My, ch�opi, zawsze tak robimy, a on trzyma swoich ludzi kr�tko.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Je�li kt�ry� z nich �le si� zachowuje, od razu dostaje nauczk�.
};


instance DIA_BAU_13_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_13_PEOPLE_Condition;
	information = DIA_BAU_13_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Je�li chcesz zna� moje zdanie, najemnicy. Fakt, Onar ich op�aca, ale chyba tylko sam Innos wie, jak d�ugo jeszcze b�d� go s�ucha�.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//Niech no tylko najemnicy p�jd� po rozum do g�owy, a szybko wpadn� na to, �e nie jest im potrzebny. Nie chcia�bym by� wtedy w jego sk�rze.
};


instance DIA_BAU_13_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_13_LOCATION_Condition;
	information = DIA_BAU_13_LOCATION_Info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o tym miejscu?";
};


func int DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Co mo�esz mi powiedzie� o tym miejscu?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//W pobli�u znajduj� si� trzy farmy. Farma Onara na wschodzie, za� u p�nocnego uj�cia doliny gospodarstwo Sekoba.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//�cie�ka pn�ca si� na wy�yn�, na po�udniowy zach�d st�d, prowadzi na farm� Bengara.
};


instance DIA_BAU_13_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_13_STANDARD_Condition;
	information = DIA_BAU_13_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Co s�ycha�?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Od kiedy zacz�li�my si� broni�, oddzia�y stacjonuj�ce w mie�cie przesta�y rozkrada� nasze zbiory i inwentarz! Chyba zbytnio si� nas boj�!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Paladyni z miasta nie za bardzo przejmuj� si� naszym losem. Je�li orkowie zaatakuj�, b�dziemy zdani tylko na siebie.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//I jeszcze smoki! Plotka g�osi, �e bestie pojawi�y si� w G�rniczej Dolinie. Pono� wkr�tce maj� przeprawi� si� przez prze��cz!
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//M�wi si� nawet o tym, jakoby bandyci z g�r zmierzali w stron� G�rniczej Doliny. Jak dla mnie, to troch� za du�o niebezpiecze�stw.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//Kiedy podatki spadn� do jakich� sensownych warto�ci, a my b�dziemy przyzwoicie zarabia�, wtedy zn�w zaczniemy handlowa� z miastem.
	};
};

func void B_AssignAmbientInfos_BAU_13(var C_Npc slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

