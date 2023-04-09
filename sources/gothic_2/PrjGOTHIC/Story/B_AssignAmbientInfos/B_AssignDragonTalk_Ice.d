
instance DIA_Dragon_Ice_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Ice_Exit_Condition;
	information = DIA_Dragon_Ice_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Ice_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Ice_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//W³adza Oka nade mn¹ dobieg³a koñca. Twój czas na tym œwiecie równie¿.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
	Wld_InsertNpc(Draconian,"FP_ROAM_OW_ICEREGION_29_02");
	Wld_InsertNpc(Draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");
};


instance DIA_Dragon_Ice_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Ice_Hello_Condition;
	information = DIA_Dragon_Ice_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Ice_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Ice_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Dlaczego zak³ócasz mój odpoczynek? Czy mam siê zakopaæ jeszcze g³êbiej, byœcie mnie wreszcie zostawili w spokoju?
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Gadaj¹cy smok. Chwa³a niech bêdzie Oku Innosa.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Zaprawdê, jesteœcie niezwyk³ymi istotami. Niewa¿ne, ile razy przetoczy siê przez was lodowaty wicher œmierci, zawsze znajdzie siê jeden, który powstanie z popio³ów, myœl¹c, ¿e s¹dzone mu byæ bohaterem.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Ale to siê wkrótce zmieni. Osobiœcie dopilnujê, by tym razem ¿aden z was nie powsta³.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Milcz! Na moc œwiêtego Oka, które powierzono w moje rêce, zaklinam ciê: odpowiedz na moje pytania!
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha, ha, ha. Pytaj wiêc. Twoja wiedza i tak na nic ci siê nie zda.
};


instance DIA_Dragon_Ice_WERBISTDU(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Ice_WERBISTDU_Condition;
	information = DIA_Dragon_Ice_WERBISTDU_Info;
	description = "Kim jesteœ?";
};


func int DIA_Dragon_Ice_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Ice_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Jestem Finkregh, pan lodu i œniegu, Stra¿nik Spotkania, i ten, który zakoñczy twój nêdzny ¿ywot.
};


instance DIA_Dragon_Ice_BELIAR(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Ice_BELIAR_Condition;
	information = DIA_Dragon_Ice_BELIAR_Info;
	description = "Któremu bogu s³u¿ysz?";
};


func int DIA_Dragon_Ice_BELIAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Ice_BELIAR_Info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Któremu bogu s³u¿ysz?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//Jakie¿ to przeklête bóstwo pozwala, by tak odra¿aj¹ce istoty jak ty chodzi³y po naszym œwiecie?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Pró¿no siê trudzisz, próbuj¹c ogarn¹æ znaczenie naszego spotkania, ma³y bohaterze.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Beliar nie tylko pozwoli³ na nasze przybycie. On KAZA£ nam tutaj przybyæ!
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Ws³uchani w jego œwiête s³owa, nie spoczniemy, póki nie spe³ni siê jego wola.
};

func void B_AssignDragonTalk_Ice(var C_Npc slf)
{
	DIA_Dragon_Ice_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_BELIAR.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

