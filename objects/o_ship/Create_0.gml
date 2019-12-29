module_list = array_create(7, [noone])
created = false
#region positioning
battle_grid = 0
battle_map = instance_find(o_battle_map, 0)
if (ship_team = team.left){
	battle_grid = battle_map.left_grid_container
}
if (ship_team = team.right){
	battle_grid = battle_map.right_grid_container
}
#endregion

basic_attack_array = create_basic_attack_array()
fire_counter = 10
fire_counter_rate = 40



state = ship.planning



