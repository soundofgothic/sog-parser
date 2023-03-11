
instance Info_Xardas_EXIT(C_Info)
{
	npc = KDF_404_Xardas;
	nr = 999;
	condition = Info_Xardas_EXIT_Condition;
	information = Info_Xardas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Xardas_EXIT_Condition()
{
	return 1;
};

func void Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneFireball))
	{
		CreateInvItem(self,ItArRuneFireball);
	};
	if(Npc_HasItems(self,ItArScrollSummonDemon) < 1)
	{
		CreateInvItems(self,ItArScrollSummonDemon,2);
	};
};


instance Info_Xardas_DISTURB(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DISTURB_Condition;
	information = Info_Xardas_DISTURB_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_DISTURB_Condition()
{
	if(!UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Xardas_DISTURB_Info()
{
	B_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01");	//KTO �MIE PRZESZKADZA� MI W MOICH STUDIACH?
	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02");	//Nazywam si�...
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03");	//Nie interesuje mnie twoje imi�. To nieistotne.
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04");	//Liczy si� tylko to, �e jeste� pierwsz� osob� od wielu lat, kt�rej uda�o si� rozwi�za� zagadk� Golem�w.
};


instance Info_Xardas_OTHERS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OTHERS_Condition;
	information = Info_Xardas_OTHERS_Info;
	important = 0;
	permanent = 0;
	description = "Czy kto� jeszcze tu zagl�da�?";
};


func int Info_Xardas_OTHERS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_OTHERS_Info()
{
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01");	//Czy kto� jeszcze tu zagl�da�?
	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02");	//Bardzo rzadko. Zwykle szybko zaczynali mnie irytowa� i nasy�a�em na nich kt�r�� z moich magicznych istot.
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03");	//Wolisz wie�� �ywot samotnika, czy� nie?
};


instance Info_Xardas_SATURAS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SATURAS_Condition;
	information = Info_Xardas_SATURAS_Info;
	important = 0;
	permanent = 0;
	description = "Przysy�a mnie Saturas. Potrzebujemy twojej pomocy!";
};


func int Info_Xardas_SATURAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SATURAS_Info()
{
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01");	//Przysy�a mnie Saturas. Potrzebujemy twojej pomocy!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02");	//Magowie Wody zamierzaj� zrobi� u�ytek ze swojego kopca rudy.
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03");	//Detonacja wielkiej g�ry nie jest �adnym rozwi�zaniem!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04");	//Nie jest?
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05");	//NIE!
};


instance Info_Xardas_KDW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_KDW_Condition;
	information = Info_Xardas_KDW_Info;
	important = 0;
	permanent = 0;
	description = "Wszyscy Magowie Ognia zgin�li!";
};


func int Info_Xardas_KDW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_KDW_Info()
{
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//Wszyscy Magowie Ognia zgin�li!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//Gomez kaza� ich zamordowa�.
	AI_Output(self,hero,"Info_Xardas_KDW_14_03");	//Nie powiem, �ebym by� szczeg�lnie zaskoczony. Tym durnym barbarzy�com z zamku - z Gomezem na czele - nigdy nie mo�na by�o ufa�.
	AI_Output(self,hero,"Info_Xardas_KDW_14_04");	//Pomagaj�c Gomezowi w obj�ciu w�adzy, Corristo i inni sami kopali sobie gr�b.
};


instance Info_Xardas_SLEEPER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SLEEPER_Condition;
	information = Info_Xardas_SLEEPER_Info;
	important = 0;
	permanent = 0;
	description = "Tak zwany '�ni�cy' okaza� si� pono� pot�nym demonem zag�ady.";
};


func int Info_Xardas_SLEEPER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SLEEPER_Info()
{
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01");	//Tak zwany "�ni�cy" okaza� si� pono� pot�nym demonem zag�ady.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02");	//Przekona�o si� o tym Bractwo z obozu na bagnie.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03");	//Magowie Wody uwa�aj� teraz, �e ca�a kolonia znalaz�a si� w �miertelnym niebezpiecze�stwie.
	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04");	//Stoimy przed powa�niejszym zagro�eniem ni� ktokolwiek wewn�trz Bariery jest w stanie sobie wyobrazi�...
};


instance Info_Xardas_DANGER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DANGER_Condition;
	information = Info_Xardas_DANGER_Info;
	important = 0;
	permanent = 0;
	description = "Je�li detonacja kopca rudy nie wystarczy, by za�egna� niebezpiecze�stwo...";
};


func int Info_Xardas_DANGER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_SLEEPER) && Npc_KnowsInfo(hero,Info_Xardas_SATURAS))
	{
		return TRUE;
	};
};

func void Info_Xardas_DANGER_Info()
{
	AI_Output(hero,self,"Info_Xardas_DANGER_15_01");	//Je�li detonacja kopca rudy nie wystarczy, by za�egna� niebezpiecze�stwo...
	AI_Output(self,hero,"Info_Xardas_DANGER_14_02");	//...Zapomnij o tym ca�ym kopcu! Jego pot�ga nie wystarczy, by prze�ama� Barier�.
	AI_Output(self,hero,"Info_Xardas_DANGER_14_03");	//Gdyby Corristo i Saturas nie tracili cennego czasu na te swoje dziecinne spory, wiedzieliby teraz co nale�y zrobi�.
	AI_Output(hero,self,"Info_Xardas_DANGER_15_04");	//A co twoim zdaniem nale�y zrobi�?
	AI_Output(self,hero,"Info_Xardas_DANGER_14_05");	//�aden z dwunastu mag�w nie zada� sobie trudu, by zbada� z jakich przyczyn Bariera wymkn�a si� spod kontroli, ani dlaczego przybra�a tak ogromne rozmiary.
};


instance Info_Xardas_BARRIER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BARRIER_Condition;
	information = Info_Xardas_BARRIER_Info;
	important = 0;
	permanent = 0;
	description = "A ty wiesz, co si� sta�o, tak?";
};


func int Info_Xardas_BARRIER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DANGER))
	{
		return TRUE;
	};
};

func void Info_Xardas_BARRIER_Info()
{
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01");	//A ty wiesz, co si� sta�o, tak?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02");	//C�, jedno jest pewne: odpowied� spoczywa ukryta g��boko pod miastem Ork�w.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03");	//Miastem Ork�w?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04");	//Orkowie to nie zwierz�ta, cho� wielu ludzi tak w�a�nie my�li. Ich kultura dor�wnuje wiekiem naszej.
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05");	//Wiele stuleci temu, pi�ciu orkowych szaman�w przywo�a�o do tego �wiata pot�nego demona, kt�ry mia� im pom�c zdominowa� pozosta�e klany.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06");	//Ten demon... To �ni�cy, prawda?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07");	//Orkowie nadali mu to imi� du�o p�niej. Ale nie powiem ci dlaczego wybrali t� nazw�, ani dlaczego tak bardzo si� go teraz boj�!
};


instance Info_Xardas_EVENT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENT_Condition;
	information = Info_Xardas_EVENT_Info;
	important = 0;
	permanent = 0;
	description = "Dlaczego nie?";
};


func int Info_Xardas_EVENT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_BARRIER))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENT_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENT_15_01");	//Dlaczego nie?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_02");	//My�l�, �e mo�esz by�... NIE, aby mnie przekona�, musisz wykona� jeszcze jedno zadanie!
	AI_Output(hero,self,"Info_Xardas_EVENT_15_03");	//Jakie zadanie?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_04");	//S�uchaj uwa�nie: Orkowie wygnali z miasta jednego ze swoich szaman�w.
};


instance Info_Xardas_EVENTWHY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHY_Condition;
	information = Info_Xardas_EVENTWHY_Info;
	important = 0;
	permanent = 0;
	description = "Dlaczego?";
};


func int Info_Xardas_EVENTWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHY_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01");	//Dlaczego?
	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02");	//Umieraj�cy Ork, kt�rego kaza�em przes�ucha� moim demonom, nie by� w stanie odpowiedzie� mi na to pytanie.
};


instance Info_Xardas_EVENTHOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTHOW_Condition;
	information = Info_Xardas_EVENTHOW_Info;
	important = 0;
	permanent = 0;
	description = "Co ten szaman ma wsp�lnego z moim zadaniem?";
};


func int Info_Xardas_EVENTHOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTHOW_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01");	//Co ten szaman ma wsp�lnego z moim zadaniem?
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02");	//On opowie ci reszt� historii zwi�zanej ze �ni�cym.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03");	//Obawiam si�, �e Ork nie b�dzie zbyt ch�tny do zwierze� w mojej obecno�ci!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04");	//Chcesz �ebym ci pom�g�, czy nie?
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05");	//Tak, ale...
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06");	//Wi�c nigdy wi�cej nie kwestionuj tego, co m�wi�!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07");	//Znajd� tego szamana. Nie pa�a mi�o�ci� do swych braci z miasta Ork�w, wi�c mo�e zgodzi si� ciebie wys�ucha� zanim zamieni ci� w �yw� pochodni�!
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08");	//Bardzo pocieszaj�ce!
};


instance Info_Xardas_EVENTWHERE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHERE_Condition;
	information = Info_Xardas_EVENTWHERE_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie znajd� tego wygnanego szamana?";
};


func int Info_Xardas_EVENTWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHERE_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01");	//Gdzie znajd� tego wygnanego szamana?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02");	//Id� do starej cytadeli na wschodzie. Na pewno trafisz - znajduje si� na szczycie wysokiej g�ry. Wida� j� ju� z daleka.
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03");	//I mog� tak po prostu do niej wej��?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04");	//M�wi� na ni� stara cytadela, cho� tak naprawd� to tylko sterta kamieni. Od wielu dziesi�cioleci nikt tam nie zagl�da.
};


instance Info_Xardas_ACCEPT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ACCEPT_Condition;
	information = Info_Xardas_ACCEPT_Info;
	important = 0;
	permanent = 0;
	description = "Porozmawiam z tym szamanem!";
};


func int Info_Xardas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENTWHY) && Npc_KnowsInfo(hero,Info_Xardas_EVENTHOW) && Npc_KnowsInfo(hero,Info_Xardas_EVENTWHERE))
	{
		return TRUE;
	};
};

func void Info_Xardas_ACCEPT_Info()
{
	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01");	//Porozmawiam z tym szamanem!
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02");	//M�j s�uga da� ci ju� magiczn� run� uaktywniaj�c� pentagram pi�tro ni�ej.
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03");	//W ten spos�b b�dziesz m�g� wr�ci� do mnie natychmiast po wykonaniu zadania.
	B_Story_CordsPost();
	B_Story_FindOrcShaman();
	AI_StopProcessInfos(self);
};


instance Kdf_404_Xardas_SELLMAGICSTUFF(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information = Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important = 0;
	permanent = 1;
	trade = 1;
	description = "Poszukuj� wiedzy magicznej.";
};


func int Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

func void Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//Poszukuj� wiedzy magicznej.
};


instance Info_Xardas_RETURN(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_RETURN_Condition;
	information = Info_Xardas_RETURN_Info;
	important = 0;
	permanent = 0;
	description = "Rozmawia�em z szamanem Ork�w.";
};


func int Info_Xardas_RETURN_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_RETURN_Info()
{
	AI_Output(hero,self,"Info_Xardas_RETURN_15_01");	//Rozmawia�em z szamanem Ork�w.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_02");	//�wietnie! Czego si� dowiedzia�e�?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_03");	//Pi�ciu szaman�w, kt�rzy przywo�ali �ni�cego, wybudowa�o dla niego podziemn� �wi�tyni�. Wej�cie do niej znajduje si� w mie�cie Ork�w.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_04");	//Zgadza si�!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_05");	//Miast okaza� wdzi�czno��, �ni�cy wyrwa� ich serca i skaza� ich, oraz wszystkich, kt�rzy pracowali przy budowie na wieczne pot�pienie, zamieniaj�c ich w O�ywie�c�w!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_06");	//Doskonale, doskonale!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_07");	//Orkowie zapiecz�towali wej�cie do �wi�tyni i pr�bowali przeb�aga� demona sk�adaj�c mu ofiary!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_08");	//Znalaz�e� spos�b na dostanie si� do �wi�tyni?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_09");	//Tak, jest pewien Ork, kt�ry...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_10");	//�adnych szczeg��w! Udaj si� do podziemnej �wi�tyni. Tam znajdziesz jedyny spos�b na zniszczenie Bariery!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_11");	//Nic nie rozumiem!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_12");	//Poprosi�e� mnie o pomoc w zniszczeniu Bariery, tak czy nie?!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_13");	//Tak, ale...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_14");	//WI�C ID�! Zmarnowano ju� do�� czasu! Id� do podziemnej �wi�tyni! Tam znajdziesz odpowied�!
	B_Story_ReturnedFromUrShak();
};


instance Info_Xardas_FOUNDTEMPLE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FOUNDTEMPLE_Condition;
	information = Info_Xardas_FOUNDTEMPLE_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em drog� do podziemnej �wi�tyni!";
};


func int Info_Xardas_FOUNDTEMPLE_Condition()
{
	if(EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01");	//Znalaz�em drog� do podziemnej �wi�tyni!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02");	//ZNALAZ�E�... To niesamowite!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03");	//Sta�e� si� niezwykle pot�ny! Pot�niejszy ni� ktokolwiek wewn�trz Bariery.
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04");	//Mo�e rzeczywi�cie jeste� cz�owiekiem, o kt�rym wspomina proroctwo Ork�w!
};


instance Info_Xardas_PROPHECY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_PROPHECY_Condition;
	information = Info_Xardas_PROPHECY_Info;
	important = 0;
	permanent = 0;
	description = "Proroctwo? Jakie proroctwo?";
};


func int Info_Xardas_PROPHECY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FOUNDTEMPLE))
	{
		return TRUE;
	};
};

func void Info_Xardas_PROPHECY_Info()
{
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01");	//Proroctwo? Jakie proroctwo?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02");	//Prastare manuskrypty Ork�w, spisane tu� po zamkni�ciu �wi�tyni, wspominaj� o "�wi�tym Nieprzyjacielu".
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03");	//�wi�tym Nieprzyjacielu?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04");	//Kogo�, kto raz na zawsze wyp�dzi �ni�cego z naszego �wiata!
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05");	//I to ja mam by� t� osob� z przepowiedni?! Mylisz si�! Na pewno si� mylisz!
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06");	//Mo�e tak... Mo�e nie!
};


instance Info_Xardas_LOADSWORD(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD_Condition;
	information = Info_Xardas_LOADSWORD_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em dziwny miecz.";
};


func int Info_Xardas_LOADSWORD_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//Znalaz�em dziwny miecz.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02");	//Poka� mi go.
	CreateInvItem(self,Mythrilklinge01);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03");	//Hmm... To ciekawe. Wyryto na nim s�owo "URIZIEL".
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04");	//S�ysza�em o tym mieczu. To or� z dawnych lat, kiedy rasa ludzka by�a jeszcze bardzo m�oda.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05");	//Nie wiem z jakiego materia�u go wykuto, ani nawet KTO go wyku�.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06");	//Wed�ug legendy, miecz ma posiada� niezwyk�e moce, ale nie wyczuwam wok� niego magicznej aury!
	Npc_RemoveInvItem(hero,Mythrilklinge);
	CreateInvItem(hero,Mythrilklinge01);
};


instance Info_Xardas_LOADSWORD01(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD01_Condition;
	information = Info_Xardas_LOADSWORD01_Info;
	important = 0;
	permanent = 0;
	description = "URIZIEL posiada� niezwyk�e moce?";
};


func int Info_Xardas_LOADSWORD01_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem(self,Mythrilklinge01);
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01");	//URIZIEL posiada� niezwyk�e moce?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02");	//Napisano, �e posiadacz tej broni by� w stanie przebi� najgrubszy pancerz i przezwyci�y� najsilniejsze zakl�cia.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03");	//W jaki spos�b tak pot�ny or� trafi� w r�ce Ork�w?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04");	//Pono� Orkowie odebrali go pot�nemu rycerzowi. Nie wiedzieli jak go wykorzysta�, wi�c postanowili go ukry�!
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05");	//Jak wida� - nie do�� dobrze!
};


instance Info_Xardas_LOADSWORD02(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD02_Condition;
	information = Info_Xardas_LOADSWORD02_Info;
	important = 0;
	permanent = 0;
	description = "Czy jest jaki� spos�b na przywr�cenie tej broni dawnej �wietno�ci?";
};


func int Info_Xardas_LOADSWORD02_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD01))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD02_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01");	//Czy jest jaki� spos�b na przywr�cenie tej broni dawnej �wietno�ci?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02");	//Nie obejdzie si� bez odpowiednio silnego �r�d�a magii.
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03");	//Masz na my�li �r�d�o wystarczaj�co pot�ne, by wysadzi� w powietrze Magiczn� Barier�?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04");	//Co� w tym rodzaju...
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05");	//Opr�cz tego potrzebna b�dzie specjalna magiczna formu�a, kt�ra przeka�e ca�� wyzwolon� energi� na miecz.
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06");	//Daj mi troch� czasu na przygotowanie formu�y!
	B_Story_ShowedUrizielToXardas();
};


instance Info_Xardas_BETTERARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BETTERARMOR_Condition;
	information = Info_Xardas_BETTERARMOR_Info;
	important = 0;
	permanent = 0;
	description = "W mi�dzyczasie, ja poszukam sobie lepszej zbroi!";
};


func int Info_Xardas_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD02))
	{
		return TRUE;
	};
};

func void Info_Xardas_BETTERARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01");	//W mi�dzyczasie, jak poszukam sobie lepszej zbroi!
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if(armorInstance == crw_armor_h)
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02");	//Te posklecane w napr�dce pancerze pe�zaczy s� zbyt g�sto podziurawione po wyprawie do podziemnej �wi�tyni!
	}
	else if((armorInstance == kdw_armor_h) || (armorInstance == kdw_armor_l))
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03");	//Te niebieskie szmatki nie zapewni�y mi zbyt wielkiej ochrony w podziemnej �wi�tyni!
	}
	else
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04");	//O�ywie�cy porz�dnie podziurawili m�j stary pancerz.
	};
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05");	//Powiniene� zajrze� do mojej starej wie�y?
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06");	//Twojej starej wie�y?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07");	//Podczas trz�sienia ziemi poch�on�o j� jedno ze wschodnich jezior. Jej szczyt powinien nadal wystawa� nad poziom wody.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08");	//Wewn�trz zosta�o kilka cennych artefakt�w. Nigdy nie zada�em sobie trudu, by je odzyska�.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09");	//Jak si� tam dostan�?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10");	//Nie zagl�da�em tam od trz�sienia ziemi, wi�c sam b�dziesz musia� poszuka� drogi do �rodka.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11");	//We� ten klucz. Otwiera skrzyni�, w kt�rej przechowywa�em szczeg�lnie cenne artefakty.
	B_Story_ExploreSunkenTower();
};


instance Info_Xardas_OREARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OREARMOR_Condition;
	information = Info_Xardas_OREARMOR_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_OREARMOR_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h))
	{
		return TRUE;
	};
};

func void Info_Xardas_OREARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if((armorInstance == ore_armor_m) || (armorInstance == ore_armor_h))
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01");	//Ach, jak widz� nosisz zbroj� runiczn�, wykonan� z magicznej rudy!
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02");	//Jak widz�, znalaz�e� zbroj� runiczn�, wykonan� z magicznej rudy!
	};
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03");	//Znalaz�em j� w zatopionej wie�y, w jednej z tych starych skrzy�.
	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04");	//Nale�a�a kiedy� do tego samego genera�a, kt�ry dzier�y� URIZIEL w bitwie z Orkami.
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05");	//Mam tylko nadziej�, �e przyniesie mi troch� wi�cej szcz�cia ni� jemu!
};


instance Info_Xardas_FORMULA(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FORMULA_Condition;
	information = Info_Xardas_FORMULA_Info;
	important = 0;
	permanent = 0;
	description = "Przygotowa�e� ju� formu��, kt�ra przywr�ci URIZIELOWI jego dawn� moc?";
};


func int Info_Xardas_FORMULA_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h) || Npc_HasItems(hero,ItArRuneTeleport1))
	{
		return TRUE;
	};
};

func void Info_Xardas_FORMULA_Info()
{
	AI_Output(other,self,"Info_Xardas_FORMULA_15_01");	//Przygotowa�e� ju� formu��, kt�ra przywr�ci URIZIELOWI jego dawn� moc?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_02");	//Tak, wszystko gotowe. Ale sam nie dasz rady jej u�y�.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_03");	//Dlaczego nie?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_04");	//B�dziesz musia� dotkn�� mieczem �r�d�a mocy magicznej. Dok�adnie w tej samej chwili jaki� mag musi wypowiedzie� formu��.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_05");	//Zatem musz� sobie poszuka� kogo� do pomocy!
	AI_Output(self,other,"Info_Xardas_FORMULA_14_06");	//We� formu�� i przywr�� URIZIEL do jego dawnej �wietno�ci. B�dzie ci wkr�tce potrzebny!
	B_Story_LoadSword();
};


instance Info_Xardas_ALTRUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ALTRUNE_Condition;
	information = Info_Xardas_ALTRUNE_Info;
	important = 0;
	permanent = 0;
	description = "Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� URIZIELEM!";
};


func int Info_Xardas_ALTRUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FORMULA) && ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB)))
	{
		return TRUE;
	};
};

func void Info_Xardas_ALTRUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01");	//Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//Jest na to spos�b...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//Ale najpierw na�aduj miecz magiczn� energi�. Wr�� jak najszybciej!
};


instance Info_Xardas_SWORDLOADED(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SWORDLOADED_Condition;
	information = Info_Xardas_SWORDLOADED_Info;
	important = 0;
	permanent = 0;
	description = "Uda�o mi si�! URIZIEL zn�w posiada magiczn� aur�!";
};


func int Info_Xardas_SWORDLOADED_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_SWORDLOADED_Info()
{
	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01");	//Uda�o mi si�! URIZIEL zn�w posiada magiczn� aur�!
	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02");	//Niesamowite! Miecz odzyska� sw� dawn� moc! Dysponujesz teraz nie lada or�em!
	Wld_InsertItem(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");
};


instance Info_Xardas_MAKERUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNE_Condition;
	information = Info_Xardas_MAKERUNE_Info;
	important = 0;
	permanent = 0;
	description = "B�d� m�g� pos�ugiwa� si� tym mieczem mimo, i� jestem magiem?";
};


func int Info_Xardas_MAKERUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ALTRUNE) && Npc_KnowsInfo(hero,Info_Xardas_SWORDLOADED))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01");	//Powiedzia�e�, �e b�d� m�g� pos�ugiwa� si� tym mieczem mimo, i� jestem magiem?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//Przyjrzyj si� mu uwa�nie. Zauwa�y�e� zapewne ten du�y, b��kitny klejnot zatopiony w ostrzu.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//Ca�a energia magiczna miecza skumulowana jest w�a�nie tutaj.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04");	//Je�li usun� klejnot, b�d� m�g� stworzy� magiczn� run� posiadaj�c� wszystkie te cechy, kt�re czyni� URIZIEL tak szczeg�lnym or�em.
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05");	//Magiczna runa stworzona z URIZIEL?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06");	//W bitwie ta runa b�dzie r�wnie niebezpieczna co sam miecz!
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07");	//Ale nie zapominaj, �e jedynie mag Sz�stego Kr�gu mo�e zapanowa� nad tak pot�n� magi�!
};


instance Info_Xardas_MAKERUNEDOIT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNEDOIT_Condition;
	information = Info_Xardas_MAKERUNEDOIT_Info;
	important = 0;
	permanent = 1;
	description = "Chc�, �eby� usun�� klejnot z URIZIELA!";
};


func int Info_Xardas_MAKERUNEDOIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_MAKERUNE) && Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01");	//Chc�, �eby� usun�� klejnot z URIZIEL!
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02");	//Ale nie opanowa�e� jeszcze magii Sz�stego Kr�gu!
	};
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//Od tej decyzji nie ma odwrotu. Jeste� pewien, �e chcesz abym usun�� klejnot?
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"TAK, zr�b to.",Info_Xardas_MAKERUNE_YES);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"Nie, nie chc�.",Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//TAK, zr�b to.
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05");	//Je�li tego w�a�nie chcesz... Prosz�, oto miecz i runa!
	Npc_RemoveInvItem(hero,Mythrilklinge02);
	CreateInvItems(self,UrizielRune,2);
	B_GiveInvItems(self,hero,UrizielRune,2);
	Npc_RemoveInvItem(hero,UrizielRune);
	CreateInvItem(hero,Mythrilklinge03);
	B_LogEntry(CH5_Uriziel,"Xardas usun�� magiczny kryszta� z Uriziela. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus(CH5_Uriziel,LOG_SUCCESS);
};

func void Info_Xardas_MAKERUNE_NO()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//Nie, nie chc�.
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//Jak sobie �yczysz. Ostrze zachowa sw� magiczn� moc!
};


instance Info_Xardas_LOADSWORD09(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD09_Condition;
	information = Info_Xardas_LOADSWORD09_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0);
};


func int Info_Xardas_LOADSWORD09_Condition()
{
	if(EnteredTemple && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD09_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Mo�esz mnie czego� nauczy�?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//Wprowadz� ci� w Sz�sty Kr�g Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//Pami�taj, �e to przywilej zarezerwowany wy��cznie dla najbieglejszych mag�w. Mog� do niego przyst�pi� ci, kt�rych ca�e �ycie jest znakiem.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Twoim znakiem jest zjednoczenie element�w.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//Sz�sty Kr�g pozwala ci wykorzystywa� magi� dowolnej runy.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//I nie zapomnij: twoim zadaniem jest s�u�y� pot�dze magii, a nie j� wykorzystywa�.
			CreateInvItem(hero,dmb_armor_m);
			AI_EquipBestArmor(hero);
			CreateInvItem(self,ItAmArrow);
			B_GiveInvItems(self,hero,ItAmArrow,1);
			Npc_RemoveInvItem(hero,ItAmArrow);
			hero.guild = GIL_DMB;
			Npc_SetTrueGuild(hero,GIL_DMB);
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07");	//Jeszcze nie. Jeste� zdolny, ale brak ci niezb�dnego do�wiadczenia. Niech Saturas popracuje nad tob� przez jaki� czas. Wtedy zobaczymy.
		AI_StopProcessInfos(self);
	};
};

