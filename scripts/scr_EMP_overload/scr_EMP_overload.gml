if (instance_exists(ship_target)){
	var _overload = instance_create_layer(ship_target.x, ship_target.y, "Effects", o_overload)
	with (_overload){
		overload_damage = 20
		number_of_bounces = 3//to change, obviously
		target_ship = other.ship_target
		origin_team = other.ship_team
		
	}
}