
instance DIA_Hilda_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_EXIT_Condition;
	information = DIA_Hilda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_Hallo(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Hallo_Condition;
	information = DIA_Hilda_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_Hallo_Condition()
{
	if((MIS_Lobart_Rueben != LOG_SUCCESS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//Hej, kto ciê tu zaprasza³? Natychmiast wynoœ siê z mojego domu. Nic tutaj nie dostaniesz.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//Tak, o co chodzi?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_WasZuEssen(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_WasZuEssen_Condition;
	information = DIA_Hilda_WasZuEssen_Info;
	permanent = TRUE;
	description = "Czy mo¿esz mi daæ coœ do jedzenia?";
};


func int DIA_Hilda_WasZuEssen_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Hilda_Hallo) || (MIS_Lobart_Rueben == LOG_SUCCESS)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info()
{
	var int Rueben_TagNull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//Czy mo¿esz mi daæ coœ do jedzenia?
		if(MIS_Lobart_Rueben == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,DIA_Hilda_PfanneTooLate))
			{
				if(Hilda_Stew_Day != Wld_GetDay())
				{
					B_GiveInvItems(self,other,ItFo_Stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//Proszê, to dla ciebie.
					Hilda_Stew_Day = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (Rueben_TagNull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//Jutro mo¿esz wróciæ po wiêcej.
					B_GiveInvItems(self,other,ItFo_Stew,1);
					Hilda_Stew_Day = Wld_GetDay();
					Rueben_TagNull = TRUE;
					Log_CreateTopic(Topic_Bonus,LOG_NOTE);
					B_LogEntry(Topic_Bonus,"Codziennie mogê dostaæ u Hildy trochê gotowanej rzepy.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//Przecie¿ ju¿ dosta³eœ swoj¹ dzisiejsz¹ porcjê! PrzyjdŸ kiedy indziej.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//Nie karmimy tutaj darmozjadów. Wynoœ siê!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//Tutaj jadaj¹ tylko uczciwie pracuj¹cy ludzie!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//Jestem pewna, ¿e staæ ciê na obiad w mieœcie.
	};
};


instance DIA_Hilda_BringBeet(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_BringBeet_Condition;
	information = DIA_Hilda_BringBeet_Info;
	permanent = FALSE;
	description = "Mam tu dla ciebie kilka rzep...";
};


func int DIA_Hilda_BringBeet_Condition()
{
	if((MIS_Lobart_RuebenToHilda == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >= 1) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//Mam tu dla ciebie kilka rzep...
	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems(other,self,ItPl_Beet,Npc_HasItems(other,ItPl_Beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//Œwietnie! To powinno wystarczyæ do nakarmienia tych wszystkich g³odomorów!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//Skoro ju¿ tu jesteœ - kilka minut temu przechodzi³ têdy wêdrowny handlarz.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//Chyba zatrzyma³ siê gdzieœ po drodze do miasta. ZnajdŸ go i zapytaj, czy nie ma dla mnie jakiejœ porz¹dnej patelni.
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//Co?! To ma byæ ca³y zbiór?!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//To nie wystarczy.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//IdŸ na pole i przynieœ wiêcej, przecie¿ muszê jakoœ nakarmiæ tych wszystkich ludzi!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_Einkaufen(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Einkaufen_Condition;
	information = DIA_Hilda_Einkaufen_Info;
	permanent = FALSE;
	description = "Daj mi z³oto, a znajdê tego handlarza...";
};


func int DIA_Hilda_Einkaufen_Condition()
{
	if((MIS_Lobart_RuebenToHilda == LOG_SUCCESS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//Daj mi z³oto, a znajdê tego handlarza...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//Chyba mogê ci zaufaæ... Tylko nie wydaj wszystkiego na gorza³ê! S³yszysz?!
	};
	B_GiveInvItems(self,other,ItMi_Gold,20);
	MIS_Hilda_PfanneKaufen = LOG_Running;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	Log_CreateTopic(TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_Running);
	B_LogEntry(TOPIC_Hilda,"Hilda, ¿ona farmera Lobarta, chce, abym kupi³ dla niej u wêdrownego handlarza patelniê.");
};


instance DIA_Hilda_PfanneGeholt(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_PfanneGeholt_Condition;
	information = DIA_Hilda_PfanneGeholt_Info;
	permanent = FALSE;
	description = "Oto twoja patelnia.";
};


func int DIA_Hilda_PfanneGeholt_Condition()
{
	if((MIS_Hilda_PfanneKaufen == LOG_Running) && (Npc_HasItems(other,ItMi_Pan) > 0) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//Oto twoja patelnia.
	B_GiveInvItems(other,self,ItMi_Pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//Dobrze. Wypróbujmy j¹...
	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP(XP_HildaHolPfanne);
};


instance DIA_Hilda_PfanneTooLate(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_PfanneTooLate_Condition;
	information = DIA_Hilda_PfanneTooLate_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_PfanneTooLate_Condition()
{
	if((MIS_Hilda_PfanneKaufen == LOG_Running) && (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay() - 1)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//Masz czelnoœæ siê tutaj pokazywaæ?! Gdzie s¹ moje pieni¹dze, hultaju?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//Wystarczy tego dobrego. Gdzie s¹ pieni¹dze, za które mia³eœ kupiæ patelniê?
	};
	if(Npc_HasItems(other,ItMi_Pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//Przepraszam, ¿e zajê³o mi to tyle czasu. Oto twoja patelnia!
		B_GiveInvItems(other,self,ItMi_Pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//Daj j¹ tutaj wreszcie. Coœ niebywa³ego!
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP(XP_HildaHolPfanne / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//Ach! Jeszcze j¹ masz. Oddaj mi j¹. W tej chwili.
			B_GiveInvItems(other,self,ItMi_Gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//Coœ niebywa³ego!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//Gdzie jest moja patelnia? Dosta³eœ na ni¹ 20 sztuk z³ota!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//Wynoœ siê st¹d, wstrêtny z³odzieju!
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_KAP3_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP3_EXIT_Condition;
	information = DIA_Hilda_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KRANK(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 30;
	condition = DIA_Hilda_KRANK_Condition;
	information = DIA_Hilda_KRANK_Info;
	permanent = TRUE;
	description = "le siê czujesz?";
};


func int DIA_Hilda_KRANK_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HealHilda != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Hilda_KRANK_OnTime;

func void DIA_Hilda_KRANK_Info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//le siê czujesz?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//Nie najlepiej. Znowu mam tê okropn¹ gor¹czkê.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//Powinnam pójœæ do uzdrawiacza, ale nawet na to jestem za s³aba.
	if(DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices(DIA_Hilda_KRANK);
		Info_AddChoice(DIA_Hilda_KRANK,"Wracaj do zdrowia. Ja muszê ju¿ iœæ.",DIA_Hilda_KRANK_besserung);
		Info_AddChoice(DIA_Hilda_KRANK,"Czy mogê jakoœ pomóc?",DIA_Hilda_KRANK_helfen);
		DIA_Hilda_KRANK_OnTime = TRUE;
	};
	MIS_HealHilda = LOG_Running;
};

func void DIA_Hilda_KRANK_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//Wracaj do zdrowia. Ja muszê ju¿ iœæ.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//Miejmy nadziejê, ¿e wkrótce przyjd¹ lepsze czasy.
	AI_StopProcessInfos(self);
};

func void DIA_Hilda_KRANK_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//Czy mogê jakoœ pomóc?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//By³oby wspaniale, gdybyœ uda³ siê do Vatrasa i przyniós³ mi od niego moje lekarstwo.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//On bêdzie wiedzia³, co zrobiæ!
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda,"¯ona Lobarta, Hilda, zachorowa³a. Vatras ma lekarstwo, które mo¿e j¹ wyleczyæ.");
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_HEILUNGBRINGEN(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 31;
	condition = DIA_Hilda_HEILUNGBRINGEN_Condition;
	information = DIA_Hilda_HEILUNGBRINGEN_Info;
	description = "Przynios³em twoje lekarstwo.";
};


func int DIA_Hilda_HEILUNGBRINGEN_Condition()
{
	if(Npc_HasItems(other,ItPo_HealHilda_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//Przynios³em twoje lekarstwo.
	B_GiveInvItems(other,self,ItPo_HealHilda_MIS,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//Naprawdê, gdyby wszyscy byli tacy uczynni jak ty... Strasznie ci dziêkujê.
	B_UseItem(self,ItPo_HealHilda_MIS);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//Mam nadziejê, ¿e tych kilka monet wystarczy.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealHilda);
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_DISTURB(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 32;
	condition = DIA_Hilda_DISTURB_Condition;
	information = DIA_Hilda_DISTURB_Info;
	permanent = TRUE;
	description = "Jak siê masz?";
};


func int DIA_Hilda_DISTURB_Condition()
{
	if((MIS_HealHilda == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Kapitel > 3)))
	{
		return TRUE;
	};
};

func void DIA_Hilda_DISTURB_Info()
{
	if(MIS_HealHilda == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//Jak siê czujesz?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//Dziêkujê, dziêki tobie wracam do zdrowia.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//Niezbyt dobrze.
	};
};


instance DIA_Hilda_KAP4_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP4_EXIT_Condition;
	information = DIA_Hilda_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP5_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP5_EXIT_Condition;
	information = DIA_Hilda_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP6_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP6_EXIT_Condition;
	information = DIA_Hilda_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_PICKPOCKET(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 900;
	condition = DIA_Hilda_PICKPOCKET_Condition;
	information = DIA_Hilda_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Hilda_PICKPOCKET_Condition()
{
	return C_Beklauen(26,35);
};

func void DIA_Hilda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,Dialog_Back,DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

