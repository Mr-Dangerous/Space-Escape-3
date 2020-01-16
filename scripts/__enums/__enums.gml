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
	piercing,
	rocket,
	missile,
	torpedo
}
enum channel_ability{
	null,
	hyper_boost
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
	battle,
	cast_ability,
	disabled,
	channel_ability,
	firing_range//for testing purposes only
}

enum target_class{
	interceptor,
	fighter,
	frigate
}
	