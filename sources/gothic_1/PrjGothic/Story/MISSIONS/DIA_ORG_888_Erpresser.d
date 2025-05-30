
instance Info_Erpresser(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_Erpresser_Condition;
	information = Info_Erpresser_Info;
	permanent = 1;
	important = 1;
};


func int Info_Erpresser_Condition()
{
	if((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (self.aivar[AIV_HAS_ERPRESSED] == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Erpresser_Info()
{
	AI_Output(self,other,"Info_Erpresser_Info_13_01");	//Hej, ch�opcze! Je�li chcesz wej�� do �rodka, b�dziesz musia� zap�aci� 10 bry�ek, kapujesz?
	Info_ClearChoices(Info_Erpresser);
	Info_AddChoice(Info_Erpresser,"To dlaczego nie przyjdziesz tutaj i ich sobie nie we�miesz!",Info_Erpresser_Choice_AufsMaul);
	Info_AddChoice(Info_Erpresser,"Trzy bry�ki? To niewiele. Prosz� bardzo...",Info_Erpresser_Choice_Zahlen);
};

func void Info_Erpresser_Choice_AufsMaul()
{
	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01");	//To dlaczego nie przyjdziesz tutaj i ich sobie nie we�miesz!
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02");	//Dzi�ki, stary. W�a�nie zaczyna�em si� nudzi�.
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void Info_Erpresser_Choice_Zahlen()
{
	if(Npc_HasItems(other,ItMiNugget) >= 3)
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01");	//Prosz�, oto 10 bry�ek.
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02");	//Jaka szkoda.
		self.aivar[AIV_HAS_ERPRESSED] = 1;
	}
	else
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03");	//Ummm... Nie mam przy sobie 10 bry�ek.
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04");	//Wielka szkoda...
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	};
	AI_StopProcessInfos(self);
};


instance Info_BereitsErpresst(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsErpresst_Condition;
	information = Info_BereitsErpresst_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsErpresst_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 1) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsErpresst_Info()
{
	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02");	//Zap�aci�e� - mo�esz przej��. W�a�, zanim si� rozmy�l�.
};


instance Info_BereitsAufsMaul(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsAufsMaul_Condition;
	information = Info_BereitsAufsMaul_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsAufsMaul_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 2) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsAufsMaul_Info()
{
	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02");	//Spadaj zanim zetr� ten g�upi u�miech z twojej g�by!
};


instance Info_Exit(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 999;
	condition = Info_Exit_Condition;
	information = Info_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Exit_Condition()
{
	return 1;
};

func void Info_Exit_Info()
{
	AI_StopProcessInfos(self);
};

