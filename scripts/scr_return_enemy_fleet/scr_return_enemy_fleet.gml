//@param number_of_enemy_ships
//@param modules_on_each_ship]

var _fleet_size = argument0
var _modules_on_ship = argument1
var _enemy_fleet = ds_list_create()

//enemy fleet will be a list of an array of the x, y positions and a module list and a ship frame card.
//First, create a grid to represent the available spaces.
var enemy_spawn_locations = ds_grid_create(6, 7)
ds_grid_set_region(enemy_spawn_locations, 0, 0, 6, 7, noone)


for (var i = 0; i < _fleet_size; i++)
{
	var _enemy_ship_to_add = array_create(4, -1)
	var _x = -1 //assigned grid x
	var _y = -1 //assigned grid y
	var _ship_card = instance_create_layer(50, 50, "Cards", o_ship_frame_parent)
	var _module_list = array_create(6, noone)
	
	
	
	//there might need to be some JSON fuckery later
	var position_assigned = false
	do{
		var _random_x = irandom(ds_grid_width(enemy_spawn_locations))
		var _random_y = irandom(ds_grid_height(enemy_spawn_locations))
		var _grid_value = enemy_spawn_locations[# _random_x, _random_y]
		if (_grid_value = noone){
			position_assigned = true
			_x = _random_x
			_y = _random_y
		}
		
	}
	until position_assigned = true
	
	
	
	
	_enemy_ship_to_add[0] = _x
	_enemy_ship_to_add[1] = _y
	_enemy_ship_to_add[2] = _ship_card
	_enemy_ship_to_add[3] = _module_list
	ds_list_add(_enemy_fleet, _enemy_ship_to_add)
	ds_grid_destroy(enemy_spawn_locations)
}


return _enemy_fleet