
func void B_Story_FoundOrcSlave()
{
	B_LogEntry(CH4_UluMulu,"Znalaz�em przyjaciela Ur-Shaka w jednym z dolnych korytarzy Wolnej Kopalni. Nazywa si� Tarrok. Je�li szybko nie dostarcz� mu jego lekarstwa, umrze w wyniku zatrucia. Orkowe lekarstwo ma si� znajdowa� na kt�rym� z ni�szych poziom�w. Musz� si� spieszy�!");
	B_GiveXP(XP_FoundOrcSlave);
	FreemineOrc_SuchePotion = LOG_RUNNING;
};

