anvil_class_plates_timing_counter++
if (anvil_class_plates_timing_counter >= 180){//3 seconds
	
	var _random_seed = irandom(1)
	if (_random_seed = 0){
		armor += 50
		max_armor += 50
	}
	anvil_class_plates_timing_counter = 0
}