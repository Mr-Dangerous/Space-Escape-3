//this script will access the enemy fleet and find out
var fleet_to_check = enemy_fleet
var fleet_size = array_length_1d(fleet_to_check)
var ships_targeting_ship = 0
for (var i = 0; i < fleet_size-1; i++){
	if (fleet_to_check[i].ship_target = self){
		ships_targeting_ship++
	}
}



return ships_targeting_ship