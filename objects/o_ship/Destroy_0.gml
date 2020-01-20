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
	in_play = false
}

var battle_map = instance_find(o_battle_map, 0)
var grid_container = battle_map.left_grid_container
ds_grid_set(grid_container, assigned_grid_x, assigned_grid_y, noone)
if (in_play = false){ 
	card_game_ui_object.current_fuel_spent -= fuel_cost
	reference_factory.new_ship = true
}

