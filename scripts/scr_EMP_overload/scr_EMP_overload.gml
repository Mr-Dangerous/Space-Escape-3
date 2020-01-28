if (instance_exists(ship_target)){
	var _overload = instance_create_layer(ship_target.x, ship_target.y, "Effects", o_overload)
	with (_overload){
		var _damage = sqr(other.energy_current)
		//I feel bad for this
		if (_damage < 20) _damage = 20
		casters_energy_current = other.energy_current
		overload_damage = _damage
		number_of_bounces = other.number_of_overload_bounces
		target_ship = other.ship_target
		origin_team = other.ship_team
		
	}
}