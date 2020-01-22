//reset variables that need to check release of mouse
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
//strings
draw_set_font(f_card_font)

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


//draw the timer
draw_set_halign(fa_center)
var _x = timer_offset[0]
var _y = timer_offset[1]
if (timer_counter > 0){
	draw_text(_x, _y, string(timer))
}
//phase name underneath?
draw_text(_x, _y + 30, current_phase_text)
draw_set_halign(fa_left)


//draw the shop


for (var i = 0; i < array_length_1d(shop_slot_ui_x_offset); i++){
	if (shop_slots[i] = noone){
		draw_sprite_ext(s_card_placeholder, 0, shop_slot_ui_x_offset[i], shop_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1 )
	}
	if (shop_slots[i] != noone){
		if (instance_exists(shop_slots[i])){
			var _sprite = shop_slots[i].sprite_index
			var image_scale = shop_slots[i].image_scale
			var card_border = shop_slots[i].card_border
			draw_sprite_ext(card_border, 0, shop_slot_ui_x_offset[i], shop_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1)
			draw_sprite_ext(_sprite, 0, shop_slot_ui_x_offset[i]+card_offset_sprite_x, shop_slot_ui_y_offset+card_offset_sprite_y, image_scale*resolution_scale, image_scale*resolution_scale, 0, c_white, 1)
			draw_set_valign(fa_top)
			
			draw_text(shop_slot_ui_x_offset[i]+card_text_offset_x, shop_slot_ui_y_offset+card_name_offset_y, shop_slots[i].name)
			draw_text_ext(shop_slot_ui_x_offset[i]+card_text_offset_x, shop_slot_ui_y_offset+card_class_offset_y, shop_slots[i].sub_class, 16, 220*resolution_scale)
			draw_text_ext(shop_slot_ui_x_offset[i]+card_text_offset_x, shop_slot_ui_y_offset+card_origin_offset_y, shop_slots[i].origin, 16, 220*resolution_scale)
			draw_text_ext(shop_slot_ui_x_offset[i]+card_resource_cost_x, shop_slot_ui_y_offset+card_resource_cost_y, string(shop_slots[i].resource_cost), 16, 220*resolution_scale)
			
		}
	}
	//draw an outline around the box
	/*
	var _top_left_x = shop_slot_ui_x_offset[i]
	var _top_left_y = shop_slot_ui_y_offset
	var _bot_right_x = shop_slot_ui_x_offset[i] + (237*resolution_scale)
	var _bot_right_y = shop_slot_ui_y_offset + (153*resolution_scale)
	draw_rectangle(_top_left_x, _top_left_y, _bot_right_x, _bot_right_y, true)
	*/
	
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
//generate income window
if (point_in_rectangle(_mouse_x, _mouse_y, resource_ui_x_offset[0], resource_ui_y_offset, resource_ui_x_offset[1], resource_y_offset + 16)){
	if (income_hover_timer < 80){
		income_hover_timer++
	}
	if (income_hover_timer >= 60){
		income_hover = true
	}
} else {
	income_hover_timer = 0
	income_hover = false
}
if (income_hover = true){
	//TODO more work here
}


//draw the parts box
for (var i = 0; i < array_length_1d(parts_slot_ui_x_offset); i++){
		
	
	draw_sprite_stretched_ext(s_window_original, 0, parts_slot_ui_x_offset[i]-32, parts_slot_ui_y_offset-34, 64, 64, c_white, .5)
	var _module = parts_slot[i]
	if (instance_exists(_module)){
		var _sprite = _module.sprite_index
		draw_sprite_stretched_ext(_sprite, 0, parts_slot_ui_x_offset[i]-(32*resolution_scale), parts_slot_ui_y_offset-(32*resolution_scale), resolution_scale*64, resolution_scale*64, c_white, 1 )
		//the offsets are due to the method in which the sprite is drawn.  may be made more concise later.
	}
}




//testing something


