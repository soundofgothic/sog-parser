
instance Info_Sld_11_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_11_EXIT_Condition;
	information = Info_Sld_11_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Sld_11_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chcia�bym zosta� Najemnikiem i pracowa� dla Mag�w.";
};


func int Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_11_EinerVonEuchWerden_Info()
{
	var C_Npc gorn;
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00");	//Chcia�bym zosta� Najemnikiem i pracowa� dla Mag�w.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01");	//To nie takie trudne. Je�li jeste� got�w do walki za nasz� spraw�, Lee na pewno ci� przyjmie.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02");	//Ale szanse na zostanie Najemnikiem maj� tylko ludzie biegli w pos�ugiwaniu si� mieczem. Jak z tym u ciebie?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03");	//C�...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04");	//Tak w�a�nie my�la�em. Je�li my�lisz o tym powa�nie, porozmawiaj z Gornem. On kiedy� szkoli� nowoprzyby�ych.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05");	//Mo�e ci si� poszcz�ci, i Gorn zechce ci� uczy�.
	gorn = Hlp_GetNpc(PC_Fighter);
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_11_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_11_WichtigePersonen_Condition;
	information = Info_Sld_11_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_11_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01");	//Wype�niamy polecenia mag�w, cho� ci rzadko maj� jakie� konkretne ��dania. Siedz� tylko przy kopcu rudy i czytaj� te swoje ksi�gi.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02");	//W sumie rz�dzi tu Lee. To nasz szef.
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_11_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_11_DasLager_Condition;
	information = Info_Sld_11_DasLager_Info;
	permanent = 1;
	description = "Czy w obozie dochodzi do jakich� spi��?";
};


func int Info_Sld_11_DasLager_Condition()
{
	return 1;
};

func void Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00");	//Czy w obozie dochodzi do jakich� spi��?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01");	//Ch�opie, co chwila s� jakie� problemy! Szkodniki robi� co si� im �ywnie podoba, a my musimy pilnowa� Mag�w i ca�ego Obozu.
};


instance Info_Sld_11_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_11_DieLage_Condition;
	information = Info_Sld_11_DieLage_Info;
	permanent = 1;
	description = "Wszystko w porz�dku?";
};


func int Info_Sld_11_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01");	//Jeszcze jest cicho...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02");	//Jeszcze?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03");	//Je�li Szkodniki nie przestan� atakowa� konwoj�w ze Starego Obozu, Gomez w ko�cu si� w�cieknie i zapuka do naszych bram.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04");	//I b�dzie niez�a zabawa!
};


instance Info_Sld_11_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_11_Krautprobe_Condition;
	information = Info_Sld_11_Krautprobe_Info;
	permanent = 1;
	description = "Chcesz troch� bagiennego ziela?";
};


func int Info_Sld_11_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_11_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00");	//Chcesz troch� bagiennego ziela?
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
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01");	//Jasne. Masz tu 10 bry�ek rudy.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02");	//Jakby� mia� jeszcze kiedy� troch� ziela, no wiesz...
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00");	//Najpierw je przynie�, wtedy pogadamy.
	};
};

func void B_AssignAmbientInfos_Sld_11(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

