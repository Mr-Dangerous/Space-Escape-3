//reveal all nearby enemies
var i = 1
var _radius = 250
var no_valid_targets = false
while (!no_valid_targets){
	var _nearby_ship = instance_nth_nearest(x, y, o_ship, i)
	i++
	if (point_distance(x, y, _nearby_ship.x, _nearby_ship.y) > _radius){
		no_valid_targets = true
	} else {
		if (_nearby_ship.ship_team != ship_team){
			cloak = false
			cloak_timer = 0
			//maybe target that?
		}
	}
	if (i > 30){
		break;
	}
}

scr_fire_rocket(projectile.rocket)
hunter_strike_multiplier = 1
hunter_strike_counter = floor(energy_current/3) * 60
show_debug_message("Hunter Strike!")