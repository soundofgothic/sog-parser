
instance DIA_OCPAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_9_EXIT_Condition;
	information = DIA_OCPAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_9_PEOPLE_Condition;
	information = DIA_OCPAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Zamkiem dowodzi kapitan Garond. Cho� pewnie nie mo�na mu zazdro�ci� tej posady.
};


instance DIA_OCPAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_9_LOCATION_Condition;
	information = DIA_OCPAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "Co wiesz o tej dolinie?";
};


func int DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//Co wiesz o tej dolinie?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//W jej wschodniej cz�ci orkowie wybudowali pot�ny mur, chroni�cy ich zapasy. Za nim znajduje si� doj�cie do przystani, przy kt�rej cumuj� swoje statki.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//Mam nadziej�, �e zapasy nie dotr� do ork�w zbyt szybko. OBECNE problemy zupe�nie nam wystarczaj�.
};


instance DIA_OCPAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_9_STANDARD_Condition;
	information = DIA_OCPAL_9_STANDARD_Info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak si� maj� sprawy?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//Smoki zaatakowa�y ponownie! Jednak Innos ochroni nas w walce. Monstra Belaira zap�ac� za to wszystko w�asn� krwi�!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//�owcy smok�w! Powinni byli przys�a� tu paladyn�w!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Teraz, kiedy nie ma ju� smok�w, jedynym problemem pozostaj� orkowie!
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//Musimy jak najszybciej za�adowa� rud� na statki i ucieka� z tej przekl�tej krainy.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Zdrada! Brama nie powinna zosta� otwarta. �mier� zdrajcom!
		};
	};
};

func void B_AssignAmbientInfos_OCPAL_9(var C_Npc slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

