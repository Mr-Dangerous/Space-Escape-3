/// @description Insert description here
// You can write your code in this editor
if(!created){
	secondary_explosion_sprite = choose(s_explosion_multi_burst_original, s_explosion_nova_original)
	var _sprite_width = sprite_get_width(secondary_explosion_sprite)
	explosion_image_scale = 0
	switch(projectile_class){
		case projectile.rocket:
			max_speed = 7
	 
		break;
	
		case projectile.missile:
			explosion_image_scale = 72 / _sprite_width
			max_speed = 6
		break;
	
		case projectile.torpedo:
			explosion_image_scale = 256 / _sprite_width
			max_speed = 3
		break;
	}
	created = true
}
duration--
if (duration <= 0){ 
	misfire = true
	instance_destroy()
}

speed += acceleration_rate

if (speed > max_speed){
	speed = max_speed
}
