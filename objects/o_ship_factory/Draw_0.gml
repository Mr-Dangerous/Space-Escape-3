draw_self()
if (instance_exists(ship_frame_contained)){
	var _sprite = ship_frame_contained.sprite_index
	draw_sprite_ext(_sprite, 0, 
		x, y, ship_frame_contained.image_scale*resolution_scale,
		ship_frame_contained.image_scale*resolution_scale,
		270, c_white, 1)
}
for (var i = 0; i < 6; i++){
	//just for testing
	//will eventually not be there!
	if (factory_item[i, 1] != noone){
		var _factory_module = factory_item[i, 1]
		var _sprite = _factory_module.sprite_index
		draw_sprite_stretched_ext(_sprite, 0, 
		x+socket_offsets[i, 0]-8, y+socket_offsets[i, 1]-8, 
		16, 16, c_white, 1)
	} else {
		draw_circle_color(x+socket_offsets[i, 0], y+socket_offsets[i, 1], 8, c_black, c_black, true)
	}
}
