/// @description adjust the variables

if (instance_exists(ship_frame_contained)){
	//get the map of the ship
	var _ship_name = ship_frame_contained.name
	var _ship_map = card_game_ui_object.ship_maps[? _ship_name]
	
	armor = _ship_map[? "Armor"]
	shields = _ship_map[? "Shields"]
	armor_resilency = _ship_map[? "Armor Resiliency"]
	shield_power = _ship_map[? "Shield Power"] //maximum mass the ship can deflect
	max_speed = _ship_map[? "Max Speed"]
	turn_speed = _ship_map[? "Turn Speed"]
	acceleration_rate = _ship_map[? "Acceleration"]
	basic_attack_number = _ship_map[? "Number of Basic Attacks"] //quantity of attacks per attack
	basic_attack_projectile_speed = _ship_map[? "Basic Attack Projectile Speed"]
	basic_attack_projectile_duration = _ship_map[? "Basic Attack Projectile Duration"]
	basic_attack_weapon_speed = _ship_map[? "Basic Attack Weapon Speed"] // divide by 60 for attacks per second
	basic_attack_weapon_damage = _ship_map[? "Basic Attack Weapon Damage"] 
	basic_attack_weapon_mass = _ship_map[? "Basic Attack Weapon Mass"]
	energy_starting = _ship_map[? "Energy Starting"]
	energy_to_cast = _ship_map[? "Energy to Cast"]
	energy_regeneration = _ship_map[? "Energy Generation"]
	sprite_to_load = asset_get_index(_ship_map[? "Sprite"])
	//graphic_offset_script = asset_get_index(_ship_map[? "Weapons and Exhaust"])
	//basic_ability_script = asset_get_index(_ship_map[? "Basic Ability Script"])
}
for (var i = 0; i < 6; i ++){
	if (instance_exists(factory_item[i, 1])){
		script_execute(factory_item[i, 1].loading_script)
	}
}
