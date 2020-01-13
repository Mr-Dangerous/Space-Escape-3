/// @description 
duration_counter++
if (duration_counter < 10){
	image_alpha = duration_counter * .05 // caps at .5 or .45
}

if (duration_counter > duration - 20 and image_alpha > 0.25){
	image_alpha -= .025
}
if (instance_exists(origin_ship)){
	x = origin_ship.x
	y = origin_ship.y
	image_angle = origin_ship.image_angle
	if (visible = false){
		visible = true
	}
}


if (duration_counter >= duration){
	instance_destroy()
}