//this script will access the enemy fleet and put all enemies targeting ths ship into it.

var fleet_size = array_length_1d(enemy_fleet)
var ships_targeting_ship = 0
var j=0
for (var i = 0; i < fleet_size-1; i++){
	if (instance_exists(enemy_fleet[i])){
		if (enemy_fleet[i].ship_target = self){
			ships_targeting_ship[j] = enemy_fleet[i]
			j++
		}
	}
}

return ships_targeting_ship