ds_map_destroy(saved_variables)
var _explosion_sprite = choose (s_explosion_nova_original)

var _ship_explosion = instance_create_layer(x, y, "Effects", o_ship_explosion)

//need to create some debris too

with (_ship_explosion){
	sprite_index = _explosion_sprite
	image_xscale = other.image_scale*3
	image_yscale = other.image_scale*3
	image_angle = image_angle
}
