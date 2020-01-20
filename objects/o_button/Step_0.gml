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
				var _ui_spawner = instance_find(o_ui_spawner, 0)
				_ui_spawner.current_menu = menu.resolution
				
			break;
			
			case 1:
				event_user(0)
				room_goto(r_battle_space);
				
			break;
			
			case 2:
				//set resolution to 1920x1080
				view_set_wport(view_camera[0], 1920)
				view_set_hport(view_camera[0], 1080)
			break;
			
			case 3:
				//set resolution to 1600x900
				view_set_wport(view_camera[0], 1920)
				view_set_hport(view_camera[0], 1080)
			break;
			
			case 4:
				//set resolution to 1280x720?
				view_set_wport(view_camera[0], 1920)
				view_set_hport(view_camera[0], 1080)
			break;
			case 5:
				//return to main menu
				current_menu = menu.main
				event_user(1)
			break;
		}
	}
}
