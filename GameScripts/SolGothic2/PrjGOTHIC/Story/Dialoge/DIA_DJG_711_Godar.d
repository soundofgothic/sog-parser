
instance DIA_Godar_EXIT(C_Info)
{
	npc = DJG_711_Godar;
	nr = 999;
	condition = DIA_Godar_EXIT_Condition;
	information = DIA_Godar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Godar_Hello(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_Hello_Condition;
	information = DIA_Godar_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Godar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//Hê? Co?
};


instance DIA_Godar_ComeFrom(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent = FALSE;
	description = "Sk¹d pochodzisz?";
};


func int DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//Pochodzimy z... Eeem, z miasta.
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Jesteœcie bandytami!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom,"Dlaczego nigdy wczeœniej nie widzia³em ciê w mieœcie?",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom,"Rozumiem. Z miasta.",DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Jesteœcie bandytami!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Ostro¿nie! ¯ebyœ siê nie zad³awi³!
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Spokojnie, nie doniosê na ciebie.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom,"Nie przestraszysz mnie.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Spokojnie, nie doniosê na ciebie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//Mam nadziejê, dla twojego w³asnego dobra. Inaczej zginiesz.
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//Nie przestraszysz mnie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//To siê jeszcze oka¿e.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Nigdy wczeœniej nie widzia³em ciê w mieœcie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Nie znoszê, jak ktoœ za bardzo siê interesuje cudzymi sprawami.
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Nie.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom,"Ach tak, z miasta.",DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//A tak, z miasta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//W³aœnie tak.
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Nie.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Wiêc bêdê musia³ spuœciæ wam lanie.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Rozumiem. Z miasta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//No widzisz!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Masz, ³yknij sobie.
	CreateInvItems(self,ItFo_Beer,1);
	B_GiveInvItems(self,other,ItFo_Beer,1);
	B_UseItem(other,ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};


instance DIA_Godar_Plan(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Plan_Condition;
	information = DIA_Godar_Plan_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Godar_Plan_Condition()
{
	return TRUE;
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//S³yszeliœmy o polowaniu na smoki. Wiêc spakowaliœmy nasz dobytek i czym prêdzej tu przybyliœmy.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Ale jeœli mam byæ szczery, to smoki nic mnie nie obchodz¹. Chcê tylko zarobiæ.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//Smoki maj¹ z³oto, prawda?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Z pewnoœci¹.
};


instance DIA_Godar_DragonLore(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent = FALSE;
	description = "Co wiesz na temat smoków?";
};


func int DIA_Godar_DragonLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Co wiesz na temat smoków?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Znam jedynie bajki, opowiadane dzieciom.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Wiesz, dziewice, z³oto, zianie ogniem, te sprawy.
};


instance DIA_Godar_Destination(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Destination_Condition;
	information = DIA_Godar_Destination_Info;
	permanent = FALSE;
	description = "Dok¹d zamierzasz siê teraz udaæ?";
};


func int DIA_Godar_Destination_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//Dok¹d zamierzasz siê teraz udaæ?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//Nie mam pojêcia. Ci¹gle siê jeszcze zastanawiamy.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//Móg³byœ udaæ siê do zamku.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Za nic w œwiecie. Nie do paladynów.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Nie zamierzam wyl¹dowaæ z powrotem w wiêzieniu. Ju¿ raz tam by³em, i wystarczy.
	};
};


instance DIA_Godar_Orks(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Orks_Condition;
	information = DIA_Godar_Orks_Info;
	permanent = FALSE;
	description = "A co z orkami?";
};


func int DIA_Godar_Orks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//A co z orkami?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Ca³y zamek jest otoczony.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Próba przedarcia siê to szaleñstwo. Wdaj siê w walkê, a ju¿ po tobie.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Nikt siê tam nie przedostanie.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Doprawdy?
};


instance DIA_Godar_Prison(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Prison_Condition;
	information = DIA_Godar_Prison_Info;
	permanent = FALSE;
	description = "Za co siedzia³eœ w wiêzieniu?";
};


func int DIA_Godar_Prison_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//Za co siedzia³eœ w wiêzieniu?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Akurat ci powiem. Niedoczekanie twoje.
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Wy, magowie, macie jakieœ konszachty z paladynami. Nic wiêcej nie powiem. Zapomnij o ca³ej sprawie.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Zosta³em aresztowany za k³usownictwo. Za dwa nêdzne króliki!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Dosta³em za to 10 lat.
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//I to wszystko?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//No... nie, broni³em siê, kiedy mnie schwytali.
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//I?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Nic na to nie mog³em poradziæ, ten facet siê potkn¹³ i sam skrêci³ sobie kark. Naprawdê!
		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison,"Sk¹d ja to znam?",DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison,"Nie powinieneœ by³ pozwoliæ, aby ciê z³apali.",DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//Brzmi znajomo.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//Rozumiesz, o czym mówiê. Te bogate œwinie nie maj¹ w ogóle pojêcia o tym, jak jesteœmy traktowani.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//W ogóle siê tym nie przejmuj¹.
	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//Nie powinieneœ by³ pozwoliæ, aby ciê z³apali.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//Za³o¿ê siê, ¿e ty nigdy nie by³eœ w wiêzieniu, co?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Pozwól wiêc, ¿e poka¿ê ci, co mo¿e ciê spotkaæ w pierdlu.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Godar_Hunting(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Hunting_Condition;
	information = DIA_Godar_Hunting_Info;
	permanent = FALSE;
	description = "Mo¿esz mnie nauczyæ polowaæ?";
};


func int DIA_Godar_Hunting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Mo¿esz mnie nauczyæ polowaæ?
	if(GodarLikesYou == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//Chyba nie mówisz powa¿nie, co? Spadaj st¹d!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Zwierzê to znacznie wiêcej ni¿ tylko miêso. Jeœli sprzedasz jego skórê lub pazury, mo¿esz na tym sporo zarobiæ.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//Ju¿ siê nie mogê doczekaæ, a¿ dorwê jakiegoœ smoka.
		Godar_TeachAnimalTrophy = TRUE;
	};
};


instance DIA_Godar_Dragonstuff(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Dragonstuff_Condition;
	information = DIA_Godar_Dragonstuff_Info;
	permanent = TRUE;
	description = "Poka¿ mi, jak siê patroszy smoka.";
};


var int Godar_TeachDragonStuff;

func int DIA_Godar_Dragonstuff_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)) && (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Poka¿ mi, jak siê patroszy smoka.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//¯ebyœ móg³ zgarn¹æ ca³¹ kasê dla siebie, co?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//No dobrze, ale to ciê bêdzie kosztowa³o 1000 sztuk z³ota.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff,"Ta wiedza nie jest dla mnie tyle warta.",DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff,"W porz¹dku.",DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//W porz¹dku.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		Godar_TeachDragonStuff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Nie do koñca. Najpierw przynieœ mi pieni¹dze.
	};
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Ta wiedza nie jest dla mnie tyle warta.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Bardzo proszê.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};


instance DIA_Godar_Teach(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Teach_Condition;
	information = DIA_Godar_Teach_Info;
	permanent = TRUE;
	description = "Poka¿ mi, jak nale¿y polowaæ.";
};


func int DIA_Godar_Teach_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Poka¿ mi, jak nale¿y polowaæ.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		Info_AddChoice(DIA_Godar_Teach,Dialog_Back,DIA_Godar_Teach_Back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("Skradaj siê",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Godar_Teach_Thief_Sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("Usuñ k³y",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Godar_Teach_TROPHYS_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("¯¹d³o krwiopijcy",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Godar_Teach_TROPHYS_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("Skrzyd³a krwiopijcy",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Godar_Teach_TROPHYS_BFWing);
		};
		if(Godar_TeachDragonStuff == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("Usuñ smocze ³uski",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Godar_Teach_TROPHYS_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("Zbieraj smocz¹ krew",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Zêby naj³atwiej usun¹æ przy pomocy mocnego no¿a.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Jeœli naciœniesz na odpowiednie miejsce, ¿¹d³o krwiopijcy wysunie siê i bêdziesz móg³ je odci¹æ.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//Skrzyd³a krwiopijcy s¹ bardzo delikatne, dlatego musisz uwa¿aæ przy ich usuwaniu.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Podczas polowania u¿ywaj obuwia na miêkkiej podeszwie. Twarde buty robi¹ strasznie du¿o ha³asu.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Bêdziesz potrzebowa³ du¿o si³y, aby wyrwaæ smocze ³uski. Zapewniam ciê jednak, ¿e da siê to zrobiæ.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Aby utoczyæ smoczej krwi, znajdŸ ods³oniête miejsce na brzuchu i wbij tam nó¿.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};


instance DIA_Godar_AllDragonsDead(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_AllDragonsDead_Condition;
	information = DIA_Godar_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Zabi³em wszystkie smoki.";
};


func int DIA_Godar_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Zabi³em wszystkie smoki.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//I co z tego? Tu w dolinie jest ich ca³y czas pod dostatkiem.
};


instance DIA_Godar_PICKPOCKET(C_Info)
{
	npc = DJG_711_Godar;
	nr = 900;
	condition = DIA_Godar_PICKPOCKET_Condition;
	information = DIA_Godar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Godar_PICKPOCKET_Condition()
{
	return C_Beklauen(16,160);
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET,Dialog_Back,DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

