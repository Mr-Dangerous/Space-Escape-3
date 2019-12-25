//create the player grid

var left_x_offset = 360
var top_y_offset = 160
var grid_spacing = 96

//i is horizantal, j is vertical!

grid_positions = array_create(42, [0, 0])
//first value is the grid number
//second number is either the x or y position (0 = x, 1 =y)
grid_container = array_create(42, [0, 0])
//first value is the grid number,
//second value is the object contained - to be implmented later.

var _k = 0
for (var i = 0; i < 6; i++){
	for (var j = 0; j < 7; j++){
		grid_positions[_k, 0] = left_x_offset + (i * grid_spacing)
		grid_positions[_k, 1] = top_y_offset + (j * grid_spacing)
		grid_container[_k, 0] = noone
		_k++
	}
}
