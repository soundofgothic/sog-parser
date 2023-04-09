
instance Info_HighPriest5(C_Info)
{
	npc = ORC_Priest_5;
	nr = 1;
	condition = Info_HighPriest5_Condition;
	information = Info_HighPriest5_Info;
	important = 1;
};


func int Info_HighPriest5_Condition()
{
	return TRUE;
};

func void Info_HighPriest5_Info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	if(Npc_HasItems(hero,Mythrilklinge02) || Npc_HasItems(hero,UrizielRune))
	{
		AI_Output(self,other,"Info_HighPriest5_17_04");	//MASZ ZE SOB� POTʯNY ORʯ!
		AI_Output(self,other,"Info_HighPriest5_17_05");	//POWSTRZYMAM CI�!
		AI_StopProcessInfos(self);
		self.npcType = npctype_main;
		Npc_SetAttitude(self,ATT_HOSTILE);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	}
	else
	{
		AI_Output(self,other,"Info_HighPriest5_17_01");	//MUSISZ TUTAJ ZAWR�CI�!
		AI_Output(self,other,"Info_HighPriest5_17_02");	//NIKT NIE MO�E ZAK��CI� SNU MEGO PANA!
		AI_Output(other,self,"Info_HighPriest5_15_03");	//Nie ma lekko! Budzimy �PIOCHA!
		AI_StopProcessInfos(self);
		B_Story_EncounteredHighPriest();
	};
};


instance Info_HighPriest5FAILED(C_Info)
{
	npc = ORC_Priest_5;
	nr = 2;
	condition = Info_HighPriest5FAILED_Condition;
	information = Info_HighPriest5FAILED_Info;
	important = 1;
};


func int Info_HighPriest5FAILED_Condition()
{
	if(Npc_KnowsInfo(hero,Info_HighPriest5) && (self.aivar[AIV_MISSION1] >= HighPriest_MaxHit) && !Npc_HasItems(hero,Mythrilklinge02) && !Npc_HasItems(hero,UrizielRune))
	{
		return TRUE;
	};
};

func void Info_HighPriest5FAILED_Info()
{
	AI_Output(other,self,"Info_HighPriest5FAILED_15_01");	//Cholera! Nie zadaj� mu nawet najmniejszych obra�e�. Potrzebuj� innej...
	AI_Output(self,other,"Info_HighPriest5FAILED_17_02");	//TERAZ ZGINIESZ!
	AI_Output(other,self,"Info_HighPriest5FAILED_15_03");	//Lepiej si� st�d wynosi�! I to zaraz!
	AI_RemoveWeapon(other);
	AI_TurnAway(other,self);
	self.npcType = npctype_main;
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(CH4_EnterTemple,"Wygl�da na to, �e Grash-Varrag-Arushat nie nale�y do przekl�tych orkowych szaman�w. Jest o wiele bardziej pot�ny i ma bro� zdaje si� go nie ima�! Potrzebuj� pot�niejszego or�a!");
	B_GiveXP(XP_RetreatFromLastPriest);
	AI_StopProcessInfos(self);
};

