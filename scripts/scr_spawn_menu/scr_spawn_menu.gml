//nice

switch(current_menu){

case menu.main:
var _play_button = instance_create_layer(x, y, "Instances", o_button)
_play_button.button_function = 0
_play_button.hover = 1
_play_button.x = view_wport[0] / 2
_play_button.y = view_hport[0] / 2 + 80 * _play_button.button_function

var _test_range_button = instance_create_layer(x, y, "Instances", o_button)
_test_range_button.button_function = 1
_test_range_button.hover = 1
_test_range_button.x = view_wport[0] / 2
_test_range_button.y = view_hport[0] / 2 + 80 * _test_range_button.button_function
break;

case menu.resolution:
var _1920x_1080_resolution_button = instance_create_layer(x, y, "Instances", o_button)
_1920x_1080_resolution_button.button_function = 2
_1920x_1080_resolution_button.hover = 1
_1920x_1080_resolution_button.x = view_wport[0] / 2
_1920x_1080_resolution_button.y = view_hport[0] / 2 + 80 * (_1920x_1080_resolution_button.button_function-_1920x_1080_resolution_button.button_function)

var _1600x_900_resolution_button = instance_create_layer(x, y, "Instances", o_button)
_1600x_900_resolution_button.button_function = 3
_1600x_900_resolution_button.hover = 1
_1600x_900_resolution_button.x = view_wport[0] / 2
_1600x_900_resolution_button.y = view_hport[0] / 2 + 80 * (_1600x_900_resolution_button.button_function-_1920x_1080_resolution_button.button_function)


var _1280x_720_resolution_button = instance_create_layer(x, y, "Instances", o_button)
_1280x_720_resolution_button.button_function = 4
_1280x_720_resolution_button.hover = 1
_1280x_720_resolution_button.x = view_wport[0] / 2
_1280x_720_resolution_button.y = view_hport[0] / 2 + 80 * (_1280x_720_resolution_button.button_function-_1920x_1080_resolution_button.button_function)

var return_button = instance_create_layer(x, y, "Instances", o_button)
return_button.button_function = 5
return_button.hover = 1
return_button.x = view_wport[0] / 2
return_button.y = view_hport[0] / 2 + 80 * (return_button.button_function-_1920x_1080_resolution_button.button_function)

break;
}