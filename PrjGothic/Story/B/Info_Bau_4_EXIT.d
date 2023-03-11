
instance Info_Bau_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_4_EXIT_Condition;
	information = Info_Bau_4_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Bau_4_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bau_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_4_WichtigePersonen_Condition;
	information = Info_Bau_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Macie jakiego� przyw�dc�?";
};


func int Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_4_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00");	//Macie jakiego� przyw�dc�?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01");	//C�, teoretycznie naszym szefem jest Ry�owy Ksi��e, ale wi�kszo�� z nas pracuje dla niego tylko ze strachu przed jego siepaczami.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02");	//Ja jestem wyj�tkiem. Jestem tu od kilku lat i zd��y�em ju� par� razy oberwa� od Szkodnik�w. Na polach ry�owych jest przynajmniej spokojnie.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_4_DasLager_Condition;
	information = Info_Bau_4_DasLager_Info;
	permanent = 1;
	description = "Co powinienem wiedzie� o tym miejscu?";
};


func int Info_Bau_4_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00");	//Co powinienem wiedzie� o tym miejscu?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01");	//Uwa�aj na siebie, ch�opcze! W Obozie roi si� od morderc�w i rabusi�w. Oni tylko czekaj� na przybycie kogo� takiego jak ty.
};


instance Info_Bau_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_4_DieLage_Condition;
	information = Info_Bau_4_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_Bau_4_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01");	//Mamy mn�stwo pracy. Do wykarmienia tylu ludzi potrzeba mn�stwa ry�u.
};


instance Info_Bau_4_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_4_Wasser_Condition;
	information = Info_Bau_4_Wasser_Info;
	permanent = 1;
	description = "Przysy�a mnie Lewus. Przynios�em ci wod�.";
};


func int Info_Bau_4_Wasser_Condition()
{
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00");	//Przysy�a mnie Lewus. Przynios�em ci wod�.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Bau_4_Wasser_04_01");	//Dzi�ki, ch�opcze. Pi�kne dzi�ki.
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00");	//Ale nic ci nie zosta�o! No trudno, poszukam u innych.
	};
};

func void B_AssignAmbientInfos_Bau_4(var C_Npc slf)
{
	Info_Bau_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_Wasser.npc = Hlp_GetInstanceID(slf);
};

