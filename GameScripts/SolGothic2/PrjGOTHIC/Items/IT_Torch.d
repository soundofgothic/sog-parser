
const int Value_Fackel = 2;

instance ItLsTorch(C_Item)
{
	name = "Pochodnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH | ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[3] = "Zwyk³a pochodnia.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorchburning(C_Item)
{
	name = "P³on¹ca pochodnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
	text[3] = "Zwyk³a pochodnia.";
};

instance ItLsTorchburned(C_Item)
{
	name = "Pochodnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH | ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	text[3] = "Wypalona pochodnia.";
	description = name;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "Pochodnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_TORCH;
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

