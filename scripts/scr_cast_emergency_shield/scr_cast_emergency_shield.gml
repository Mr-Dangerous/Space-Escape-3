if (emergency_shield_counter = 0){
	temporary_shields += 5*energy
}
show_debug_message("spell cast")
temporary_shield_counter = 360
emergency_shield_counter = 360
energy = 0
energy_sub_counter = 0
scr_fire_missile()
