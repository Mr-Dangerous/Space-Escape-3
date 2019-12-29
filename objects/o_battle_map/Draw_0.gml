/// @description Insert description here
// You can write your code in this editor
var grid_height = ds_grid_height(left_grid_positions)
var grid_width = ds_grid_width(left_grid_positions)


for (var i = 0; i < grid_width; i++){
	for (var j = 0; j < grid_height; j++){
		_position = ds_grid_get(left_grid_positions, i, j)
		draw_sprite(s_grid_box, 0, _position[0], _position[1])
		_position = ds_grid_get(right_grid_positions, i, j)
		draw_sprite(s_grid_box, 0, _position[0], _position[1])
	}
}


	

