
instance DIA_Larius_EXIT(C_Info)
{
	npc = VLK_400_Larius;
	nr = 999;
	condition = DIA_Larius_EXIT_Condition;
	information = DIA_Larius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Larius_Hello(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = DIA_Larius_Hello_Condition;
	information = DIA_Larius_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Larius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Czego chcesz? Je�li masz jak�� spraw�, musisz si� najpierw um�wi�.
};


instance DIA_Larius_WhoAreYou(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_WhoAreYou_Condition;
	information = DIA_Larius_WhoAreYou_Info;
	permanent = FALSE;
	description = "Kim jeste�?";
};


func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jestem Larius, miejscowy gubernator.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Chocia� w tym momencie mo�e trudno w to uwierzy�, jestem najbardziej wp�ywowym cz�owiekiem w tym mie�cie.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//A wi�c ty tutaj rz�dzisz?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Ja... No c�... w chwili obecnej mam zwi�zane r�ce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Dop�ki Lord Hagen nie opu�ci miasta, to on sprawuje w�adz�.
};


instance DIA_Larius_Disturb(C_Info)
{
	npc = VLK_400_Larius;
	nr = 3;
	condition = DIA_Larius_Disturb_Condition;
	information = DIA_Larius_Disturb_Info;
	permanent = TRUE;
	description = "Nie chcia�em przeszkadza�.";
};


func int DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Nie chcia�em przeszkadza�.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//A jednak przeszkadzasz. Wyno� si� st�d!
};


instance DIA_Larius_DieLage(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_DieLage_Condition;
	information = DIA_Larius_DieLage_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//A co ci� to obchodzi? Dop�ki w mie�cie przebywaj� paladyni, Lord Hagen sprawuje tu w�adz�.
};


instance DIA_Larius_Richterueberfall(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_Richterueberfall_Condition;
	information = DIA_Larius_Richterueberfall_Info;
	description = "S�dzia wynaj�� kilku opryszk�w, �eby ci� uciszyli.";
};


func int DIA_Larius_Richterueberfall_Condition()
{
	if(SCKnowsRichterKomproBrief == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//S�dzia wynaj�� kilku opryszk�w, �eby ci� uciszyli. Mog� to udowodni�.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Nie opowiadaj takich bzdur, chcesz sko�czy� w areszcie?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Nawet je�li jeste� wojownikiem Innosa...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Nawet je�li jeste� szanowanym magiem...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Moje s�owo wci�� co� znaczy w tym mie�cie. Ostrzegam ci�, nie zamierzam s�ucha�, jak bezczelnie szkalujesz dobre imi� s�dziego!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Larius_PICKPOCKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 900;
	condition = DIA_Larius_PICKPOCKET_Condition;
	information = DIA_Larius_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Larius_PICKPOCKET_Condition()
{
	return C_Beklauen(35,120);
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET,Dialog_Back,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

