x = mouse_x
y = mouse_y

_card_game_controller = instance_find(o_card_game_ui, 0)
for (var i = 0; i < _card_game_controller.number_of_construction_bays; i++){
	var _xx = _card_game_controller.construction_bay_slot_x_offset
	var _yy = _card_game_controller.construction_bay_slot_y_offset[i]
	draw_rectangle(_xx, _yy, _xx+256, _yy+256, false)

	
}