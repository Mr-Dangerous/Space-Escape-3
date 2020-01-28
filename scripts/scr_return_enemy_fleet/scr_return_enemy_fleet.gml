//@param number_of_enemy_ships
//@param modules_on_each_ship]

var _fuel = argument0
var _modules_on_ship = argument1
_modules_on_ship = 0
var _enemy_fleet = ds_list_create()

//enemy fleet will be a list of an array of the x, y positions and a module list and a ship frame card.
//First, create a grid to represent the available spaces.
enemy_spawn_locations = ds_grid_create(6, 7)
//ds_grid_set_region(enemy_spawn_locations, 0, 0, 6, 7, noone)


while(_fuel > 0){
	var _enemy_ship_to_add = array_create(4, -1)
	var _x = -1 //assigned grid x
	var _y = -1 //assigned grid y
	var _ship_card = instance_create_layer(50, 50, "Cards", o_ship_frame_parent)
	var _module_list = array_create(6, noone)
	var position_assigned = false
	do{
		var _grid_width = ds_grid_width(enemy_spawn_locations)
		var _random_x = irandom(_grid_width)
		var _grid_height = ds_grid_height(enemy_spawn_locations)
		var _random_y = irandom(_grid_height)
		var _grid_value = enemy_spawn_locations[# _random_x, _random_y]
		if (_grid_value = 0){
			position_assigned = true
			_x = _random_x
			_y = _random_y
		}
		
	} until position_assigned = true
	
	//select the card to inject
	var _ship_class = scr_choose_ship_class(player_level)//to be changed later
	var _ship_frame_book = scr_choose_frame(_ship_class)
	
	var _ship_stats = ship_maps[? _ship_frame_book[0]]
	with (_ship_card){
		//CONSIDERATION: you may want to have ALL stats in this]//because you might want to hover for them!
	
		name = string(_ship_stats[? "Name"])
		class = string(_ship_stats[? "Class"])
		sub_class = string(_ship_stats[? "Sub Class"])
		origin = string(_ship_stats[? "Origin"])
		resource_cost = _ship_stats[? "Fuel Cost"]//this can be level later, for now, this works.
		fuel_cost = _ship_stats[? "Fuel Cost"]
		var _graphic_script = string(_ship_stats[? "Weapons and Exhaust"])
		graphic_offset_script = asset_get_index(_graphic_script)//may need to change the name later
		
		var _sprite = asset_get_index(string(_ship_stats[? "Sprite"]))
		sprite_index = _sprite
	}
	_fuel -= _ship_card.fuel_cost
	//make some fucking modules!
	var _modules_to_allocate = _modules_on_ship
	while (_modules_to_allocate > 0){
		var _module_level = scr_return_card_level(card_type.module)//TODO the level should be able to change here.
		var _selected_card_object = instance_create_layer(-50, -50, "Cards", o_module_card_parent)//o_card eventually
		//select a module by name
		var _card_level_book = ds_list_find_value(complete_module_book, _module_level)
		var _card_level_book_size = ds_list_size(_card_level_book)
		var _selected_card_book = ds_list_find_value(_card_level_book, irandom(_card_level_book_size))
		var _module_stats = module_maps[? _selected_card_book[0]]
		with (_selected_card_object){
			//CONSIDERATION: you may want to have ALL stats in this]//because you might want to hover for them!
	
			name = string(_module_stats[? "Name"])
			class = string(_module_stats[? "Class"])
			sub_class = string(_module_stats[? "Sub Class"])
			origin = string(_module_stats[? "Origin"])
			resource_cost = _module_stats[? "Level"]
			module_type = _module_stats[? "Module Type"]
			loading_script = asset_get_index(_module_stats[? "Loading Script"])
			var _sprite = asset_get_index(string(_module_stats[? "Sprite"]))
			sprite_index = _sprite
			card_book = _selected_card_book
		}
		//check to make sure yoiu're not duplicating module types
		
		
		ds_map_destroy(_module_stats)//might not need to destroy either of these
		ds_list_destroy(_card_level_book)//,may not need to destroy this
	}
	
	
	
	
	
	_enemy_ship_to_add[0] = _x
	_enemy_ship_to_add[1] = _y
	_enemy_ship_to_add[2] = _ship_card
	_enemy_ship_to_add[3] = _module_list
	ds_list_add(_enemy_fleet, _enemy_ship_to_add)

}

ds_grid_destroy(enemy_spawn_locations)
return _enemy_fleet