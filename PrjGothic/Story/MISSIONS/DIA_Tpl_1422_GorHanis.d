
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "Co tu robisz?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Co tu robisz?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Ja? Walcz� ku chwale wielkiego �ni�cego!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "Walczysz na arenie?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Walczysz na arenie?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Zosta�em wybrany przez moich mistrz�w, by broni� na arenie honoru obozu na bagnie.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Przy�wieca mi wi�c wy�szy cel. Walcz�, by pokaza� niewiernym jak wielka jest pot�ga �ni�cego!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Kim jest �ni�cy?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Kim jest �ni�cy?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//W naszym obozie znajdziesz �wi�tych m��w, kt�rzy odpowiedz� ci na to pytanie znacznie lepiej ni� ja.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Powiem ci tylko tyle: �ni�cy b�dzie naszym zbawicielem. Przyprowadzi� nas tutaj i z jego pomoc� uda si� nam st�d wydosta�.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Chcesz przez to powiedzie�, �e czekacie a� wasz b�g zwr�ci wam wolno��?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Tak! Nasze oczekiwanie wkr�tce dobiegnie ko�ca. W tej chwili przygotowujemy si� do rytua�u wielkiego przyzwania.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Na czym polega rytua�, kt�ry planujecie?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Na czym polega rytua�, kt�ry planujecie?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Nasi prorocy przewidzieli, �e wsp�lne przywo�anie �ni�cego jest jedyn� drog� do odzyskania wolno�ci!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Je�li chcesz si� jeszcze czego� dowiedzie�, powiniene� uda� si� do naszego obozu.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "M�g�by� opisa� mi drog� do waszego obozu?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//M�g�by� opisa� mi drog� do waszego obozu?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, kt�rzy ch�tnie wska�� ci drog� do obozu na bagnie. Znajd� kt�rego� z nich i porozmawiaj z nim!
};


instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Wyzywam ci� na pojedynek na arenie!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Wyzywam ci� na pojedynek na arenie!
	AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Zabicie kogo� takiego jak ty nie przysporzy raczej chwa�y �ni�cemu.
	AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Stan� z tob� w szranki dopiero w tedy, gdy oka�esz si� godnym rywalem.
	AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Ale jestem pewien, �e wojownicy z Nowego Obozu nie b�d� mieli takich skrupu��w...
};


instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?
	AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Nie! Jeste� jeszcze zbyt s�aby. Nie sprostasz mi w walce!
};

