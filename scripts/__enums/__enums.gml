enum module {
	frame,
	weapon,
	shields,
	armor,
	targeting,
	ability, 
	power_plant
}

enum card_type{
	frame,
	module
}

enum projectile{
	light,
	medium,
	heavy,
	energy,
	piercing
}
enum team{
	//can eventually be sxpanded to have player slots
	left, //player
	right //ai foes
}

enum ship{
	locked,
	planning,
	repositioning,
	battle
}

enum target_class{
	interceptor,
	fighter,
	frigate
}
	