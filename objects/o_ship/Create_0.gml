module_list = array_create(7, [noone])
created = false
fleet_object = instance_find(o_fleets, 0)
card_game_ui_object = instance_find(o_card_game_ui, 0)
allied_fleet = 0
enemy_fleet = 0



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

max_armor = 0
max_shields = 0
max_energy = 0



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

shield_sprite = s_shield_2
generate_shields = 0
reinforced_shields = false

visible = false

state = ship.planning



