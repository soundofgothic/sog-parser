
instance ItSe_ErzFisch(C_Item)
{
	name = "Kulista ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ErzFisch;
	description = name;
	text[2] = "W tej rybie coœ schowano.";
};


func void Use_ErzFisch()
{
	B_PlayerFindItem(ItMi_Nugget,1);
};


instance ItSe_GoldFisch(C_Item)
{
	name = "Ciê¿ka ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_GoldFisch;
	description = name;
	text[2] = "W tej rybie coœ schowano.";
};


func void Use_GoldFisch()
{
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ItSe_Ringfisch(C_Item)
{
	name = "Ma³a ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Ringfisch;
	description = name;
	text[2] = "W tej rybie coœ schowano.";
};


func void Use_Ringfisch()
{
	B_PlayerFindItem(ItRi_Prot_Fire_01,1);
};


instance ItSe_LockpickFisch(C_Item)
{
	name = "Lekka ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_LockpickFisch;
	description = name;
	text[2] = "W tej rybie coœ schowano.";
};


func void Use_LockpickFisch()
{
	B_PlayerFindItem(ItKE_lockpick,3);
};


instance ItSe_GoldPocket25(C_Item)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket25;
	description = "Skórzany mieszek.";
	text[0] = "";
	text[1] = "";
	text[2] = "W œrodku podzwania kilka monet.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket25()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItSe_GoldPocket50(C_Item)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket50;
	description = "Skórzany mieszek.";
	text[0] = "";
	text[1] = "";
	text[2] = "Woreczek jest pe³ny monet.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket50()
{
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ItSe_GoldPocket100(C_Item)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100;
	description = "Skórzany mieszek.";
	text[0] = "";
	text[1] = "";
	text[2] = "Ciê¿ka torba pe³na";
	text[3] = "z³otych monet.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket100()
{
	B_PlayerFindItem(ItMi_Gold,100);
};


instance ItSe_HannasBeutel(C_Item)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = HannasBeutel;
	description = "Skórzany mieszek.";
	text[0] = "";
	text[1] = "";
	text[2] = "Da³a mi go Hanna.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void HannasBeutel()
{
	CreateInvItems(hero,ItKE_lockpick,10);
	CreateInvItems(hero,ItKe_ThiefTreasure,1);
	Print(PRINT_HannasBeutel);
};

