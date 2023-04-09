
instance DIA_Gravo_Exit(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 999;
	condition = DIA_Gravo_Exit_Condition;
	information = DIA_Gravo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gravo_Exit_Condition()
{
	return 1;
};

func void DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gravo_Hallo(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_Hallo_Condition;
	information = DIA_Gravo_Hallo_Info;
	permanent = 0;
	description = "Co s�ycha�?";
};


func int DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func void DIA_Gravo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//Odk�d rzuci�em robot� w kopalni, nie mog� narzeka�.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//A sk�d bierzesz �rodki na utrzymanie?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//Pomagam ludziom w rozwi�zywaniu ich problem�w.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//Je�li podpadniesz kt�remu� z wp�ywowych ludzi, zg�o� si� do mnie. Razem co� wymy�limy.
};


instance DIA_Gravo_HelpHow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpHow_Condition;
	information = DIA_Gravo_HelpHow_Info;
	permanent = 0;
	description = "Gdybym mia� k�opoty TY m�g�by� mi pom�c? W jaki spos�b?";
};


func int DIA_Gravo_HelpHow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpHow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//Gdybym mia� k�opoty, TY m�g�by� mi pom�c? W jaki spos�b?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//No za��my, �e nadepn��e� na odcisk Thorusowi. Lepiej nigdy nie w�azi� mu w drog�, ale wypadki si� zdarzaj�...
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//Thorus potrafi by� bardzo uparty. Jak raz si� na ciebie wkurzy, nie b�dzie chcia� zamieni� z tob� s�owa. A to ju� bardzo niedobrze.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//Jako ��todzi�b, musisz go mie� po swojej stronie. Wi�c przychodzisz do mnie i m�wisz w czym rzecz. Znam tu wiele os�b, z kt�rych zdaniem liczy si� nawet Thorus.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//Oni szepn� o tobie dobre s��wko i Thorus przestanie si� na ciebie boczy�. Oczywi�cie ch�opcy nie zrobi� tego za darmo. Takie przys�ugi kosztuj�.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//A ja pilnuj�, �eby ruda trafi�a do w�a�ciwych os�b...
	B_LogEntry(GE_TraderOC,"Kopacz Gravo oferuje przydatne us�ugi. Gdybym podpad� kiedy� wp�ywowym ludziom ze Starego Obozu, mam si� zg�osi� do niego.");
};

func void B_Gravo_HelpAttitude(var C_Npc prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//Zgadza si�. Zagi�� na ciebie parol.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//Poprosz� paru ludzi, �eby go troch� uspokoili. 100 bry�ek rudy i b�dzie po sprawie.
		if(Npc_HasItems(other,ItMiNugget) >= 100)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//Zobaczmy ile tu masz... Tak, powinno wystarczy�. Mo�esz uzna� spraw� za nieby��.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//Tylko nikomu ani s�owa. Zachowuj si�, jakby w og�le nic si� nie sta�o.
			B_GiveInvItems(hero,self,ItMiNugget,100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//Nie mam tyle przy sobie.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Przykro mi, ch�opcze, ale w takim razie nic nie mog� dla ciebie zrobi�.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//To maj� by� k�opoty? To jest cholerna katastrofa! Obawiam si�, �e on najch�tniej rozdar�by ci� na strz�py.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//Spr�buj� przekona� paru ludzi, �eby si� za tob� wstawili, ale to nie b�dzie tanio kosztowa�. 500 bry�ek rudy, je�li nie wi�cej!
		if(Npc_HasItems(other,ItMiNugget) >= 500)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//Zobaczmy ile tu masz... Widz�, �e ci si� poszcz�ci�o. Wezm� te 500 bry�ek i spr�buj� to wszystko odkr�ci�.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//I pami�taj: nigdy, przenigdy nie wspominaj, �e pomog�em ci za�atwi� t� spraw�. Trzymaj j�zyk za z�bami. Zrozumiano?
			B_GiveInvItems(hero,self,ItMiNugget,500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//Nie mam tyle przy sobie.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Przykro mi, ch�opcze, ale w takim razie nic nie mog� dla ciebie zrobi�.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//Z tego co mi wiadomo, nie masz z nim �adnego zatargu.
	};
};


instance DIA_Gravo_HelpAngryNow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpAngryNow_Condition;
	information = DIA_Gravo_HelpAngryNow_Info;
	permanent = 1;
	description = "Mo�esz mi pom�c? Chyba mam k�opoty.";
};


func int DIA_Gravo_HelpAngryNow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Mo�esz mi pom�c? Chyba mam k�opoty.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Mog� spr�bowa�, ale uprzedzam - moja pomoc b�dzie ci� kosztowa�a od 100 do 500 bry�ek rudy!
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,DIALOG_BACK,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pom� mi z Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pom� mi z Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pom� mi z Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	var C_Npc diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//Pom� mi z Diego.
	diego = Hlp_GetNpc(PC_Thief);
	B_Gravo_HelpAttitude(diego);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	var C_Npc Thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//Pom� mi z Thorusem.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	B_Gravo_HelpAttitude(Thorus);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	var C_Npc Gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//Pom� mi z Gomezem.
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	B_Gravo_HelpAttitude(Gomez);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};


instance DIA_Gravo_Influence(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 2;
	condition = DIA_Gravo_Influence_Condition;
	information = DIA_Gravo_Influence_Info;
	permanent = 1;
	description = "Mo�esz mi powiedzie�, kt�re Cienie nale�� do najbardziej wp�ywowych?";
};


func int DIA_Gravo_Influence_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_Influence_Info()
{
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//Mo�esz mi powiedzie�, kt�re Cienie nale�� do najbardziej wp�ywowych?
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//Chcesz mie� po swojej stronie najwa�niejszych ludzi, co?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//Najpot�niejszym z Cieni jest Diego. Do jego zaufanych ludzi nale�� R�czka, �wistak i Z�y.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//Dexter i Fisk handluj� na targowisku. Maj� szerok� klientel�, w tym nawet Stra�nik�w, wi�c s� do�� wp�ywowi.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//No i jest jeszcze Scatty. On rz�dzi na arenie, organizuje walki i takie tam. Wielu ludzi jest mu winnych pieni�dze, wi�c on r�wnie� jest spor� szych�.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Dexter i Fisk handluj� r�nymi dobrami na targowisku.");
};

