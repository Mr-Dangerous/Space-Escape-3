/// @description 

//check to see if hovering over another parts slot
var selected_bin_slot = -1
var selected_construction_hangar_slot = -1
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y(0)

var _card_game_controller = instance_find(o_card_game_ui, 0)

//check to see if part is being dropped into a bin
for (var i =0; i<15; i++){
	var _center_x = _card_game_controller.parts_slot_x_offset[i]
	var _center_y = _card_game_controller.parts_slot_y_offset
	var _radius = 32*_card_game_controller.resolution_scale
	
	if (point_in_circle(mouse_x, mouse_y, 
	_center_x, _center_y, _radius)){
		selected_bin_slot = i
	}
}
show_debug_message(selected_bin_slot)
if (selected_bin_slot != -1){
	//drop the part into a parts slot that's empty
	if (_card_game_controller.parts_slot[selected_bin_slot] = noone){
		
		with (_card_game_controller){
			_i = other.parts_bin_slot
			parts_slot[@ _i] = noone
			parts_slot[@ selected_bin_slot] = other.reference_object
		}
		reference_object.x = _card_game_controller.parts_slot_x_offset[selected_bin_slot]
		reference_object.y = _card_game_controller.parts_slot_y_offset
		reference_object.parts_bin_slot = selected_bin_slot
	}
	//swap the part with another part instead
	if (_card_game_controller.parts_slot[selected_bin_slot] != noone){
		object_to_swap = _card_game_controller.parts_slot[selected_bin_slot]
		object_to_swap.x = _card_game_controller.parts_slot_x_offset[parts_bin_slot]
		object_to_swap.y = _card_game_controller.parts_slot_y_offset
		object_to_swap.parts_bin_slot = parts_bin_slot
		_card_game_controller.parts_slot[@ i] = object_to_swap
		reference_object.x = _card_game_controller.parts_slot_x_offset[selected_bin_slot]
		reference_object.y = _card_game_controller.parts_slot_y_offset
		reference_object.parts_bin_slot = selected_bin_slot
		with (_card_game_controller){
			parts_slot[@ selected_bin_slot] = other.reference_object
		}
	}
}

//check to see if hovering over a construction hangar
for (var i = 0; i < _card_game_controller.number_of_construction_bays; i++){
	if (point_in_rectangle(mouse_x, mouse_y, 
	_card_game_controller.construction_bay_slot_x_offset,
	_card_game_controller.construction_bay_slot_y_offset[i],
	_card_game_controller.construction_bay_slot_x_offset + (256),
	_card_game_controller.construction_bay_slot_y_offset[i] + (256))){
		selected_construction_hangar_slot = i
	}
}
if (selected_construction_hangar_slot != -1){
	//check to see if the item can be placed into the construction bay
	show_debug_message(selected_construction_hangar_slot)
	
	reference_object.x = 0
	reference_object.y = 0
	reference_object.visible = false
	var _construction_bay = _card_game_controller.construction_bays[selected_construction_hangar_slot]
	//scan the construction bay for an open matching socket
	var matching_socket = -1
	for (var f = 0; f < _card_game_controller.number_of_sockets; f++){
		if (_construction_bay[f] = noone and _card_game_controller.construction_bay_item_type[f] = reference_object.module_type){
			matching_socket = f
			break;
		}
	}
	if (matching_socket != -1){
		_construction_bay[@ matching_socket] = reference_object
		_card_game_controller.parts_slot[parts_bin_slot] = noone
	} else {
		selected_construction_hangar_slot = -1
	}
	
}

//check to see if hovering over the shop to sell

if (selected_bin_slot = -1 and selected_construction_hangar_slot = -1){
	reference_object.visible = true

}
instance_destroy()
