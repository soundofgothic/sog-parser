
instance Info_Bau_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_2_EXIT_Condition;
	information = Info_Bau_2_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Bau_2_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bau_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_2_WichtigePersonen_Condition;
	information = Info_Bau_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Pracujesz na polach ry�owych z w�asnej woli?";
};


func int Info_Bau_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_2_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00");	//Pracujesz na polach ry�owych z w�asnej woli?
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01");	//Jasne! Lepsze to, ni� zosta� ZMUSZONYM do pracy przez oprych�w Ry�owego Ksi�cia!
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02");	//Rozumiem...
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_2_DasLager_Condition;
	information = Info_Bau_2_DasLager_Info;
	permanent = 1;
	description = "Co mo�esz mi powiedzie� o Obozie?";
};


func int Info_Bau_2_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_2_DasLager_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00");	//Co mo�esz mi powiedzie� o Obozie?
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01");	//Nie�atwo si� tu �yje. Najemnicy Lee i magowie s� w porz�dku, ale Szkodniki daj� si� wszystkim we znaki!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_2_DieLage_Condition;
	information = Info_Bau_2_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_Bau_2_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_2_DieLage_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01");	//Czego chcesz? Przys�a� ci� Ry�owy Ksi��e? Pracuj� najlepiej jak potrafi�!
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02");	//Nikt mnie nie przys�a�! Chc� po prostu porozmawia�!
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_2_Wasser_Condition;
	information = Info_Bau_2_Wasser_Info;
	permanent = 1;
	description = "Przysy�a mnie Lewus. Przynios�em ci wod�.";
};


func int Info_Bau_2_Wasser_Condition()
{
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_2_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00");	//Przysy�a mnie Lewus. Przynios�em ci wod�.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_02_01");	//O, dzi�ki. Umieram z pragnienia!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00");	//Woda! Hej, cz�owieku! Nic nie zosta�o! Tylko mi nie m�w, �e znowu wszyscy si� napili, opr�cz mnie!
	};
};

func void B_AssignAmbientInfos_Bau_2(var C_Npc slf)
{
	Info_Bau_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_Wasser.npc = Hlp_GetInstanceID(slf);
};
