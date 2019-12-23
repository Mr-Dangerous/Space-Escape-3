




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

//draw the parts box
for (var i = 0; i < array_length_1d(parts_slot_ui_x_offset); i++){
	if (parts_slot[i] = noone){
		draw_sprite_ext(s_grid_box, 0, parts_slot_ui_x_offset[i], parts_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1 )
		draw_circle(parts_slot_ui_x_offset[i], parts_slot_ui_y_offset, 34*resolution_scale, true)
	}
}
//draw the construction bays
for (var i = 0; i < number_of_construction_bays; i++){
	draw_sprite_ext(s_hangar_bay_placeholder, 0, construction_bay_slot_x_offset, construction_bay_slot_y_offset[i], resolution_scale, resolution_scale, 0, c_white, 1)
}

//draw the repair bays
for (var i = 0; i < number_of_repair_bays; i++){
	draw_sprite_ext(s_hangar_bay_placeholder, 0, repair_bay_slot_x_offset, repair_bay_slot_y_offset[i], resolution_scale, resolution_scale, 0, c_white, 1)
}

//testing something


