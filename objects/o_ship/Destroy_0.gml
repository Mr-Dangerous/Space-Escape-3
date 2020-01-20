ds_map_destroy(saved_variables)
if (combat_explosion = true){
	var _explosion_sprite = choose (s_explosion_nova_original)

	var _ship_explosion = instance_create_layer(x, y, "Effects", o_ship_explosion)

	//need to create some debris too
	var _explosion_size_range = random_range(2, 3.1)
	with (_ship_explosion){
		sprite_index = _explosion_sprite
		image_xscale = other.image_scale*_explosion_size_range
		image_yscale = other.image_scale*_explosion_size_range
		image_angle = other.image_angle
	}
}
if (ship_sold = true){
	var _sold_item = instance_create_layer(x, y, "Above_Cards", o_sold_item)
	_sold_item.amount = ship_sold_amount
}
