/// @description Insert description here
if (team_attack_from != other.ship_team){
	//calculate damage - will do later!
	var damage_to_armor = 0
	var damage_to_shields = 0
	var damage_to_temporary_shields
	
	if(other.temporary_shields > 0){
		damage_to_temporary_shields += damage
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
	
	
	
	
	instance_destroy()
}

