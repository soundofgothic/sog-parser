
instance DIA_Kjorn_EXIT(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 999;
	condition = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kjorn_Hello(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Kjorn_Hello_Condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_Hello_Info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hej, podejd� tu!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Dolina jest niebezpiecznym miejscem, bez odpowiedniego ekwipunku nie dasz tam sobie rady.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//Rozumiem, �e TY posiadasz w�a�ciwy ekwipunek?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//Zgad�e�. I wiesz co? Ch�tnie ci go sprzedam.
};


instance DIA_Kjorn_TRADE(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mo�esz mi zaoferowa�?";
};


func int DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Co mo�esz mi zaoferowa�?
};


instance DIA_Kjorn_SellInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent = FALSE;
	description = "Czy sprzedajesz r�wnie� informacje?";
};


func int DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_SellInfos_Info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Czy sprzedajesz r�wnie� informacje?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//To zale�y. Za odpowiedni� cen� powiem ci wszystko, co wiem.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Ile chcesz za informacje?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmmm... Sam nie wiem. 50 sztuk z�ota za ka�d� udzielon� ci informacj� wydaje mi si� rozs�dn� cen�.
};


instance DIA_Kjorn_BuyInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent = TRUE;
	description = "Potrzebuj� paru informacji.";
};


func int DIA_Kjorn_BuyInfos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_BuyInfos_Info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Potrzebuj� informacji.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 sztuk z�ota!
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,"To troch� za drogo.",DIA_Kjorn_BuyInfos_HoldMoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"Tak, prosz�.",DIA_Kjorn_BuyInfos_GiveMoney);
	};
};

func void DIA_Kjorn_BuyInfos_HoldMoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//To dla mnie za drogo.
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_GiveMoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Prosz�.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//A teraz powiedz mi...
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,Dialog_Back,DIA_Kjorn_BuyInfos_Back);
	if(KjornToldDragon == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o smokach.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if(KjornToldDragon == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o smokach - dok�adniej.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	if(KjornToldColony == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o G�rniczej Dolinie.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if(KjornToldColony == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o G�rniczej Dolinie - dok�adniej.",DIA_Kjorn_BuyInfos_Colony2);
	};
	if(KjornToldOldCamp == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o zamku.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	if(KjorntoldOrks == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o orkach.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if(KjorntoldOrks == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"...o orkach - dok�adniej.",DIA_Kjorn_BuyInfos_Orks2);
	};
};

func void DIA_Kjorn_BuyInfos_Back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//Wiesz co, zwr�� mi moje pieni�dze, rozmy�li�em si�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Prosz� bardzo.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Opowiedz mi o smokach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Smoki to pradawne, niewyobra�alnie pot�ne istoty. Kiedy� tysi�ce tych stworze� zamieszkiwa�o ca�y �wiat.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Jednak up�yn�o ju� ponad sto lat, odk�d widziano ostatniego smoka.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Ich krew jest gor�ca niczym wrz�cy olej. Je�li spojrzysz im prosto w oczy, twoje serce obr�ci si� w kamie�. Tak s�ysza�em...
	KjornToldDragon = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Opowiedz mi wi�cej o smokach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Smoki r�ni� si� mi�dzy sob�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Niekt�re z nich mog�yby pokry� ca�y �wiat warstw� lodu grub� na kilka st�p.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Inne lubi� mieszka� na bagnach lub w wulkanach.
	B_LogEntry(TOPIC_DRACHENJAGD,"�owca smok�w Kjorn uwa�a, �e istniej� r�ne rodzaje smok�w. Niekt�re z nich lubi� zimne, wilgotne miejsca, inne wol� ogie�.");
	KjornToldDragon = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Opowiedz mi o G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//G�rnicza Dolina Khorinis s�ynie w ca�ym kraju ze swojej magicznej rudy.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Mo�na j� znale�� tylko w tych g�rach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Bro� wykuta z takiej rudy jest praktycznie niezniszczalna. Mo�na ni� przeci�� nawet najtwardszy pancerz.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Jeszcze par� tygodni temu ca�� Dolin� otacza�a magiczna Bariera. Kto raz j� przekroczy�, zostawa� tam na ca�e �ycie.
	KjornToldColony = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Opowiedz mi wi�cej o G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//W ci�gu paru ostatnich dni Dolina bardzo si� zmieni�a.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Przybyli do niej orkowie, a wraz z nimi wszelkie mo�liwe potwory, jakie tylko mo�na sobie wyobrazi�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//Podobno w okolicy przebywaj� jacy� my�liwi, jednak nie wiadomo nawet, czy jeszcze �yj�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Wygl�da to tak, jakby wszystkie stworzenia Beliara przyby�y do tej jednej Doliny.
	KjornToldColony = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_OldCamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Opowiedz mi o zamku.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Znajduje si� praktycznie w samym �rodku G�rniczej Doliny.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Kiedy jeszcze dolina by�a wykorzystywana jako wi�zienie, lokalni baronowie kontrolowali st�d handel rud�.
	KjornToldOldCamp = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Opowiedz mi o orkach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Orkowie pojawili si� tutaj dopiero niedawno. Przynajmniej ci sprzed zamku.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Dziwi mnie, jak dobrze s� zorganizowani. Orkowie przewa�nie atakuj� na o�lep, niezale�nie od okoliczno�ci.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//Ci orkowie najwyra�niej pr�buj� zyska� na czasie. Czekaj� na co�, nie wiemy tylko na co.
	KjorntoldOrks = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Opowiedz mi wi�cej o orkach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Orkami dowodz� elitarni wojownicy. S� oni niezwykle silni i nosz� bardzo mocne zbroje. Praktycznie nie mo�na ich pokona�.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Kiedy� widzia�em, jak jeden z nich powali� ogromny d�b zaledwie jednym ciosem swojego topora.
	KjorntoldOrks = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};


instance DIA_Kjorn_AllDragonsDead(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Zabi�em wszystkie smoki!";
};


func int DIA_Kjorn_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Zabi�em wszystkie smoki!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//Tak, pewnie. A ja zosta�em paladynem.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Mog�e� zabi� JEDNEGO, ale WSZYSTKIE? Ciekawe kto ci w to uwierzy.
};


instance DIA_Kjorn_PICKPOCKET(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 900;
	condition = DIA_Kjorn_PICKPOCKET_Condition;
	information = DIA_Kjorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Kjorn_PICKPOCKET_Condition()
{
	return C_Beklauen(47,75);
};

func void DIA_Kjorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,Dialog_Back,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

