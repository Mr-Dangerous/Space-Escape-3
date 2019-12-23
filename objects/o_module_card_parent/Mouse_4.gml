/// @description Insert description here
visible = false
x = 0
y = 0
module_clone = instance_create_layer(mouse_x, mouse_y, "Instances", o_module_clone)

with (module_clone){
	reference_object= other
	parts_bin_slot = other.parts_bin_slot
	sprite_index = other.sprite_index
	image_xscale = other.image_scale
	image_yscale = other.image_scale

	
}
