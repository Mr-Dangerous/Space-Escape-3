/// @description Insert description here
// You can write your code in this editor
var _gui_y = gui_y

draw_sprite_stretched(s_window_original, 0, gui_x, _gui_y, 384, 384)

v_spacing = 95
h_spacing =  120
draw_set_halign(fa_left)

for (var i = 0; i < ds_grid_width(display_strings); i++){
	for (var j = 0; j < ds_grid_height(display_strings); j++){
		var _display_string = ds_grid_get(display_strings, i, j)
		var _display_string_lines = array_length_1d(_display_string)
		for (var k = 0; k < _display_string_lines; k++){
			if(k = 0) draw_set_font(f_card_font)
			if(k > 0) draw_set_font(f_small_font)
			var _string = _display_string[k]
			var _x = gui_x + (h_spacing*i) + 20
			if (i = 2 and j = 1){
				_x -= 65
			}
			var _y = _gui_y + (v_spacing*(j+1))
			if(k >0) _y+=20+10*k
			
			draw_text(_x, _y, _string)
		}
	}
}