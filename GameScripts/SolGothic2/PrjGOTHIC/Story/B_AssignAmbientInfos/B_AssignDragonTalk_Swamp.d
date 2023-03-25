
instance DIA_Dragon_Swamp_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Swamp_Exit_Condition;
	information = DIA_Dragon_Swamp_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Swamp_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Wyczerpa³a siê moc Oka. Nadszed³ twój kres, cz³owieku.
	SwampDragon = Hlp_GetNpc(Dragon_Swamp);
	SwampDragon.flags = 0;
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	if(DJG_SwampParty_GoGoGo == TRUE)
	{
		if((DJG_SwampParty == TRUE) && (Npc_IsDead(DJG_Cipher) == FALSE))
		{
			B_StartOtherRoutine(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine(DJG_Cipher,"SwampDragon");
	};
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};


instance DIA_Dragon_Swamp_Hello(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Swamp_Hello_Condition;
	information = DIA_Dragon_Swamp_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Swamp_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Swamp_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//Biada ci, jeœli zbli¿ysz siê jeszcze o krok!
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ha. Oko Innosa najwyraŸniej dzia³a.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//By³o tu przed tob¹ wielu takich jak ty. ¯aden siê nie osta³.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//Oszczêdzaj oddech. Twoje s³owa mnie nie przestrasz¹, piekielny gadzie.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//Odpowiesz na moje pytania albo utopiê ciê w twojej w³asnej krwi.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ha, ha, ha. Œmiesz mi groziæ, robaczku? Podaj choæ jeden powód, dla którego nie mia³bym ciê od razu rozerwaæ na tysi¹c strzêpów.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Jestem wys³annikiem Innosa. Mam przy sobie œwiête Oko. Nie masz wyboru. Rób, co ci ka¿ê, albo spotka ciê zas³u¿ona kara.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//Aargh. Mów! Czego ode mnie chcesz?
};


instance DIA_Dragon_Swamp_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Swamp_WERBISTDU_Condition;
	information = DIA_Dragon_Swamp_WERBISTDU_Info;
	description = "Kim jesteœ?";
};


func int DIA_Dragon_Swamp_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Nazywam siê Pandrodor. Dobrze ci radzê: uciekaj st¹d, póki jeszcze mo¿esz!
};


instance DIA_Dragon_Swamp_WOSINDDIEANDEREN(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;
	description = "Gdzie znajdê resztê twoich ohydnych pobratymców?";
};


func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Gdzie znajdê resztê twoich ohydnych pobratymców?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//¯ywio³y, od których wszystko pochodzi, utrzymuj¹ ten œwiat w harmonii.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Ka¿dy z nich sprawuje w³adzê nad jedn¹ czêœci¹ œwiata.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Szukaj ¿ywio³ów, a znajdziesz moich braci.
};

func void B_AssignDragonTalk_Swamp(var C_Npc slf)
{
	DIA_Dragon_Swamp_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

