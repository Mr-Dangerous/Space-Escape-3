//reset variables that need to check release of mouse

//strings
var _experience_to_level = experience_to_level[player_level]
if (player_level = 10){
	_experience_to_level = "MAX"
}
economy_ui_string[0] = "Income: " + string(income)
economy_ui_string[1] = "Resources: " + string(resources)
economy_ui_string[2] = "Current turn: " +string(current_turn)
economy_ui_string[3] = "Fuel: " + string(current_fuel_spent) + "/" + string(max_fuel)
economy_ui_string[4] = "Investment: " + string(player_experience) +"/" + string(_experience_to_level)
economy_ui_string[5] = "Infrastructure Level: " + string(player_level) 




//draw the shop


for (var i = 0; i < array_length_1d(shop_slot_ui_x_offset); i++){
	if (shop_slots[i, 0] = noone){
		draw_sprite_ext(s_card_placeholder, 0, shop_slot_ui_x_offset[i], shop_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1 )
	}
	if (shop_slots[i, 0] != noone){
		if (instance_exists(shop_slots[i, 1])){
			var _sprite = shop_slots[i, 1].sprite_index
			var image_scale = shop_slots[i, 1].image_scale*1.3
			var card_border = shop_slots[i, 1].card_border
			draw_sprite_ext(card_border, 0, shop_slot_ui_x_offset[i], shop_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1)
			draw_sprite_ext(_sprite, 0, shop_slot_ui_x_offset[i]+card_offset_sprite_x, shop_slot_ui_y_offset+card_offset_sprite_y, image_scale*resolution_scale, image_scale*resolution_scale, 0, c_white, 1)
			draw_set_valign(fa_middle)
			draw_text_ext(shop_slot_ui_x_offset[i]+card_text_offset_x, shop_slot_ui_y_offset+card_name_offset_y, shop_slots[i, 1].name, 16, 220*resolution_scale)
			draw_text_ext(shop_slot_ui_x_offset[i]+card_text_offset_x, shop_slot_ui_y_offset+card_class_offset_y, shop_slots[i, 1].class, 16, 220*resolution_scale)
			draw_text_ext(shop_slot_ui_x_offset[i]+card_text_offset_x, shop_slot_ui_y_offset+card_origin_offset_y, shop_slots[i, 1].origin, 16, 220*resolution_scale)
			draw_set_valign(fa_top)
		}
	}
	//draw an outline around the box
	var _top_left_x = shop_slot_ui_x_offset[i]
	var _top_left_y = shop_slot_ui_y_offset
	var _bot_right_x = shop_slot_ui_x_offset[i] + (237*resolution_scale)
	var _bot_right_y = shop_slot_ui_y_offset + (153*resolution_scale)
	draw_rectangle(_top_left_x, _top_left_y, _bot_right_x, _bot_right_y, true)
	
}

//draw the upgrade and refresh button
draw_sprite_ext(invest_button_image, 0, invest_button_ui_x_offset, invest_button_ui_y_offset, 1 ,1, 0, c_white, 1)
draw_sprite_ext(refresh_button_image, 0, refresh_button_ui_x_offset, refresh_button_ui_y_offset, 1, 1, 0, c_white, 1)
draw_sprite_ext(hangar_button_image, 0, hangar_button_ui_x_offset, hangar_button_ui_y_offset, 1, 1, 0, c_white, 1)
//draw the economy ui



//will eventuall be replaced by icons
//draw a background
draw_rectangle_color(shop_slot_ui_x_offset[0], resource_ui_y_offset - 6, 
shop_slot_ui_x_offset[4] + (237*resolution_scale), shop_slot_ui_y_offset - 2, c_white, c_white, c_white
, c_white, false)
draw_rectangle_color(shop_slot_ui_x_offset[0] +2, resource_ui_y_offset - 4, 
shop_slot_ui_x_offset[4] + (237*resolution_scale) - 2, shop_slot_ui_y_offset - 4, c_gray, c_gray, c_gray
, c_gray, false)


for (var i = 0; i < resource_elements; i++){
	draw_text(resource_ui_x_offset[i], resource_ui_y_offset, economy_ui_string[i])
}




//draw the parts box
for (var i = 0; i < array_length_1d(parts_slot_ui_x_offset); i++){
		
	//if (parts_slot[i] = noone){
		//draw_sprite_ext(s_grid_box, 0, parts_slot_ui_x_offset[i], parts_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1 )
		//the offsets are due to the method in which the sprite is drawn.  may be made more concise later.
		draw_sprite_stretched_ext(s_window_original, 0, parts_slot_ui_x_offset[i]-32, parts_slot_ui_y_offset-34, 64, 64, c_white, .5)
	//}
}
//draw the construction bays
for (var i = 0; i < number_of_construction_bays; i++){
	var _x = construction_bay_slot_ui_x_offset
	var _y = construction_bay_slot_ui_y_offset[i]
	draw_sprite_ext(s_hangar_bay_placeholder, 0, _x, _y, resolution_scale, resolution_scale, 0, c_white, .3)
	active_construction_bay = construction_bays[i]
	number_of_sockets = array_length_1d(active_construction_bay)-1//NOTE  - 1 because some information is in slot 7
	for(var j = 0; j < number_of_sockets; j++){
		var _module = active_construction_bay[j]
		if (instance_exists(_module)){
			//get the sprite
			var _sprite = _module.sprite_index
			//display the sprite
			var _rotation = 0
			if (j = 0) _rotation = 270
			draw_sprite_ext(_sprite, 0, 
				_x + construction_bay_socket_offsets[j, 0],
				_y + construction_bay_socket_offsets[j, 1],
				_module.image_scale*resolution_scale, _module.image_scale*resolution_scale, _rotation, c_white, 1)
		}
			
	}
	//display some text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	//deploy string and button
	 
	
	
	var _deploy_string_x = _x + construction_bay_string_offset[1, 0]
	var _deploy_string_y = _y + construction_bay_string_offset[1, 1]
	var _deploy_string = "Deploy"
	
	var _deploy_button_top_x = _deploy_string_x - (40 * resolution_scale)
	var _deploy_button_top_y = _deploy_string_y - (16 * resolution_scale)
	var _deploy_button_bot_x = _deploy_string_x + (40 * resolution_scale)
	var _deploy_button_bot_y = _deploy_string_y + (16 * resolution_scale)
	
	//draw outline
	draw_rectangle_color(_deploy_button_top_x - 2, _deploy_button_top_y - 2,
	_deploy_button_bot_x + 2, _deploy_button_bot_y + 2, c_black, c_black, c_black, c_black, false)
	//draw button
	deploy_button_pressed = construction_bay_deploy_button_pressed[i]
	if (!deploy_button_pressed){
		draw_rectangle_color(_deploy_button_top_x, _deploy_button_top_y,
		_deploy_button_bot_x, _deploy_button_bot_y, c_red, c_red, c_red, c_red, false)
	}
	if (deploy_button_pressed){
		draw_rectangle_color(_deploy_button_top_x, _deploy_button_top_y,
		_deploy_button_bot_x, _deploy_button_bot_y, c_maroon, c_maroon, c_maroon, c_maroon, false)
	}
	
	draw_text_transformed(_deploy_string_x, _deploy_string_y, _deploy_string, resolution_scale, resolution_scale, 0)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

//draw the repair bays
for (var i = 0; i < number_of_repair_bays; i++){
	draw_sprite_ext(s_hangar_bay_placeholder, 0, repair_bay_slot_x_offset, repair_bay_slot_y_offset[i], resolution_scale, resolution_scale, 0, c_white, .3)
}

//testing something


