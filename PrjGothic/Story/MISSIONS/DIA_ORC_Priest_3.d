
instance Info_HighPriest3(C_Info)
{
	npc = ORC_Priest_3;
	nr = 1;
	condition = Info_HighPriest3_Condition;
	information = Info_HighPriest3_Info;
	important = 1;
};


func int Info_HighPriest3_Condition()
{
	return 1;
};

func void Info_HighPriest3_Info()
{
	B_SelectWeapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_HighPriest3_17_01");	//�MIERTELNY!
	AI_Output(self,other,"Info_HighPriest3_17_02");	//TW�J CZAS W�A�NIE DOBIEG� KO�CA!
	AI_Output(other,self,"Info_HighPriest3_15_03");	//Ale� sk�d, kobiety i gnij�ce mumie przodem!
	B_LogEntry(CH4_EnterTemple,"Varrag-Unhilqt, jeden z pi�ciu orkowych szaman�w, stoi tu� przede mn�. Tylko jeden z nas do�yje jutra!");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

