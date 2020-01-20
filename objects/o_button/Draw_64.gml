/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)
draw_rectangle(x+button_offsets[0]-2, y+button_offsets[1]-2,
x+button_offsets[2]+2, y+button_offsets[3]+2, false)
draw_set_color(color)
draw_rectangle(x+button_offsets[0], y+button_offsets[1],
x+button_offsets[2], y+button_offsets[3], false)
draw_set_color(c_black)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x, y, button_text)






draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)