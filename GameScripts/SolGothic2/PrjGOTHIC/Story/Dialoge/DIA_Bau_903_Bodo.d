
instance DIA_Bodo_EXIT(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 999;
	condition = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bodo_Hallo(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 1;
	condition = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Jak leci?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Stra�nicy zbyt d�ugo nami pomiatali. Ale teraz nie o�miel� si� tu pokaza�, skoro najemnicy s� po naszej stronie.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Kr�l mo�e s�dzi, �e wszystko ujdzie mu p�azem. Ale my nie zamierzamy tego d�u�ej znosi�.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//W porz�dku. Jak zobaczysz jakich� stra�nik�w, to huknij ich raz ode mnie, dobra?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Dobrze. Niech Innos b�dzie z tob�.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//�o�nierze Kr�la nie s� mile widziani na farmie.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//Wiele os�b i tak b�dzie z tob� gada�o, ale na pewno nie zdob�dziesz tu popularno�ci.
	};
};


instance DIA_Bodo_Bauernaufstand(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 2;
	condition = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent = FALSE;
	description = "W mie�cie m�wi�, �e ch�opi si� buntuj�!";
};


func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//W mie�cie m�wi�, �e ch�opi si� buntuj�!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Bzdury. Po prostu bronimy tego, na co ci�ko pracowali�my.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//To jasne, �e ci�ar wojny spoczywa na grzbietach wie�niak�w. Ale Onar nie b�dzie si� ju� bezczynnie przygl�da�, jak Kr�l zdziera z nas sk�r�.
};


instance DIA_Bodo_Bett(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 3;
	condition = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent = FALSE;
	description = "Mog� gdzie� tu odpocz��?";
};


func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bett_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Mog� gdzie� tu odpocz��?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Je�li chcesz si� gdzie� przespa�, id� do stodo�y. Tylko nie po�� si� przez pomy�k� w ��ku jakiego� najemnika.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar dba o to, �eby zostawili w spokoju wie�niak�w, ale z obcym spoza farmy mog� zrobi�, co im si� spodoba.
};


instance DIA_Bodo_Cipher(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 4;
	condition = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent = FALSE;
	description = "Cipher powiedzia�, �e kto� mu ukrad� paczk� bagiennego ziela...";
};


func int DIA_Bodo_Cipher_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) || (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher powiedzia�, �e kto� mu ukrad� paczk� bagiennego ziela...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//I co?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//My�li, �e ty to zrobi�e�.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Och, wi�c DLATEGO si� tak na mnie t�po gapi.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Ostatnio by�em dla niego bardzo uprzejmy, bo my�la�em, �e jest mu ci�ko.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Ale nic to nie da�o. Ja by�em dla niego uprzejmy, a on si� gapi�, jakby chcia� mnie zabi�.
};


instance DIA_Bodo_WeedOrElse(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 5;
	condition = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent = FALSE;
	description = "Dawaj mi to ziele, albo po�a�ujesz!";
};


func int DIA_Bodo_WeedOrElse_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Dawaj mi to ziele, albo po�a�ujesz!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//S�uchaj, mam tylko jednego skr�ta. We� go i zostaw mnie w spokoju.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Wiesz, �e najemnicy Onara nas chroni�, co?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Wi�c nie r�b nic g�upiego!
	};
};


instance DIA_Bodo_WeedPERM(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 6;
	condition = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent = TRUE;
	description = "Nie wierz� w ani jedno twoje s�owo! Dawaj bagienne ziele!";
};


func int DIA_Bodo_WeedPERM_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Nie wierz� w ani jedno twoje s�owo! Dawaj bagienne ziele!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//Nie mam go. M�wi� prawd�.
};


instance DIA_Bodo_PICKPOCKET(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 900;
	condition = DIA_Bodo_PICKPOCKET_Condition;
	information = DIA_Bodo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bodo_PICKPOCKET_Condition()
{
	return C_Beklauen(30,60);
};

func void DIA_Bodo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,Dialog_Back,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

