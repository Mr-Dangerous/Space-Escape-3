///@param seek
///@param flee
///@param pursue
///@param evade
///@param strafe

var behavior_to_change_array = array_create(5, 0)

for (var i = 0; i < 5; i++){
	 behavior_to_change_array[i] = argument[i]
}

if (behavior_to_change_array[0]){
	seek = true
} else {
	seek = false
}

if (behavior_to_change_array[1]){
	flee = true
} else {
	flee = false
}

if (behavior_to_change_array[2]){
	pursue = true
} else {
	pursue = false
}

if (behavior_to_change_array[3]){
	evade = true
} else {
	evade = false
}

if (behavior_to_change_array[4]){
	strafe = true
} else {
	strafe = false
}



	
