
instance DIA_Richter_EXIT(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 999;
	condition = DIA_Richter_EXIT_Condition;
	information = DIA_Richter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Hello(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 4;
	condition = DIA_Richter_Hello_Condition;
	information = DIA_Richter_Hello_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Richter_Hello_Condition()
{
	if(MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Czym siê zajmujesz?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//A jak ci siê wydaje? Kim ty w³aœciwie jesteœ?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Ja, em...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//S³uchaj no, czy ja ciê sk¹dœ nie znam?
	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello,"Nie przypominam sobie.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello,"Mo¿liwe.",DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Nie przypominam sobie.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To zabawne. Móg³bym przysi¹c, ¿eœmy siê ju¿ spotkali.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Niewa¿ne, pewnie jesteœ jak¹œ szumowin¹ z rynsztoka. Wszyscy wygl¹dacie tak samo.
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Mo¿liwe.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Nie wym¹drzaj siê. Nie rozmawiasz z byle kim.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//Móg³byœ przynajmniej zwracaæ siê do mnie z nale¿nym szacunkiem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A teraz, zejdŸ mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Perm(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 800;
	condition = DIA_Richter_Perm_Condition;
	information = DIA_Richter_Perm_Info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int DIA_Richter_Perm_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter == LOG_Running)) && (SCIstRichtersLakai == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Jak leci?
	if((MIS_Lee_JudgeRichter == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Lepiej odejdŸ, cuchn¹cy najemniku, zanim wezwê stra¿e.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Uspokój siê. Nie przyszed³em tu, by ciê okradaæ. Szukam pracy.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Ach, wiêc chcesz dla mnie pracowaæ. To zupe³nie zmienia postaæ rzeczy.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Jest tylko jeden ma³y problem. Nie wiem, czy mogê ci zaufaæ. Musisz dowieœæ swojej lojalnoœci.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Czy¿ nie powiedzia³em jasno, ¿e nie chcê byæ niepokojony?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Widocznie coœ przeoczy³em.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Mam wiêc nadziejê, ¿e teraz to do ciebie dotrze.
	};
};


instance DIA_Richter_RichtersLakai(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_RichtersLakai_Condition;
	information = DIA_Richter_RichtersLakai_Info;
	description = "Poddaj mnie próbie.";
};


func int DIA_Richter_RichtersLakai_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter != 0)) && (SCIstRichtersLakai == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Poddaj mnie próbie.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmm. Dobrze, pos³uchaj. Przynieœ mi œwiêty m³ot Magów Ognia. Trzymaj¹ go gdzieœ w klasztornych piwnicach.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Jeœli ci siê to uda, zatrudniê ciê jako ochroniarza.
	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai,"Mam okraœæ magów? Czyœ ty na g³owê upad³?",DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai,"W porz¹dku.",DIA_Richter_RichtersLakai_ja);
	B_LogEntry(TOPIC_RichterLakai,"Sêdzia mi nie ufa. Muszê udowodniæ swoj¹ lojalnoœæ. W tym celu mam ukraœæ œwiêty m³ot z podziemi klasztoru Magów Ognia i zanieœæ go sêdziemu.");
	MIS_Richter_BringHolyHammer = LOG_Running;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//Mam okraœæ magów? Czyœ ty na g³owê upad³?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//W takim razie, idŸ do diab³a i nie marnuj mojego czasu.
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Niech bêdzie.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Doskonale. Ale pamiêtaj - jeœli ciê z³api¹, nigdy o mnie nie s³ysza³eœ.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KillMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KillMorgahard_Condition;
	information = DIA_Richter_KillMorgahard_Info;
	description = "Oto œwiêty m³ot magów.";
};


func int DIA_Richter_KillMorgahard_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) && (MIS_Richter_BringHolyHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Oto œwiêty m³ot magów.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jestem pod wra¿eniem. Wygl¹da na to, ¿e faktycznie ci na tym zale¿y. Oto twoja zap³ata.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Dobrze, skoro sprawy tak siê maj¹, to przygotowa³em dla ciebie kolejne zadanie.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Przed kilkoma dniami grupa opryszków uciek³a z tutejszego wiêzienia.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Te sucze syny zwia³y i schowa³y siê w górach. Poszli w kierunku nowej wie¿y Xardasa.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Ich przywódc¹ jest Morgahard. Chcê, ¿ebyœ go zabi³.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Spiesz siê, nim zd¹¿¹ uciec zbyt daleko.
	Wld_InsertNpc(BDT_1030_Morgahard,"REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling,"REICH");
	B_InitNpcGlobals();
	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai,"Niektórzy wiêŸniowie zdo³ali uciec sêdziemu. Najprawdopodobniej ukrywaj¹ siê gdzieœ w górach, w okolicy nowej wie¿y Xardasa. Mam zabiæ ich przywódcê, Morgaharda. ");
	MIS_Richter_KillMorgahard = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KilledMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahard_Condition;
	information = DIA_Richter_KilledMorgahard_Info;
	description = "Morgahard nie ¿yje.";
};


func int DIA_Richter_KilledMorgahard_Condition()
{
	if(Npc_IsDead(Morgahard) && (MIS_Richter_KillMorgahard == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard nie ¿yje.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Dobry z ciebie ch³opak. Oto twoja nagroda.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai,"Sêdziego najwyraŸniej ucieszy³a wiadomoœæ o œmierci Morgaharda. To dobrze, ale muszê pamiêtaæ o zadaniu, które powierzy³ mi Lee.");
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};


instance DIA_Richter_KilledMorgahardPERM(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahardPERM_Condition;
	information = DIA_Richter_KilledMorgahardPERM_Info;
	permanent = TRUE;
	description = "Czy mogê coœ jeszcze dla ciebie zrobiæ?";
};


func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if((MIS_Richter_KillMorgahard == LOG_SUCCESS) && (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Czy mogê coœ jeszcze dla ciebie zrobiæ?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//W tej chwili nie. Mo¿e póŸniej.
};


instance DIA_Richter_PermissionForShip(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_PermissionForShip_Condition;
	information = DIA_Richter_PermissionForShip_Info;
	description = "Daj mi przepustkê na statek paladynów.";
};


func int DIA_Richter_PermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Daj mi przepustkê na statek paladynów.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//Co mam ci daæ? Chyba postrada³eœ zmys³y.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Dobrze wiesz, o czym mówiê. Daj mi przepustkê albo wydam ciê stra¿y.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//Nie pozwolê siê szanta¿owaæ. A ju¿ na pewno nie komuœ takiemu jak ty! Ka¿ê nakarmiæ tob¹ wilki, ty ¿a³osna kupo œcierwa!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard zamordowa³ gubernatora z twojego rozkazu. Mam dokument, który jednoznacznie to stwierdza.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//Aaaach.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Po¿a³ujesz swoich s³ów. Nikt nie bêdzie mnie bezkarnie szanta¿owa³.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Oto twoja przepustka. Teraz wyjdŸ. PóŸniej siê tob¹ zajmê.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_LogEntry(Topic_Ship,"Dziêki sfa³szowanemu dokumentowi dostanie siê na statek nie powinno stanowiæ problemu. Ciekawe, co na to Lee.");
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};


instance DIA_Richter_perm2(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_perm2_Condition;
	information = DIA_Richter_perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Richter_perm2_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//ZejdŸ mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_PICKPOCKET(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 900;
	condition = DIA_Richter_PICKPOCKET_Condition;
	information = DIA_Richter_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie ³atwa)";
};


func int DIA_Richter_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET,Dialog_Back,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_Richter,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};

