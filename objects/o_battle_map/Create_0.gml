//create the player grid

var left_x_offset = 385
var top_y_offset = 160
var grid_spacing = 96

var right_x_offset = 1038

//i is horizantal, j is vertical!

left_grid_positions = ds_grid_create(6, 7)
right_grid_positions = ds_grid_create(6, 7)
//first value is the grid number
//second number is either the x or y position (0 = x, 1 =y)
left_grid_container = ds_grid_create(6, 7)
ds_grid_clear(left_grid_container, noone)
right_grid_container = ds_grid_create(6, 7)
ds_grid_clear(right_grid_container, noone)
//first value is the grid number,
//second value is the object contained - to be implmented later.


for (var i = 0; i < 6; i++){
	for (var j = 0; j < 7; j++){
		var grid_position = array_create(2, 0)
		grid_position[0] = left_x_offset + (i * grid_spacing)
		grid_position[1] = top_y_offset + (j * grid_spacing)
		ds_grid_set(left_grid_positions, i, j, grid_position) 
		
		grid_position[0] = right_x_offset + (i * grid_spacing)
		grid_position[1] = top_y_offset + (j * grid_spacing)
		ds_grid_set(right_grid_positions, i, j, grid_position) 
	}
}


battle_map_visible = true
