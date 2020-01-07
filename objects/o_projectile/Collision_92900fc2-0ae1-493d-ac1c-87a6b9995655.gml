/// @description Insert description here
if (team_attack_from != other.ship_team){
	//calculate damage - will do later!
	var damage_to_armor = 0
	var damage_to_shields = 0
	
	if (other.shields > 0){
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

