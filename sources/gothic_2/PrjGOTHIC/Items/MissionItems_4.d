
const int Value_Dragonegg = 200;
const int Value_OrcEliteRing = 130;

instance ItAm_Mana_Angar_MIS(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_Mana;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Mana_Angar;
	on_unequip = UnEquip_ItAm_Mana_Angar;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Magiczny amulet Angara";
	text[2] = NAME_Bonus_Mana;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Mana_Angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_Mana;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Am_Mana;
};

func void UnEquip_ItAm_Mana_Angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_Mana;
	if(self.attribute[ATR_MANA] > Am_Mana)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_Mana;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ItMW_1H_FerrosSword_Mis(C_Item)
{
	name = "Miecz Ferosa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_1H_2;
	damageTotal = Damage_Special_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_KerolothsGeldbeutel_MIS(C_Item)
{
	name = "Sk�rzana torba Kerolotha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseKerolothsGeldbeutel;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseKerolothsGeldbeutel()
{
	CreateInvItems(self,ItMi_Gold,300);
	CreateInvItems(self,ItMi_KerolothsGeldbeutelLeer_MIS,1);
	Print(PRINT_KerolothsGeldBeutel);
	Snd_Play("Geldbeutel");
};


instance ItMi_KerolothsGeldbeutelLeer_MIS(C_Item)
{
	name = "Sk�rzana torba Kerolotha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_SengrathsArmbrust_MIS(C_Item)
{
	name = "Kusza Sengratha";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damageTotal = Damage_MilArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MilArmbrust;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TalbinsLurkerSkin(C_Item)
{
	name = "Sk�ra topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ReptileSkin;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Na wewn�trznej stronie wygarbowano imi� 'Talbin'.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DragonEgg_MIS(C_Item)
{
	name = "Smocze jajo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Dragonegg;
	visual = "ItAt_DragonEgg.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Jajo jest ciep�e, a ze �rodka";
	text[1] = "dochodzi s�aby d�wi�k, jakby drapanie.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_OrcEliteRing(C_Item)
{
	name = "Pier�cie� orkowych przyw�dc�w";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = Value_OrcEliteRing;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_OrcEliteRing;
	on_unequip = UnEquip_OrcEliteRing;
	description = name;
	text[0] = "Pier�cie� jest szorstki i";
	text[1] = "dziwnie zimny w dotyku.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_OrcEliteRing()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
	Print(PRINT_OrcEliteRingEquip);
};

func void UnEquip_OrcEliteRing()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,20);
};


var int Neoras_SCUsedDragonEggDrink;

instance ItPo_DragonEggDrinkNeoras_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_DragonEggDrinkNeoras;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Mikstura wydzieliny ze smoczych jaj";
	text[3] = "Skutki nieznane.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_DragonEggDrinkNeoras()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Elixier);
	B_RaiseAttribute(self,ATR_STRENGTH,3);
	Snd_Play("DEM_Warn");
	Neoras_SCUsedDragonEggDrink = TRUE;
};


instance ItWr_Map_Orcelite_MIS(C_Item)
{
	name = "Orkowa mapa wojenna";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Orcelite_MIS;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


var int Use_Map_NewWorld_Orcelite_MIS_OneTime;

func void Use_Map_NewWorld_Orcelite_MIS()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_Orcelite_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Orcelite.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
	if((Use_Map_NewWorld_Orcelite_MIS_OneTime == FALSE) && (MIS_KillOrkOberst != 0))
	{
		B_LogEntry(TOPIC_OrcElite,"Przy orkowym pu�kowniku znalaz�em dziwn� map�. Wygl�da jak plan dzia�a� wojennych tych stworze�.");
		Use_Map_NewWorld_Orcelite_MIS_OneTime = TRUE;
	};
};


instance ItWr_Map_Caves_MIS(C_Item)
{
	name = "Jaskinie Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Caves_MIS;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Caves_MIS()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_Caves_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Caves.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};

