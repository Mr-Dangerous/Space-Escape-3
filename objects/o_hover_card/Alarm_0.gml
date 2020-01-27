/// @description Insert description here
with(reference_factory){
	event_user(0)
}
var _shield_string_stat_array = array_create(2, 0)
_shield_string_stat_array[0] = "Shields"//Header
_shield_string_stat_array[1] = string("Units: " + string(reference_factory.shields) + 
"\n" + string("Deflection Power: " + string(reference_factory.shield_power))) 


var _armor_string_stat_array = array_create(2, 0)
_armor_string_stat_array[0] = "Armor"//Header
_armor_string_stat_array[1] = string("Integrity: " + string(reference_factory.armor) + 
"\n" + string("Resilency: " + string(reference_factory.armor_resilency)))


var _movement_string_stat_array = array_create(2, 0)
_movement_string_stat_array[0] = "Mobility"
_movement_string_stat_array[1] = string("Max Speed: " + string(reference_factory.max_speed))+ 
"\n" + string("Turn Speed: " + string(reference_factory.turn_speed))
//maybe add acceleration if there is room!


var _basic_weapon_string_array = array_create(2, 0)
_basic_weapon_string_array[0] = "Built in Weapons"
_basic_weapon_string_array[1] = string("Number of Weapons: " + string(reference_factory.basic_attack_number)) + 
"\n" + string("Damage: " + string(reference_factory.basic_attack_weapon_damage)) + 
"\n" + string("Projectile Mass: " + string(reference_factory.basic_attack_weapon_mass)) + 
"\n" + string("Fire Rate: " + string(reference_factory.basic_attack_weapon_speed/60) + " /sec")


var _secondary_weapon_string_array = array_create(1, 0)
_secondary_weapon_string_array[0] = "Secondary Weapons"
if (reference_factory.secondary_attack_exists){
	_secondary_weapon_string_array[1] = string("Number of Weapons: " + string(reference_factory.secondary_attack_number)) + 
	"\n" + string("Damage: " + string(reference_factory.secondary_attack_weapon_damage)) + 
	"\n" + string("Projectile Mass: " + string(reference_factory.secondary_attack_weapon_mass)) + 
	"\n" + string("Fire Rate: " + string(reference_factory.secondary_attack_weapon_speed/60) + " /sec")
}

var _energy_string_array = array_create(2, 0)
_energy_string_array[0] = "Energy"
_energy_string_array[1] = string("Energy: " + string(reference_factory.energy_starting) + "/" + string(reference_factory.energy_to_cast) + 
"\n" + string("Generation: " + string(reference_factory.energy_regeneration)) + 
"\n" + "Ability Power:  100%")


var _blank = array_create(2, "")



display_strings[# 0, 0] = _shield_string_stat_array
display_strings[# 1, 0] = _armor_string_stat_array
display_strings[# 2, 0] = _movement_string_stat_array
display_strings[# 0, 1] = _basic_weapon_string_array
display_strings[# 1, 1] = _blank
display_strings[# 2, 1] = _secondary_weapon_string_array
display_strings[# 0, 2] = _energy_string_array
display_strings[# 1, 2] = _blank
display_strings[# 2, 2] = _blank
display_strings[# 0, 3] = _blank
display_strings[# 1, 3] = _blank
display_strings[# 2, 3] = _blank

