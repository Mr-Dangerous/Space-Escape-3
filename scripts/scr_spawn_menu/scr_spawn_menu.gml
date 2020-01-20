//nice


var _play_button = instance_create_layer(x, y, "Instances", o_button)
_play_button.button_function = 0
_play_button.hover = 1
_play_button.x = view_wport[0] / 2
_play_button.y = view_hport[0] / 2 + 40 * _play_button.button_function

var _test_range_button = instance_create_layer(x, y, "Instances", o_button)
_test_range_button.button_function = 1
_test_range_button.hover = 1
_test_range_button.x = view_wport[0] / 2
_test_range_button.y = view_hport[0] / 2 + 40 * _test_range_button.button_function


