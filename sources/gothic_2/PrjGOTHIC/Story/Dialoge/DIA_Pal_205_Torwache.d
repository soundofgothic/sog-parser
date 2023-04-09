
instance DIA_PAL_205_Torwache_EXIT(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 999;
	condition = DIA_PAL_205_Torwache_EXIT_Condition;
	information = DIA_PAL_205_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_205_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_205_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string PAL_205_Checkpoint = "NW_CITY_CITYHALL_IN";

var int PAL_205_schonmalreingelassen;

instance DIA_PAL_205_Torwache_FirstWarn(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 1;
	condition = DIA_PAL_205_Torwache_FirstWarn_Condition;
	information = DIA_PAL_205_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,PAL_205_Checkpoint) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (PAL_205_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//ST�J!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Sprzeniewierzy�bym si� swoim zasadom, gdybym wpu�ci� morderc�.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Jeste� oskar�ony o kradzie�. Dop�ki nie oczy�cisz si� z zarzut�w, nie wpuszcz� ci� do �rodka.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Twoje zami�owanie do awantur jest powszechnie znane. Nie wpuszcz� ci� do �rodka.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Udaj si� do Lorda Andre i wyja�nij spraw�.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Tylko osoby w s�u�bie u Kr�la mog� wej�� do ratusza.
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	PrintScreen("",-1,-1,FONT_Screen,0);
};


instance DIA_PAL_205_Torwache_SecondWarn(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_SecondWarn_Condition;
	information = DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Jeszcze jeden krok, a kln� si� na Innosa, �e oberwiesz.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_Attack(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_Attack_Condition;
	information = DIA_PAL_205_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_205_Torwache_Hagen(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_Hagen_Condition;
	information = DIA_PAL_205_Torwache_Hagen_Info;
	permanent = TRUE;
	description = "Musz� porozmawia� z Lordem Hagenem!";
};


func int DIA_PAL_205_Torwache_Hagen_Condition()
{
	if(PAL_205_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Hagen_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//Musz� porozmawia� z Lordem Hagenem!
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Czy wiesz, ile razy dziennie s�ysz� te s�owa? Nie mo�esz wej��. Je�li spr�bujesz, b�d� musia� ci� zabi�.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMil(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMil_Condition;
	information = DIA_PAL_205_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = "Nale�� do stra�y miejskiej.";
};


func int DIA_PAL_205_Torwache_PassAsMil_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_MIL) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMil_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Nale�� do stra�y miejskiej.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//W porz�dku, mo�esz wej��.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMage(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMage_Condition;
	information = DIA_PAL_205_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = "Jestem Magiem Ognia.";
};


func int DIA_PAL_205_Torwache_PassAsMage_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_KDF) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Jestem Magiem Ognia.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Tak, oczywi�cie. Wybacz mi, Wybra�cze, wykonuj� tylko polecenia.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsSld(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsSld_Condition;
	information = DIA_PAL_205_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = "Przepu�� mnie, przynosz� wie�ci od najemnik�w.";
};


func int DIA_PAL_205_Torwache_PassAsSld_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_SLD) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsSld_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Przepu�� mnie, przynosz� wie�ci od najemnik�w.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//Dobrze, ale ostrzegam ci�. Je�li b�dziesz sprawia� k�opoty, nie zd��ysz tego nawet po�a�owa�.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PERM(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_PERM_Condition;
	information = DIA_PAL_205_Torwache_PERM_Info;
	permanent = TRUE;
	description = "Jak tam na s�u�bie?";
};


func int DIA_PAL_205_Torwache_PERM_Condition()
{
	if((PAL_205_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Jak tam na s�u�bie?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Wszystko pod kontrol�.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Jestem zadowolony ze swojej pracy, Wybra�cze.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Zamknij si� i wchod�.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Czego chcesz?
	};
	AI_StopProcessInfos(self);
};

