
instance ItWrTemplemap(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTemplemap;
	description = "Szkic �wi�tyni";
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseTemplemap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Temple.tga",1);
	Doc_Show(nDocID);
};


instance ItMiAlarmhorn(C_Item)
{
	name = "R�g";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 9;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Sleeper_01(C_Item)
{
	name = "Pos��ek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Pos��ek przedstawia zniekszta�con�";
	text[1] = "posta� w masce.";
	text[2] = "Mask� otacza sze�� ��de�.";
};

instance Weltenspalter(C_Item)
{
	name = "Rozcinacz �wiat�w";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Ten miecz nale�a� do zamienionego w o�ywie�ca";
	text[1] = "kap�ana ork�w, Varrag-Hashora.";
	text[2] = "Niestety, po tych wszystkich latach";
	text[3] = "nie nadaje si� ju� do u�ytku!";
	text[4] = "Mo�e da si� go wykorzysta�";
	text[5] = "w inny spos�b.";
};

instance Lichtbringer(C_Item)
{
	name = "Ostrze �wiat�a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Ten miecz nale�a� do zamienionego w o�ywie�ca";
	text[1] = "kap�ana ork�w, Varrag-Kasorga.";
	text[2] = "Niestety, po tych wszystkich latach";
	text[3] = "nie nadaje si� ju� do u�ytku!";
	text[4] = "Mo�e da si� go wykorzysta�";
	text[5] = "w inny spos�b.";
};

instance Zeitenklinge(C_Item)
{
	name = "Ostrze Czasu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Ten miecz nale�a� do zamienionego w o�ywie�ca";
	text[1] = "kap�ana ork�w, Varrag-Unhilqta.";
	text[2] = "Niestety, po tych wszystkich latach";
	text[3] = "nie nadaje si� ju� do u�ytku!";
	text[4] = "Mo�e da si� go wykorzysta�";
	text[5] = "w inny spos�b.";
};

instance Daemonenstreich(C_Item)
{
	name = "Gniew Demon�w";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Ten miecz nale�a� do zamienionego w o�ywie�ca";
	text[1] = "kap�ana ork�w, Varrag-Ruuushka.";
	text[2] = "Niestety, po tych wszystkich latach";
	text[3] = "nie nadaje si� ju� do u�ytku!";
	text[4] = "Mo�e da si� go wykorzysta�";
	text[5] = "w inny spos�b.";
};

instance Bannklinge(C_Item)
{
	name = "Wygnaniec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Ten miecz nale�a� do zamienionego w o�ywie�ca";
	text[1] = "kap�ana ork�w, Grash-Varrag-Arushata.";
	text[2] = "Niestety, po tych wszystkich latach";
	text[3] = "nie nadaje si� ju� do u�ytku!";
	text[4] = "Mo�e da si� go wykorzysta�";
	text[5] = "w inny spos�b.";
};

instance Mythrilklinge(C_Item)
{
	name = "Przedziwny miecz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Przepi�kny miecz.";
	text[1] = "Ostrze zdobi� prastare runy.";
	text[2] = "Mo�e Xardasowi uda si� je odczyta�!";
	text[3] = "P�ki co, lepiej go nie u�ywa�.";
	text[4] = " ";
};

instance Mythrilklinge01(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Xardas twierdzi, �e miecz nazywa si� URIZIEL.";
	text[1] = "Jest pono� bardzo stary i dysponowa� niegdy�";
	text[2] = "pot�n� moc� magiczn�, ale j� utraci�.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge02(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "To staro�ytny miecz Uriziel.";
	text[1] = "Uriziel zosta� magicznie na�adowany.";
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dam_Fire;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge03(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Magiczny kryszta� zosta� usuni�ty z miecza.";
	text[1] = "Jest to wci�� bardzo pot�na bro�, cho�";
	text[2] = "pozbawiona mocy magicznych.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Scroll4Milten(C_Item)
{
	name = "Przekaz energii";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWrScroll.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Zakl�cie, kt�re pozwoli na�adowa�";
	text[1] = "Uriziela magiczn� energi�.";
	text[2] = "Nie mog� go wykorzysta�.";
};

instance ItKe_SunkenTower(C_Item)
{
	name = "Klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otwiera drzwi w";
	text[1] = "zatopionej wie�y.";
};

instance DungeonKey(C_Item)
{
	name = "Klucz do loch�w";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otwiera drzwi w lochach";
	text[0] = "Starego Obozu.";
};

instance UrizielRune(C_Item)
{
	name = "Fala �mierci Uriziela";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = name;
	text[0] = "Ta pot�na runa magiczna zawiera";
	text[1] = "staro�ytn� moc miecza Uriziela.";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Manakosten;
	count[3] = SPL_SENDCAST_MASSDEATH;
	text[4] = NAME_Dam_Magic;
	count[4] = SPL_DAMAGE_MASSDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

