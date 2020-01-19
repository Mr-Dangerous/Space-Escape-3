var thermal_lance = instance_create_layer(x, y, "Projectiles", o_spell_thermal_lance)
var size_multiplier = energy/20
size_multiplier = clamp(size_multiplier, 1, 2.5)
//testing
size_multiplier = 1

energy_sub_counter = 0
energy = 0
with(thermal_lance){
	origin_ship = other
	image_xscale *= size_multiplier
	image_yscale *= size_multiplier
	
}
