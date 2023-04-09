
instance DIA_Dragon_Rock_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Rock_Exit_Condition;
	information = DIA_Dragon_Rock_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Rock_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Do�� gadania. Oko straci�o sw� ochronn� moc. Przygotuj si� na �mier�.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Rock_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Rock_Hello_Condition;
	information = DIA_Dragon_Rock_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Rock_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Rock_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Jeszcze jeden zadufany w sobie karze�, kt�ry o�mieli� si� wspi�� na moj� ska��... Ach, ludzie. Tacy waleczni... i tacy w�tli.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Ej, ty m�wisz!
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Wypatrosz� ci� i rzuc� twoje wn�trzno�ci �cierwojadom.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Nie tak szybko! Mam tu Oko Innosa. Odpowiesz mi najpierw na moje pytania.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//Aaargh. Pytaj wi�c!
};


instance DIA_Dragon_Rock_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Rock_WERBISTDU_Condition;
	information = DIA_Dragon_Rock_WERBISTDU_Info;
	description = "Kim jeste�?";
};


func int DIA_Dragon_Rock_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Nazywam si� Pedrakhan. Jak ci� dopadn�, obedr� �ywcem ze sk�ry!
};


instance DIA_Dragon_Rock_HIERARCHIE(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Rock_HIERARCHIE_Condition;
	information = DIA_Dragon_Rock_HIERARCHIE_Info;
	description = "Kt�ry z was, smok�w, jest najpot�niejszy?";
};


func int DIA_Dragon_Rock_HIERARCHIE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Kt�ry z was, smok�w, jest najpot�niejszy?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Czerpiemy nasz� moc z �ywio��w waszego �wiata. Ich hierarchia jest bardzo prosta.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Mi�kka ziemia obdarza �yciem wszystkie istoty pod s�o�cem, ale otworzy si� i poch�onie ci�, je�li zbli�ysz si� do niej za bardzo.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Ska�a, kt�ra pr�dzej p�knie, ni� si� podda, wznosi si� dumnie ku niebu, by pogrzeba� pod sob� nieostro�nych. A mimo to jest przecie� najlepsz� ochron� przed fal� przyp�ywu.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Iskra �ycia p�onie w hucz�cym ogniu tego �wiata. A przecie� ogie� spala ca�e �ycie, pozostawiaj�c po nim ledwie garstk� popio�u.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Wszystkie �ywio�y maj� moc tworzenia i niszczenia. Ale tylko w wodzie, kt�ra sta�a si� twarda jak ska�a, wszystko stanie si� s�upem soli, na kt�rym �ycie jest niemo�liwe.
};

func void B_AssignDragonTalk_Rock(var C_Npc slf)
{
	DIA_Dragon_Rock_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

