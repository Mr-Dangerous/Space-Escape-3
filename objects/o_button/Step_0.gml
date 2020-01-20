/// @description Insert description here
// You can write your code in this editor
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)




if (point_in_rectangle(_mouse_x, _mouse_y, x+button_offsets[0], y+button_offsets[1],
x+button_offsets[2], y+button_offsets[3])){
	hover = 1	
	color = c_blue
} else {
	hover = 0
	color = c_white
}
if (hover=1){
	if (mouse_check_button_pressed(mb_left)){
		switch(button_function){
			case 0:
			
			break;
			
			case 1:
				room_goto(r_battle_space);
			break;
		}
	}
}
