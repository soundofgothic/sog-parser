
func void B_Story_AccessToXardas()
{
	CreateInvItem(hero,ItArRuneTeleport3);
	B_LogEntry(CH4_FindXardas,"Przekaza�em trzy serca golem�w demonowi, kt�ry w zamian podarowa� mi magiczn� run� teleportacji. Ciekawe, dok�d mnie przeniesie?");
	B_GiveXP(XP_DeliveredGolemhearts);
	FindGolemHearts = 4;
};

