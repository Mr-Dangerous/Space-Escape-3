/// @description Insert description here
// You can write your code in this editor

//strings

display_strings = ds_grid_create(3, 4)
for (var i = 0; i < ds_grid_width(display_strings); i++){
	for (var j = 0; j < ds_grid_height(display_strings); j++){
		ds_grid_add(display_strings, i, j, string("Testing" + string (i+j)))
	}
}
alarm[0] = 2





//offsets
