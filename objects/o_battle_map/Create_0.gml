//create the player grid

var left_x_offset = 360
var top_y_offset = 160
var grid_spacing = 96

var right_x_offset = 1032

//i is horizantal, j is vertical!

left_grid_positions = array_create(42, [0, 0])
right_grid_positions = array_create(42, [0, 0])
//first value is the grid number
//second number is either the x or y position (0 = x, 1 =y)
left_grid_container = array_create(42, [0, 0])
right_grid_container = array_create(42, [0, 0])
//first value is the grid number,
//second value is the object contained - to be implmented later.

var _k = 0
for (var i = 0; i < 6; i++){
	for (var j = 0; j < 7; j++){
		left_grid_positions[_k, 0] = left_x_offset + (i * grid_spacing)
		left_grid_positions[_k, 1] = top_y_offset + (j * grid_spacing)
		right_grid_positions[_k, 0] = right_x_offset + (i*grid_spacing)
		right_grid_positions[_k, 1] = top_y_offset + (j*grid_spacing)
		left_grid_container[_k, 0] = noone
		right_grid_container[_k, 0] = noone
		_k++
	}
}
