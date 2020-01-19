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
var selected_factory = -1


//check each factory to see if it was selected
for (var i = 0; i < array_height_2d(factory_positions); i++){
	var _x = factory_positions[i, 0]
	var _y = factory_positions[i, 1]
	var _xx = _x + 128*resolution_scale
	var _yy = _y + 128*resolution_scale
	if (point_in_rectangle(_mouse_x, _mouse_y, _x, _y, _xx, _yy)){
		selected_factory = i
		show_debug_message(selected_factory)
	}
}

//if a factory is seleted, create the ship clone!
if (selected_factory != -1){
	var _factory = ship_factories[selected_factory]
	if (_factory.ship_frame_contained != noone and _factory.ship_deployed = false){
	var _deployment_clone = instance_create_layer(mouse_x, mouse_y, "Ships", o_ship_clone)
		with (_deployment_clone){
			new_ship = true
			reference_factory = _factory
			ship_team = team.left
			sprite_index = _factory.ship_frame_contained.sprite_index
			image_xscale = _factory.ship_frame_contained.image_scale
			image_yscale = _factory.ship_frame_contained.image_scale
		}
	}
}

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

if (selected_part_bin_slot != -1){
	var _module = parts_slot[selected_part_bin_slot]
	
	var _module_clone = instance_create_layer(mouse_x, mouse_y, "Instances", o_module_clone)

	with (_module_clone){
		reference_object= _module
		parts_bin_slot = _module.parts_bin_slot
		sprite_index = _module.sprite_index
		image_xscale = _module.image_scale
		image_yscale = _module.image_scale

	
	}	
}




//buy the part
if (selected_shop_slot != -1){
	if (shop_slots[selected_shop_slot] != noone){
		_card_reference = shop_slots[selected_shop_slot]
		_card_type = _card_reference.card_type
		purchased = false
		resources_spent = 0
		var _resource_cost = _card_reference.resource_cost
		if( _resource_cost <= resources){
			resources_spent = _resource_cost
			if(_card_type = card_type.module){
			//scan the parts bins slots for the first empty slot
				for (var i = 0; i < number_of_parts_slots; i++){
					if (parts_slot[i] = noone){
						// move the object into the parts slot
						selected_part = _card_reference
						
						
						parts_slot[i] = selected_part
						with(selected_part){
							parts_bin_slot = i
					
						}
						
						shop_slots[@ selected_shop_slot] = noone
						purchased = true
						break;
					}	
				}
			}
			if (_card_type = card_type.frame){
				//find an empty factory
				var _ship_frame = _card_reference
				for (var i = 0; i < array_length_1d(ship_factories); i++){
					if (ship_factories[i].ship_frame_contained = noone){
						ship_factories[i].ship_frame_contained = _ship_frame
						shop_slots[@ selected_shop_slot] = noone
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

var _hangar_button_top_left_x = hangar_button_ui_x_offset-(40*resolution_scale)
var _hangar_button_top_left_y = hangar_button_ui_y_offset
var _hangar_button_bottom_right_x = hangar_button_ui_x_offset
var _hangar_button_bottom_right_y = hangar_button_ui_y_offset+(40*resolution_scale)

if (point_in_rectangle(_mouse_x, _mouse_y, 
_hangar_button_top_left_x, _hangar_button_top_left_y,
_hangar_button_bottom_right_x, _hangar_button_bottom_right_y)){
	hangar_button_pressed = true
}





