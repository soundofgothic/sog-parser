
func void B_Story_LoadSword()
{
	var C_Npc milten;
	B_LogEntry(CH5_Uriziel,"Xardas przygotowa� ju� magiczn� formu��. Teraz potrzebuj� pot�nego �r�d�a energii magicznej i maga, kt�ry zechce mi pom�c. Na szcz�cie w kolonii znajduje si� osiedle, kt�remu wy�wiadczy�em nieocenione us�ugi i dysponuj�ce wystarczaj�co pot�nym �r�d�em.");
	B_GiveXP(XP_ReturnedFromSunkenTower);
	CreateInvItem(hero,Scroll4Milten);
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LoadSword = TRUE;
};

