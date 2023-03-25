
instance DIA_PAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_4_EXIT_Condition;
	information = DIA_PAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_4_JOIN_Condition;
	information = DIA_PAL_4_JOIN_Info;
	permanent = TRUE;
	description = "Jak mogê zostaæ paladynem?";
};


func int DIA_PAL_4_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//Jak mogê zostaæ paladynem?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//Jeœli w istocie tego pragniesz, to powinieneœ do³¹czyæ do paladynów.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//Udaj siê do koszar i porozmawiaj z Lordem Andre. Do³¹cz do oddzia³ów stra¿y.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//Byæ mo¿e w ten sposób dowiedziesz swej wartoœci.
};


instance DIA_PAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_4_PEOPLE_Condition;
	information = DIA_PAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_PAL_4_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//Lord Hagen jest dowódc¹ wszystkich oddzia³ów na wyspie. Póki tu jesteœmy, sprawuje tak¿e urz¹d gubernatora.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//Jest jednak bardzo zajêty. Jeœli masz jakiœ problem, udaj siê do koszar i porozmawiaj z Lordem Andre.
};


instance DIA_PAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_4_LOCATION_Condition;
	information = DIA_PAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "Co paladyni robi¹ tutaj, w Khorinis?";
};


func int DIA_PAL_4_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//Co paladyni robi¹ tutaj, w Khorinis?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//Nie wolno mi na ten temat rozmawiaæ.
};


instance DIA_PAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_4_STANDARD_Condition;
	information = DIA_PAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//Co s³ychaæ?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//Wci¹¿ walczymy ze smokami, jestem pewien, ¿e nasz kapitan podejmie wkrótce jakieœ zdecydowane kroki.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//Ci¹gle nie mamy ¿adnych wieœci z obozowiska w Górniczej Dolinie. To bardzo niepokoj¹ce.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//B³ogos³awiony niech bêdzie Innos! Niebezpieczeñstwo ataku smoków zosta³o za¿egnane. ¯eby dotrzeæ do rudy, musimy siê ju¿ tylko zaj¹æ orkami.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//Nie mam czasu na rozpowiadanie plotek zas³yszanych gdzieœ na mieœcie.
	};
};

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

