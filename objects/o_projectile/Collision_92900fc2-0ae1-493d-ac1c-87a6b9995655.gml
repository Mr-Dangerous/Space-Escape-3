
if (team_attack_from != other.ship_team){
	//on hit effects
	if (ECP_bonus >= 1){
		var _shield_damage = mass
		if (other.temporary_shields > 0){
			scr_display_damage(x, y, string(_shield_damage), c_blue)
			other.temporary_shields -= _shield_damage
			_shield_damage = 0
			if (other.temporary_shields < 0){
				_shield_damage -= other.temporary_shields
				other.temporary_shields = 0
			}
		} 
		if (other.shields > 0 and _shield_damage != 0){
			other.shields -= _shield_damage
			_shield_damage = 0
			if (other.shields < 0){
				other.shields = 0
			}
		}
		//create the overload spark effect
		show_debug_message ("spark made")
		_x = other.x + irandom_range(-32, 32)
		_y = other.y + irandom_range(-32, 32)
		image_scale = random_range(.25, .5)
		var _static_spark = instance_create_layer(_x, _y, "Effects", o_ECP_bonus_spark)
	
		_static_spark.image_xscale = image_scale
		_static_spark.image_yscale = image_scale
	}
	
	
	
	
	
	//finally calculate it all!
	scr_calculate_damage(other, damage, mass, directional_damage)
		
	instance_destroy()
}

	
	



