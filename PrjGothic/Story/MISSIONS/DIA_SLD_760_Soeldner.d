
instance DIA_SLD_760_Soeldner_INTRO(C_Info)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_760_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};


func int DIA_SLD_760_Soeldner_INTRO_CONDITION()
{
	if(Npc_GetDistToNpc(self,hero) < 200)
	{
		return 1;
	};
};

func void DIA_SLD_760_Soeldner_INTRO_INFO()
{
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01");	//Co si� tak kr�cisz? Dobrze ci radz�: �apy z dala od tych drzwi!
};


instance DIA_SLD_760_Soeldner_EXIT_1(C_Info)
{
	nr = 999;
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_760_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
	description = "Lepiej ju� sobie p�jd�.";
};


func int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01");	//Lepiej ju� sobie p�jd�.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");	//Mam nadziej�, �e si� rozumiemy.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_760_Soeldner_EXIT_2(C_Info)
{
	nr = 999;
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_760_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
	description = "Musz� ju� i��.";
};


func int DIA_SLD_760_Soeldner_EXIT_2_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_760_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_760_Soeldner_EXIT_2_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");	//No to id�!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_760_Soeldner_UMSEHEN(C_Info)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_760_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
	description = "Chcia�bym si� tutaj troch� rozejrze�.";
};


func int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01");	//Chcia�bym si� tutaj troch� rozejrze�.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");	//Tylko trzymaj �apy przy sobie, albo ci je odr�bi�.
};


instance DIA_SLD_760_Soeldner_INMINE(C_Info)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_760_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
	description = "Chcia�bym si� dosta� do kopalni.";
};


func int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01");	//Chcia�bym si� dosta� do kopalni.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");	//Do kopalni? Nie wpuszcz� nikogo, kto nie otrzyma� upowa�nienia od Okyla.
	if(!Npc_KnowsInfo(hero,dia_sld_752_okyl_werbistdu))
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");	//Kim jest Okyl?
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");	//Okyl? Czy to nie ten go�� w ci�kiej zbroi i z wielkim toporem?
	};
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");	//Uwa�aj co m�wisz o naszym szefie!
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");	//Powiem ci co� o Okylu: to najtwardszy go�� w ca�ym Obozie. Kiedy� nawet w�lizn�� si� do zamku w Starym Obozie i podw�dzi� Magnatom spory �adunek rudy.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");	//Wi�c na przysz�o�� radz� ci okazywa� mu troch� wi�cej szacunku.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");	//Nie wiem, gdzie jest teraz, ale jakby� go spotka�, lepiej pami�taj o tym, co ci dzi� powiedzia�em.
};

