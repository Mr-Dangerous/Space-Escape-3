///@param x
///@param y
///@param string
///@param color

var _x = argument0
var _y = argument1
var _string_to_display = argument2
var _color = argument3


var _text = instance_create_layer(_x, _y, "Above_Cards", o_text_notification)

_text.string_to_display = _string_to_display
_text.text_color = _color

//maybe add in an argument for bold or something
