visible = false

#region Instances
//this region contains references to all required instances
fleet_object = instance_find(o_fleets, 0)//may be redundant
card_game_ui_object = instance_find(o_card_game_ui, 0)
enemy_fleet = 0
allied_fleet = 0
ship_target = noone
battle_grid = 0
battle_grid_positions = 0
battle_map = instance_find(o_battle_map, 0)
reference_factory = noone
is_deactivated = false
#endregion

#region Energy Variables
energy_sub_counter = 0//counts it in ticks
max_energy = 20 //energy to cast
energy = 0
energy_multiplier = 10
#endregion



#region Shield Variables
temporary_shields = 0
temporary_shield_counter = 0
shields = 1
max_shields = 1
max_mass_shield_can_deflect = 5 
shield_forward_strength = 80
shield_left_strength = 60
shield_right_strength = 60
shield_rear_strength = 20
shield_sprite = s_shield
secondary_shield_sprite = s_shield_outline
generate_shields = 0
reinforced_shields = false

#endregion

#region armor variables
armor = 1
max_armor = 1
#endregion

#region Loading variables - for scripts
module_list = array_create(7, [noone])
loading_scripts = array_create(7, [noone])
created = false
origin = ""
sub_class = ""

#endregion

#region behavior variables
seek = false
flee = false
pursue = false
evade = false
strafe = false
target_x = 0
target_y = 0
#endregion

#region movement variables

pilot_reflexes = 0
combat_timing_counter = 0
acceleration_rate = .1
max_speed = 1
turn_speed = .5
dodge = 10
dodge_reset_counter = 0
mass = 2
#endregion

#region targeting variables
priority_target = target_class.any
#endregion

#region attack variables
secondary_attack_array = create_basic_attack_array()
basic_attack_array = create_basic_attack_array()
projectile_flight_time = 0
projectile_speed = 0
fire_rate = 40
fire_rate_counter = 0
secondary_fire_rate = -1
secondary_fire_rate_counter = 0
#endregion

#region exhaust variables
exhaust_sprite = s_rocket_exhaust_original
exhaust_array = scr_return_exhaust_array()
exhaust_sub_image_counter = 0
exhaust_scale_multiplier = 1
#endregion

#region graphic values
combat_explosion = false
ship_sold = false
ship_sold_amount = 0
#endregion

#region state variables
ship_disabled_counter = 0
state = ship.planning
channel_ability_state = channel_ability.null
saved_variables = ds_map_create()
in_play = true
#endregion

#region origin and class counters
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
#endregion





















#region ability variables
hyper_boost_channel_timer = -2
hyper_boost_duration_timer = -1
old_max_speed = 0
old_turning_speed = 0
old_acceleration_rate = 0
cloak = false
cloak_timer = -1
inhibitor_shield_counter = -1
inhibitor_shields_granted = 0
number_of_overload_bounces = 1
overload_damage = 15
#endregion

#region spell module variables
//spell module variables
thermal_lance_damage_counter = 0
emergency_shield_counter = 0
#endregion

#region armor module variables
//armor module variables
anvil_class_plates_timing_counter = 0
serrated_plates = 0 //level of the plates
serrated_plates_damage_counter = 0//the counter that ticks for damage from plates
#endregion

#region shield module variables
wave_crasher_shield = 0//level of the part
wave_crasher_shield_damage_counter = 0 //counter that ticks for damage and effect
#endregion



