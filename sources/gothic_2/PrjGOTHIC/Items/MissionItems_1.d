
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do skrzyni";
	text[3] = "Xardasa.";
};

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = "List Canthara do Sary.";
};


func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," Ostatnie ostrze¿enie");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," Wielokrotnie ju¿ ostrzega³em ciê");
	Doc_PrintLine(nDocID,0," w niezwykle przyjazny sposób,");
	Doc_PrintLine(nDocID,0," ¿e broñ zamówiona u ciebie tydzieñ");
	Doc_PrintLine(nDocID,0," temu jest mi wyj¹tkowo pilnie");
	Doc_PrintLine(nDocID,0," potrzebna.");
	Doc_PrintLine(nDocID,0," Jeœli szybko siê nie odezwiesz w tej");
	Doc_PrintLine(nDocID,0," sprawie, to zmusisz mnie do zmiany");
	Doc_PrintLine(nDocID,0," sposobu, w jaki ciê traktujê. Mam");
	Doc_PrintLine(nDocID,0," nadziejê, ¿e siê dobrze rozumiemy!!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Onar");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "Miecz dwurêczny Roda";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rod;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "Srebro Coragona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "Paczka Thekli";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "Ciê¿ki, z³oty talerz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Ozdobiono go stylizowanymi";
	text[3] = "imionami Onara i Marii.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_ValentinosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Valentina";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do skrzyni";
	text[3] = "Dextera.";
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "Lista";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "Lista zió³ Constantina.";
};


func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Zio³a alchemiczne");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Roœlina lecznicza");
	Doc_PrintLine(nDocID,0,"Ziele lecznicze");
	Doc_PrintLine(nDocID,0,"Korzeñ leczniczy");
	Doc_PrintLine(nDocID,0,"Ognista pokrzywa");
	Doc_PrintLine(nDocID,0,"Ogniste ziele");
	Doc_PrintLine(nDocID,0,"Ognisty korzeñ");
	Doc_PrintLine(nDocID,0,"Goblinie jagody");
	Doc_PrintLine(nDocID,0,"Smoczy korzeñ");
	Doc_PrintLine(nDocID,0,"Zêbate ziele");
	Doc_PrintLine(nDocID,0,"Rdest polny");
	Doc_PrintLine(nDocID,0,"Szczaw królewski");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Niech roœliny zbiera dla ciebie kandydat na ucznia - przekonasz siê, czy siê do czegoœ nadaje. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Z powa¿aniem, Zuris.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "Receptura";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = "Receptura esencji magicznej.";
};


func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mikstury magiczne");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Do warzenia mikstur magicznych alchemik potrzebuje - oprócz umiejêtnoœci - tak¿e:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ognistej pokrzywy");
	Doc_PrintLine(nDocID,0,"Ognistego ziela");
	Doc_PrintLine(nDocID,0,"Ognistego korzenia");
	Doc_PrintLines(nDocID,0,"oraz");
	Doc_PrintLine(nDocID,0,"Rdestu polnego");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mistrz Neoras");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "Przepustka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[3] = "Dziêki tym dokumentom nie";
	text[4] = "zatrzymaj¹ mnie stra¿nicy miejscy.";
};


func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Przepustka");
	Doc_PrintLine(nDocID,0,"        Khorinis    ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," Ten dokument uprawnia jego posiadacza");
	Doc_PrintLine(nDocID,0," do swobodnego poruszania siê po dolnej czêœci");
	Doc_PrintLine(nDocID,0," Khorinis przez czas nieograniczony.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    Larius,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    gubernator królewski");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMi_HerbPaket(C_Item)
{
	name = "Paczka ziela";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ciê¿ka, lepi¹ca siê paczka,";
	text[3] = "œmierdz¹ca bagiennym zielem.";
	text[5] = NAME_Value;
	count[5] = 200;
};

instance ItKe_Storage(C_Item)
{
	name = "Klucz do magazynu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do magazynu";
	text[3] = "portowego.";
};


const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "ŒledŸ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = "ŒledŸ";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Hering;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};


func void Use_SmellyFish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Hering);
};


instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "Dziwna ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = "Dziwnie wygl¹daj¹ca ryba.";
	text[2] = "Z t¹ ryb¹ jest coœ nie tak.";
	text[3] = "Wygl¹da, jakby ktoœ j¹ pozszywa³...";
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "Œmierdz¹ca notatka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "W rybie by³a schowana ta notatka.";
};


func void UseHalvorMessage()
{
	var int nDocID;
	Knows_Halvor = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    Nie wychylajcie siê! ");
	Doc_PrintLine(nDocID,0,"    Stra¿ zaczyna coœ podejrzewaæ.");
	Doc_PrintLine(nDocID,0,"    Nic nie róbcie, dopóki znów siê nie odezwê!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"        Halvor");
	Doc_Show(nDocID);
};


instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "Miecz Alrika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = Damage_Alrik;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Alrik;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	on_equip = Equip_AlriksSword;
	on_unequip = UnEquip_AlriksSword;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
};

func void UnEquip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-10);
};


instance ItWr_VatrasMessage(C_Item)
{
	name = "Zapieczêtowana wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Wiadomoœæ od Vatrasa";
	text[3] = "do Magów Ognia.";
};


func void UseVatrasMessage()
{
	var int nDocID;
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Drogi Isgarocie,");
	Doc_PrintLines(nDocID,0,"wyczuwam coraz mocniej obecnoœæ nie znanej nam si³y.");
	Doc_PrintLines(nDocID,0,"Czy to mo¿liwe, ¿e s³ugi Beliara nadchodz¹? Byæ mo¿e siê mylê,");
	Doc_PrintLines(nDocID,0,"s¹dzê jednak, ¿e Ojciec Pyrokar powinien wzi¹æ sprawy w swoje rêce. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Oby nasze mod³y zosta³y wys³uchane.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = "Wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[2] = "Wiadomoœæ od Vatrasa";
	text[3] = "do Magów Ognia.";
	text[4] = "Pieczêæ zosta³a z³amana.";
};


func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Drogi Isgarocie,");
	Doc_PrintLines(nDocID,0,"wyczuwam coraz mocniej obecnoœæ nie znanej nam si³y.");
	Doc_PrintLines(nDocID,0,"Czy to mo¿liwe, ¿e s³ugi Beliara nadchodz¹? Byæ mo¿e siê mylê,");
	Doc_PrintLines(nDocID,0,"s¹dzê jednak, ¿e Ojciec Pyrokar powinien wzi¹æ sprawy w swoje rêce. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Oby nasze mod³y zosta³y wys³uchane.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItKe_Hotel(C_Item)
{
	name = "Klucz do pokoju";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do izby w";
	text[3] = "gospodzie.";
};

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = "Zardzewia³y klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ten nie opar³ siê dzia³aniu s³onej, morskiej wody.";
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = "Zardzewia³y klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do piwnicy w gospodzie.";
};

instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do portalu klasztoru";
	text[3] = "Innosa.";
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do skarbca";
	text[3] = "klasztornego.";
};

instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do spi¿arni";
	text[3] = "klasztornej.";
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do komnaty";
	text[3] = "w klasztorze.";
};

instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do biblioteki";
	text[3] = "klasztornej.";
};

instance ItFo_Schafswurst(C_Item)
{
	name = "Barania kie³basa";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};


func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Esencja ducha";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_LittleMana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance Holy_Hammer_MIS(C_Item)
{
	name = "Œwiêty m³ot";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "Obra¿enia:                   ??";
	text[3] = "Wymagana si³a:          ??";
	text[4] = "Broñ dwurêczna";
	text[5] = "Wartoœæ:  niemo¿liwa do ustalenia";
};

instance ItKe_MagicChest(C_Item)
{
	name = "Stary klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Stary, ¿elazny klucz.";
	text[3] = "Prawdopodobnie otwiera";
	text[4] = "jak¹œ k³ódkê.";
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "Propozycja Lee dla paladynów";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[3] = "Dziêki tej wiadomoœci byæ mo¿e uda";
	text[4] = "mi siê porozmawiaæ z Lordem Hagenem.";
};


func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Szanowny Lordzie Hagenie,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"obydwaj zdajemy sobie sprawê z sytuacji, wiêc przejdê od razu do rzeczy:");
	Doc_PrintLines(nDocID,0,"uniewinnij mnie i moich ludzi wobec Jego Wysokoœci i samego Innosa.");
	Doc_PrintLines(nDocID,0,"W zamian zobowi¹zujemy siê pomóc Ci w obronie miasta i okolicznych ziem.");
	Doc_PrintLines(nDocID,0,"Osobiœcie dopilnujê te¿, by moi ludzie trzymali siê z dala od tutejszych farm - naturalnie oprócz zagród Onara, gdzie nadal bêdziemy stacjonowali.");
	Doc_PrintLines(nDocID,0,"Wiem, ¿e statek, którym zamierzacie wróciæ na kontynent, mo¿e zabraæ kilka dodatkowych osób. Gdy bêdziecie ruszaæ w drogê, chcê pop³yn¹æ z wami.");
	Doc_PrintLines(nDocID,0,"Zaklinam ciê: rozwa¿ dobrze moje s³owa i podejmij rozs¹dn¹ decyzjê.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Podpisano   Genera³ Lee");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "Wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
};


func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Zatrzymujcie wszystkich, którzy");
	Doc_PrintLine(nDocID,0,"przyjd¹ od strony gór.");
	Doc_PrintLine(nDocID,0,"Jeœli ktoœ przekroczy prze³êcz,");
	Doc_PrintLine(nDocID,0,"bêdzie to prawdopodobnie pewien");
	Doc_PrintLine(nDocID,0,"starzec. Nie dajcie siê");
	Doc_PrintLine(nDocID,0,"zwieœæ - to niebezpieczny mag.");
	Doc_PrintLine(nDocID,0,"Miejcie na niego oko.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mo¿e siê z nim skontaktowaæ cz³owiek,");
	Doc_PrintLine(nDocID,0,"którego szukamy.");
	Doc_PrintLine(nDocID,0,"Wraz z tym listem otrzymujecie");
	Doc_PrintLine(nDocID,0,"30 sztuk z³ota.");
	Doc_PrintLine(nDocID,0,"Kolejne 30 otrzyma osoba,");
	Doc_PrintLine(nDocID,0,"która go zabije.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"G³owê przynieœcie do starej kopalni.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,".....D.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "List goñczy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[3] = "Moja podobizna!";
	text[4] = "";
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};


instance ItKe_Bandit(C_Item)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ten klucz nale¿a³";
	text[3] = "do bandyty.";
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "£uk myœliwski";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "£uk myœliwski Bospera.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "Pierœcieñ Constantina";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Drewniana ochrona";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "Pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Innosie, W³adco Prawoœci,";
	text[3] = "pob³ogos³aw mnie,";
	text[4] = "i chroñ przed wrogiem.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = "Stary mosiê¿ny klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ze szkieletu w pomieszczeniu 1";
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "Stary mosiê¿ny klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ze szkieletu w pomieszczeniu 2";
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "Stary mosiê¿ny klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ze szkieletu w pomieszczeniu 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name = "Stara rycerska zbroja";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Valentino(C_Item)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do kufra";
	text[3] = "Valentina.";
};

instance ItKe_Buerger(C_Item)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Le¿a³ na parapecie.";
	text[3] = "";
};

instance ItKe_Richter(C_Item)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do kufra";
	text[3] = "sêdziego.";
};

instance ItKe_Salandril(C_Item)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "alchemika Salandrila.";
	text[3] = "";
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Niewielki mosiê¿ny klucz";
	text[3] = "z siedziby paladynów.";
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ma³y klucz.";
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Zardzewia³y klucz do drzwi";
	text[3] = "z kana³ów.";
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "Ksiêga D³ugów";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Ksiêga D³ugów Lehmara.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
};


func void UseSchuldBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Umowy i d³ugi");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ja, Mistrz Thorben, stolarz z Khorinis, jestem winien sz.p. Lehmarowi 200 monet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"          Thorben");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ja, Coragon, w³aœciciel gospody w Khorinis, jestem winien sz.p. Lehmarowi 150 monet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"          Coragon");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ja, Hanna, w³aœcicielka gospody w Khorinis, jestem winna sz.p. Lehmarowi 250 monet.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"          Hanna");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "S³oneczny aloes";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name = "Klucz do pokoju";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "gospody 'Pod Martw¹ Harpi¹'.";
	text[3] = "";
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Kusza Dragomira";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damageTotal = Damage_LeichteArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

