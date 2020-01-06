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
draw_line_width_color(shield_x_offset, shield_y_offset, shield_x_end_offset, shield_y_offset, 6, c_blue, c_white)

var energy_bar_color = c_teal
if (energy >= max_energy){
	energy_bar_color = c_purple
}
var energy_y_offset = y+20
var energy_x_offset = x-32
var energy_x_end_offset = x+((energy/max_energy) *64)-32
draw_line_width_color(energy_x_offset, energy_y_offset, energy_x_end_offset, energy_y_offset, 6, energy_bar_color, c_purple)
#endregion