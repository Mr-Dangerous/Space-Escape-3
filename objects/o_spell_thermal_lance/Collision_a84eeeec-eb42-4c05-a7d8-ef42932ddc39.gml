/// @description 

var _ship_team = origin_ship.ship_team
 
if (visible){
	if (other != origin_ship){
		if (_ship_team != other.ship_team){
		//to become right later
			//damage needs to be a script later
			_damage = 15
			if (other.thermal_lance_damage_counter = 0){
				other.thermal_lance_damage_counter = 30
				other.armor -= _damage
				scr_display_damage(other.x, other.y, string(_damage), c_red)
			}
		}
	}
}
