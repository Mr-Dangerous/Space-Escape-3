visible = false

#region Instances
//this region contains references to all required instances
name = "" //required to fetch the correct map
card_game_ui_object = instance_find(o_card_game_ui, 0)
enemy_fleet = 0
allied_fleet = 0
ship_target = noone
battle_grid = 0
battle_grid_positions = 0
battle_map = instance_find(o_battle_map, 0)
reference_factory = noone
#endregion

#region Energy Variables
energy_sub_counter = 0//counts it in ticks
max_energy = 20 //energy to cast
energy = 0
energy_multiplier = 10
energy_per_second = 1
energy_per_second = 1
energy_current = 0
#endregion



#region Shield Variables
temporary_shields = 0
temporary_shield_counter = 0
shields = 1  
max_shields = 1
shield_power = 5 
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
armor = 1 //MAP VALUE
max_armor = 1
armor_resilency = 1
#endregion

#region Loading variables - for scripts

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
movement_target_x = 0
movement_target_y = 0
target_locked = false
#endregion

#region movement variables

acceleration_rate = .1 //MAP VALUE
max_speed = 1 //MAP VALUE
turn_speed = .5 //MAP VALUE
ship_mass = 2 //SHOULD BE A MAP VALUE
#endregion

#region targeting variables
priority_target = target_class.any
#endregion

#region attack variables
secondary_attack_array = create_basic_attack_array()
basic_attack_array = create_basic_attack_array()
basic_attack_projectile_duration = 0 //MAP VALUE
basic_attack_projectile_speed = 0 //MAP VALUE
basic_attack_weapon_speed = 40 //MAP VALUE
basic_attack_weapon_speed_counter = 0 //MAP  VALUE
secondary_attack_projectile_duration = 0 //MAP VALUE
secondary_attack_projectile_speed = 0 //MAP VALUE
secondary_attack_weapon_speed = 40 //MAP VALUE
secondary_attack_weapon_speed_counter = -1 //MAP  VALUE
critical_hit_chance = 24 //25%
critical_hit_multiplier = 2
attack_speed_multiplier = 1
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

#region Basic Ability things
hunter_strike_multiplier = 0
precision_strike_attacks = 0
rocket_count = 6
missile_count = 4
torpedo_count = 2
command_strike_bonus = 0
command_strike_bonus_counter = -1
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
hunter_strike_counter = -1
hunter_strike_speed_multiplier = 0
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



