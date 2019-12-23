/// @description

//General variables
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)


//Selection variables that can be used
var selected_shop_slot = -1
var selected_part_bin_slot = -1
//check each shop slot to see if it was selected

for (var i =0; i<5; i++){
	var _top_left_x = shop_slot_ui_x_offset[i]
	var _top_left_y = shop_slot_ui_y_offset
	var _bot_right_x = shop_slot_ui_x_offset[i] + (237*resolution_scale)
	var _bot_right_y = shop_slot_ui_y_offset + (153*resolution_scale)
	
	if (point_in_rectangle(_mouse_x, _mouse_y, 
	_top_left_x, _top_left_y, _bot_right_x, _bot_right_y)){
		selected_shop_slot = i
	}
}

//check parts bin

//buy the part
if (selected_shop_slot != -1){
	if (shop_slots[selected_shop_slot, 0] != noone){
	//scan the parts bins slots for the first empty slot
		for (var i = 0; i < number_of_parts_slots; i++){
			if (parts_slot[i] = noone){
				// move the object into the parts slot
				selected_part = shop_slots[selected_shop_slot, 1]
				selected_part.visible = true
				selected_part.x = parts_slot_x_offset[i]
				selected_part.y = parts_slot_y_offset
				parts_slot[i] = selected_part
				with(selected_part){
					parts_bin_slot = i
				}
				shop_slots[@ selected_shop_slot, 0] = noone
				shop_slots[@ selected_shop_slot, 1] = noone
				break;
			}	
		}		
	}
}


