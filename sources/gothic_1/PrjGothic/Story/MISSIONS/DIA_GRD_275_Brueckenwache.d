
instance Info_GRD_275_PreExit(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_PreExit_Condition;
	information = Info_GRD_275_PreExit_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int Info_GRD_275_PreExit_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_GRD_275_PreExit_Info()
{
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01");	//Id� jak najszybciej do Starego Obozu! Tam ju� czekaj� na ciebie z nowiute�kim kilofem. Hi hi hi!
	AI_StopProcessInfos(self);
};


instance Info_GRD_275_Exit(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_Exit_Condition;
	information = Info_GRD_275_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GRD_275_Exit_Condition()
{
	if((Kapitel > 1) || Npc_KnowsInfo(hero,Info_GRD_275_PreExit))
	{
		return 1;
	};
};

func void Info_GRD_275_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GRD_275_WasMachtIhrHier(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_WasMachtIhrHier_Condition;
	information = Info_GRD_275_WasMachtIhrHier_Info;
	permanent = 1;
	description = "Czym si� tutaj zajmujecie?";
};


func int Info_GRD_275_WasMachtIhrHier_Condition()
{
	return 1;
};

func void Info_GRD_275_WasMachtIhrHier_Info()
{
	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00");	//Czym si� tutaj zajmujecie?
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01");	//A na co ci to wygl�da? Pilnujemy mostu!
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02");	//Pilnujemy, �eby �adne paskudztwa nie przedosta�y si� na drug� stron�.
};


instance Info_GRD_275_Tips(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_Tips_Condition;
	information = Info_GRD_275_Tips_Info;
	permanent = 1;
	description = "Masz dla mnie jakie� dobre rady?";
};


func int Info_GRD_275_Tips_Condition()
{
	return 1;
};

func void Info_GRD_275_Tips_Info()
{
	AI_Output(other,self,"Info_GRD_275_Tips_15_00");	//Masz dla mnie jakie� dobre rady?
	AI_Output(self,other,"Info_GRD_275_Tips_06_01");	//Tak. Nie zapuszczaj si� do lasu w pojedynk�.
	AI_Output(self,other,"Info_GRD_275_Tips_06_02");	//Chyba, �e jeste� wystarczaj�co silny, �eby da� sobie rad� ze zwierzakami.
};

