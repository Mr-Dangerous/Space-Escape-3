module_list = array_create(7, [noone])
loading_scripts = array_create(7, [noone])
created = false
fleet_object = instance_find(o_fleets, 0)
card_game_ui_object = instance_find(o_card_game_ui, 0)
allied_fleet = 0
enemy_fleet = 0
energy_sub_counter = 0
temporary_shields = 0
temporary_shield_counter = 0
reference_factory = noone



//movement manager variables
seek = false
flee = false
pursue = false
evade = false
strafe = false
target_x = 0
target_y = 0
ship_target = noone
pilot_reflexes = 0
combat_timing_counter = 0



//movement stats
acceleration_rate = .1
max_speed = 1
turn_speed = .5
projectile_speed = 0
dodge = 10
dodge_reset_counter = 0
armor = 1
shields = 1
energy = 0

max_armor = 1
max_shields = 1
max_energy = 20

//
max_mass_shield_can_deflect = 5 

//sheild directional strength
shield_forward_strength = 80
shield_left_strength = 60
shield_right_strength = 60
shield_rear_strength = 20


_energy_multiplier = 10//not really sure what this is right now.

ship_disabled_counter = 0



//temporary
#region positioning


battle_grid = 0
battle_grid_positions = 0
battle_map = instance_find(o_battle_map, 0)

battle_grid_width = ds_grid_width(battle_grid)
battle_grid_height = ds_grid_height(battle_grid)



#endregion
secondary_attack_array = create_basic_attack_array()
basic_attack_array = create_basic_attack_array()
projectile_flight_time = 0
projectile_speed = 0
fire_rate = 40
fire_rate_counter = 0
secondary_fire_rate = -1
secondary_fire_rate_counter = 0

shield_sprite = s_shield
generate_shields = 0
reinforced_shields = false

exhaust_sprite = s_rocket_exhaust_original
exhaust_array = scr_return_exhaust_array()
exhaust_sub_image_counter = 0
exhaust_scale_multiplier = 1

visible = false

state = ship.planning
channel_ability_state = channel_ability.null
saved_variables = ds_map_create()

//ability variables
hyper_boost_channel_timer = -2
hyper_boost_duration_timer = -1
old_max_speed = 0
old_turning_speed = 0
old_acceleration_rate = 0
cloak = false
cloak_timer = -1

//spell module variables
thermal_lance_damage_counter = 0
emergency_shield_counter = 0

//armor module variables
anvil_class_plates_timing_counter = 0
serrated_plates = 0 //level of the plates
serrated_plates_damage_counter = 0//the counter that ticks for damage from plates
wave_crasher_shield = 0//level of the part
wave_crasher_shield_damage_counter = 0 //counter that ticks for damage and effect



