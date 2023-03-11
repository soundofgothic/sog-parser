
const int Value_Z�hne = 10;
const int Value_Krallen = 15;
const int Value_Wolfsfell = 10;
const int Value_Orkhundfell = 15;
const int Value_Panzerplatte = 50;
const int Value_Crawlerzangen = 10;
const int Value_Shadowbeastfell = 100;
const int Value_Lurkerklaue = 15;
const int Value_Lurkerhaut = 25;
const int Value_Sumpfhaihaut = 200;
const int Value_Trollfell = 300;
const int Value_Fl�gel = 15;
const int Value_Stachel = 25;
const int Value_Feuerzunge = 500;
const int Value_Sumpfhaiz�hne = 500;
const int Value_Shadowbeasthorn = 500;
const int Value_Trollhauer = 500;
const int Value_Steinherz = 1000;
const int Value_Feuerherz = 1000;
const int Value_Eisherz = 1000;
const int Value_Eistueck = 100;

instance ItAt_Teeth_01(C_Item)
{
	name = "K�y";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Z�hne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Z�hne;
};

instance ItAt_Wolf_01(C_Item)
{
	name = "Sk�ra wilka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Wolfsfell;
};

instance ItAt_Wolf_02(C_Item)
{
	name = "Sk�ra orkowego psa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Orkhundfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Orkhundfell;
};

instance ItAt_Waran_01(C_Item)
{
	name = "J�zyk Ognia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Feuerzunge;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Feuerzunge;
};

instance ItAt_Claws_01(C_Item)
{
	name = "Pazury";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Krallen;
};

instance ItAt_Crawler_02(C_Item)
{
	name = "P�ytka z pancerza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Panzerplatte;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = "Fragment pancerza pe�zacza.";
	text[4] = NAME_Value;
	count[4] = Value_Panzerplatte;
};

instance ItAt_Crawler_01(C_Item)
{
	name = "Wn�trzno�ci pe�zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Crawlerzangen;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Crawlerzangen;
};

instance ItAt_Shadow_01(C_Item)
{
	name = "Sk�ra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeastfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = "Sk�ra cieniostwora";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeastfell;
};

instance ItAt_Shadow_02(C_Item)
{
	name = "R�g";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = "R�g cieniostwora";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeasthorn;
};

instance ItAt_Lurker_01(C_Item)
{
	name = "Pazury topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerklaue;
};

instance ItAt_Lurker_02(C_Item)
{
	name = "Sk�ra topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerhaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerhaut;
};

instance ItAt_Troll_02(C_Item)
{
	name = "Kie� trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Trollhauer;
};

instance ItAt_Troll_01(C_Item)
{
	name = "Sk�ra trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Trollfell;
};

instance ItAt_Swampshark_01(C_Item)
{
	name = "Sk�ra b�otnego w�a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaihaut;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Sumpfhaihaut;
};

instance ItAt_Swampshark_02(C_Item)
{
	name = "K�y b�otnego w�a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaiz�hne;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Sumpfhaiz�hne;
};

instance ItAt_Bloodfly_01(C_Item)
{
	name = "Skrzyd�a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Fl�gel;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Fl�gel;
};

instance ItAt_Bloodfly_02(C_Item)
{
	name = "��d�o krwiopijcy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stachel;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Stachel;
};

instance ItAt_StoneGolem_01(C_Item)
{
	name = "Serce Kamiennego Golema";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = Value_Steinherz;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "To serce pochodzi ze szcz�tk�w";
	text[1] = "pokonanego kamiennego Golema.";
	text[2] = "Jego magiczna moc pozwala";
	text[3] = "wyrzuci� przeciwnika w powietrze.";
	text[5] = NAME_Value;
	count[5] = Value_Steinherz;
};

instance ItAt_FireGolem_01(C_Item)
{
	name = "Serce Ognistego Golema";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = Value_Feuerherz;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "To serce pochodzi ze szcz�tk�w";
	text[1] = "pokonanego ognistego Golema.";
	text[2] = "Jego magiczna moc pozwala";
	text[3] = "podpali� przeciwnika.";
	text[5] = NAME_Value;
	count[5] = Value_Feuerherz;
};

instance ItAt_IceGolem_01(C_Item)
{
	name = "Serce Lodowego Golema";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = Value_Eisherz;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "To serce pochodzi ze szcz�tk�w";
	text[1] = "pokonanego lodowego Golema.";
	text[2] = "Jego magiczna moc pozwala";
	text[3] = "zamrozi� przeciwnika.";
	text[5] = NAME_Value;
	count[5] = Value_Eisherz;
};

instance ItAt_IceGolem_02(C_Item)
{
	name = "Fragment Lodowego Golema";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = Value_Eistueck;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Ten fragment pochodzi ze szcz�tk�w";
	text[1] = "pokonanego lodowego Golema.";
	text[4] = NAME_Value;
	count[4] = Value_Eistueck;
};

