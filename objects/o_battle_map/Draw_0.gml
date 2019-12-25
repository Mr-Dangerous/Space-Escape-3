/// @description Insert description here
// You can write your code in this editor
var grid_spaces = array_length_1d(grid_positions)

var _k =0
repeat(grid_spaces){
	draw_sprite(s_grid_box, 0, grid_positions[_k, 0], grid_positions[_k, 1])
	_k++
}