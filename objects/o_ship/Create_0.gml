module_list = array_create(7, [noone])
created = false
ship_target = noone
#region positioning


battle_grid = 0
battle_grid_positions = 0
battle_map = instance_find(o_battle_map, 0)

battle_grid_width = ds_grid_width(battle_grid)
battle_grid_height = ds_grid_height(battle_grid)



#endregion

basic_attack_array = create_basic_attack_array()
fire_counter = 0
fire_rate = 40

visible = false

state = ship.planning



