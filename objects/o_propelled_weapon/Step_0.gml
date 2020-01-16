/// @description Insert description here
// You can write your code in this editor
duration--
if (duration <= 0){ 
	misfire = true
	instance_destroy()
}

speed += acceleration_rate

if (speed > max_speed){
	speed = max_speed
}
