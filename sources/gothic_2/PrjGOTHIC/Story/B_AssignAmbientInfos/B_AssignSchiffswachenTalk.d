
func void B_AssignSchiffswachenGuard(var C_Npc Schiffswache)
{
	if((MIS_ShipIsFree == TRUE) || (MIS_SCvisitShip == LOG_Running))
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Obserwujemy ci�, wi�c lepiej o tym pami�taj.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Nie wpl�cz si� w jakie� k�opoty, b�d�c tutaj.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Nawet nie my�l o kradzie�y, jasne?
		};
		AI_StopProcessInfos(Schiffswache);
		Npc_SetRefuseTalk(Schiffswache,60);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,60);
	}
	else
	{
		B_Say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,1);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,20);
	};
};

func void B_AssignSchiffswachenInfos(var C_Npc Schiffswache)
{
	if(MIS_OCGateOpen == TRUE)
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Przekl�ci orkowie najechali zamek Garonda. Natychmiast musimy co� zrobi�!
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Je�li kiedy� dorwiemy drania, kt�ry otworzy� g��wn� bram�, nie b�dziemy z nim d�ugo rozmawia�. Zap�aci za sw� zdrad�.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//Nie mo�emy d�u�ej czeka�. Bez pomocy nasi ch�opcy ugn� si� pod naciskiem kolejnej fali orkowych wojsk.
		};
	}
	else
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond zwo�a� pospolite ruszenie. Wkr�tce wyruszamy do G�rniczej Doliny.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Czas da� orkom ostateczn� nauczk�.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Nie mog� si� doczeka�, by pokaza� orkom, co o nich my�l�. Wkr�tce zaczynamy.
		};
	};
	AI_StopProcessInfos(Schiffswache);
};

func void B_AssignSchiffswachenTalk(var C_Npc Schiffswache)
{
	if(Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos(Schiffswache);
	}
	else
	{
		B_AssignSchiffswachenGuard(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions(var C_Npc Schiffswache)
{
	if((Kapitel < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCvisitShip != LOG_Running))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

