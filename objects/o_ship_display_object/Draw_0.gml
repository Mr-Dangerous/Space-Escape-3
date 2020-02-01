/// @description Insert description here
// You can write your code in this editor
_image_angle += .5
var k = 0
for (var i = 0; i < ds_grid_width(display_grid); i++){
	for (var j = 0;  j < ds_grid_height(display_grid); j++){
		var _sprite = ds_list_find_value(sprites_to_display, k)
		if (_sprite != undefined){
			var _grid_value = display_grid[# i, j]
			_x = _grid_value[0]
			_y = _grid_value[1]
			draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, _image_angle, c_white, 1)
		}
		k++
	}
}