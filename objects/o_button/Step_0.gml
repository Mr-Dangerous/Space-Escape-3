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
				
				_ui_spawner.current_menu = menu.resolution
				with(_ui_spawner){
					event_user(0)
				}
				
			break;
			
			case 1:
			with (_ui_spawner){
				event_user(1)
				
			}
			room_goto(r_battle_space);
				
			break;
			
			case 2:
				//set resolution to 1920x1080
				
				window_set_size(1920, 1080)
				view_set_wport(view_camera[0], 1920)
				view_set_hport(view_camera[0], 1080)
			break;
			
			case 3:
				//set resolution to 1600x900
				window_set_size(1600, 900)
				view_set_wport(view_camera[0], 1600)
				view_set_hport(view_camera[0], 900)
			break;
			
			case 4:
				//set resolution to 1280x720?
				window_set_size(1280, 720)
				view_set_wport(view_camera[0], 1280)
				view_set_hport(view_camera[0], 720)
			break;
			case 5:
				_ui_spawner.full_screen = !_ui_spawner.full_screen
				if (_ui_spawner.full_screen){
					var _display_width = display_get_width()
					var _display_height = display_get_height()
					view_set_wport(view_camera[0], _display_width)
					view_set_hport(view_camera[0], _display_height)
				}
				window_set_fullscreen(_ui_spawner.full_screen)
			case 6:
				//return to main menu
				_ui_spawner.current_menu = menu.main
				with (_ui_spawner){
					event_user(0)
				}
			break;
		}
	}
}
