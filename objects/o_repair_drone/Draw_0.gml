/// @description Insert description here
// You can write your code in this editor

if (state = repair_drone.attached){
	if(instance_exists(target_ship)){
		draw_line_width_color(x, y, target_ship.x + x_offset, target_ship.y + y_offset, 3, c_green, c_green)
	}
}
draw_self()