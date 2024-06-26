
func void B_FollowMe_Wisp()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_FollowMe_Wisp_15_00");	//Chod� za mn�!
};


instance DIA_Addon_WispDetector_EXIT(C_Info)
{
	npc = Wisp_Detector;
	nr = 999;
	condition = DIA_Addon_WispDetector_EXIT_Condition;
	information = DIA_Addon_WispDetector_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_WispDetector_DetectItems(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_DetectItems_Condition;
	information = DIA_Addon_WispDetector_DetectItems_Info;
	permanent = TRUE;
	description = "Poszukaj czego�!";
};


func int DIA_Addon_WispDetector_DetectItems_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_15_00");	//Poszukaj czego�!
	Info_ClearChoices(DIA_Addon_WispDetector_DetectItems);
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Chod� za mn�!",DIA_Addon_WispDetector_DetectItems_Follow);
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� run i zwoj�w magicznych.",DIA_Addon_WispDetector_DetectItems_RUNE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� z�ota, kluczy i narz�dzi.",DIA_Addon_WispDetector_DetectItems_NONE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� broni strzeleckiej i amunicji.",DIA_Addon_WispDetector_DetectItems_FF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� broni do walki wr�cz.",DIA_Addon_WispDetector_DetectItems_NF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� �ywno�ci i zi�.",DIA_Addon_WispDetector_DetectItems_FOOD);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� pier�cieni i amulet�w.",DIA_Addon_WispDetector_DetectItems_MAGIC);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Potrzebuj� magicznych mikstur.",DIA_Addon_WispDetector_DetectItems_POTIONS);
	};
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Poszukaj wszystkiego, co znajdziesz.",DIA_Addon_WispDetector_DetectItems_ALL);
};

func void DIA_Addon_WispDetector_DetectItems_Follow()
{
	B_FollowMe_Wisp();
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
	WispSearching = WispSearch_Follow;
};

func void DIA_Addon_WispDetector_DetectItems_ALL()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_ALL_15_00");	//Poszukaj wszystkiego, co znajdziesz.
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_POTIONS_15_00");	//Potrzebuj� magicznych mikstur.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_MAGIC_15_00");	//Potrzebuj� pier�cieni i amulet�w.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FOOD_15_00");	//Potrzebuj� �ywno�ci i zi�.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NF_15_00");	//Potrzebuj� broni do walki wr�cz.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FF_15_00");	//Potrzebuj� broni strzeleckiej i amunicji.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NONE_15_00");	//Potrzebuj� z�ota, kluczy i innych przedmiot�w.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_RUNE_15_00");	//Potrzebuj� run i zwoj�w magicznych.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_WispDetector_Follow(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_Follow_Condition;
	information = DIA_Addon_WispDetector_Follow_Info;
	permanent = TRUE;
	description = "Chod� za mn�!";
};


func int DIA_Addon_WispDetector_Follow_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_Follow_Info()
{
	B_FollowMe_Wisp();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

