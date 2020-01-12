/// @description Spawn the enemy fleet
var j = 0
for (var i = 1; i > 0; i--){
	var enemy_ship = instance_create_layer(x, y, "Ships", o_ship)
	with (enemy_ship){
		ship_team = team.right
		loading_scripts[0] = scr_load_solar_interceptor_frame()
		scr_determine_start_location()
		visible = true
		direction = 180
		image_angle = 180
	}
	//add the enemy ship tot he fleet
	var ship_added = false

	while (!ship_added){
		if (_right_fleet[j] = noone){
			_right_fleet[j] = enemy_ship
			ship_added = true
		}
		j++
	}
	
}
