
func void B_Story_GotUluMulu()
{
	CreateInvItem(hero,UluMulu);
	B_LogEntry(CH4_UluMulu,"Zadanie sko�czone. Tarrok otrzyma� wszystkie elementy potrzebne do stworzenia Ulu-Mulu. Mam tylko nadziej�, �e orkowie strzeg�cy �wi�tyni �ni�cego uszanuj� amulet.");
	Log_SetTopicStatus(CH4_UluMulu,LOG_SUCCESS);
	B_GiveXP(XP_GotUluMulu);
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};

