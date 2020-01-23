draw_self()



#region armor, shield, and energy bars
//background

var whole_bar_y_offset = y + 26
var whole_bar_x_offset = x - 34
var whole_bar_x_end_offset = x + 34
draw_line_width_color(whole_bar_x_offset-2, whole_bar_y_offset, whole_bar_x_end_offset+2, whole_bar_y_offset, 18, c_black, c_black)
draw_line_width_color(whole_bar_x_offset, whole_bar_y_offset, whole_bar_x_end_offset, whole_bar_y_offset, 16, c_gray, c_gray)


var armor_color = c_green
if((armor/max_armor)<.6) armor_color = c_orange
if((armor/max_armor)<.25) armor_color = c_red
var armor_y_offset = y+30
var armor_x_offset = x-32
var armor_x_end_offset = x+((armor/max_armor) *64)-32
draw_line_width_color(armor_x_offset, armor_y_offset, armor_x_end_offset, armor_y_offset, 6, c_green, armor_color)

//shield bar
var shield_y_offset = y+24
var shield_x_offset = x-32
var shield_x_end_offset = x+((shields/max_shields) *64)-32
draw_line_width_color(shield_x_offset, shield_y_offset, shield_x_end_offset, shield_y_offset, 6, c_blue, c_blue)

if (temporary_shields > 0){
	var percent_of_bar_to_show = (temporary_shields/max_shields) * 64
	
	var temporary_shield_x_end_offset = x-(percent_of_bar_to_show) +32
	var temporary_shield_x_offset = x+32
	draw_line_width_color(temporary_shield_x_offset, shield_y_offset, temporary_shield_x_end_offset, shield_y_offset, 6, c_white, c_white)
}
var energy_bar_color = c_teal
if (energy >= max_energy){
	energy_bar_color = c_purple
}
var energy_y_offset = y+20
var energy_x_offset = x-32
var energy_x_end_offset = x+((energy/max_energy) *64)-32
draw_line_width_color(energy_x_offset, energy_y_offset, energy_x_end_offset, energy_y_offset, 6, energy_bar_color, c_purple)
#endregion

#region shield srpites
shield_color = c_white
if (generate_shields > 0){
	var _shield_sprite = shield_sprite
	if (temporary_shields > 0){
		_shield_sprite = secondary_shield_sprite
	}
	shield_alpha = generate_shields * .1
	shield_alpha = clamp(shield_alpha, 0, 1)

	draw_sprite_ext(_shield_sprite, 0, x, y, .15*sprite_height*image_scale, .15*sprite_height*image_scale, image_angle, shield_color, shield_alpha)
	generate_shields-=.3
	
}
#endregion

#region exhaust_sprites
for (var i = 0; i < array_height_2d(exhaust_array); i++){
	exhaust_sub_image_counter++
	var _sub_image = round(exhaust_sub_image_counter/5)
	_x = x+lengthdir_x(exhaust_array[i, 1], image_angle+exhaust_array[i, 0])
	_y = y+lengthdir_y(exhaust_array[i, 1], image_angle+exhaust_array[i, 0])
	var _exhaust_image_scale = image_scale * exhaust_scale_multiplier//times a multiplier that makes it bigger or smaller!
	draw_sprite_ext(exhaust_sprite, _sub_image, _x, _y, 
	_exhaust_image_scale, _exhaust_image_scale, image_angle, c_white, image_alpha)
	if (exhaust_sub_image_counter > sprite_get_number(exhaust_sprite)*5){
		exhaust_sub_image_counter = 0
	}
}

#endregion