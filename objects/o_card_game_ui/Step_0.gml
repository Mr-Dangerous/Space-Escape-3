//reset deploy button, and deploy the armada!
var mouse_left_released = mouse_check_button_released(mb_left)

if (mouse_left_released){
	for (var  i =0; i < 3; i++){
		construction_bay_deploy_button_pressed[i] = false
		//deploy ship contained
		active_construction_bay = construction_bays[i]
		
	}
}
