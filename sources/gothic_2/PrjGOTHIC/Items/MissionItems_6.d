
instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "Bardzo dziwna sk�rzana torba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[0] = "";
	text[1] = "Wydaje si� zawiera�";
	text[2] = "co� twardego i jaki�";
	text[3] = "dokument.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	concatText = ConcatStrings("2",PRINT_ItemsErhalten);
	Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = "List ostrzegawczy Xardasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"M�j m�ody przyjacielu - wielce mnie rozczarowa�a twoja postawa. Jak mog�e� odp�yn�� bez Oka Innosa?");
	Doc_PrintLines(nDocID,0,"Liczy� mog� jedynie na to, �e nawet twe niedbalstwo ma granice. W przeciwnym wypadku nie wygnasz Z�a ze �wiata i b�d� musia� osobi�cie ocali� ci� od twej g�upoty.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      Xardas");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon(C_Item)
{
	name = "Stary list";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "Pisany niepewn� r�k�.";
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zawiod�em. P�onne me nadzieje na zatrzymanie Inubisa na �cie�ce dobra.");
	Doc_PrintLines(nDocID,0,"Na pocz�tku s�dzi�em, �e nie �yj�, ale w starych ko�ciach Ivana drzemie jeszcze si�a.");
	Doc_PrintLines(nDocID,0,"Inubis jednak powsta� z martwych i szuka zemsty za wygnanie przez prastary zakon paladyn�w.");
	Doc_PrintLines(nDocID,0,"Towarzyszy mu wielu wyznawc�w... Jak wojownik pokroju Inubisa m�g� sta� si� tak z�y?");
	Doc_PrintLines(nDocID,0,"Znalaz�em w tej krypcie jego gr�b, nie wiem jednak, czy zdo�am przekaza� komu� wie�ci o moim odkryciu, pisz� wi�c te s�owa w nadziei na to, �e zostan� odnalezione.");
	Doc_PrintLines(nDocID,0,"Strze�cie si�. Pot�ny nieprzyjaciel si�ga po dusze sprawiedliwych. Inubis nie b�dzie ostatni...");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Niechaj Innos chroni wasze dusze");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 Ivan");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name = "Klucz orka-pu�kownika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_UNDEAD_01(C_Item)
{
	name = "Klucz Archola";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name = "Klucz klucznika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "Klucz do komnaty czarnego maga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "Zw�j czarnego maga";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = name;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"KHADOSH ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"EMEM KADAR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Niech Oko Mocy o�wietli tw� �cie�k�.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Zw�j czarnego maga zawiera s�owa KHADOSH EMEM KADAR. Brzmi to jak jakie� zakl�cie, ale do czego s�u�y - i czym jest Oko Mocy?");
};


instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = "Klucz do kufra czarnego maga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name = "Receptura";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = name;
};


func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zdo�a�em wskrzesi� pradawn� sztuk�, boj� si� jednak, �e nie spodoba si� to Feodaronowi.");
	Doc_PrintLines(nDocID,0,"Musz� zmiesza� ca�e jego potomstwo i stworzy� z niego mikstur� w moim laboratorium. Gdyby jeszcze tylko nie siedzia� bez przerwy na tych jajach... Nadal jednak czuj� wobec niego szacunek.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Embarla Firgasto:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"10 smoczych jaj, jedna starta na proszek czarna per�a i szczypta siarki.");
	Doc_PrintLines(nDocID,0,"Mikstur� nale�y doprowadzi� do wrzenia i miesza� bez przerwy podczas destylacji.");
	Doc_PrintLines(nDocID,0,"Substancji ko�cowej nale�y u�ywa� z umiarem, gdy� wywo�uje silne efekty uboczne i mo�e rozchwia� ca�y system kontroli nad magi�.");
	Doc_Show(nDocID);
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};


instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ju� od 36 dni czekam na wezwanie. Zaczynam w�tpi�, czy si� doczekam - mimo �e zrobi�em wszystko, o co mnie proszono. Lata�em dla nich i przynosi�em r�ne rzeczy jak jaki� lokaj.");
	Doc_PrintLines(nDocID,0,"Klucznik nakaza� mi zamkni�cie krat, ale jeszcze si� do tego nie zabra�em. Jak tak dalej p�jdzie, to ka�dy b�dzie sobie m�g� po prostu wej�� przez bram�...");
	Doc_PrintLines(nDocID,0,"Szkoda, �e nie pami�tam w�a�ciwych kombinacji.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bardzo dawno ju� nie zakrada�em si� do wielkiej komnaty i nie mog� si� doczeka� spotkania z Mistrzem. Ciekaw jestem, czy pozwol� mi na nie, gdy ju� do nich do��cz�.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Wczoraj podj��em pr�b�, ale dotar�em tylko do komnaty z dwoma d�wigniami - nawet nie zdo�a�em wypr�bowa� kombinacji prze��cznik�w w zachodnim skrzydle! Ta �winia pozamyka�a komnaty. Jutro spr�buj� wydosta� od niego klucz...");
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Dziennik ucznia czarnego maga wspomina o komnatach z d�wigniami, kluczniku, kombinacji prze��cznik�w... Trzeba to zapami�ta�, nigdy nie wiadomo, kiedy mo�e si� przyda�.");
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = "Stary list";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = name;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"   Ostatnie ostrze�enie!");
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nic mnie nie obchodzi, czy uda si� wam przele�� przez most z drugiej strony. Dla mnie mo�ecie piec si� w piekle.");
	Doc_PrintLines(nDocID,0,"Tak d�ugo, jak jestem w swoich w�o�ciach, most b�dzie podniesiony, a ka�dego m�drka, kt�ry b�dzie pr�bowa� ustrzeli� z �uku prze��cznik, �eby si� tu dosta�, osobi�cie wypatrosz� i powiesz� na najbli�szym drzewie!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      Archol");
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "Oko Mocy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

