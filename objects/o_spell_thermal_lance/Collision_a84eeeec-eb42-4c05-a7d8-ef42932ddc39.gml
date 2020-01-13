/// @description 

var _ship_team = origin_ship.ship_team
 
if (visible){
	if (other != origin_ship){
		if (_ship_team = team.left){
			if (other.ship_team = team.left){//to become right later
				//damage needs to be a script later
				if (other.thermal_lance_damage_counter = 0){
					other.thermal_lance_damage_counter = 30
					other.armor -= 25
				}
			}
		}
		if (_ship_team = team.right){
		}
	}
}
