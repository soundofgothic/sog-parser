
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Proszê, proszê, kogo tutaj mamy. Nasz wielki liberator we w³asnej osobie! Co tu robisz, bohaterze?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Potrzebujê paru odpowiedzi.
	if(Ranger_SCKnowsDexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Nie s¹dzi³em, ¿e pojawisz siê tu z w³asnej woli.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to ma znaczyæ?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To znaczy, ¿e ktoœ daje nagrodê za twoj¹ g³owê. Nie widzia³eœ jeszcze ¿adnych ulotek?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Jest na nich TWOJA gêba. Tak... jesteœ poszukiwanym cz³owiekiem. Nie wiedzia³eœ o tym?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//Ktoœ rozprowadza ulotki z moj¹ podobizn¹. I ktoœ mi powiedzia³, ¿e to w³aœnie ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Ktoœ tu gada za du¿o.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//Ale masz racjê. To ja rozprowadzi³em ulotki. I co siê dzieje? Sam do mnie przychodzisz.
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Ja? Nic. Ale mój szef strasznie chcia³by ciê za³atwiæ.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//Dlatego w³aœnie musia³em ciê znaleŸæ, ¿eby zanieœæ mu twoj¹ g³owê.
};


instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "Nie wierzê nawet w jedno twoje s³owo.";
};


func int DIA_Dexter_Glaube_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierzê nawet w jedno twoje s³owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysiêgam na grób mojej matki!
};


instance DIA_Addon_Dexter_Patrick(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_Patrick_Condition;
	information = DIA_Addon_Dexter_Patrick_Info;
	description = "Widziano tu najemnika imieniem Patrick.";
};


func int DIA_Addon_Dexter_Patrick_Condition()
{
	if((MIS_Addon_Cord_Look4Patrick == LOG_Running) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//Widziano tu najemnika imieniem Patrick.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrick? Nigdy o nim nie s³ysza³em.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//A, pamiêtam jednego ostro gard³uj¹cego najemnika, który krêci³ siê tu czasem ze swoj¹ kompani¹.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//Od d³u¿szego czasu go jednak nie widzia³em.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//Mo¿e ta kompania go obwiesi³a... Któ¿ to mo¿e wiedzieæ.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Dexter twierdzi, ¿e nie zna najemnika o imieniu Patrick.");
	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};


instance DIA_Addon_Dexter_Greg(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_Greg_Condition;
	information = DIA_Addon_Dexter_Greg_Info;
	description = "Jest taki goœæ z zas³oniêtym okiem. Szuka ciebie!";
};


func int DIA_Addon_Dexter_Greg_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Jest taki goœæ z zas³oniêtym okiem. Szuka ciebie!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Wszyscy mnie ostatnio szukaj¹... Mam siê tym przejmowaæ?
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jak czegoœ ode mnie chce, to niech tu przyjdzie.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Dexter_missingPeople(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_missingPeople_Condition;
	information = DIA_Addon_Dexter_missingPeople_Info;
	description = "Podobno to ty porywasz ludzi z Khorinis.";
};


func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if((SC_KnowsDexterAsKidnapper == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Podobno to ty porywasz ludzi z Khorinis.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Jednak uda³o ci siê to rozpracowaæ... Gratulujê, dobra robota.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//S¹dzi³em, ¿e uda³o mi siê lepiej zatrzeæ œlady.
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Kto kaza³ ci to robiæ?",DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Co siê sta³o z tymi ludŸmi?",DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Co siê sta³o z tymi ludŸmi? Gdzie oni s¹? W okolicznych kopalniach?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//Dawno ju¿ ich tu nie ma. S¹ za górami na pó³nocnym wschodzie, poza czyimkolwiek zasiêgiem...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Niby mogê ci pokazaæ, gdzie dok³adnie... Tylko po co?
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kto kaza³ ci to robiæ?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//Mój szef, groŸny typ. Znasz go - to Kruk, jeden z Magnatów ze Starego Obozu w Górniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Potrzebowa³ tych ludzi do swoich planów - tylko tyle siê dowiesz.
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Kruk? GroŸny? Hmm...",DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Magnat? W Khorinis?",DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Kruk? GroŸny? Hmm...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//A co ty tam wiesz?! Nie znasz go tak dobrze, jak ja.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//Ju¿ wtedy by³ z niego kawa³ sukinsyna, ale teraz...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Bardzo siê zmieni³ po upadku Bariery. Twarz skry³ mu czarny cieñ.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//Jego wzrok przebija ciê niczym pazury dzikiej bestii, jeœli zbyt d³ugo siê w niego wpatrzeæ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//Dobrze ci radzê - opuœæ Khorinis, dopóki jeszcze mo¿esz to uczyniæ.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//Nie czeka ciê tu nic poza œmierci¹.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Dexter ma szefa, który nazywa siê Kruk. To by³y magnat. Chyba w³aœnie on jest odpowiedzialny za wszystkie porwania. Teraz potrzebujê tylko jakiegoœ dowodu.");
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Magnat? W Khorinis?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//Ju¿ nie jest Magnatem. Ma swoje tajne plany, o których Khorinis wkrótce siê dowie...
};


instance DIA_Addon_Dexter_Boss(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = DIA_Addon_Dexter_Boss_Condition;
	information = DIA_Addon_Dexter_Boss_Info;
	description = "Twój szef? A kim¿e on jest?";
};


func int DIA_Addon_Dexter_Boss_Condition()
{
	if((Knows_Dexter == TRUE) && (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Twój szef? A kim¿e on jest?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//Liczysz pewnie, ¿e ci tak od razu powiem, co? Pewnie tak.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//Nie mam ¿adnego powodu, aby udzieliæ ci odpowiedzi.
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "Co zamierzasz zrobiæ?";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobiæ? Zabiæ mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni³eœ. Dlatego postanowi³em daæ ci jeszcze jedn¹ szansê. Wynoœ siê st¹d - zniknij, ulotnij siê, zapadnij pod ziemiê. IdŸ i nigdy wiêcej nie pokazuj mi siê na oczy.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Muszê siê dowiedzieæ, gdzie zabrano tych ludzi.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//Jasne. Mo¿e spróbujesz mnie zmusiæ?
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//Lepiej ju¿ sobie idŸ!
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Jeœli jeszcze raz ciê tutaj zobaczê, zabijê bez wahania.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Dexter_NoMoreSmallTalk == TRUE) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//Skoro tego chcesz...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By³oby lepiej, gdybyœ siê tutaj nie pokazywa³. Po prostu znalaz³eœ siê w niew³aœciwym miejscu w niew³aœciwym czasie.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill,Dialog_Ende,DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	var C_Item itm;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	itm = Npc_GetEquippedArmor(Greg_NW);
	if(Hlp_IsItem(itm,ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
	};
};


instance DIA_Dexter_Kopf(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent = FALSE;
	description = "Chcesz mojej g³owy? To spróbuj j¹ zdobyæ!";
};


func int DIA_Dexter_Kopf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chcesz mojej g³owy? To spróbuj j¹ zdobyæ!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//Jak sobie ¿yczysz!
	DIA_Dexter_Kill_ENDE();
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

