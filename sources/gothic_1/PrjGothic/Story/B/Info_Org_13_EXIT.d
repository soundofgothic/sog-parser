
instance Info_Org_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_13_EXIT_Condition;
	information = Info_Org_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_13_EinerVonEuchWerden_Condition;
	information = Info_Org_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co musz� zrobi�, �eby do��czy� do waszego Obozu?";
};


func int Info_Org_13_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00");	//Co musz� zrobi�, �eby do��czy� do waszego Obozu?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01");	//Wyjd� na pole i pom� przy zbieraniu ry�u.
};


instance Info_Org_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_13_WichtigePersonen_Condition;
	information = Info_Org_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_13_WichtigePersonen_Info()
{
	var C_Npc Lee;
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01");	//Lee jest szefem Najemnik�w, je�li o to ci chodzi. Ale JA nie jestem Najemnikiem, wi�c niech mnie szlag, je�li pozwol� mu sob� pomiata�!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_13_DasLager_Condition;
	information = Info_Org_13_DasLager_Info;
	permanent = 1;
	description = "Chcia�bym si� dowiedzie� wi�cej o waszym Obozie.";
};


func int Info_Org_13_DasLager_Condition()
{
	return 1;
};

func void Info_Org_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00");	//Chcia�bym si� dowiedzie� czego� wi�cej o waszym Obozie.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01");	//Najlepiej wejd� do �rodka i po prostu rozejrzyj si�! Tak d�ugo jak nie jeste� jednym z ludzi Gomeza, nikt ci� nie b�dzie zaczepia�.
};


instance Info_Org_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_13_DieLage_Condition;
	information = Info_Org_13_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01");	//A czego chcesz?
};


instance Info_Org_13_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_13_Krautprobe_Condition;
	information = Info_Org_13_Krautprobe_Info;
	permanent = 1;
	description = "Wygl�dasz mi na kogo�, komu przyda�oby si� troch� ziela.";
};


func int Info_Org_13_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_13_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00");	//Wygl�dasz mi na kogo�, komu przyda�oby si� troch� bagiennego ziela.
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01");	//A masz je przy sobie? Dam ci 10 bry�ek rudy!
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02");	//Wracaj, kiedy tylko zechcesz, Bracie!
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00");	//Ale ty wcale nie masz ziela! Przesta� mnie wkurza�!
	};
};

func void B_AssignAmbientInfos_Org_13(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

