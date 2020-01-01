var allied_team
var enemy_team
if (ship_team = team.left){
	allied_team = team.left
	enemy_team = team.right
}
if (ship_team = team.right){
	allied_team = team.right
	enemy_team = team.left
}

enemy_target = noone
if (enemy_target = noone){
	//Find nearest target
	
	for (var i = 0; i < 20; i++){
		var nearby_ship = instance_nth_nearest(x, y, o_ship, i)
		//cancel if no ships are found
		if (nearby_ship = noone){
			break;
		}
		//cancel the while loop if a valid ship is found
		if (nearby_ship.ship_team = enemy_team){
			enemy_target = nearby_ship
			break;	
		}
	
	}
	
	
	//there needs to be a seperate check for priority targeting here...?
	/*
	if (enemy_target != noone and priority_enemy_target != 0){
		var nearby_ship_priority_target = noone
		var distance_check = false
		//this uses previosu i as an iterator.  j is used to save the value of i
		var j = 0
		//k is the countdown.  if the 3rd nearest ship in range
		//doesn't match the class, then the loop is canceled
		var k = 3
	
		while (nearby_ship_priority_target = noone or distance_check = false){
			var nearby_ship_priority_target = instance_nth_nearest(x, y, o_ship, i + j)
			//if there is just no ship to be found, cancel
			if (nearby_ship_priority_target = noone){
				break;
			}
			if (nearby_ship.ship_team = enemy_team){
				//only decrements if the ship found is an enemy ship
				k--
				if (nearby_ship_priority_target.class = priority_target){
					priority_enemy_target = nearby_ship_priority_target
				}
				
				if (k<0) distance_check = true
			}
			j++
				
		}
	}
	if (priority_enemy_target != noone){
		enemy_target = priority_enemy_target
	}
	*/
}

return enemy_target