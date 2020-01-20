/// @description Insert description here
// You can write your code in this editor

var _view_width = view_get_wport(view_camera[0])
var _view_height = view_get_hport(view_camera[0])

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

_x = _view_width/2
_y = _view_height/2 - 300 * (_view_height/1080)

draw_set_font(f_title_font)
draw_text_transformed_color(_x, _y, "Space Escape", 1.1, 1.1, 0, c_black, c_black, c_black, c_black, 1)
draw_text_transformed_color(_x, _y, "Space Escape", 1, 1, 0, c_white, c_white, c_red, c_red, 1)

draw_set_font(f_card_font)



draw_set_halign(fa_left)
draw_set_valign(fa_top)
