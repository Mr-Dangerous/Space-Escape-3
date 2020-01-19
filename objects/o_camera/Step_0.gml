/// @description Insert description here
// You can write your code in this editor
/*
if (current_zoom_level != selected_zoom_level){
	
	
}
*/



selected_zoom = zoom_levels[selected_zoom_level]
var _differential = 1
if (abs(selected_zoom - current_zoom) > .3){
	var _divisor = abs(selected_zoom - current_zoom)
	_differential *= _divisor/.3
	_differential = clamp(_differential, 1, 10)
}
if (current_zoom < selected_zoom){
	current_zoom += .01 * _differential
}
if (current_zoom > selected_zoom){
	current_zoom -= .01 * _differential
}

var _new_camera_width = round(base_camera_width*current_zoom)
var _new_camera_height = round(base_camera_height*current_zoom)

camera_set_view_size(view_camera[0], _new_camera_width,_new_camera_height)



//find the new x position and y position of the camera
var _new_x = -(_new_camera_width - base_camera_width)/2
var _new_y = -(_new_camera_height - base_camera_height)/2

camera_set_view_pos(view_camera[0], _new_x, _new_y)
