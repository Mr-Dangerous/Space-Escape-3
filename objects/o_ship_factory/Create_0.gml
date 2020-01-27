/// @description 

_card_game_controller = instance_find(o_card_game_ui, 0)
resolution_scale = _card_game_controller.resolution_scale

ship_deployed = false
create_ship = false
factory_team = team.left
new_ship = true
hover = false
hover_timer = 0
hover_card = noone
_factory_sprite_size = sprite_get_width(s_factory_dock)*.8

//module socket offests - assuming factories are origin center
socket_offsets[0, 0]= 0 //x
socket_offsets[0, 1]= 0//y
var _vertical_spacing = 24*resolution_scale

for (var i = 0; i < 3; i++){
	socket_offsets[i, 0] = 24*resolution_scale
	socket_offsets[i, 1] = (100*resolution_scale) - (_vertical_spacing*i)
	socket_offsets[i+3, 0] = 96*resolution_scale
	socket_offsets[i+3, 1] = (100*resolution_scale) - (_vertical_spacing*i)
}


factory_item[0, 0] = module.weapon//the type to compare agaisnt
factory_item[0, 1] = noone
factory_item[0, 2] = false
factory_item[1, 0] = module.shields
factory_item[1, 1] = noone
factory_item[1, 2] = false
factory_item[2, 0] = module.armor
factory_item[2, 1] = noone
factory_item[2, 2] = false
factory_item[3, 0] = module.targeting
factory_item[3, 1] = noone
factory_item[3, 2] = false
factory_item[4, 0] = module.ability
factory_item[4, 1] = noone
factory_item[4, 2] = false
factory_item[5, 0] = module.power_plant
factory_item[5, 1] = noone
factory_item[5, 2] = false

//origin
imperial_count = 0
iron_count = 0
solar_count = 0
crystal_count = 0
pirate_count = 0

//classes
hunter_count = 0
breakthrough_count = 0
ghost_count = 0
ECP_count = 0
weapons_platform_count = 0
shield_count = 0
command_count = 0
support_count = 0
corvette_count = 0

//Stats
armor = 0
shields = 0
armor_resilency = 0
shield_power = 0 //maximum mass the ship can deflect
max_speed = 0
turn_speed = 0
acceleration_rate = 0
basic_attack_number = 0 //quantity of attacks per attack
basic_attack_projectile_speed = 0
basic_attack_projectile_duration = 0
basic_attack_weapon_speed = 0 // divide by 60 for attacks per second
basic_attack_weapon_damage = 0 
basic_attack_weapon_mass = 0
energy_starting = 0
energy_to_cast = 0 //
energy_regeneration = 0
sprite_to_load = 0
graphic_offset_script = 0
basic_ability_script = 0


