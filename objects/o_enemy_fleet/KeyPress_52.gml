/// @description Spawn the enemy fleet

for (var i = 5; i > 0; i--){
	var enemy_ship = instance_create_layer(x, y, "Ships", o_ship)
	with (enemy_ship){
		ship_team = team.right
		frame_load_script = scr_load_iron_interceptor_frame()
		visible = true
		direction = 180
		image_angle = 180
	}
	
}
