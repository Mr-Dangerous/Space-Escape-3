/// @description Spawn the enemy fleet
var j = 0
for (var i = 5; i > 0; i--){
	var enemy_ship = instance_create_layer(x, y, "Ships", o_ship)
	with (enemy_ship){
		ship_team = team.right
		frame_load_script = scr_load_iron_interceptor_frame()
		visible = true
		direction = 180
		image_angle = 180
	}
	//add the enemy ship tot he fleet
	var ship_added = false

	while (!ship_added){
		if (right_fleet[j] = noone){
			right_fleet[j] = enemy_ship
			ship_added = true
		}
		j++
	}
	
}