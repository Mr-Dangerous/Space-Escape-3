/// @description 

var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
draw_sprite_stretched_ext(sprite_index, 0, _mouse_x-36, _mouse_y-36, 72, 72, c_white, .6)


var _shop_x = card_game_ui_object.shop_slot_ui_x_offset[0]
var _shop_y = card_game_ui_object.shop_slot_ui_y_offset
var _shop_xx = card_game_ui_object.shop_slot_ui_x_offset[4]+251//TODO:these numbers need to be adjusted
var _shop_yy = card_game_ui_object.shop_slot_ui_y_offset+110//TODO
if (_mouse_y + 150 >= _shop_y) {
	var _difference = _shop_y - _mouse_y
	var _image_alpha = (1/(_difference)) + .3//i want this to start low and get higher unitl 1
	_image_alpha = clamp(_image_alpha, 0, 1)
	if (_mouse_y >= _shop_y) _image_alpha = 1
	draw_set_alpha(_image_alpha)
	draw_set_color(c_blue)
	draw_rectangle(_shop_x, _shop_y, _shop_xx, _shop_yy, false)
	draw_set_color(c_white)
	draw_set_alpha(1)
}


