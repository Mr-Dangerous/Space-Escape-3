/// @description Spawn the enemy fleet!

//load the enemy fleet into an array
//enemy_spawn_fleet[0, 0]= //assigned grid x position
//enemy_spawn_fleet[0, 1]= //assigned grid y position
//enemy_spawn_fleet[0, 2]= //assigned frame
//enemy_module_array = array_create(6, noone)//assign objects as needed, need to spawn them though.
//enemy_spawn_fleet[0, 3]= //module array, if needed



for (var i = 0; i < 5; i++){
	
}
var _frigate_card = choose (o_iron_frigate_frame_card, 
o_imperial_frigate_frame_card, o_crystal_frigate_frame_card, 
o_solar_frigate_frame_card, o_pirate_frigate_frame_card)





var _enemy_ship_card = instance_create_layer(room_width, room_height, "Cards", o_iron_frigate_frame_card)
var _enemy_module_array = array_create(6, noone)
_enemy_module_array[0] = instance_create_layer(0, 0, "Cards", o_armada_5_module_card)
enemy_spawn_fleet[0, 0] = 2
enemy_spawn_fleet[0, 1] = 2
enemy_spawn_fleet[0, 2] = _enemy_ship_card
enemy_spawn_fleet[0, 3] = _enemy_module_array

var _enemy_ship_card = instance_create_layer(room_width, room_height, "Cards", o_iron_interceptor_frame_card)
var _enemy_module_array = array_create(6, noone)
enemy_spawn_fleet[1, 0] = 0
enemy_spawn_fleet[1, 1] = 2
enemy_spawn_fleet[1, 2] = _enemy_ship_card
enemy_spawn_fleet[1, 3] = _enemy_module_array

var _enemy_ship_card = instance_create_layer(room_width, room_height, "Cards", o_iron_fighter_frame_card)
var _enemy_module_array = array_create(6, noone)
enemy_spawn_fleet[2, 0] = 0
enemy_spawn_fleet[2, 1] = 3
enemy_spawn_fleet[2, 2] = _enemy_ship_card
enemy_spawn_fleet[2, 3] = _enemy_module_array


//send the fleet order to the factories
var _enemy_fleet_size = array_height_2d(enemy_spawn_fleet)
for (var i = 0; i < _enemy_fleet_size; i++){
	var enemy_ship_factory = enemy_ship_factories[i]
	enemy_ship_factory.assigned_grid_x = enemy_spawn_fleet[i, 0]
	enemy_ship_factory.assigned_grid_y = enemy_spawn_fleet[i, 1]
	enemy_ship_factory.ship_frame_contained = enemy_spawn_fleet[i, 2]
	var _enemy_ship_module_list = enemy_spawn_fleet[i, 3]
	for (var j = 0; j < array_length_1d(enemy_spawn_fleet[i, 3]); j++){
		enemy_ship_factory.factory_item[j, 1] = _enemy_ship_module_list[j]
	}
}




