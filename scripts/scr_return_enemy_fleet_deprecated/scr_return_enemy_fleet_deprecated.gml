///@param fleet_size
///@param number_of_enemy_modules_can_spawn

//returns a lsit!

//1/17/20 = do this next!

var _fleet_size = argument0
var _enemy_modules_can_spawn = argument1
//never higher than 6!
enemy_spawn_locations[0,0] = -1
for (var i = 0; i < 7; i++){
	for (var j = 0; j<7; j++){
		enemy_spawn_locations[i, j] = noone
	}
}
enemy_spawn_fleet = ds_list_create()

for (var i =0; i < _fleet_size; i++){
	var _enemy_ship = array_create(4, noone)
	var _x = -1
	var _y = -1
	var _enemy_module_array = array_create(6, noone)
	var _enemy_ship_card = noone
	//select the frame
	var _class = choose(target_class.interceptor, target_class.fighter, target_class.frigate)
	var _enemy_ship_card_resource = noone
	if (_class = target_class.interceptor){
		_enemy_ship_card_resource = choose (o_iron_interceptor_frame_card, 
		o_imperial_interceptor_frame_card, o_crystal_interceptor_frame_card, 
		o_solar_interceptor_frame_card, o_pirate_interceptor_frame_card)
	}
	if (_class = target_class.fighter){
		_enemy_ship_card_resource = choose (o_iron_fighter_frame_card, 
		o_imperial_fighter_frame_card, o_crystal_fighter_frame_card, 
		o_solar_fighter_frame_card, o_pirate_fighter_frame_card)
	}
	if (_class = target_class.frigate){
		_enemy_ship_card_resource = choose (o_iron_frigate_frame_card, 
		o_imperial_frigate_frame_card, o_crystal_frigate_frame_card, 
		o_solar_frigate_frame_card, o_pirate_frigate_frame_card)
	}
	//select the module
	
	for (var k = 0; k<_enemy_modules_can_spawn; k++){
		var _module_assigned = noone
		while (_module_assigned = noone){
			var _random_seed = irandom(5)
			if (_enemy_module_array[_random_seed] = noone){
				
				if (_random_seed = 0){
					//choose weapon systems
					_module_assigned = choose(o_armada_5_module_card)
				}
				if (_random_seed = 1){
					//choose shields
					_module_assigned = choose(o_arrack_refractor_module_card, o_wave_crasher_shield_module_card)
				}
				if (_random_seed = 2){
					//choose armor
					_module_assigned = choose(o_anvil_class_plates_module_card, o_serrated_plates_module_card)
				}
				if (_random_seed = 3){
					//choose targeting
					_module_assigned = choose(o_enhar_targeting_module_module_card)
				}
				if (_random_seed = 4){
					//choose ability amp
					_module_assigned = choose(o_emergency_shield_module_card, o_thermal_lance_module_card)
				}
				if (_random_seed = 5){
					//choose power plant
					_module_assigned = choose(o_arrack_refractor_module_card)
				}
			} else {
				continue
			}
			if (k > 7){
				break;
			}
		}
		var _module = instance_create_layer(0, 0, "Cards", _module_assigned)
		_enemy_module_array[_random_seed] = _module
	}
	_enemy_ship_card = instance_create_layer(room_width, room_height, "Cards", _enemy_ship_card_resource)
	//find the location
	var _location_found = false
	while (_location_found = false){
		_random_x = irandom(5)
		_random_y = irandom(5)
		if (enemy_spawn_locations[_random_x, _random_y] = noone){
			_x = _random_x
			_y = _random_y
			_location_found = true
			enemy_spawn_locations[_x, _y] = 0
		}
	}
	
	
	
	_enemy_ship[0] = _x
	_enemy_ship[1] = _y
	_enemy_ship[2] = _enemy_ship_card
	_enemy_ship[3] = _enemy_module_array
	
	
	ds_list_add(enemy_spawn_fleet, _enemy_ship)
}




return enemy_spawn_fleet
