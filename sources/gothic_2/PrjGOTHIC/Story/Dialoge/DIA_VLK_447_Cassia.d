
instance DIA_Cassia_EXIT(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_PICKME(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 900;
	condition = DIA_Cassia_PICKME_Condition;
	information = DIA_Cassia_PICKME_Info;
	permanent = TRUE;
	description = Pickpocket_100_Female;
};


func int DIA_Cassia_PICKME_Condition()
{
	return C_Beklauen(100,400);
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME,Dialog_Back,DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME,DIALOG_PICKPOCKET,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cassia_PICKME);
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};


instance DIA_Cassia_Gilde(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Gilde_Condition()
{
	if((Cassia_Gildencheck == TRUE) && (Join_Thiefs == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Widz�, �e sta�e� si� wojownikiem prawa i porz�dku.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//To �e s�u�ysz Innosowi, nie ma znaczenia. Jeste� jednym z nas. Mam nadziej�, �e ty te� tak to postrzegasz.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Nale�ysz teraz do ko�cio�a Innosa, ale wci�� jeste� jednym z nas - mam nadziej�, �e o tym nie zapomnisz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_Abgelaufen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Abgelaufen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Cassia_Frist == TRUE) && (Cassia_Day < (B_GetDayPlus() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Abgelaufen_Info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Termin min��. Trzeba by�o nie wraca�.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Cassia_News(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Widz�, �e dosta�e� nasz prezent. Jestem Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//W porz�dku, powiedz mi, dlaczego tu jestem?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Przyci�gn��e� nasz� uwag�, zdobywaj�c zaufanie naszych przyjaci�.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//Chcemy ci co� zaproponowa�. Mo�esz do nas do��czy�.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Popatrzcie tylko, kto znalaz� do nas drog�. Atylla ci� nie doceni�. Ja nie pope�ni� tego b��du.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Co si� tu dzieje?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Chcieli�my twojej �mierci za to, �e donios�e� na jednego z naszych przyjaci�. Dlatego wys�ali�my Atyll�.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Jednak twoja obecno�� tutaj otwiera now� mo�liwo��...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//...co chcesz mi zaproponowa�?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Mo�esz do nas do��czy�.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Cassia_mehr(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent = FALSE;
	description = "Opowiedz mi wi�cej o waszej organizacji.";
};


func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Opowiedz mi wi�cej o waszej organizacji.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Ludzie w mie�cie boj� si� nas, ale nikt nie zna naszej kryj�wki.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Ta garstka ludzi, kt�ra wie o istnieniu kana��w, jest przekonana, �e s� zamkni�te i nikt nie ma do nich dost�pu.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//Tak d�ugo jak nas nie znajd�, mo�emy spokojnie pracowa�.
};


instance DIA_Cassia_MissingPeople(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent = FALSE;
	description = "Mo�esz mi co� powiedzie� o zaginionych mieszka�cach miasta?";
};


func int DIA_Cassia_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Mo�esz mi co� powiedzie� o zaginionych mieszka�cach miasta?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Czemu niby chcesz si� o tym czego� dowiedzie�?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Interesuje mnie ich los.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Opuszczaj�c kana�, pop�y� w prawo wzd�u� wybrze�a.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Tam znajdziesz odpowiedzi na swoje pytania.
};


instance DIA_Cassia_Vorteil(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent = FALSE;
	description = "Je�li do was do��cz�, to co b�d� z tego mia�?";
};


func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Vorteil_Info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//Je�li do was do��cz�, to co b�d� z tego mia�?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Mo�esz si� od nas nauczy� specjalnych zdolno�ci, kt�re pozwol� ci �y� w luksusie.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Ale nie b�d� musia� ukrywa� si� tutaj na dole, prawda?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//Nie. Musisz jedynie przestrzega� naszych zasad. To wszystko.
};


instance DIA_Cassia_Lernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 4;
	condition = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent = FALSE;
	description = "Czego mog� si� od was nauczy�?";
};


func int DIA_Cassia_Lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Lernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Czego mog� si� od was nauczy�?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper jest mistrzem skradania i ukrywania si�. Poka�e ci, jak si� bezszelestnie porusza�.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez jest wyj�tkowo zdolnym w�amywaczem. �aden zamek nie oprze si� jego wytrychom.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//A ja mog� nauczy� ci� kradzie�y kieszonkowej.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Pomog� ci tak�e sta� si� zr�czniejszym. To podstawa twoich zdolno�ci.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Cassia mo�e nauczy� mnie kradzie�y kieszonkowej. Mo�e mi r�wnie� pokaza�, jak sta� si� zr�czniejszym.");
	B_LogEntry(TOPIC_CityTeacher,"Ramirez mo�e mnie nauczy�, jak otwiera� zamki.");
	B_LogEntry(TOPIC_CityTeacher,"Jesper mo�e mnie nauczy�, jak si� skrada�.");
};


instance DIA_Cassia_Regeln(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent = FALSE;
	description = "Jakie s� wasze zasady?";
};


func int DIA_Cassia_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Jakie s� wasze zasady?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Zasada pierwsza: ani s�owa o nas. Nikomu. Nigdy.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Druga: nie daj si� z�apa�.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Trzecia: je�eli wyci�gniesz tu bro�, �eby kogo� zaatakowa�, zabijemy ci�.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//I czwarta, ostatnia zasada: ci, kt�rzy chc� do nas do��czy�, musz� udowodni� swoj� warto��.
};


instance DIA_Cassia_Erwischen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent = FALSE;
	description = "Co si� stanie, jak mnie z�api�?";
};


func int DIA_Cassia_Erwischen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Erwischen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Co si� stanie, jak mnie z�api�?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Po prostu nie daj si� z�apa�, dobra?
};


instance DIA_Cassia_beweisen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent = TRUE;
	description = "Jak mam dowie�� swojej warto�ci?";
};


var int DIA_Cassia_beweisen_permanent;

func int DIA_Cassia_beweisen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln) && (DIA_Cassia_beweisen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Jak mam dowie�� swojej warto�ci?
	if(Join_Thiefs == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Do��czysz do nas czy nie?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//Ten uparty stary alchemik - Constantino - ma pi�kny pier�cie�.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Nie jest mu on potrzebny. Chc�, by przyozdobi� moj� d�o�.
		MIS_CassiaRing = LOG_Running;
		DIA_Cassia_beweisen_permanent = TRUE;
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing,LOG_Running);
		B_LogEntry(Topic_CassiaRing,"Cassia chce, abym przyni�s� jej pier�cie� Constantina.");
	};
};


instance DIA_Cassia_Beitreten(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent = FALSE;
	description = "Dobra, niech b�dzie.";
};


func int DIA_Cassia_Beitreten_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Beitreten_Info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Dobra, wchodz� w to.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//�wietnie. B�dziesz mia� okazj� dowie�� swej warto�ci. Je�li chcesz si� od nas uczy�, to nie widz� ku temu �adnych przeszk�d.
	Join_Thiefs = TRUE;
};


instance DIA_Cassia_Ablehnen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 9;
	condition = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent = FALSE;
	description = "A co je�li nie chc� do was do��czy�...?";
};


func int DIA_Cassia_Ablehnen_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Ablehnen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//A co je�li nie chc� do was do��czy�...?
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Tracisz jedyn� w swoim rodzaju szans�, ale mo�esz odej��.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//I nawet nie my�l o zdradzie. Gorzko by� tego po�a�owa�.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Dobra, niech b�dzie.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Musz� si� nad tym zastanowi�.",DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//W takim razie zabij� ci�.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Dobra, niech b�dzie.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"W takim razie spr�buj mnie zabi�.",DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Ablehnen_Okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Dobra, niech b�dzie.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//Podj��e� m�dr� decyzj�. Je�eli uda ci si� dowie�� swojej warto�ci, b�dziesz m�g� wst�pi� w nasze szeregi.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Je�eli chcesz wcze�niej opanowa� umiej�tno�ci z�odziejskie, to nie kr�puj si� - na pewno ci si� przydadz�.
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//W takim razie spr�buj mnie zabi�.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Szkoda. My�la�am, �e jeste� m�drzejszy.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Ablehnen_Frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Musz� si� nad tym zastanowi�.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Zr�b tak. Daj� ci dwa dni na podj�cie decyzji. Potem nie b�dziesz tu mile widziany.
	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};


instance DIA_Cassia_BevorLernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 5;
	condition = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent = TRUE;
	description = "Mo�esz mnie przeszkoli�?";
};


func int DIA_Cassia_BevorLernen_Condition()
{
	if((Join_Thiefs == TRUE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen) && ((Cassia_TeachPickpocket == FALSE) || (Cassia_TeachDEX == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Mo�esz mnie przeszkoli�?
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Pewnie, nie ma problemu. Daj mi tylko zna�, jak b�dziesz got�w.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Pewnie. Szkolenie w zakresie kradzie�y kieszonkowej i zr�czno�ci b�dzie ci� kosztowa� 100 sztuk z�ota ka�de.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
		Info_AddChoice(DIA_Cassia_BevorLernen,"Mo�e p�niej... (POWR�T)",DIA_Cassia_BevorLernen_Spaeter);
		if(Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen,"Chc� pozna� zasady kradzie�y kieszonkowej (zap�a� 100 sztuk z�ota).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		if(Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen,"Chc� si� sta� zr�czniejszy (zap�a� 100 sztuk z�ota).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};

func void DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices(DIA_Cassia_BevorLernen);
};

func void DIA_Cassia_BevorLernen_DEX()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Chc� by� zr�czniejszy. Tu masz z�oto.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//Mo�emy zacz��, jak tylko b�dziesz gotowy.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Wr��, jak b�dziesz mia� z�oto.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};

func void DIA_Cassia_BevorLernen_Pickpocket()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Chc� si� nauczy� kradzie�y kieszonkowej. Oto z�oto.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//Mo�emy zacz��, jak tylko b�dziesz gotowy.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Wr��, jak b�dziesz mia� z�oto.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};


instance DIA_Cassia_TEACH(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 12;
	condition = DIA_Cassia_TEACH_Condition;
	information = DIA_Cassia_TEACH_Info;
	permanent = TRUE;
	description = "Chc� by� zr�czniejszy.";
};


func int DIA_Cassia_TEACH_Condition()
{
	if(Cassia_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Chc� by� zr�czniejszy.
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};


instance DIA_Cassia_Pickpocket(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent = TRUE;
	description = "Poka� mi, jak okrada� innych (10 punkt�w nauki).";
};


func int DIA_Cassia_Pickpocket_Condition()
{
	if((Cassia_TeachPickpocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Poka� mi, jak opr�ni� czyje� kieszenie.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Je�eli chcesz opr�ni� czyje� kieszenie, musisz odci�gn�� uwag� ofiary. Zacznij z ni� gaw�dzi�.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//Podczas rozmowy postaraj si� oceni�, z kim masz do czynienia. Zwr�� uwag� na wypchane kieszenie albo bi�uteri�. Ale przede wszystkim oce�, jak czujny jest klient.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Pami�taj, �e okradanie pijanego robotnika to nie to samo co skubanie czujnego kupca.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Jak b�dziesz niezgrabny, to klient si� skapuje. Tak wi�c musisz by� opanowany.
	};
};


instance DIA_Cassia_Aufnahme(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent = FALSE;
	description = "Mam pier�cie� Constantina.";
};


func int DIA_Cassia_Aufnahme_Condition()
{
	if((MIS_CassiaRing == LOG_Running) && (Npc_HasItems(other,ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Mam pier�cie� Constantina.
	B_GiveInvItems(other,self,ItRi_Prot_Point_01_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Gratulacje. Przeszed�e� inicjacj�. Teraz jeste� jednym z nas.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//We� ten klucz. Otwiera drzwi do gospody. Nie b�dziesz musia� tapla� si� w wodzie za ka�dym razem.
	B_GiveInvItems(self,other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Co wi�cej, musisz wiedzie�, �e mamy tajny znak. Charakterystyczne kiwni�cie g�ow�.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//W�a�nie tak. Kiedy b�dziesz z kim� rozmawia� i zrobisz ten znak, jasne b�dzie, �e jeste� jednym z nas.
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP(XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"Zosta�em przyj�ty do gildii z�odziei.");
	B_LogEntry(Topic_Diebesgilde,"Pozna�em tajny znak z�odziei. Je�li poka�� go innemu z�odziejowi, b�dzie wiedzia�, �e ja r�wnie� jestem cz�onkiem gildii.");
};


instance DIA_Cassia_Versteck(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent = FALSE;
	description = "Gdzie ukrywacie swoje �upy?";
};


func int DIA_Cassia_Versteck_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Versteck_Info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//Gdzie ukrywacie swoje �upy?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Daj spok�j, nie my�la�e� chyba, �e ci to powiem?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//B�dziesz mia� do�� okazji, �eby po�o�y� �apki na maj�tku innych ludzi - zbyt chciwi ko�cz� z pustymi r�kami.
};


instance DIA_Cassia_Blutkelche(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent = FALSE;
	description = "Masz dla mnie jak�� robot�?";
};


func int DIA_Cassia_Blutkelche_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && (MIS_CassiaKelche != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//Masz dla mnie jak�� robot�?
	if(PETZCOUNTER_City_Theft > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Nie, je�li w mie�cie jeste� �cigany za kradzie�e.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Za�atw to - zap�a� grzywn� albo pozb�d� si� �wiadk�w. Nie obchodzi mnie jak, ale masz to zrobi�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Tak. Jest zestaw kielich�w - sze�ciu.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Kr�l Rhobar zdoby� je podczas jednej z kampanii - ale po�wi�ci� wtedy wielu ludzi. Dlatego s� nazywane Krwawymi Kielichami.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Pojedynczo nie s� zbyt cenne - ale razem s� warte okr�g�� sumk�.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Gdzie znajduj� si� te kielichy?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Nale�� do bogatych kupc�w w g�rnym mie�cie.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Przynie� mi je. Ja tymczasem postaram si� znale�� na nie kupca.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//Co za to dostan�?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Po�ow� zysku albo b�dziesz m�g� wybra� z mojego �upu jaki� specjalny przedmiot.
		MIS_CassiaKelche = LOG_Running;
		Log_CreateTopic(Topic_CassiaKelche,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_Running);
		B_LogEntry(Topic_CassiaKelche,"Cassia chce, abym przyni�s� jej sze�� Krwawych Kielich�w. Wszystkie znajduj� si� w mie�cie.");
	};
};


instance DIA_Cassia_abgeben(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent = TRUE;
	description = "Je�li chodzi o te Krwawe Kielichy...";
};


func int DIA_Cassia_abgeben_Condition()
{
	if(MIS_CassiaKelche == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cassia_abgeben_Info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//Je�eli chodzi o te Krwawe Kielichy...
	if(B_GiveInvItems(other,self,ItMi_BloodCup_MIS,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//Mam wszystkie sze�� kielich�w.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Dobra robota. W mi�dzyczasie uda�o mi si� znale�� na nie kupca.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Mo�esz odebra� swoj� nagrod�. Dzi�kuj�, �e to dla mnie zrobi�e�.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//Nie musz� dla ciebie robi� nic wi�cej - ale w ka�dej chwili mo�esz przyj�� do mnie na nauk�. A poza tym na tej wyspie jest do�� �up�w dla ka�dego.
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP(XP_CassiaBlutkelche);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Mog� sprzeda� te kielichy w komplecie. Przynie� mi wszystkie sze��.
	};
};


instance DIA_Cassia_Belohnung(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent = FALSE;
	description = "Przyszed�em odebra� swoj� nagrod�.";
};


func int DIA_Cassia_Belohnung_Condition()
{
	if(MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Przyszed�em odebra� swoj� nagrod�.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Co wybierasz?
	Info_ClearChoices(DIA_Cassia_Belohnung);
	Info_AddChoice(DIA_Cassia_Belohnung,"400 sztuk z�ota.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung,"4 eliksiry lecznicze",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Daj mi z�oto.
	B_GiveInvItems(self,other,ItMi_Gold,400);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Daj mi mikstury.
	B_GiveInvItems(self,other,ItPo_Health_03,4);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Daj mi pier�cie�.
	B_GiveInvItems(self,other,ItRi_HP_01,1);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

