
var _x = gui_width- round(270 * resolution_scale)
var _y = gui_height - round(260* resolution_scale)

draw_sprite_stretched_ext(s_hangar_bay_placeholder, 0, _x, _y, round(256 * resolution_scale), round(256*resolution_scale) , c_white, 1)

if (factory_to_represent != noone){
	var _ship = factory_to_represent.fielded_ship
	if (instance_exists(_ship)){
		//draw the ship
		var ship_x_offset = _x + construction_bay_socket_offsets[0, 0]
		var ship_y_offset = _y + construction_bay_socket_offsets[0, 1]
	
		draw_sprite_ext(factory_to_represent.ship_frame_contained.sprite_index, 0, ship_x_offset, ship_y_offset, factory_to_represent.ship_frame_contained.image_scale, factory_to_represent.ship_frame_contained.image_scale, rotation, c_white, 1)
		//draw the modules into the bay sockets
		var _factory_items = factory_to_represent.factory_item
		for (var i = 0; i < 6; i++){
			var _module = _factory_items[i, 1]
			if (instance_exists(_module)){
				var _sprite = _module.sprite_index
				var _module_x = _x + construction_bay_socket_offsets[i+1, 0]
				var _module_y = _y + construction_bay_socket_offsets[i+1, 1]
				draw_sprite_stretched_ext(_sprite, 0, _module_x, _module_y, 64*resolution_scale, 64*resolution_scale, c_white, 1)
			}
		}
		//STATS

	
		_y -=round(512*resolution_scale)//why fix it if it ain't broke?
		//background
		draw_sprite_stretched(s_window_original, 0, _x, _y, round(256*resolution_scale), round(512*resolution_scale))
		//draw text
		draw_set_halign(fa_center)
	
		var _ship_string = factory_to_represent.ship_frame_contained.name
		var _ship_string_x_offset = _x + round(128*resolution_scale)
		var _ship_string_y_offset = _y + round(20*resolution_scale)
		draw_text(_ship_string_x_offset, _ship_string_y_offset, _ship_string)
		draw_set_halign(fa_left)
		draw_set_font(f_small_font)
	
		//stats!
		var stat_string = array_create(20, "Test Statement:")
		stat_string[0] = "Attack Speed: " + string(60/_ship.fire_rate) + " attacks/second"
		stat_string[1] = "Attack Damage: " + string(_ship.basic_attack_array[1, 2]) + "x " + string(_ship.basic_attack_array[0,0])
		stat_string[2] = "Attack Damage per second: " + string((60/_ship.fire_rate) * _ship.basic_attack_array[1, 2] * _ship.basic_attack_array[0,0])
		stat_string[3] = "Damage type:  light"//to be modified later
		stat_string[4] = "Basic Weapon Range: " + string(250)//to be modified later
		stat_string[5] = "Max speed: " + string(_ship.max_speed)
		stat_string[6] = "Acceleration: " + string(_ship.acceleration_rate)
		stat_string[7] = "Priority target: None"
		stat_string[8] = "Energy: "+ string(_ship.energy)+"/"+string(_ship.max_energy)
		stat_string[9] = "Shields: " + string(_ship.shields)+"/"+string(_ship.shields)
		stat_string[10] = "Armor: " + string(_ship.armor)+"/"+string(_ship.max_armor)
		stat_string[11] = "Ability: Hyper Boost"
		
		//draw them!
		var spacing = 20*resolution_scale
		
		for (var i = 0; i < array_length_1d(stat_string); i++){
			draw_text_ext(_x + 10, _y + (100*resolution_scale) + (i*spacing), stat_string[i], 3, 230 * resolution_scale)
		}
		
	
			
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	
	}
}