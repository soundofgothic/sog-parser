
instance DIA_Mil_325_Miliz_EXIT(C_Info)
{
	npc = Mil_325_Miliz;
	nr = 999;
	condition = DIA_Mil_325_Miliz_EXIT_Condition;
	information = DIA_Mil_325_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_325_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_325_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_325_Checkpoint = "NW_CITY_MERCHANT_PATH_03";

instance DIA_Mil_325_Miliz_FirstWarn(C_Info)
{
	npc = Mil_325_Miliz;
	nr = 1;
	condition = DIA_Mil_325_Miliz_FirstWarn_Condition;
	information = DIA_Mil_325_Miliz_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_325_Miliz_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_325_Checkpoint) < 650)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_325_Miliz_FirstWarn_12_00");	//ST�J!
	AI_Output(self,other,"DIA_Mil_325_Miliz_FirstWarn_12_01");	//Nikt nie mo�e wej�� do magazynu.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_325_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_325_Miliz_SecondWarn(C_Info)
{
	npc = Mil_325_Miliz;
	nr = 2;
	condition = DIA_Mil_325_Miliz_SecondWarn_Condition;
	information = DIA_Mil_325_Miliz_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_325_Miliz_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_325_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_325_Miliz_SecondWarn_12_00");	//G�uchy jeste�? Jeden krok dalej, a posiekam ci� na kawa�ki.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_325_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_325_Miliz_Attack(C_Info)
{
	npc = Mil_325_Miliz;
	nr = 3;
	condition = DIA_Mil_325_Miliz_Attack_Condition;
	information = DIA_Mil_325_Miliz_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_325_Miliz_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_325_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_325_Miliz_Attack_12_00");	//To by� b��d!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_325_Miliz_Pass(C_Info)
{
	npc = Mil_325_Miliz;
	nr = 5;
	condition = DIA_Mil_325_Miliz_Pass_Condition;
	information = DIA_Mil_325_Miliz_Pass_Info;
	permanent = FALSE;
	description = "Nale�� do armii kr�lewskiej. Potrzebuj� wyposa�enia!";
};


func int DIA_Mil_325_Miliz_Pass_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Pass_Info()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_15_00");	//Nale�� do armii kr�lewskiej. Potrzebuj� wyposa�enia!
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_12_01");	//Masz na to jakie� potwierdzenie?
	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	Info_AddChoice(DIA_Mil_325_Miliz_Pass,"Nie.",DIA_Mil_325_Miliz_Pass_No);
	Info_AddChoice(DIA_Mil_325_Miliz_Pass,"Jasne.",DIA_Mil_325_Miliz_Pass_Yes);
};

func void DIA_Mil_325_Miliz_Pass_Yes()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_Yes_15_00");	//Oczywi�cie.
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_Yes_12_01");	//W porz�dku, mo�esz wej��!
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	AI_StopProcessInfos(self);
};

func void DIA_Mil_325_Miliz_Pass_No()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_No_12_01");	//W takim razie wyno� si�.
	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	AI_StopProcessInfos(self);
};


instance DIA_Mil_325_Miliz_PERM(C_Info)
{
	npc = Mil_325_Miliz;
	nr = 5;
	condition = DIA_Mil_325_Miliz_PERM_Condition;
	information = DIA_Mil_325_Miliz_PERM_Info;
	permanent = TRUE;
	description = "Dlaczego nikt nie mo�e wej�� do magazynu?";
};


func int DIA_Mil_325_Miliz_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_325_Miliz_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_PERM_15_00");	//Dlaczego nikt nie mo�e wej�� do magazynu?
	AI_Output(self,other,"DIA_Mil_325_Miliz_PERM_12_01");	//Mi�o�ciwy Lord Hagen skonfiskowa� wszystko na potrzeby armii kr�lewskiej.
};

