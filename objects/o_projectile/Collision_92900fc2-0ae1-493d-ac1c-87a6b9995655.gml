/// @description Insert description here
if (team_attack_from != other.ship_team){
	//calculate damage - will do later!
	var _temporary_shields = other.temporary_shields
	var _shields = other.shields
	var _armor = other.armor
	
	var _damage_to_shields = 0
	var _damage_to_temporary_shields = 0
	var _damage = damage
	
	if (_temporary_shields > 0 and _damage > 0){
		other.generate_shields = 9
		_damage_to_temporary_shields = _temporary_shields-_damage
		if (sign(_damage_to_temporary_shields) = -1){
			_damage = _damage_to_temporary_shields*-1
			other.temporary_shields = 0
			temporary_shield_counter = 0
		} else {
			other.temporary_shields -= _damage
			_damage = 0
		}
	}
	if (_shields > 0 and _damage > 0){
		other.generate_shields = 9
		_damage_to_shields = other.shields-_damage
		if (sign(_damage_to_shields) = -1){
			_damage = _damage_to_shields*-1
			other.shields = 0
		} else {
			other.shields -= _damage
			_damage = 0
		}
	}
	if (_armor > 0 and _damage > 0){
		other.armor -= _damage
		if(other.armor < 0){
			other.armor = 0
		}
	}
	instance_destroy()
}
			
	
	
	
	/*
	if(other.temporary_shields > 0){
		damage_to_temporary_shields += _damage
		other.generate_shields = 9
		if (other.temporary_shields - damage_to_temporary_shields < 0){
			damage_to_shields += other.temporary_shields - damage_to_temporary_shields
			damage_to_temporary_shields = 0
			
			temporary_shields = 0
		}
		temporary_shields -= damage_to_temporary_shields
	}
		
	if (other.shields > 0 and temporary_shields != 0){
		damage_to_shields += damage
		other.generate_shields = 9
		if (other.shields - damage_to_shields < 0){
			damage_to_armor += other.shields - damage_to_shields
			damage_to_shields += damage_to_armor
		}
	} else {
		damage_to_armor += damage
	}
	with (other){
		armor -= damage_to_armor
		shields -= damage_to_shields
		
	}
	*/
	
	
	



