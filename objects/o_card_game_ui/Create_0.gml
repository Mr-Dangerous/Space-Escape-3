/// @description Insert description here

gui_height = display_get_gui_height()
gui_width = display_get_gui_width()
resolution_scale = view_get_wport(0)/camera_get_view_width(view_camera[0])

//generate UI arrays
//generate shop position arrays
shop_slot_ui_x_offset = array_create(5, 0)//this array is the x position of the shop slots
shop_slot_ui_y_offset = gui_height - (108*resolution_scale)
for (var i = 0; i < 5; i++){
	shop_slot_ui_x_offset[i] = (545 + (i*166))*resolution_scale
}
//generate parts bin position array
number_of_parts_slots = 10
parts_slot_ui_x_offset = array_create(10, 0)//this array is the x position of the parts bin
parts_slot_ui_y_offset = gui_height - (150*resolution_scale)
for (var i = 0; i < number_of_parts_slots; i++){
	parts_slot_ui_x_offset[i] = (577 + (i* 84))*resolution_scale
}
//generate construction bay position array
number_of_construction_bays = 3
construction_bay_slot_x_offset = gui_width - (264 * resolution_scale)
construction_bay_slot_y_offset = array_create(3, 0)

for (var i =0; i < number_of_construction_bays; i++){
	construction_bay_slot_y_offset[i] = gui_height- (264*(i+1)*resolution_scale)
}

//generate repair bay position array
number_of_repair_bays = 3
repair_bay_slot_x_offset = (8 * resolution_scale)
repair_bay_slot_y_offset = array_create(3, 0)

for (var i =0; i < number_of_repair_bays; i++){
	repair_bay_slot_y_offset[i] = gui_height- (264*(i+1)*resolution_scale)
}
