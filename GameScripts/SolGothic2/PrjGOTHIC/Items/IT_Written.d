
instance StandardBrief(C_Item)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseStandardBrief;
	scemeName = "MAP";
	description = "TypowyList";
};


func void UseStandardBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"TypowyList");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(nDocID);
};


instance StandardBuch(C_Item)
{
	name = "TypowaKsi¹¿ka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "TypowaKsi¹¿ka";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseStandardBuch;
};


func void UseStandardBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"TypowaKsi¹¿ka Strona 1");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"TypowaKsi¹¿ka Strona 2");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(nDocID);
};


instance ItWr_Map_NewWorld(C_Item)
{
	name = "Mapa terenów Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_Map_NewWorld_City(C_Item)
{
	name = "Mapa miasta Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_City;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_City()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_City);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-6900,11800,21600,-9400);
	Doc_Show(Document);
};


instance ItWr_Map_OldWorld(C_Item)
{
	name = "Mapa Górniczej Doliny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_OldWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


var int Lerne_Einhand;
var int Lerne_Zweihand;

instance ItWr_EinhandBuch(C_Item)
{
	name = "Sztuka walki";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kunszt obronny po³udniowców";
	text[2] = "Ksi¹¿ka opisuj¹ca sztukê";
	text[3] = "walki broniami jednorêcznymi.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseEinhandBuch;
};


func void UseEinhandBuch()
{
	var int nDocID;
	if(Lerne_Einhand == FALSE)
	{
		B_RaiseFightTalent(self,NPC_TALENT_1H,5);
		Print(PRINT_Learn1H);
		Lerne_Einhand = TRUE;
		Snd_Play("Levelup");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kunszt obronny po³udniowców");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Po³udniowiec w porównaniu z mieszkañcem pó³nocy nie polega tak bardzo na sile fizycznej, preferuj¹c zwinnoœæ, a gor¹cy klimat jego ojczyzny zmusza go do korzystania z l¿ejszych i daj¹cych wiêksz¹ swobodê ruchów pancerzy. W zwi¹zku z tym styl walki ludzi po³udnia jest ca³kowicie inny od tego, do którego jesteœmy przyzwyczajeni. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Prawdopodobnie najs³ynniejszym manewrem wywodz¹cym siê z po³udnia jest jednorêczny blok po³¹czony z krokiem wstecz: cofniêcie siê pozwala na zmniejszenie si³y wrogiego ciosu i umo¿liwia przyjêcie postawy u³atwiaj¹cej wyprowadzenie kontrataku.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItWr_ZweihandBuch(C_Item)
{
	name = "Taktyka walki";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bloki dwurêczne";
	text[2] = "Ksi¹¿ka opisuj¹ca sztukê";
	text[3] = "walki broniami dwurêcznymi.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseZweihandBuch;
};


func void UseZweihandBuch()
{
	var int nDocID;
	if(Lerne_Zweihand == FALSE)
	{
		B_RaiseFightTalent(self,NPC_TALENT_2H,5);
		Print(PRINT_Learn2H);
		Lerne_Zweihand = TRUE;
		Snd_Play("Levelup");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bloki dwurêczne");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Blokowanie ciosów przeciwnika za pomoc¹ broni dwurêcznej umo¿liwia silnym wojownikom gwa³towne powstrzymanie wroga i przerwanie ewentualnej kombinacji jego ciosów. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Zatrzymany w ten sposób przeciwnik traci inicjatywê i ³atwiej go potem skutecznie zaatakowaæ.");
	Doc_Show(nDocID);
};

