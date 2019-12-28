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



state = ship.planning



