
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)

//draw the shop
for (var i = 0; i < array_length_1d(shop_slot_ui_x_offset); i++){
	draw_sprite_ext(s_card_placeholder, 0, shop_slot_ui_x_offset[i], shop_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1 )
}

//draw the parts box
for (var i = 0; i < array_length_1d(parts_slot_ui_x_offset); i++){
	draw_sprite_ext(s_grid_box, 0, parts_slot_ui_x_offset[i], parts_slot_ui_y_offset, resolution_scale, resolution_scale, 0, c_white, 1 )
}
//draw the construction bays
for (var i = 0; i < number_of_construction_bays; i++){
	draw_sprite_ext(s_hangar_bay_placeholder, 0, construction_bay_slot_x_offset, construction_bay_slot_y_offset[i], resolution_scale, resolution_scale, 0, c_white, 1)
}

//draw the repair bays
for (var i = 0; i < number_of_repair_bays; i++){
	draw_sprite_ext(s_hangar_bay_placeholder, 0, repair_bay_slot_x_offset, repair_bay_slot_y_offset[i], resolution_scale, resolution_scale, 0, c_white, 1)
}
