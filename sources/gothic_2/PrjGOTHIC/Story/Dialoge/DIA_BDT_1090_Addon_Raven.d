
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Patrzcie, kto przyszed³.
	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//Mój mistrz ostrzega³, ¿e Innos przyœle swoje s³ugi.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Jednak nie spodziewa³em siê ciebie tak szybko.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//No, skoro by³eœ taki szybki, zadbam o to, byœ równie szybko umar³.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"To TY zginiesz.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Zaprzeda³eœ duszê Beliarowi!",DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//To TY zginiesz.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//Nie jesteœ dla mnie ¿adnym wyzwaniem. Mam miecz Beliara.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Poprowadzê smoki na kontynent. Razem sprowadzimy na œwiat ludzi ciemnoœæ.
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Zaprzeda³eœ duszê Beliarowi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//To by³ dobry uk³ad. Bêdê dowodzi³ jego armiami.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A co z tob¹? Jaka jest cena za TWOJ¥ duszê?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Robiê tylko to, co trzeba zrobiæ.",DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Robiê tylko to, co trzeba zrobiæ.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//Pos³uchajcie go. Innos przys³a³ nam pokornego s³ugê!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Jesteœ pewien, ¿e s³u¿ê Innosowi?",DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jesteœ pewien, ¿e s³u¿ê Innosowi?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O czym ty mówisz?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A jeœli s³u¿ê Adanosowi?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//Nonsens!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//A mo¿e *ja* te¿ s³u¿ê Beliarowi - albo samemu sobie.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//Nie bêdziesz wiêc dla mnie godnym przeciwnikiem!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...",DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobra, doœæ ju¿ siê nas³ucha³em. Poka¿, co umiesz...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//Tak ci spieszno do ziemi? Dobra, sam tego chcia³eœ...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

