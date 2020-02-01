/// @description Insert description here
// You can write your code in this editor

sprites_to_display = ds_list_create()
_image_angle = 0

var sprite_prefix = "s_tox_dark_purple_"

for (var i = 1; i < 25; i++){
	var _number = string(i)
	if (i < 10){
		_number = string("0" + string(i))
	}
	var _asset_index = asset_get_index(string(sprite_prefix + _number))
	if (_asset_index != undefined){
		ds_list_add(sprites_to_display, _asset_index)
	} else {
		break;
	}
}

display_grid = ds_grid_create(6, 4)

for (var i = 0; i < 6;  i++){
	for (var j = 0; j < 4; j++){
		var _grid_coordinates = array_create(2, 0)
		_grid_coordinates[0] = (i+1) * 250
		_grid_coordinates[1] = ((j) * 250)+75
		ds_grid_set(display_grid, i, j, _grid_coordinates)
	}
}
