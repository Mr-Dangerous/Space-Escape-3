/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(s_window_original, 0, gui_x, gui_y, 256, 256)

v_spacing = 50
h_spacing =  80
draw_set_halign(fa_center)
for (var i = 0; i < ds_grid_width(display_strings); i++){
	for (var j = 0; j < ds_grid_height(display_strings); j++){
		var _display_string = ds_grid_get(display_strings, i, j)
		
		//TODO make this nicer!
		draw_text(gui_x + 15 + ((i)*h_spacing), gui_y+((j+1)*v_spacing), _display_string)
	}
}