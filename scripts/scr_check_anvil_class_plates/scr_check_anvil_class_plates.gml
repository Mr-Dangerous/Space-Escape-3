anvil_class_plates_timing_counter++
if (anvil_class_plates_timing_counter >= 180){//3 seconds
	show_debug_message("armor spell cast!")//needs to be programmed in
	anvil_class_plates_timing_counter = 0
}