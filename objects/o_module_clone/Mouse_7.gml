/// @description 

//check to see if hovering over another parts slot
var selected_bin_slot = -1
var selected_construction_hangar_slot = -1
var selected_factory = -1
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)

var card_game_ui_object = instance_find(o_card_game_ui, 0)

//check to see if part is being dropped into a bin
for (var i =0; i<15; i++){
	var _center_x = card_game_ui_object.parts_slot_ui_x_offset[i]
	var _center_y = card_game_ui_object.parts_slot_ui_y_offset
	var _radius = 32*card_game_ui_object.resolution_scale

	if (point_in_circle(_mouse_x, _mouse_y, 
	_center_x, _center_y, _radius)){
		selected_bin_slot = i
	}
	
}

if (selected_bin_slot != -1){
	var _module_to_swap = card_game_ui_object.parts_slot[selected_bin_slot]
	if (!instance_exists(_module_to_swap)){
		card_game_ui_object.parts_slot[selected_bin_slot] =reference_object
		card_game_ui_object.parts_slot[parts_bin_slot] = noone
		reference_object.parts_bin_slot = selected_bin_slot
	}
	if (instance_exists(_module_to_swap)){
		var _old_part_slot = reference_object.parts_bin_slot
		card_game_ui_object.parts_slot[_old_part_slot] = _module_to_swap
		_module_to_swap.parts_bin_slot = _old_part_slot
		reference_object.parts_bin_slot = selected_bin_slot
		card_game_ui_object.parts_slot[selected_bin_slot] = reference_object
	}
}

//check to see if hovering over a factory

var _factory_position_list = card_game_ui_object.factory_positions

for (var i = 0; i < array_height_2d(_factory_position_list); i++){
	var _x = _factory_position_list[i, 0]
	var _y = _factory_position_list[i, 1]
	var _xx = _x + 128*card_game_ui_object.resolution_scale
	var _yy = _y + 128*card_game_ui_object.resolution_scale
	if (point_in_rectangle(_mouse_x, _mouse_y, _x, _y, _xx, _yy)){
		selected_factory = i
		show_debug_message(selected_factory)
	}
}


if (selected_factory != -1){
	var _factory = card_game_ui_object.ship_factories[selected_factory]
	if (instance_exists(_factory)){
		if (_factory.ship_frame_contained != noone){
			for (var i = 0; i < 6; i++){
				if (reference_object.module_type = _factory.factory_item[i, 0]){
					if (_factory.factory_item[i, 1] = noone){
						_factory.factory_item[i, 1] = reference_object
						card_game_ui_object.parts_slot[parts_bin_slot] = noone
						reference_object.x = -120
						reference_object.y = -120
						reference_object.visible = false
						
					}
					break;
				}
			}
			if (instance_exists(_factory.fielded_ship)){
				//destroy the ship, make a new one
				instance_destroy(_factory.fielded_ship)
				_factory.create_ship = true
			}
		}
	}
}
	


//check to see if hovering over the shop to sell
var top_left_x = card_game_ui_object.shop_slot_ui_x_offset[0]
var top_left_y = card_game_ui_object.shop_slot_ui_y_offset
var bottom_right_x = card_game_ui_object.shop_slot_ui_x_offset[4] + (245*card_game_ui_object.resolution_scale)
var bottom_right_y = card_game_ui_object.shop_slot_ui_y_offset+(150*card_game_ui_object.resolution_scale)
var selling = false
if (point_in_rectangle(_mouse_x, _mouse_y, top_left_x, top_left_y, bottom_right_x, bottom_right_y)){

	selling = true
	card_game_ui_object.resources += reference_object.resource_cost
	var _sold_item = instance_create_layer(card_game_ui_object.resource_x_offset[1],
	card_game_ui_object.resource_y_offset, "Above_Cards", o_sold_item)
	
	_sold_item.amount = reference_object.resource_cost
	card_game_ui_object.parts_slot[reference_object.parts_bin_slot] = noone 
	//TODO check to figure out how to increase the number in the book - maybe its in the destroy event?
	reference_object.card_book[1] += 1
	instance_destroy(reference_object)
	
}


if (selected_bin_slot = -1 and selected_construction_hangar_slot = -1 and selected_factory = -1 and selling != true){
	reference_object.visible = true

}
instance_destroy()
