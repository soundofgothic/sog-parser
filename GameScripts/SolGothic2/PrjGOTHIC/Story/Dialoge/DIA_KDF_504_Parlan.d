
instance DIA_Parlan_Kap1_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Parlan_Hammer;

func void B_Parlan_HAMMER()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//Chwileczk�, m�j synu.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Plotka g�osi, �e z sanktuarium skradziono bardzo cenny artefakt.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Nie chc� wiedzie� nic wi�cej na ten temat. Rozumiem, �e wkr�tce wr�ci on na swoje dawne miejsce.
	Parlan_Hammer = TRUE;
};


var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;

instance DIA_Parlan_PMSchulden(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Parlan_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Parlan_PMSchulden_Info()
{
	var int diff;
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Pogwa�ci�e� zasady naszego zgromadzenia.
	if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//Nie jest to twoje pierwsze wykroczenie.
		if(Parlan_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Twe winy zostan� ci odpuszczone tylko wtedy, gdy ofiarujesz poka�ny datek na rzecz klasztoru.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Ile?
			diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
			if(diff > 0)
			{
				Parlan_Schulden = Parlan_Schulden + (diff * 50);
			};
			if(Parlan_Schulden > 1000)
			{
				Parlan_Schulden = 1000;
			};
			B_Say_Gold(self,other,Parlan_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Co ty sobie wyobra�asz? M�dl si� do Innosa, by przebaczy� ci twe wyst�pki.
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Twoja sytuacja uleg�a zmianie.
		if(Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Nie ma ju� �wiadk�w pope�nionego przez ciebie morderstwa.
		};
		if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Nikt nie chce zeznawa� w sprawie pope�nionej przez ciebie kradzie�y.
		};
		if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Nie ma ju� nikogo, kto oskar�a�by ci� o spowodowanie b�jki.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Wszystkie oskar�enia wobec ciebie zosta�y wycofane.
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Mnie mo�esz oszuka� - ale Innos widzi wszystko!
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Grzechy zosta�y ci odpuszczone.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//Nie zmarnuj tej szansy.
			Parlan_Schulden = 0;
			Parlan_LastPetzCounter = 0;
			Parlan_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Zap�acisz za swe grzechy - taka jest wola Innosa!
			B_Say_Gold(self,other,Parlan_Schulden);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Uwolnij si� od swych grzech�w!
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Nie mam dostatecznie du�o z�ota!",DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Ile to mia�o by�?",DIA_Parlan_PMSchulden_HowMuchAgain);
		if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Przypomnij mi, o jakiej sumie m�wili�my.
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Nie mam dostatecznie du�o z�ota!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Ile to mia�o by�?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Parlan_PETZMASTER_PayNow);
	};
};


instance DIA_Parlan_PETZMASTER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	Parlan_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Nie zamienili�my jeszcze ani s�owa, a ty ju� obarczy�e� si� ci�arem winy!
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Jeste� winny najgorszej z mo�liwych zbrodni! Morderstwa!
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
		Parlan_Schulden = Parlan_Schulden + 500;
		if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//A teraz masz na sumieniu jeszcze dodatkowe grzechy!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Gdyby to zale�a�o ode mnie, zosta�by� pot�piony tu i teraz, morderco!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Je�li jednak zap�acisz za swe czyny, mog� ci� rozgrzeszy�..
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Kradzie� to pogwa�cenie zasad klasztoru.
		if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Pr�cz tego z�ama�e� jeszcze inne zasady.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Te przest�pstwa musz� zosta� ukarane. Takie jest prawo Innosa.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Przeka�esz klasztorowi stosowny datek.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//Nie tolerujemy tu �adnych b�jek. To naruszenie panuj�cych w klasztorze zasad.
		if(PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//Dlaczego zabijasz nasze owce?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//�yjemy tu, przestrzegaj�c okre�lonych zasad. Dotycz� one tak�e ciebie.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//Za swe zbrodnie musisz z�o�y� ofiar� na rzecz klasztoru.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Zabi�e� nasze owce. Musisz zap�aci� odpowiedni� rekompensat�.
		Parlan_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Ile?
	if(Parlan_Schulden > 1000)
	{
		Parlan_Schulden = 1000;
	};
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PETZMASTER,"Nie mam dostatecznie du�o z�ota!",DIA_Parlan_PETZMASTER_PayLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PETZMASTER,"Chc� zap�aci� grzywn�!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Chc� zap�aci� kar�!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Schulden);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//Przyjmuj� datek. Twoje wykroczenie zostaje ci wybaczone. Niech Innos obdarzy ci� m�dro�ci�, by� wi�cej nie grzeszy�.
	B_GrantAbsolution(LOC_MONASTERY);
	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//Nie mam dostatecznie du�o z�ota!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Trzeba by�o o tym pomy�le�, zanim dopu�ci�e� si� owych wyst�pk�w.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Mo�e b�dzie to dla ciebie dobra nauczka. Pami�taj, je�li nie b�dziesz pope�nia� wykrocze�, nie b�dziesz musia� za nie p�aci�.
	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_WELCOME(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_WELCOME_Condition;
	information = DIA_Parlan_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_WELCOME_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Kiedy to ju� zrobisz, porozmawiamy na temat twojej pracy tu, w klasztorze.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Swoj� ofiar� na rzecz klasztoru zanie� jak najszybciej Goraksowi. On ju� zadba, aby trafi�a gdzie trzeba.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Witaj nowicjuszu, mam na imi� Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//Ja jestem...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//...NOWICJUSZEM. To, kim by�e� wcze�niej, nie ma znaczenia. Teraz jeste� s�ug� Innosa. Tylko to si� liczy.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//Wraz ze wst�pieniem do Bractwa Ognia twoje wcze�niejsze winy zostan� ci wybaczone.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Niech Innos b�ogos�awi i oczy�ci grzechy tego, kt�ry wst�puje do� na s�u�b�.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//Co teraz?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Najpierw musisz wype�ni� zadania nowicjusza. B�dziesz pracowa� i s�u�y� klasztorowi.
	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Gemeinschaft,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft,"Jako nowicjusz jestem zobowi�zany s�u�y� spo�eczno�ci.");
	if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)
	{
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Przedtem jednak zabierz swoj� owc� do Opolosa, on si� ni� zajmie.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Z�oto mo�esz zanie�� Goraxowi, naszemu ochmistrzowi. Znajdziesz go w winiarni.
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	}
	else if(DIA_Gorax_GOLD_perm == FALSE)
	{
		B_DIA_Parlan_WELCOME_BringTribute2Gorax();
		B_DIA_Parlan_WELCOME_GoForTribute();
	};
};


instance DIA_Parlan_Auge(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Auge_Condition;
	information = DIA_Parlan_Auge_Info;
	permanent = FALSE;
	description = "Poszukuj� Oka Innosa.";
};


func int DIA_Parlan_Auge_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Auge_Info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Poszukuj� Oka Innosa.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Nie wiem, kto ci o nim powiedzia�, ale nikt nie ma dost�pu do boskiego artefaktu.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Gdzie przechowywane jest Oko Innosa?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//Im mniej os�b zna ten sekret, tym bezpieczniejsze jest Oko. Mo�esz sobie oszcz�dzi� wysi�ku - i tak go nie odnajdziesz.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = "Powiedz mi co� o Oku Innosa.";
};


func int DIA_Parlan_Amulett_Condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,DIA_Parlan_Auge))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Powiedz mi co� o Oku Innosa.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Dobrze. Oko Innosa zawiera w sobie cz�stk� jego boskiej mocy. Tylko JEDEN wybrany s�uga Innosa mo�e nosi� ten amulet.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Zosta� on stworzony, by ochroni� nas przed mocami Z�a, kiedy nadejdzie w�a�ciwy moment.
};


instance DIA_Parlan_Hagen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = "Musz� porozmawia� z dow�dc� paladyn�w!";
};


func int DIA_Parlan_Hagen_Condition()
{
	if((Kapitel <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Hagen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Musz� porozmawia� z dow�dc� paladyn�w!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen nie przyjmuje nowicjuszy, jedynie my, magowie, mamy prawo si� z nim widzie�.
};


instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = "W jaki spos�b m�g�bym s�u�y� zgromadzeniu?";
};


var int DIA_Parlan_WORK_perm;

func int DIA_Parlan_WORK_Condition()
{
	if((Kapitel == 1) && (Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) == FALSE) && Npc_KnowsInfo(other,DIA_Parlan_WELCOME) && (DIA_Parlan_WORK_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//W jaki spos�b m�g�bym s�u�y� zgromadzeniu?
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Najpierw musisz wype�ni� zadania nowicjusza. B�dziesz pracowa� i s�u�y� klasztorowi.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Przedtem jednak zabierz swoj� owc� do Opolosa, on si� ni� zajmie.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Parlan_WELCOME_GoForTribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Z�oto mo�esz zanie�� Goraxowi, naszemu ochmistrzowi. Znajdziesz go w winiarni.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Kiedy to ju� zrobisz, porozmawiamy na temat twojej pracy tu, w klasztorze.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//W tej chwili obowi�zuje cisza nocna. Praca nowicjuszy zaczyna si� o �wicie, a ko�czy o zmierzchu.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//Ty te� powiniene� uda� si� na spoczynek. Wr�� do mnie, kiedy rozpoczn� si� godziny pracy.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Porozmawiaj z innymi magami, dostaniesz od nich zadania.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//B�d� nadzorowa� twoj� prac�. Kiedy wype�nisz wszystkie swoje obowi�zki, otrzymasz pozwolenie na wej�cie do biblioteki, by studiowa� s�owo Innosa.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft,"Je�li wykonam wszystkie polecenia mag�w, b�d� m�g� korzysta� z biblioteki.");
	};
};


instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = "Czy mog� skorzysta� z biblioteki?";
};


func int DIA_Parlan_Stand_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	Kloster_Punkte = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Mog� skorzysta� z biblioteki?
	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Uda�o ci si� zdoby� ogniste pokrzywy dla Brata Neorasa.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Odnalaz�e� receptury Brata Neorasa.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Pozby�e� si� czarnego wilka, kt�ry zagra�a� kaplicy.
		Kloster_Punkte = Kloster_Punkte + 1;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Znalaz�e� czterech nowicjuszy, dzi�ki czemu mog�e� posprz�ta� komnaty.
		Kloster_Punkte = Kloster_Punkte + 3;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Sprawiedliwie rozdzieli�e� jad�o mi�dzy nowicjuszy, tak jak prosi� ci� o to brat Gorax.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax nie by� z ciebie zadowolony, nie uda�o ci si� sprawiedliwie rozdzieli� jedzenia.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Ku rado�ci Goraxa sprzeda�e� wino.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//Nie m�wmy ju� o tej sprawie z winem, tak chyba b�dzie najlepiej...
	};
	if(Kloster_Punkte >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Tak, wykona�e� dostatecznie du�o zada�. Czas postudiowa� nauki Innosa. Porozmawiaj prosz� z Mistrzem Hyglasem, znajdziesz go w bibliotece.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Przyjmij ten oto klucz.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		if(MIS_NeorasPflanzen == LOG_Running)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if(MIS_NeorasRezept == LOG_Running)
		{
			MIS_NeorasRezept = LOG_OBSOLETE;
		};
		if(MIS_IsgarothWolf == LOG_Running)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if(MIS_ParlanFegen == LOG_Running)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if(MIS_GoraxEssen == LOG_Running)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if(MIS_GoraxWein == LOG_Running)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if(MIS_MardukBeten == LOG_Running)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
		B_CheckLog();
	}
	else if(Kloster_Punkte >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Zaiste sporo si� napracowa�e�, wci�� jednak musisz s�u�y� zgromadzeniu.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Najpierw wype�nij obowi�zki na rzecz zgromadzenia. Kiedy sko�czysz, wr�cimy do tej rozmowy.
	};
};


instance DIA_Parlan_Aufgabe(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Aufgabe_Condition;
	information = DIA_Parlan_Aufgabe_Info;
	permanent = FALSE;
	description = "Czy masz dla mnie jakie� zadanie?";
};


func int DIA_Parlan_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//Czy masz dla mnie jakie� zadanie?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmmm... Tak, w rzeczy samej, jest co�, co mo�esz zrobi� dla dobra zgromadzenia.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Komnatom nowicjuszy przyda�oby si� porz�dne zamiatanie. Zajmij si� tym.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Przecie� to potrwa wieki...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Chyba wi�c najlepiej b�dzie zacz�� od razu, prawda?
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen,"Mistrz Parlan chce, abym posprz�ta� komnaty czterech nowicjuszy. To zajmie ca�e wieki.");
};


instance DIA_Parlan_Fegen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = "Je�li chodzi o komnaty nowicjuszy...";
};


var int DIA_Parlan_Fegen_permanent;

func int DIA_Parlan_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Je�li chodzi o komnaty nowicjuszy...
	if(NOV_Helfer >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Widz�, �e uda�o ci si� znale�� czterech pomocnik�w. My�l�, �e teraz mog� wr�ci� do swych obowi�zk�w.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Dobra robota, nowicjuszu. Wype�ni�e� powierzone ci przeze mnie zadanie.
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		B_StartOtherRoutine(Feger1,"START");
		B_StartOtherRoutine(Feger2,"START");
		B_StartOtherRoutine(Feger3,"START");
		B_StartOtherRoutine(Babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Niew�tpliwie zadanie to nie nale�y do �atwych, jednak z pomoc� Innosa dasz sobie rad�.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = "Jak m�g�bym si� nauczy� sztuk magicznych?";
};


func int DIA_Parlan_LEARN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_Hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Jak m�g�bym si� nauczy� sztuk magicznych?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Nie jeste� tu, by uczy� si� magii, lecz by s�u�y� Innosowi.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Mog� ci jednak pokaza�, jak zwi�kszy� swe magiczne moce.
	B_LogEntry(Topic_KlosterTeacher,"Mistrz Parlan mo�e mi pom�c w doskonaleniu moich zdolno�ci magicznych.");
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = "Chc� si� podda� Pr�bie Ognia.";
};


func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Chc� si� podda� Pr�bie Ognia.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Co...? Hm... M�wisz powa�nie?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Nalegam.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Wyj�tkowy z ciebie nowicjusz. W porz�dku, je�li m�wisz powa�nie, porozmawiaj z mistrzem Pyrokarem.
	B_LogEntry(TOPIC_FireContest,"Je�li chc� si� podj�� Pr�by Ognia, powinienem porozmawia� z Mistrzem Pyrokarem.");
};


instance DIA_Parlan_TEACH_MANA(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
};


func int DIA_Parlan_TEACH_MANA_Condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,DIA_Parlan_LEARN))) && (Parlan_Sends == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Chcia�bym powi�kszy� swoje magiczne zdolno�ci.
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Twoja magiczna moc wzros�a. Wi�cej nie mog� ci ju� pom�c.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Je�li pragniesz nauczy� si� wi�cej, porozmawiaj z Pyrokarem.
		Parlan_Sends = TRUE;
	};
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};


instance DIA_Parlan_MAGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_MAGE_Condition;
	information = DIA_Parlan_MAGE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_MAGE_Condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Z�o�y�e� przysi�g�, Bracie. Witaj w naszych szeregach.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//O kr�gach magii opowiem ci, kiedy zdob�dziesz wi�ksze do�wiadczenie.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//We� ten kamie� runiczny, to znak twojej mocy.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
	description = "Wprowad� mnie prosz� do pierwszego kr�gu magii.";
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Wprowad� mnie prosz� do pierwszego kr�gu magii.
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//Magia pierwszego kr�gu pozwala na u�ywanie stworzonych przez siebie run.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Mo�esz nauczy� si� magicznych formu� i samemu tworzy� runy.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Ka�dy z nas specjalizuje si� w jakim� rodzaju magii. Zastan�w si� wi�c dok�adnie, kt�ry z nich wybierzesz dla siebie.
	};
};


instance DIA_Parlan_CIRCLE2(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
	description = "Wprowad� mnie w tajniki drugiego kr�gu magii.";
};


func int DIA_Parlan_CIRCLE2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE2_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Wprowad� mnie w tajniki drugiego kr�gu magii.
	if(Kapitel >= 2)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Poznasz teraz drugi kr�g i nauczysz si� pos�ugiwa� jeszcze pot�niejsz� magi�.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Pami�taj jednak o spoczywaj�cej na tobie odpowiedzialno�ci. Nie wobec mnie czy Pyrokara - wobec samego Innosa.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//To on wskazuje kierunek, jednak twoje czyny kszta�tuj� �cie�k�, po kt�rej st�pasz.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Nie nadszed� jeszcze czas.
	};
};


instance DIA_Parlan_CIRCLE3(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
	description = "Wprowad� mnie w tajniki trzeciego kr�gu magii.";
};


func int DIA_Parlan_CIRCLE3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE3_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Wprowad� mnie w tajniki trzeciego kr�gu magii.
	if(Kapitel >= 3)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Tak, najwy�szy czas, by� pozna� trzeci kr�g magii. Czekaj� na ciebie nowe zakl�cia.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//B�dziesz ich potrzebowa�. Z�o nie �pi, a jedynie pot�ga Innosa mo�e je pokona�.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Przekaza�em ci ju� wiedz� z zakresu wszystkich kr�g�w, jakie znam. Je�li pragniesz pozna� magi� wy�szych Kr�g�w, porozmawiaj z Karasem.
			B_LogEntry(Topic_KlosterTeacher,"Brat Parlan zapozna� mnie z pierwszymi trzema kr�gami. Dalsze post�py mog� poczyni� dzi�ki Bratu Karrasowi.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Nie nadszed� jeszcze czas na to, by� m�g� wkroczy� do trzeciego kr�gu.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = "Nauczaj mnie (tworzenie run)";
};


func int DIA_Parlan_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Naucz mnie!
	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH,Dialog_Back,DIA_Parlan_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Light] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Parlan_TEACH_LIGHT);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Parlan_TEACH_WINDFIST);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Parlan_TEACH_Sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Parlan_TEACH_MediumHeal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Fear] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Parlan_TEACH_Fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Parlan_TEACH_DestroyUndead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Parlan_TEACH_FullHeal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//W tej chwili nie naucz� ci� �adnych nowych formu�.
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};


instance DIA_Parlan_Kap2_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Parlan_Exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Niech Innos ci� prowadzi.
};


instance DIA_Parlan_Kap3_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_IAmParlan(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_IAmParlan_Condition()
{
	if((Kapitel >= 3) && Npc_IsInState(self,ZS_Talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_IAmParlan_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Widz�, �e zdecydowa�e� si� walczy� po naszej stronie. Cieszy mnie to.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Przyda nam si� ka�da pomoc! Powiniene� od razu uda� si� do Marduka, to on przygotowuje paladyn�w do walki.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Nie wiem, kto ci� wpu�ci� do klasztoru. Jestem Parlan, opiekuj� si� nowicjuszami.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Nie �ycz� sobie, by kto� odrywa� ich od zaj��, i dr�czy� niem�drymi pytaniami, zrozumiano?
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan,"B�d� robi�, co mi si� podoba.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Jasne.",DIA_Parlan_IAmParlan_OK);
	};
	Wld_InsertItem(ItKe_KlosterBibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//B�d� robi�, co mi si� podoba.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Na pewno istnieje jaki� pow�d, dla kt�rego twa obecno�� jest tutaj tolerowana, ale pami�taj - wszystko ma swoje granice.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Je�li b�dziesz sprawia� k�opoty, s�ono za to zap�acisz. Trzymaj si� z dala od nowicjuszy.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Rozumiem.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//Mam tak� nadziej�.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Bibliothek(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent = FALSE;
	description = "Czy masz dla mnie co� jeszcze?";
};


func int DIA_Parlan_Bibliothek_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Bibliothek_Info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//Czy masz dla mnie co� jeszcze?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Tak. Jako cz�onek biblioteki posiadasz do niej klucz. W bibliotece znajdziesz Braci Karasa i Hyglasa.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Je�li chcesz, mo�esz z nimi porozmawia�.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Tylko zostaw w spokoju nowicjuszy.
	};
	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
};


instance DIA_Parlan_DontDisturb(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_DontDisturb_Condition()
{
	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//Nie lubi� si� powtarza�, ale... zostaw nowicjuszy w spokoju.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//Maj� oczyszcza� swe dusze przy pomocy ci�kiej fizycznej pracy, aby przygotowywa� si� do �ycia w klasztorze.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//Nie b�d� tolerowa� twoich dalszych wybryk�w.
	Parlan_DontTalkToNovice = LOG_Running;
};


instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = "Gdzie znajd�...";
};


func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Gdzie znajd�...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...ko�ci�?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...bibliotek�?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...kaplic�?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...piwnice?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...ko�ci�?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Panie Wszechmog�cy! Czy�by Innos pozbawi� ci� wzroku?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//Gdzie tu jest ko�ci�? Hmmm... gdzie� on mo�e by�?
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...bibliotek�?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Biblioteka znajduje si� na ko�cu kolumnady, na lewo. Dok�adnie po drugiej stronie ko�cio�a.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...kaplic�?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Kaplica to sala znajduj�ca si� mniej wi�cej w po�owie kolumnady po lewej stronie. Tam w�a�nie paladyni modl� si� do Innosa.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...piwnice?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Wej�cie do piwnic znajduje si� w po�owie kolumnady, po prawej stronie.
};


instance DIA_Parlan_Kap4_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap5_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};

