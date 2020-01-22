/// @description Insert description here
// You can write your code in this editor
motion_add(270, .1)
duration--
if (duration < 10){
	_image_alpha -= .05
	if (_image_alpha < 0){
		_image_alpha = 0
	}
}
if (duration <= 0){
	instance_destroy()
}