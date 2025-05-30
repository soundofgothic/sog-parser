
instance Info_FreemineOrc_EXIT(C_Info)
{
	npc = FreemineOrc;
	nr = 999;
	condition = Info_FreemineOrc_EXIT_Condition;
	information = Info_FreemineOrc_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

func void Info_FreemineOrc_EXIT_Info()
{
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//Musz� ju� i��!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//Obcy wr�ci� znowu!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Dzi�kuj�. Musz� ju� rusza� w dalsz� drog�.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//Obcy mie� dobra podr�!
	};
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_INTRO(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_INTRO_Condition;
	information = Info_FreemineOrc_INTRO_Info;
	important = 1;
	permanent = 0;
};


func int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//Tarrok chcie� pomocy! Tarrok ranny!
};


instance Info_FreemineOrc_WASPASSIERT(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASPASSIERT_Condition;
	information = Info_FreemineOrc_WASPASSIERT_Info;
	important = 0;
	permanent = 0;
	description = "Co si� tu sta�o?";
};


func int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//Co si� tu sta�o?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//Tarrok tu z�apany przez niebieski �o�nierze. Nagle czerwony �o�nierze wsz�dzie.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//Czerwony �o�nierze zabija�... wszystko.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//Tarrok uciec tu. Czerwony �o�nierze nie tu. Oni boj� GACH LUG.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//Ty pom�c, Tarrok boli.
};


instance Info_FreemineOrc_WASTUN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASTUN_Condition;
	information = Info_FreemineOrc_WASTUN_Info;
	important = 0;
	permanent = 0;
	description = "Co mog� dla ciebie zrobi�?";
};


func int Info_FreemineOrc_WASTUN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASTUN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//Co mog� dla ciebie zrobi�?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//Tarrok chcie� mocny lek, albo Tarrok umrze�.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//O jakim lekarstwie m�wisz?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//GACH LUG otru� Tarrok. Tarrok chcie� lek!
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//G�upi, g�upi Tarrok. Zgubi� lek! Nie znale��!
};


instance Info_FreemineOrc_OFFER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_OFFER_Condition;
	information = Info_FreemineOrc_OFFER_Info;
	important = 0;
	permanent = 0;
	description = "Odzyskam twoje lekarstwo!";
};


func int Info_FreemineOrc_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_OFFER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Odzyskam twoje lekarstwo!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//Tarrok s�aby. Obcy wr�ci� szybko, albo Tarrok umrze�!
	AI_StopProcessInfos(self);
	B_Story_FoundOrcSlave();
};


instance Info_FreemineOrc_CRAWLER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_CRAWLER_Condition;
	information = Info_FreemineOrc_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Co to jest GACH LUG?";
};


func int Info_FreemineOrc_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//Co to jest GACH LUG?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//Du�y zwierz, du�o n�g ma.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//GACH LUG gro�ny! Zjada� Ork - zjada� cz�owiek!
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//Ach, masz na my�li pe�zacze!
};


instance Info_FreemineOrc_TONGUE(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TONGUE_Condition;
	information = Info_FreemineOrc_TONGUE_Info;
	important = 0;
	permanent = 0;
	description = "Potrafisz porozumiewa� si� w naszym j�zyku?";
};


func int Info_FreemineOrc_TONGUE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TONGUE_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//Potrafisz porozumiewa� si� w naszym j�zyku?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//Tarrok u ludzi d�ugi czas. Tarrok dobrze s�ucha�.
};


instance Info_FreemineOrc_SEARCHPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SEARCHPOTION_Condition;
	information = Info_FreemineOrc_SEARCHPOTION_Info;
	important = 0;
	permanent = 1;
	description = "Nie mog� znale�� twojego lekarstwa!";
};


func int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SEARCHPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//Nie mog� znale�� twojego lekarstwa!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//Obcy szuka� wi�cej! Lek gdzie� tu!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//Tarrok ucieka� od GACH LUG! Tarrok chowa� si� i ucieka�!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//Obcy przeszuka� nisze te�!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_SUCHEULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SUCHEULUMULU_Condition;
	information = Info_FreemineOrc_SUCHEULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Jeste� przyjacielem Ur-Shaka, tego szamana?";
};


func int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//Jeste� przyjacielem Ur-Shaka, tego szamana?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//Ur-Shak niewolnik, jak Tarrok. Ur-Shak uciec! Dawno, dawno temu!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//Tw�j przyjaciel powiedzia� mi, �e m�g�by� dla mnie zrobi� Ulu-Mulu.
	if(FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//Ty pom�c mi, ja pom�c ty!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//Tarrok bardzo s�aby. Nie ma lek, Tarrok umiera�.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//Obcy przynie�� lek, wtedy Tarrok pom�c!
	};
};


instance Info_FreemineOrc_GIVEPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_GIVEPOTION_Condition;
	information = Info_FreemineOrc_GIVEPOTION_Info;
	important = 0;
	permanent = 0;
	description = "Prosz�, znalaz�em twoje lekarstwo!";
};


func int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//Prosz�, znalaz�em twoje lekarstwo!
	B_GiveInvItems(hero,self,OrcMedicine,1);
	EquipItem(self,OrcMedicine);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItemToState(self,OrcMedicine,1);
	AI_UseItemToState(self,OrcMedicine,-1);
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//Obcy nie jak inny ludzie! Obcy dobry!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//Tarrok dzi�kowa�!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//Mo�esz ju� zrobi� dla mnie Ulu-Mulu?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//Obcy pom�c Tarrok, teraz Tarrok pom�c Obcy!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//Obcy potrzebowa� KROTAHK, KHAZ-TAK, DWACHKARR i ORTH-ANTAK.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//Obcy przynie��, Tarrok zrobi� Ulu-Mulu!
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER))
	{
		B_Story_FoundOrcSlave();
	};
	B_Story_CuredOrc();
};


instance Info_FreemineOrc_FIREWARAN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN_Condition;
	information = Info_FreemineOrc_FIREWARAN_Info;
	important = 0;
	permanent = 0;
	description = "Co to jest KROTAHK?";
};


func int Info_FreemineOrc_FIREWARAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//Co to jest KROTAHK?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//By� j�zyk ognia. J�zyk smoka!
};


instance Info_FreemineOrc_FIREWARAN2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN2_Condition;
	information = Info_FreemineOrc_FIREWARAN2_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mog� znale�� smoka?";
};


func int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN) && !Npc_HasItems(hero,ItAt_Waran_01) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//Gdzie mog� znale�� takiego smoka?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//Smok mieszka w domu Tarroka. Obcy musi szuka�!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//Smok mieszka te� na piasku, przy morzu.
	B_LogEntry(CH4_UluMulu,"Aby sporz�dzi� Ulu-Mulu, Tarrok potrzebuje smoczego j�zyka. Smoki �yj� w krainie ork�w i na piaszczystych pla�ach. Par� z nich kr�ci�o si� chyba w pobli�u wraku okr�tu?");
};


instance Info_FreemineOrc_SHADOWBEAST(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST_Condition;
	information = Info_FreemineOrc_SHADOWBEAST_Info;
	important = 0;
	permanent = 0;
	description = "Co to jest KHAZ-TAK?";
};


func int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//Co to jest KHAZ-TAK?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//By� r�g cieniostw�r. R�g ostry jak n�, twardy jak kamie�.
};


instance Info_FreemineOrc_SHADOWBEAST2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST2_Condition;
	information = Info_FreemineOrc_SHADOWBEAST2_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mog� znale�� tego cieniostwora?";
};


func int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST) && !Npc_HasItems(hero,ItAt_Shadow_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//Gdzie mog� znale�� tego cieniostwora?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//On w lesie albo w jaskini. Nie lubi s�o�ce.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//Bardzo z�y. Obcy uwa�a�!
	B_LogEntry(CH4_UluMulu,"Aby sporz�dzi� Ulu-Mulu, Tarrok potrzebuje rogu cieniostwora. Istoty te zamieszkuj� mroczne lasy i jaskinie. O ile pami�tam, najwi�kszy obszar le�ny w kolonii rozci�ga si� pomi�dzy Starym Obozem a bagnem.");
};


instance Info_FreemineOrc_SWAMPSHARK(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK_Condition;
	information = Info_FreemineOrc_SWAMPSHARK_Info;
	important = 0;
	permanent = 0;
	description = "DWACHKARR? A c� to takiego?";
};


func int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//DWACHKARR? A c� to takiego?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//Z�b b�otnego w�a. Jak w�� ugry��, nikt nie m�c uciec.
};


instance Info_FreemineOrc_SWAMPSHARK2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK2_Condition;
	information = Info_FreemineOrc_SWAMPSHARK2_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mog� znale�� te b�otne w�e?";
};


func int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK) && !Npc_HasItems(hero,ItAt_Swampshark_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//Gdzie mog� znale�� te b�otne w�e?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//Du�o w�� b�otny w ob�z ludzi. Ob�z na bagnie to jest!
	B_LogEntry(CH4_UluMulu,"Aby sporz�dzi� Ulu-Mulu, Tarrok potrzebuje z�b�w b�otnego w�a. Bagna w pobli�u obozu Bractwa a� roj� si� od tych stworze�.");
};


instance Info_FreemineOrc_TROLL(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL_Condition;
	information = Info_FreemineOrc_TROLL_Info;
	important = 0;
	permanent = 0;
	description = "Co to jest ORTH-ANTAK?";
};


func int Info_FreemineOrc_TROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//Co to jest ORTH-ANTAK?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//By� z�b wielki Troll! Robi� du�a dziura w ofiara!
};


instance Info_FreemineOrc_TROLL2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL2_Condition;
	information = Info_FreemineOrc_TROLL2_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mog� znale�� Trolle?";
};


func int Info_FreemineOrc_TROLL2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL) && !Npc_HasItems(hero,ItAt_Troll_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//Gdzie mog� znale�� Trolle?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//Troll siedzie� w g�ry. Troll lubi du�o miejsca!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//Obcy szuka� w g�rach na p�noc. Ale uwa�a� na Trolla �apy!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//Troll waln�� - Obcy spa�� w d�!
	B_LogEntry(CH4_UluMulu,"Aby sporz�dzi� Ulu-Mulu, Tarrok potrzebuje k��w trolla. Te pot�ne stworzy zamieszkuj� g�rzyste tereny w p�nocnej cz�ci kolonii.");
};


instance Info_FreemineOrc_LOOKINGULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information = Info_FreemineOrc_LOOKINGULUMULU_Info;
	important = 0;
	permanent = 1;
	description = "Nie mam jeszcze wszystkich czterech przedmiot�w.";
};


func int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if(!Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02) && Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2) && Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//Nie mam jeszcze wszystkich czterech przedmiot�w.
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//Obcy szuka� dalej! Tarrok tu czeka�!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_EveryUlumulu(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_EVERYULUMULU_Condition;
	information = Info_FreemineOrc_EVERYULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Mam ju� przedmioty potrzebne do sporz�dzenia Ulu-Mulu!";
};


func int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if((FreemineOrc_LookingUlumulu == LOG_RUNNING) && Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//Mam ju� wszystkie przedmioty potrzebne do sporz�dzenia Ulu-Mulu!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//Obcy by� silny wojownik! Da� rzeczy! Tarrok zrobi� ULU-MULU!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//Gotowe! Obcy nosi� ULU-MULU, by� dumny! Tarrok teraz spa�!
	CreateInvItems(hero,ItAt_Waran_01,3);
	B_GiveInvItems(hero,self,ItAt_Waran_01,4);
	Npc_RemoveInvItem(hero,ItAt_Shadow_02);
	Npc_RemoveInvItem(hero,ItAt_Swampshark_02);
	Npc_RemoveInvItem(hero,ItAt_Troll_02);
	Npc_RemoveInvItems(self,ItAt_Waran_01,4);
	B_Story_GotUluMulu();
	AI_StopProcessInfos(self);
};

