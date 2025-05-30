
instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = "List Xardasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Podejrzewa�em, �e �r�d�em z�a w G�rniczej Dolinie by� jeden ze smok�w.");
	Doc_PrintLines(nDocID,0,"Myli�em si�.");
	Doc_PrintLines(nDocID,0,"Je�li wszystko przebieg�o zgodnie z moim");
	Doc_PrintLines(nDocID,0,"planem, szukasz teraz zapewne Dworu Irdorath.");
	Doc_PrintLines(nDocID,0,"Ksi��ka, kt�r� da�e� Pyrokarowi, zawiera wszystkie potrzebne Ci wskaz�wki.");
	Doc_PrintLines(nDocID,0,"Powinienem by� si� domy�li�, dlaczego Poszukiwacze tak bardzo");
	Doc_PrintLines(nDocID,0,"chcieli j� zdoby�.");
	Doc_PrintLines(nDocID,0,"Musisz j� odzyska�!");
	Doc_PrintLines(nDocID,0,"Otworzysz j� s�owami 'XARAK BENDARDO'. Tylko nie m�w o tym nikomu!");
	Doc_PrintLines(nDocID,0,"Musz� zaj�� si� teraz wa�niejszymi sprawami.");
	Doc_PrintLines(nDocID,0,"Odt�d jeste� zdany jedynie na siebie. Tylko Ty mo�esz pokona� �r�d�o z�a.");
	Doc_PrintLines(nDocID,0,"Jeszcze si� spotkamy!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                             Xardas.");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"W swoim li�cie Xardas poinformowa� mnie, jakie s�owa otwieraj� ksi�g� DW�R IRDORATH.");
	};
	MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
};


instance ItKe_MonastarySecretLibrary_Mis(C_Item)
{
	name = "Klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "z ksi�gi 'Dw�r Irdorath'";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = "Dw�r Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Uda�o mi si� otworzy� ksi�g� Xardasa. Znalaz�em w niej tajemnicz� wiadomo�� i dziwny klucz. Kto wie, co jeszcze kryje si� w klasztornych podziemiach.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
{
	name = "Dw�r Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath_Open;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;
	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Przeczyta�em ksi�g� Xardasa. Jest w niej wzmianka o tajnej bibliotece, kt�ra zapewne znajduje si� w podziemiach klasztoru.");
	};
	ItWr_SCReadsHallsofIrdorath = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...tak oto ukry�em wej�cie do biblioteki za zamaskowanymi drzwiami, by uchroni� moje zapiski ze �wi�ty� Beliara.");
	Doc_PrintLines(nDocID,0,"Gdyby dowiedzieli si� o nich moi bracia, mogliby je pochopnie zniszczy�.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Teraz za� wiedz� tylko, �e �wi�tynie te niegdy� istnia�y.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Na wszelki wypadek zostawi�em kilka s�ug na stra�y biblioteki.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ten klucz otwiera ostatnie drzwi.");
	Doc_Show(nDocID);
};


instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = "Zakurzona ksi�ga";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
};


func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...Jestem pewien, �e ta budowla to Dw�r Irdorath. Znajduje si� on na niewielkiej wyspie, ca�kiem blisko przystani w Khorinis. Nie ma w�tpliwo�ci, �e Beliara interesuje ruda z kopal�...");
	Doc_PrintLines(nDocID,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"...Im s� pot�niejsi, tym bardziej przydatni b�d� dla niego jako o�ywie�czy s�udzy. Pokonanie tych upad�ych paladyn�w to nie�atwe zadanie. Jeden z nich wpad� w moje r�ce. Mam tylko nadziej�, �e pozostali nie dowiedz� si� o nim...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...Upad�y paladyn nie reaguje na �adne bod�ce. Jego zbroj� i inne przedmioty schowa�em w tylnej komorze. Drzwi mo�na otworzy� tylko od wewn�trz, wi�c stworzy�em na t� okazj� specjaln� run� teleportacji. Instrukcje s� w almanachu, by m�g� je znale�� Wybraniec...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"...Znaki s� jasne! Gdy przyb�dzie Wybrany, przyda si� mu ka�da pomoc. Beliar i tak jest ju� zbyt silny. Zgromadzi�em tu na wszelki wypadek kilka przydatnych artefakt�w. Podejrzewam, �e Wybraniec b�dzie jednym z nas,");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"dlatego spisa�em dla niego instrukcje w almanachu.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...Nie mam ju� z�udze�. Jeste�my bezbronni wobec wyrok�w losu. Gdy Beliar odpowiednio uro�nie w si��, spr�buje przej�� w�adz� nad ca�ym �wiatem. Musz� znale�� Wybra�ca!");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"...Wybuchnie wojna, kt�ra zadecyduje o losach �wiata. Chyba jestem jedynym, kt�ry potrafi odczyta� znaki. Pozostali po prostu je ignoruj�. Wybraniec nadejdzie, a jego przyj�cie b�dzie oznacza� pocz�tek wojny. Odwieczna rywalizacja mo�e zosta� rozstrzygni�ta.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"Nie b�d� sta� bezczynnie, pozwalaj�c innym decydowa� o losach �wiata.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...Ze staro�ytnych pism dowiedzia�em si�, jak stworzy� legendarn� bro� pradawnych Smoczych Mistrz�w. Nie wiem jednak, gdzie szuka� potrzebnych sk�adnik�w. Na wszelki wypadek zapisa�em wszystko w almanachu. Kto wie, mo�e przyjdzie nam walczy� tak�e ze smokami.");
	};
	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = "Podniszczony list";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = name;
	text[0] = "z ksi�gi 'Dw�r Irdorath'";
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"               Lampa rzuca �wiat�o");
	Doc_PrintLine(nDocID,0,"               na podziemne korytarze");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = "Mapa morska wyspy Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if((MIS_ShipIsFree == FALSE) && (Kapitel < 6))
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship,"Wygl�da na to, �e musz� si� dosta� na wysp� nieprzyjaciela. B�d� potrzebowa� statku, za�ogi i kapitana.");
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
	MIS_SCKnowsWayToIrdorath = TRUE;
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = "Akt okr�towy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = name;
	text[3] = "Upowa�nienie";
	text[4] = "do korzystania z okr�tu paladyn�w.";
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," Upowa�nienie");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," Ten dokument uprawnia jego");
	Doc_PrintLine(nDocID,0," posiadacza do swobodnego wykorzystania");
	Doc_PrintLine(nDocID,0," kr�lewskiej galery wojennej Lorda Hagena");
	Doc_PrintLine(nDocID,0," przez czas nieograniczony.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     kr�lewska piecz��");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITKE_OC_MAINGATE_MIS(C_Item)
{
	name = "Klucz do wie�y stra�nika g��wnej bramy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = "Klucz do kajuty kapita�skiej";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "�zy Innosa";
	text[1] = "???";
	count[1] = Mana_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_PotionOfDeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
		PrintScreen(PRINT_LearnSTR5,-1,45,FONT_Screen,2);
		PrintScreen(PRINT_LearnDEX5,-1,55,FONT_Screen,2);
		PrintScreen(PRINT_FullyHealed,-1,65,FONT_Screen,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_Speed);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "�zy Innosa";
	text[1] = "Ta mikstura zapewnia Magom Ognia specjalne moce,";
	text[2] = "je�li u�yje jej kto� inny, umrze.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = "�wi�ta Aura Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "�wi�ta aura Innosa.";
	text[2] = "Ten amulet chroni swego posiadacza";
	text[3] = "przed wszelkimi obra�eniami.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
};


instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Leczenie z na�ogu";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};

