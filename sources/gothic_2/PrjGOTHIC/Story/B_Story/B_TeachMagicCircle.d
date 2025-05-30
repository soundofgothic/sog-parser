
func int B_TeachMagicCircle(var C_Npc slf,var C_Npc oth,var int circle)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** B��d: Z�y parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic(TOPIC_TalentMagicCircle,LOG_NOTE);
	B_LogEntry(TOPIC_TalentMagicCircle,"Magiczne runy, do kt�rych mam dost�p, s� podzielone na kr�gi. Nie mog� korzysta� z zakl�� wymagaj�cych stopnia wtajemniczenia przekraczaj�cego moj� aktualn� wiedz�.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LearnCircle_1,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Zakl�cia z pierwszego kr�gu to: �wiat�o, Ognista strza�a, Ma�a b�yskawica, Leczenie lekkich ran i Przyzwanie szkieletu-goblina.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LearnCircle_2,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Zakl�cia z drugiego kr�gu to: Kula ognia, Lodowa strza�a, Przyzwanie wilka, Pi�� wichru i Sen.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LearnCircle_3,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Zakl�cia z trzeciego kr�gu to: Leczenie �rednich ran, Piorun kulisty, Ma�a burza ognista, Tworzenie szkieletu, Strach i Bry�a lodu.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LearnCircle_4,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Zakl�cia z czwartego kr�gu to: B�yskawica, Tworzenie kamiennego golema, Zniszczenie o�ywie�ca i Du�a kula ognia.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LearnCircle_5,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Zakl�cia z pi�tego kr�gu to: Du�a burza ognista, Lodowa fala, Przyzwanie demona i Leczenie ci�kich ran.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LearnCircle_6,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Zakl�cia z sz�stego kr�gu to: Deszcz ognia, Tchnienie �mierci, �miertelna fala, Armia ciemno�ci i Zmniejszenie potwora.");
		return TRUE;
	};
};

