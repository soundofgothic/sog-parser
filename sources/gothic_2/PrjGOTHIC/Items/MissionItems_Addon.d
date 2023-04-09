
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = "Zapieczêtowana wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Ta wiadomoœæ zosta³a dok³adnie zapieczêtowana.";
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Szanowny Vatrasie,");
	Doc_PrintLines(nDocID,0,"Dotarliœmy do portalu. Mia³eœ racjê.");
	Doc_PrintLines(nDocID,0,"S¹ znaki wskazuj¹ce na to, ¿e naprawdê czcili Adanosa. SprawdŸ, proszê, moje notatki i potwierdŸ nasze ustalenia.");
	Doc_PrintLines(nDocID,0,"Od kilku dni nie widzieliœmy tych dziwnych kamiennych istot.");
	Doc_PrintLines(nDocID,0,"Ziemia wci¹¿ trzêsie siê z niewiadomych powodów.");
	Doc_PrintLines(nDocID,0,"S¹dzê, ¿e nasze badania wkrótce wska¿¹ nam, co mo¿e byæ tego przyczyn¹.");
	Doc_PrintLines(nDocID,0,"Znaleziony przez nas ornament ma wiêksze znaczenie, ni¿ wczeœniej s¹dziliœmy. Wydaje nam siê, ¿e jest to jakiœ klucz-artefakt. Niestety, nie jest kompletny. Musimy go dok³adniej zbadaæ.");
	Doc_PrintLines(nDocID,0,"Wyœlij jednego z cz³onków Wodnego Krêgu, by nam go dostarczy³. Jeœli to mo¿liwe, nie przysy³aj Cavalorna.");
	Doc_PrintLines(nDocID,0,"Poprosi³em go ju¿ o dostarczenie Ci tego listu. Wydaje mi siê, ¿e ju¿ wystarczaj¹co nam pomóg³.");
	Doc_PrintLines(nDocID,0,"Mam nadziejê, ¿e postêpujemy w³aœciwie.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Saturas");
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Zabra³em bandycie wiadomoœæ, któr¹ Cavalorn mia³ dostarczyæ Vatrasowi, Magowi Wody. To teraz moje zadanie.");
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Istnieje stowarzyszenie zw¹ce siê Wodnym Krêgiem. Wygl¹da na to, ¿e rz¹dz¹ nim Magowie Wody.");
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Cavalorn nale¿y do Wodnego Krêgu.");
	};
	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = "Otwarta wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "List Saturasa do Vatrasa";
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment du¿ego, ozdobnego pierœcienia";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment du¿ego, ozdobnego pierœcienia";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name = "Mapa Nefariusa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = name;
	text[0] = "Na mapie zaznaczono miejsca,";
	text[1] = "gdzie wed³ug Nefariusa znajduj¹ siê brakuj¹ce ornamenty.";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Ornaments()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name = "Mapa terenów Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = name;
	text[0] = "Skip zaznaczy³ miejsce,";
	text[1] = "gdzie mogê znaleŸæ szefa bandytów,";
	text[2] = "Dextera.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Dexter()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


prototype Rangerring_Prototype(C_Item)
{
	name = "Pierœcieñ z akwamarynem";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = "Symbol przynale¿noœci do Wodnego Krêgu";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void Equip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};
		SCIsWearingRangerRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};
		RangerRingIsLaresRing = FALSE;
	};
};


instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	text[1] = "Ten pierœcieñ nale¿y do Laresa.";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[1] = "To mój pierœcieñ.";
};

instance ItRi_LanceRing(Rangerring_Prototype)
{
	text[1] = "Ten pierœcieñ nale¿y do Lance'a.";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = "Ozdobny pierœcieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Ten pierœcieñ otwiera portal";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = "List polecaj¹cy od Martina";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = "List polecaj¹cy dla Lorda Andre";
	text[2] = "powinien mi umo¿liwiæ";
	text[3] = "wst¹pienie w szeregi stra¿y.";
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Drogi Lordzie Andre,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wraz z tym listem przysy³am Ci nowego rekruta do naszej stra¿y.");
	Doc_PrintLines(nDocID,0,"Udowodni³ swoj¹ przydatnoœæ, wykonuj¹c trudne i odpowiedzialne zadania.");
	Doc_PrintLines(nDocID,0,"Jestem pewien, ¿e bêdzie siê dobrze spisywa³, broni¹c króla oraz mieszkañców tego miasta.");
	Doc_PrintLine(nDocID,0,"Innosie, chroñ króla.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Kwatermistrz Martin");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = "Rozkazy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = name;
	text[2] = "Zabra³em ten list";
	text[3] = "bandycie Dexterowi.";
};


var int Use_RavensKidnapperMission_Addon_OneTime;

func void Use_RavensKidnapperMission_Addon()
{
	var int nDocID;
	if((Use_RavensKidnapperMission_Addon_OneTime == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Teraz mam to na piœmie. Kruk, dawny magnat, stoi za porwaniami mieszkañców Khorinis. Jego kryjówka znajduje siê gdzieœ za górami, w pó³nocno-wschodniej czêœci Khorinis. Vatras powinien zobaczyæ ten dokument.");
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"Dexter, ty draniu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kiedy jeszcze by³em magnatem, mo¿na by³o bardziej na tobie polegaæ.");
	Doc_PrintLines(nDocID,0,"Jeœli nie zdo³asz porwaæ wiêcej ludzi z miasta i przys³aæ ich do mnie, to bêdziemy mieli niez³y problem z ch³opakami w naszej kryjówce.");
	Doc_PrintLines(nDocID,0,"Potrzebujê tu wiêcej niewolników albo ch³opaki zaczn¹ siê buntowaæ. Chyba nie muszê ci mówiæ, co to znaczy, prawda?");
	Doc_PrintLines(nDocID,0,"Jestem bardzo bliski dostania siê do œwi¹tyni. Nie mogê sobie pozwoliæ na ¿adne, absolutnie ¿adne k³opoty.");
	Doc_PrintLines(nDocID,0,"A, jest jeszcze jeden problem:");
	Doc_PrintLines(nDocID,0,"Prêdzej czy póŸniej bêdziemy musieli znaleŸæ drogê przez wysokie góry w pó³nocno-wschodnim Khorinis. Piraci nie zapewni¹ nam transportu, kiedy przestaniemy im p³aciæ.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Kruk");
	Doc_Show(nDocID);
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = "List polecaj¹cy od Vatrasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = "List polecaj¹cy od Vatrasa";
	text[2] = "powinien pomóc mi";
	text[3] = "wejœæ do klasztoru Magów Ognia";
	text[4] = "bez zap³aty.";
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bracia Ognia");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"W³aœnie poinformowano mnie, ¿e aby do³¹czyæ do waszego stowarzyszenia, trzeba wnieœæ op³atê.");
	Doc_PrintLines(nDocID,0,"List ten dostarczy oddany cz³owiek, który chcia³by zostaæ nowicjuszem w waszych szeregach.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Vatras");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = "Cenny pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = "List po¿egnalny Lucii";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_LuciasLoveLetter_Addon;
	scemeName = "MAP";
	description = name;
};


func void Use_LuciasLoveLetter_Addon()
{
	var int nDocID;
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Lucia napisa³a list po¿egnalny dla Elvricha. Z pewnoœci¹ bêdzie chcia³ go przeczytaæ.");
	MIS_LuciasLetter = LOG_Running;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Najdro¿szy Elvrichu,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"¯adne s³owa nie oddadz¹ tego, jak mi przykro.");
	Doc_PrintLines(nDocID,0,"Wiem, ¿e ciê¿ko bêdzie ci to zrozumieæ. Dosz³am jednak do wniosku, ¿e lepiej bêdzie dla nas obojga, jeœli znajdziesz sobie porz¹dniejsz¹ dziewczynê.");
	Doc_PrintLines(nDocID,0,"Udajê siê w miejsce, z którego ju¿ nie wrócê. Zapomnij o mnie. Nieprzyzwoita dziewczyna jak ja nie zas³uguje na takiego dobrego ch³opaka. ¯egnaj.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Lucia");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Kamieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_Rake(C_Item)
{
	name = "Grabie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Use_Rake()
{
};


instance ItRi_Addon_BanditTrader(C_Item)
{
	name = "Pierœcieñ gildii";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "RzeŸbiony pierœcieñ";
	text[2] = "zamorskiej gildii Araxos";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = "Dostawa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[2] = "Zabra³em ten list bandytom";
	text[3] = "za farm¹ Sekoba.";
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	var int nDocID;
	BanditTrader_Lieferung_Gelesen = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"15 krótkich mieczy");
	Doc_PrintLines(nDocID,0,"20 pa³aszy");
	Doc_PrintLines(nDocID,0,"25 bochenków chleba");
	Doc_PrintLines(nDocID,0,"15 butelek wina");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"To ju¿ ostatni raz.");
	Doc_PrintLines(nDocID,0,"Zaczyna robiæ siê za gor¹co.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Fernando");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Znalaz³em dokument potwierdzaj¹cy, ¿e Fernando jest handlarzem broni¹, którego szukam.");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = "Przesy³ka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Wiadomoœæ Vatrasa dla Saturasa";
};


func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Szanowny Saturasie,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Mam nadziejê, ¿e zbli¿asz siê do koñca. Sytuacja w mieœcie ostatnio siê uspokoi³a. Jednak obawiam siê, ¿e to cisza przed burz¹. Pospiesz siê, proszê. Potrzebujê ciê tutaj.");
	Doc_PrintLines(nDocID,0,"Przestudiowa³em zapiski i potwierdzam twoje podejrzenia. Symbole rzeczywiœcie wskazuj¹ na kulturê, która czci³a Adanosa. Dlatego musimy pozostaæ czujni i nie daæ siê zaœlepiæ s³owom fa³szywych proroków.");
	Doc_PrintLines(nDocID,0,"Zaginieni mieszkañcy zostali porwani przez Kruka, by³ego magnata. S¹ w rejonie, do którego z pewnoœci¹ zaprowadzi nas portal.");
	Doc_PrintLines(nDocID,0,"Jeszcze jedno – przysy³am Ci pomocnika. Osoba, która przyniesie ten list, jest doœæ wyj¹tkowa. Za ka¿dym razem, gdy na ciebie spogl¹da, ma w oku ten charakterystyczny b³ysk. Nie jestem jeszcze tego ca³kiem pewien, ale mo¿liwe, ¿e to ON, nawet jeœli inaczej go sobie wyobra¿aliœmy.");
	Doc_PrintLines(nDocID,0,"SprawdŸ go. Wierzê, ¿e mam racjê.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Vatras");
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = "Otwarta przesy³ka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = name;
	text[2] = "Wiadomoœæ Vatrasa dla Saturasa";
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = "Amulet z rudy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_WispDetector;
	on_unequip = UnEquip_WispDetector;
	description = "Amulet szukaj¹cego ognika";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int Equip_WispDetector_OneTime;

func void Equip_WispDetector()
{
	var C_Npc DetWsp;
	if(Equip_WispDetector_OneTime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WispSearching = WispSearch_NF;
		Equip_WispDetector_OneTime = TRUE;
	};
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	AI_Teleport(DetWsp,"TOT");
	Wld_SpawnNpcRange(self,Wisp_Detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(DetWsp,"TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp,"TOT");
};


instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name = "Miêso bagiennego szczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	description = name;
	text[1] = "Ma podejrzany zapach!";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = "Pierœcieñ Morgana";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = Equip_MorgansRing;
	on_unequip = UnEquip_MorgansRing;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[1] = "Pierœcieñ zdobiony jest mnóstwem piêknych run.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_MorgansRing()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
};

func void UnEquip_MorgansRing()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-10);
};


instance ItMi_Focus(C_Item)
{
	name = "Kamieñ ogniskuj¹cy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ItMi_Addon_Steel_Paket(C_Item)
{
	name = "Pakiet stali";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ta paczka jest NAPRAWDÊ ciê¿ka.";
	text[3] = "Zawiera spor¹ bry³ê stali.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Stara kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = value_StonePlateCommon;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Szara kamienna tablica";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value_StonePlateCommon;
};


func void Use_StonePlateCommon()
{
	var int nDocID;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,-1,70,50,90,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Kasta wojowników wywo³a³a gniew naszego boga.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"RADEMES, nastêpca QUARHODRONA, zosta³ wypêdzony. Ale jego z³owroga moc dotar³a do nas nawet z jego miejsca wygnania.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Byliœmy wobec niej bezsilni.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Na JARKENDAR spad³ gniew ADANOSA!");
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_01(C_Item)
{
	name = "Czerwona kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_01;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Czerwona kamienna tablica";
	text[3] = "";
};


func void Use_Addon_Stone_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"My, trzej pozostali przywódcy Rady Piêciu, za³o¿yliœmy pu³apki w œwi¹tyni i zapieczêtowaliœmy jej wejœcie. Oby miecz na zawsze ju¿ pozosta³ w mroku.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_05(C_Item)
{
	name = "¯ó³ta kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_05;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "¯ó³ta kamienna tablica";
	text[3] = "";
};


func void Use_Addon_Stone_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Ja, który sprzeciwi³em siê rozkazom trójki, zbudowa³em pierwsz¹ pu³apkê. I tylko ja znam w³aœciwe wrota.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_03(C_Item)
{
	name = "Niebieska kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_03;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Niebieska kamienna tablica";
	text[3] = "";
};


func void Use_Addon_Stone_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON przygotowa³ drug¹ pu³apkê. Tylko ten, kto nie zejdzie ze œcie¿ki œwiat³a, dotrze do trzeciej komnaty.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_04(C_Item)
{
	name = "Zielona kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_04;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Zielona kamienna tablica";
	text[3] = "";
};


func void Use_Addon_Stone_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Trzecia pu³apka zosta³a zbudowana przez QUARHODRONA i jedynie on wie, jak otworzyæ bramê.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_02(C_Item)
{
	name = "Fioletowa kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_02;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Fioletowa kamienna tablica";
	text[3] = "";
};


func void Use_Addon_Stone_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON by³ te¿ tym, który z pomoc¹ KHARDIMONA zapieczêtowa³ zewnêtrzn¹ bramê œwi¹tyni. ¯aden z nich nie prze¿y³ tego rytua³u.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jedynie ja pozosta³em, aby byæ œwiadkiem tych wydarzeñ.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Oby RADEMES przez ca³¹ wiecznoœæ gni³ wewn¹trz œwi¹tyni!");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Erfjkemvfj RADEMES Fjewheege Egdgsmkd!");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name = "Z³oty kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItSE_Addon_FrancisChest(C_Item)
{
	name = "Skrzynia ze skarbem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = FrancisChest;
	description = "Skrzynia ze skarbem";
	text[0] = "Skrzynia jest dosyæ ciê¿ka.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void FrancisChest()
{
	CreateInvItems(hero,ItMi_GoldChest,1);
	CreateInvItems(hero,ItMw_FrancisDagger_Mis,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_GoldCup,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
	Snd_Play("Geldbeutel");
	Print("Zdoby³em stertê ró¿nych rzeczy.");
};


instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = "Wynagrodzenie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseFrancisAbrechnung_Mis;
};


func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Statek kupiecki 'Syrena'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Suma ³upów: 14560");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Za³oga       : 9840");
	Doc_PrintLine(nDocID,0,"Oficerowie   : 2500");
	Doc_PrintLine(nDocID,0,"Kapitan      : 1200");
	Doc_PrintLine(nDocID,0,"----------------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"moja dzia³ka  : 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Fregata 'Miriam'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Suma ³upów: 4890");
	Doc_PrintLine(nDocID,0,"----------------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Za³oga       : 2390");
	Doc_PrintLine(nDocID,0,"Oficerowie   : 500");
	Doc_PrintLine(nDocID,0,"Kapitan      : 500");
	Doc_PrintLine(nDocID,0,"----------------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"moja dzia³ka  : 1000");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Statek handlowy 'Nico'");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Suma ³upów: 9970");
	Doc_PrintLine(nDocID,1,"----------------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Za³oga       : 5610");
	Doc_PrintLine(nDocID,1,"Oficerowie   : 1500");
	Doc_PrintLine(nDocID,1,"Kapitan      : 1000");
	Doc_PrintLine(nDocID,1,"----------------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"moja dzia³ka  : 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Statek kupiecki 'Maria'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Suma ³upów: 7851");
	Doc_PrintLine(nDocID,1,"----------------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Za³oga       : 4000");
	Doc_PrintLine(nDocID,1,"Oficerowie   : 750");
	Doc_PrintLine(nDocID,1,"Kapitan      : 1000");
	Doc_PrintLine(nDocID,1,"----------------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"moja dzia³ka  : 1701");
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dziennik Grega";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGregsLogbuch;
};


func void UseGregsLogbuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"Mam ju¿ doœæ tej pla¿y! Wokó³ tylko piasek. Nie mogê nawet spaæ, bo mnie wszêdzie swêdzi. Czas, ¿eby Kruk w koñcu sypn¹³ z³otem za wiêŸniów i ¿ebyœmy w koñcu st¹d odp³ynêli. Coœ mi siê zdaje, ¿e muszê powa¿nie pogadaæ z tym bufonem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Co ten pacan sobie wyobra¿a? Kaza³ odprawiæ mnie z kwitkiem swoim œmierdz¹cym najemnikom. Wkrótce siê dowie, z kim ma do czynienia. Na pocz¹tek za³atwiê tego s³u¿alca Bloodwyna.");
	Doc_PrintLines(nDocID,0,"Jeœli wkrótce nie zap³aci, bêdê musia³ zrobiæ siê naprawdê niemi³y.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLines(nDocID,1,"Bandyci siê rozzuchwalili. Wci¹¿ nie zap³acili za ostatni transport. Po prostu za ma³o wiemy. Muszê wybadaæ, co planuje Kruk.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Wezmê wiêkszoœæ za³ogi na kontynent i zabezpieczymy rudê. Francis zostanie z paroma ludŸmi i ufortyfikuje obóz.");
	Doc_PrintLines(nDocID,1,"Aby mieæ pewnoœæ, ¿e ka¿dy ma zajêcie, da³em Bonesowi zbrojê. Przekradnie siê w niej do obozu bandytów i dowie siê, co knuje Kruk.");
	Greg_GaveArmorToBones = TRUE;
	Doc_Show(nDocID);
};


instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz Bloodwyna";
	text[2] = "Pasuje do skrzyni";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_Addon_Heiler(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz kamiennego stra¿nika";
	text[2] = "Pasuje do skrzyni";
	text[3] = "w dziwnym budynku na bagnie";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "Kamienna tablica Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	text[2] = "Klucz do œwi¹tyni Adanosa";
};


func void Use_TempelTorKey()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  Jhehedra Akhantar");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name = "G³owa Bloodwyna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWR_Addon_TreasureMap(C_Item)
{
	name = "Mapa do skarbu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = name;
	text[0] = "";
	text[1] = "Na mapie s¹ zaznaczone jakieœ miejsca.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TreasureMap()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWR_Addon_TreasureMap);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Wiadomoœæ w butelce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "W œrodku jest kawa³ek papieru";
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(ItWR_Addon_TreasureMap,1);
};


instance itmi_erolskelch(C_Item)
{
	name = "Pêkniêta srebrna misa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

