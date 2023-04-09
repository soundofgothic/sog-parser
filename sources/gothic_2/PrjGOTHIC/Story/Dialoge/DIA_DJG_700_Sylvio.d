
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//A niech mnie! Szukasz ³atwej kasy, hê? Wiedzia³em! Masz duszê najemnika.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//S³uchaj no, jeœli myœlisz, ¿e tu zarobisz, to jesteœ w b³êdzie. Ja by³em pierwszy.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hej, ty! Magowie strasznie mnie wkurzaj¹! Spadaj st¹d! Nie masz tu czego szukaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hej, ty, paladyn! Wracaj do swojej kopalni rudy. Nic tu po tobie.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Rozumiem. Nikt nie lubi dzieliæ siê ³upem.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//Ty to powiedzia³eœ. Teraz znikaj.
};


instance DIA_Sylvio_VERSAGER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = "A jeœli tego nie zrobiê?";
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//A jeœli tego nie zrobiê?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Nie zgrywaj mi tu wa¿nego, spadaj, albo skoñczysz jak ta œwinia, le¿¹c na œniegu z bebechami na wierzchu.
};


instance DIA_Sylvio_DEINELEUTE(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = "To byli twoi ludzie?";
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_DJG_Sylvio_KillIceGolem == 0))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//To byli twoi ludzie?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Ju¿ nie. ¯adna strata. Ci idioci byli nic niewarci.
};


instance DIA_Sylvio_WASISTPASSIERT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = "Co im siê sta³o?";
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Co im siê sta³o?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Nie potrafili poradziæ sobie z lodowymi gigantami, a teraz w¹chaj¹ kwiatki od strony pod³o¿a.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Skoro taki z ciebie twardziel, to mo¿e ty spróbujesz.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"W porz¹dku, czemu nie?",DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Dobra, a co TY bêdziesz z tego mia³?",DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"A co JA bêdê z tego mia³?",DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Dlaczego sam siê ich nie pozbêdziesz?",DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem,"Sylvio boi siê dwóch lodowych golemów strzeg¹cych wejœcia do skutego lodem obszaru Górniczej Doliny.");
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Dlaczego sam siê ich nie pozbêdziesz?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Spokojnie, spokojnie. Nie strosz siê tak.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//Jeœli chcesz znaæ moje zdanie, to robisz ze strachu pod siebie.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Nie mam zamiaru uczestniczyæ w twoich gierkach.",DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Co ja bêdê z tego mia³?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Ja wiem... Powiedzmy 1000 sztuk z³ota. Co ty na to?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//Dobra, a co TY bêdziesz z tego mia³?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//Ten znowu to samo. Mam zamiar pow³óczyæ siê po lodowej krainie.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Jest parê spraw, z którymi mam problem.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co takiego kryje w sobie lodowa kraina?",DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Nie mam zamiaru uczestniczyæ w twoich gierkach.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Taak. Wiêc wynoœ siê st¹d, tchórzu.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Co takiego kryje w sobie lodowa kraina?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ty chyba nie masz doœæ tych swoich pytañ, co? Dobra, powiem ci.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Tutaj, za klifami, rozci¹ga siê lodowa kraina, jakiej nigdy jeszcze nie widzia³eœ.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Podobno znajduje siê tam wielki skarb lodowego smoka.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Ja zaœ chcê tego skarbu. Wiêc jak? Zgadzasz siê, czy nie?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//W porz¹dku, czemu nie?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Poœpiesz siê wiêc. Nie mam dla ciebie ca³ego dnia.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = "Przejœcie jest bezpieczne!";
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MIS_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Przejœcie jest bezpieczne! Pozby³em siê lodowych gigantów.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Œwietna robota. Niech no i ja siê przyjrzê.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Chwileczkê. A co z moimi pieniêdzmi?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Wszystko w swoim czasie.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	B_StartOtherRoutine(DJG_Bullco,"IceWait1");
};


instance DIA_Sylvio_WASJETZT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = "Co dalej?";
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if((MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Co dalej?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Có¿. Obawiam siê, ¿e nie jest dobrze.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Najlepiej bêdzie, jeœli pójdziesz przodem, a ja za tob¹.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Niech ci bêdzie.",DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Czy¿byœ siê ba³?",DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Nie bêdê odwala³ za ciebie brudnej roboty.",DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT,"Najpierw mi zap³aæ.",DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Czy¿byœ siê ba³?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nonsens. Przestañ bredziæ, tylko prowadŸ.
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Niech ci bêdzie.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//No dalej. Do dzie³a.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Nie bêdê odwala³ za ciebie brudnej roboty.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Tchórz!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Najpierw mi zap³aæ.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Kiedy pozbêdziemy siê smoka, dostaniesz tyle z³ota, ile zdo³asz unieœæ.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Chcê moich pieniêdzy, natychmiast.",DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Chcê moich pieniêdzy, natychmiast.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Albo idziesz przodem, albo bêdziesz mia³ ze mn¹ do czynienia.
};


instance DIA_Sylvio_KOMMSTDU(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = "Myœla³em, ¿e wybierasz siê do lodowej krainy.";
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Myœla³em, ¿e wybierasz siê do lodowej krainy.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//No dalej, idŸ przodem. Bêdê zaraz za tob¹.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = "Przyda³aby mi siê pomoc.";
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Przyda³aby mi siê pomoc.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nonsens. Œwietnie sobie radzisz.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(IceDragon))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Lodowy smok nie ¿yje. Teraz dawaj wszystko, co masz przy sobie!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Po moim trupie!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//To mnie bêd¹ s³awiæ za zabicie smoka.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Twoja rola w tym przedstawieniu w³aœnie dobieg³a koñca!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter,"Sylvio, ta œwinia, próbowa³ sobie przyw³aszczyæ moje zas³ugi w pokonaniu lodowych smoków. Wysz³a z tego niez³a k³ótnia.");
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};


instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//Czas na zap³atê.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};


instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

