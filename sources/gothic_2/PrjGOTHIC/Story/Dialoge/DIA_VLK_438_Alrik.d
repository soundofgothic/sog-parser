
instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return C_Beklauen(55,50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tu robisz?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//To mój dom!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//A co mam robiæ? Pijê.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Idê na przechadzkê.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jeœli pytasz, co robiê przez ca³y dzieñ, to ci powiem - organizujê walki.
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "Ty organizujesz walki?";
};


func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty organizujesz walki?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Codziennie, od po³udnia do wieczora.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//Dok³adnie tutaj!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za magazynem w dzielnicy portowej - wszêdzie dobrze, ale w domu najlepiej!
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "Jakie s¹ zasady walk?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jakie s¹ zasady walk?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Ca³kiem proste: mo¿na u¿ywaæ ka¿dej normalnej broni. ¯adnych ³uków ani kusz, i ¯ADNEJ magii!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Walczymy, dopóki jeden nie padnie. Kiedy jeden z walcz¹cych pada na ziemiê, walka siê koñczy. Zrozumia³eœ?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Kto wyjdzie z naro¿nika, ten odpada! Wiêc jeœli siê wycofasz, ja wygrywam!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Stawka wynosi 50 z³otych monet. Jeœli wygrasz, zabierasz stówê. Jeœli nie - no có¿ - wtedy twoje pieni¹dze znikaj¹.
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Zrozumia³eœ?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jasne!
};

func void B_Alrik_Again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Jak leci? Chcesz znowu stan¹æ przeciwko mnie? S¹dzê, ¿e w miêdzyczasie sta³em siê lepszy...
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,4);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//Myœlê, ¿e ju¿ doœæ wygra³eœ.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nie zrozum mnie Ÿle, ale we ³bie nadal mi siê krêci po poprzednim razie...
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Wróæ do mnie póŸniej. A w miêdzyczasie trochê potrenujê...
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "Chcê z tob¹ walczyæ!";
};


func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chcê z tob¹ walczyæ!
	Info_ClearChoices(DIA_Alrik_WannaFight);
	if(((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Najpierw oddaj mi mój miecz. Wtedy zobaczymy...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Nie, nie. Zanim znowu zmierzê siê z tob¹, potrzebna mi lepsza broñ!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Kilka dni temu musia³em sprzedaæ swój miecz.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//Z tym maleñstwem jestem niepokonany! Jeœli je odzyskasz, znowu siê z tob¹ zmierzê!
			Alrik_VomSchwertErzaehlt = TRUE;
			Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
			B_LogEntry(TOPIC_AlrikSchwert,"Arik sprzeda³ swój miecz kupcowi imieniem Jora. Zgodzi siê ze mn¹ walczyæ tylko pod warunkiem, ¿e odzyskam jego broñ.");
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Chyba na razie wystarczy...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Zróbmy krótk¹ przerwê.
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren > 9))
	{
		B_Alrik_Enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Poza tym zgarn¹³em ju¿ doœæ z³ota.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Rezygnujê, zamierzam zatrzymaæ siê gdzieœ w mieœcie...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kto wie, mo¿e otworzê sklep z broni¹...
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//Masz 50 sztuk z³ota?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Nie...",DIA_Alrik_WannaFight_NoGold);
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Proszê bardzo...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Walczê tylko od po³udnia do wieczora.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Walka ma jakiœ sens tylko wtedy, kiedy jest doœæ widzów obstawiaj¹cych zak³ady.
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Jest ju¿ za póŸno. Wróæ jutro w po³udnie!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Jest jeszcze za wczeœnie, przyjdŸ póŸniej!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Proszê bardzo...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//Mamy nowego zawodnika!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Zak³ady obstawione...
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	CreateInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jesteœ gotowy?
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"Chwileczkê...",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"No chodŸ!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Nie...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//No to je przynieœ! Bez stawki nie ma walki!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//No chodŸ!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//No to zobaczymy, na co ciê staæ!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Chwileczkê...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Spokojnie... Ja zaczynam!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Och, stary! Masz niez³y cios.
			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Oto twoje 100 sztuk z³ota! Zas³u¿y³eœ na nie!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Jak widzê, ju¿ wzi¹³eœ swoje z³oto.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Mog³eœ zaczekaæ, a¿ ci je dam - dotrzymujê s³owa!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Przetrz¹sn¹³eœ mi kieszenie, kiedy by³em nieprzytomny!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To z³y zwyczaj, stary! Niewa¿ne, pieni¹dze i tak by³y twoje. Tu jest reszta.
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To by³a dobra walka. Twoja stawka przepad³a - nie ¿a³uj jej, to dla dobra sprawy!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, mówi³em, kto opuszcza naro¿nik, przegrywa walkê! Jeœli chcesz spróbowaæ jeszcze raz, jestem do twojej dyspozycji!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//I jeszcze jedno: nikt nie rozmawia o tym, co siê dzieje za magazynem.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Stra¿ pakuje za kratki ka¿dego, kto siê tu zjawia. Ci ch³opcy nie lubi¹ walk za pieni¹dze.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Walka by³a skoñczona, ty w³óczêgo!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nie podoba mi siê, kiedy ktoœ nie przestrzega zasad.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Wynoœ siê st¹d!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Skoro chcia³eœ walczyæ ze mn¹, wystarczy³o mnie wyzwaæ.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Skoro chcia³eœ walczyæ ze mn¹ jeszcze raz, wystarczy³o mnie wyzwaæ!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//Nie chcê mieæ nic wspólnego z mêtami takimi jak ty! Zje¿d¿aj!
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = ""Mieszkasz" za tym magazynem?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//'Mieszkasz' za tym magazynem?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//To tylko chwilowe. Kiedy bêdziesz mia³ tyle z³ota co ja, bêdzie ciê staæ na trochê luksusu!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//By³em instruktorem musztry w armii, ale rzuci³em to, ¿eby zaznaæ przygód i poszukaæ szczêœcia gdzie indziej.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A teraz ugrzêz³em w tej dziurze. Moje ostatnie 100 sztuk z³ota zniknê³o w kieszeniach stra¿ników przy bramie.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Wiêc staram siê znowu zdobyæ trochê pieniêdzy. Musia³em nawet sprzedaæ swój miecz.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "Komu sprzeda³eœ ten miecz?";
};


func int DIA_Alrik_WerSchwert_Condition()
{
	if((Alrik_VomSchwertErzaehlt == TRUE) && (MIS_Alrik_Sword != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu sprzeda³eœ ten miecz?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//Wymieni³em go z handlarzem na targowisku na parê drobiazgów.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Facet nazywa siê Jora. Pochodnie i trochê ¿arcia, które da³ mi w zamian, dawno ju¿ zu¿y³em.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Raczej nie odda mi go za darmo...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//To stary miecz. Nie bêdzie za niego du¿o chcia³. Pomyœl o tych pieni¹dzach jako o dodatkowej stawce.
	MIS_Alrik_Sword = LOG_Running;
};


var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = TRUE;
	description = "Mam twój miecz!";
};


func int DIA_Alrik_HaveSword_Condition()
{
	if(Npc_HasItems(other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Mam twój miecz!
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	if(MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Ach! To znacznie lepsze, ni¿ wymachiwanie starym kijem!
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP(XP_AlriksSword);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Dobrze! Ciekaw jestem, kiedy odwa¿ysz siê wyzwaæ mnie ponownie!
	};
	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "Co wiesz o wojnie z orkami?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co wiesz o wojnie z orkami?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//Nie mam wiele do powiedzenia. Wojna trwa³a zdecydowanie za d³ugo.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Proœci ludzie g³oduj¹. Wszêdzie wybuchaj¹ ch³opskie bunty, które Król t³umi bez litoœci.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale jest ich za du¿o. Jeœli wojna siê szybko nie skoñczy, to bêdzie koniec królestwa.
};


var int Alrik_VorausErzaehlt;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "Czy mo¿esz mnie wyszkoliæ?";
};


func int DIA_Alrik_Ausbilden_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE)) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Czy mo¿esz mnie wyszkoliæ?
	if((Alrik_Kaempfe == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jeœli naprawdê chcesz nauczyæ siê walczyæ, to zmierz siê ze mn¹. Ta lekcja bêdzie za darmo.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Dotrzymujê s³owa. Nauczê ciê wszystkiego, co umiem - jeœli jesteœ wystarczaj¹co doœwiadczony.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jasne, pod warunkiem, ¿e masz doœæ doœwiadczenia.
		};
		Alrik_Teach1H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Alrik, który krêci siê za magazynem w dzielnicy portowej, mo¿e mnie nauczyæ walki orê¿em jednorêcznym.");
	};
};


var int Alrik_Merke_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "Wyszkol mnie we w³adaniu mieczem!";
};


func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Wyszkol mnie we w³adaniu mieczem!
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//Ju¿ nie jesteœ pocz¹tkuj¹cy!
	}
	else if(other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//Jesteœ ju¿ lepszy. Nied³ugo staniesz siê prawdziwym wojownikiem!
	};
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

