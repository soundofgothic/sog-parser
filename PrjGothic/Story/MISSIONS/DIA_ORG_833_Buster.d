
instance DIA_ORG_833_Buster(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};


func int DIA_ORG_833_Buster_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Wiesz co, poruszasz si� tak jako� sztywno. M�g�bym ci pom�c.
};


instance DIA_ORG_833_Buster_Exit(C_Info)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_833_Buster3(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 1;
	description = "Jak mo�esz mi pom�c?";
};


func int DIA_ORG_833_Buster3_Condition()
{
	return Npc_KnowsInfo(hero,DIA_ORG_833_Buster);
};

func void DIA_ORG_833_Buster3_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Mog� ci pokaza�, jak nale�y balansowa� cia�em. Naucz� ci� AKROBATYKI.
	Info_ClearChoices(DIA_ORG_833_Buster3);
	Info_AddChoice(DIA_ORG_833_Buster3,DIALOG_BACK,DIA_ORG_833_Buster_Back);
	Info_AddChoice(DIA_ORG_833_Buster3,B_BuildLearnString(NAME_LearnAcrobat,LPCOST_TALENT_ACROBAT,0),DIA_ORG_833_Buster_Train1);
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Buster mo�e mnie nauczy� akrobatyki.");
};

func void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices(DIA_ORG_833_Buster3);
	if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Po kilku lekcjach nauczysz si� skaka� na wi�ksze odleg�o�ci.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Poka�� ci w jaki spos�b mo�na z�agodzi� efekt upadku z du�ej wysoko�ci. Tylko nie my�l sobie, �e b�dziesz m�g� skaka� b�g wie sk�d!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Akrobatyka przyda ci si� r�wnie� w trakcie walki. Poka�� ci jak bardzo szybko zmniejszy� lub zwi�kszy� odleg�o�� dziel�c� ci� od przeciwnika. Powodzenia!
	};
};

func void DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices(DIA_ORG_833_Buster3);
};

