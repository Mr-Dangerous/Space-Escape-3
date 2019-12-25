/// @description Insert description here
// You can write your code in this editor
var grid_spaces = array_length_1d(left_grid_positions)


var _k =0
repeat(grid_spaces){
	draw_sprite(s_grid_box, 0, left_grid_positions[_k, 0], left_grid_positions[_k, 1])
	draw_sprite(s_grid_box, 0, right_grid_positions[_k, 0], right_grid_positions[_k, 1])
	_k++
}