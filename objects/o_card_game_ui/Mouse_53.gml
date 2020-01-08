/// @description

//General variables
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
var gui_height = display_get_gui_height()
var gui_width = display_get_gui_width()

//card variables
var _card_reference = -1
var _card_type = -1

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
for (var i =0; i<15; i++){
	var _center_x = parts_slot_ui_x_offset[i]
	var _center_y = parts_slot_ui_y_offset
	var _radius = 32*resolution_scale
	
	if (point_in_circle(_mouse_x, _mouse_y, 
	_center_x, _center_y, _radius)){
		selected_part_bin_slot = i
	}
}
//buy the part
if (selected_shop_slot != -1){
	if (shop_slots[selected_shop_slot, 0] != noone){
		_card_reference = shop_slots[selected_shop_slot, 0]
		_card_type = _card_reference[2]
		purchased = false
		resources_spent = 0
		var _resource_cost = shop_slots[selected_shop_slot, 1].resource_cost
		show_debug_message(_resource_cost)
		if( _resource_cost <= resources){
			resources_spent = _resource_cost
			if(_card_type = card_type.module){
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
						purchased = true
						break;
					}	
				}
			}
			if (_card_type = card_type.frame){
				//send to an empty hangar
				for (var i = 0; i < number_of_construction_bays; i++){
					var active_construction_bay = construction_bays[i]
					if (active_construction_bay[0] = noone){
						//took stuff from here - fix it!
						var ship_frame = shop_slots[selected_shop_slot, 1]
						active_construction_bay[@ 0] = ship_frame
					
						shop_slots[@ selected_shop_slot, 0] = noone
						shop_slots[@ selected_shop_slot, 1] = noone
						purchased = true
						break;
					}
				}
			
			
			}
			resources -= resources_spent
			
		}
	}
}
//check deploy_buttons(and other construction bay features later)
for (var i = 0; i < number_of_construction_bays; i++){
	var _x = construction_bay_slot_ui_x_offset
	var _y = construction_bay_slot_ui_y_offset[i]
	var _deploy_string_x = _x + construction_bay_string_offset[1, 0]
	var _deploy_string_y = _y + construction_bay_string_offset[1, 1]
	var _deploy_button_top_x = _deploy_string_x - (40 * resolution_scale)
	var _deploy_button_top_y = _deploy_string_y - (16 * resolution_scale)
	var _deploy_button_bot_x = _deploy_string_x + (40 * resolution_scale)
	var _deploy_button_bot_y = _deploy_string_y + (16 * resolution_scale)

	
	//check to see if deploy button clicked
	var deploy_button_pressed = point_in_rectangle(_mouse_x, _mouse_y, _deploy_button_top_x - 2, _deploy_button_top_y - 2,
	_deploy_button_bot_x + 2, _deploy_button_bot_y + 2)
	
	
	
	if (deploy_button_pressed){
		construction_bay_deploy_button_pressed[i] = true
	}
}

//check to see if invest or refresh button was pressed

var _invest_button_top_left_x = invest_button_ui_x_offset-(40*resolution_scale)
var _invest_button_top_left_y = invest_button_ui_y_offset
var _invest_button_bottom_right_x = invest_button_ui_x_offset
var _invest_button_bottom_right_y = invest_button_ui_y_offset+(40*resolution_scale)

if (point_in_rectangle(_mouse_x, _mouse_y, 
_invest_button_top_left_x, _invest_button_top_left_y,
_invest_button_bottom_right_x, _invest_button_bottom_right_y)){
	invest_button_pressed = true
}

var _refresh_button_top_left_x = refresh_button_ui_x_offset-(40*resolution_scale)
var _refresh_button_top_left_y = refresh_button_ui_y_offset
var _refresh_button_bottom_right_x = refresh_button_ui_x_offset
var _refresh_button_bottom_right_y = refresh_button_ui_y_offset+(40*resolution_scale)

if (point_in_rectangle(_mouse_x, _mouse_y, 
_refresh_button_top_left_x, _refresh_button_top_left_y,
_refresh_button_bottom_right_x, _refresh_button_bottom_right_y)){
	refresh_button_pressed = true
}





