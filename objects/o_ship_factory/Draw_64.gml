if (factory_team = team.left){

	draw_sprite_stretched(s_factory_dock, 0, gui_x, gui_y, _factory_sprite_size, _factory_sprite_size)//102 is 80% of the sprite width

	if (instance_exists(ship_frame_contained)){
		var _image_alpha = 1
		if (instance_exists(fielded_ship)){
			_image_alpha = .5
		} 
		var _sprite = ship_frame_contained.sprite_index
		draw_sprite_ext(_sprite, 0, 
			gui_x + 64*resolution_scale,
			gui_y + 64*resolution_scale,
			ship_frame_contained.image_scale*resolution_scale,
			ship_frame_contained.image_scale*resolution_scale,
			270, c_white, _image_alpha)
	}

	for (var i = 0; i < 6; i++){
		//just for testing
		//will eventually not be there!
		if (factory_item[i, 1] != noone){
			var _factory_module = factory_item[i, 1]
			var _sprite = _factory_module.sprite_index
			draw_sprite_stretched_ext(_sprite, 0, 
			gui_x+socket_offsets[i, 0]-8, gui_y+socket_offsets[i, 1]-8, 
			16, 16, c_white, 1)
		} else {
			draw_circle_color(gui_x+socket_offsets[i, 0], gui_y+socket_offsets[i, 1], 8, c_black, c_black, true)
		}
	}
}