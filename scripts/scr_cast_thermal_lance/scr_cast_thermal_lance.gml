var thermal_lance = instance_create_layer(x, y, "Projectiles", o_spell_thermal_lance)
show_debug_message("spell cast!")
energy_sub_counter = 0
energy = 0
with(thermal_lance){
	origin_ship = other
	
}
state = ship.firing_range//to change to battle