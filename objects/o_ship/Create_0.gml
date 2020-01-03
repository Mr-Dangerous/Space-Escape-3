module_list = array_create(7, [noone])
created = false
fleet_object = instance_find(o_fleets, 0)
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
fire_counter = 0
fire_rate = 40
projectile_flight_time = 0
projectile_speed = 0

visible = false

state = ship.planning



